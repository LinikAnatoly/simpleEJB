
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

import com.ksoe.energynet.valueobject.ENDamageRecovery2ENAct;
import com.ksoe.energynet.valueobject.filter.ENDamageRecovery2ENActFilter;
import com.ksoe.energynet.valueobject.brief.ENDamageRecovery2ENActShort;
import com.ksoe.energynet.valueobject.lists.ENDamageRecovery2ENActShortList;


/**
 * DAO Object for ENDamageRecovery2ENAct;
 *
 */

public class ENDamageRecovery2ENActDAOGen extends GenericDataMiner {

   public ENDamageRecovery2ENActDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENDamageRecovery2ENActDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(ENDamageRecovery2ENAct inObject) throws PersistenceException
   {
      ENDamageRecovery2ENAct obj = new ENDamageRecovery2ENAct();
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
			if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
				return false;
			}
     if (inObject.damageRecoveryRef.code != obj.damageRecoveryRef.code){
        return false;
     }
     if (inObject.actRef.code != obj.actRef.code){
        return false;
     }
      return true;
   }

   public int add(ENDamageRecovery2ENAct anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENDamageRecovery2ENAct anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENDAMAGERECOVERY2ENACT (CODE,USERGEN,DATEEDIT,MODIFY_TIME,DAMAGERECOVERYREFCODE,ACTREFCODE) VALUES (?,?,?,?,?,?)";

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
      if (anObject.damageRecoveryRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDamageRecoveryDAOGen(connection,getUserProfile()).exists(anObject.damageRecoveryRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDamageRecovery2ENAct.damageRecoveryRef.code%} = {%"+anObject.damageRecoveryRef.code+"%}");
        statement.setInt(5,anObject.damageRecoveryRef.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.actRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).exists(anObject.actRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDamageRecovery2ENAct.actRef.code%} = {%"+anObject.actRef.code+"%}");
        statement.setInt(6,anObject.actRef.code);
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
      throw new PersistenceException("Error in method {%ENDamageRecovery2ENActDAOGen.add%}",e);
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

   public void save(ENDamageRecovery2ENAct anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENDamageRecovery2ENAct anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENDamageRecovery2ENAct oldObject = new ENDamageRecovery2ENAct();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENDamageRecovery2ENAct.modify_time_Field+" FROM  ENDAMAGERECOVERY2ENACT WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("DAMAGERECOVERYREF") == 0)
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
        "UPDATE ENDAMAGERECOVERY2ENACT SET  USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , DAMAGERECOVERYREFCODE = ? , ACTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENDAMAGERECOVERY2ENACT SET ";
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
      if (anObject.damageRecoveryRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.damageRecoveryRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.actRef.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.actRef.code);
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
            if("DAMAGERECOVERYREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.damageRecoveryRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.damageRecoveryRef.code);
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

   } // end of save(ENDamageRecovery2ENAct anObject,String[] anAttributes)


 public ENDamageRecovery2ENActShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENDamageRecovery2ENAct filterObject = new ENDamageRecovery2ENAct();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENDamageRecovery2ENActShort)list.get(0);
   return null;
  }

  public ENDamageRecovery2ENActShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENDamageRecovery2ENActShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENDamageRecovery2ENActShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENDamageRecovery2ENActShortList getFilteredList(ENDamageRecovery2ENAct filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENDamageRecovery2ENActShortList getScrollableFilteredList(ENDamageRecovery2ENAct aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENDamageRecovery2ENActShortList getScrollableFilteredList(ENDamageRecovery2ENAct aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENDamageRecovery2ENActShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENDamageRecovery2ENActShortList getScrollableFilteredList(ENDamageRecovery2ENActFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENDamageRecovery2ENActShortList getScrollableFilteredList(ENDamageRecovery2ENActFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENDamageRecovery2ENActShortList getScrollableFilteredList(ENDamageRecovery2ENAct aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENDamageRecovery2ENActShortList getScrollableFilteredList(ENDamageRecovery2ENAct aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENDamageRecovery2ENActShortList result = new ENDamageRecovery2ENActShortList();
    ENDamageRecovery2ENActShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDAMAGERECOVERY2ENACT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENDAMAGERECOVERY2ENACT.CODE"+
     ",ENDAMAGERECOVERY2ENACT.USERGEN"+
     ",ENDAMAGERECOVERY2ENACT.DATEEDIT"+

      ", ENDAMAGERECOVERY.CODE " +
      ", ENDAMAGERECOVERY.NUMBERGEN " +
      ", ENDAMAGERECOVERY.DATEGEN " +
      ", ENDAMAGERECOVERY.FKCONTRACTCODE " +
      ", ENDAMAGERECOVERY.FKPARTNERCODE " +
      ", ENDAMAGERECOVERY.FKDOCCODE " +
      ", ENDAMAGERECOVERY.FKDOCID " +
      ", ENDAMAGERECOVERY.COMMENTGEN " +
      ", ENDAMAGERECOVERY.CONTRAGENTNAME " +
      ", ENDAMAGERECOVERY.CONTRAGENTADDRESS " +
      ", ENDAMAGERECOVERY.CONTRAGENTPASSPORT " +
      ", ENDAMAGERECOVERY.DAMAGEAMMOUNT " +
      ", ENDAMAGERECOVERY.USERGEN " +
      ", ENDAMAGERECOVERY.DATEEDIT " +
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
     " FROM ENDAMAGERECOVERY2ENACT " +
     ", ENDAMAGERECOVERY " +
     ", ENACT " +
     //" WHERE "
  "";
     whereStr = " ENDAMAGERECOVERY.CODE = ENDAMAGERECOVERY2ENACT.DAMAGERECOVERYREFCODE" ; //+
      whereStr = whereStr +" AND ENACT.CODE = ENDAMAGERECOVERY2ENACT.ACTREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENDAMAGERECOVERY2ENACT.CODE IN ( SELECT ENDAMAGERECOVERY2ENACT.CODE FROM ENDAMAGERECOVERY2ENACT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY2ENACT.CODE = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY2ENACT.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDAMAGERECOVERY2ENACT.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY2ENACT.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY2ENACT.MODIFY_TIME = ?";
        }
        if(aFilterObject.damageRecoveryRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDAMAGERECOVERY2ENACT.DAMAGERECOVERYREFCODE = ? ";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDAMAGERECOVERY2ENACT.ACTREFCODE = ? ";
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
       if(aFilterObject.damageRecoveryRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.damageRecoveryRef.code);
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
      for (i = 0; set.next(); i++) {
        /*
        if (i < fromPosition)
          continue;
        else if (i >= fromPosition + quantity) {
          i++;
          break;
        } */

        anObject = new ENDamageRecovery2ENActShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.userGen = set.getString(2);
        anObject.dateEdit = set.getTimestamp(3);

        anObject.damageRecoveryRefCode = set.getInt(4);
    if(set.wasNull())
      anObject.damageRecoveryRefCode = Integer.MIN_VALUE;
        anObject.damageRecoveryRefNumberGen = set.getString(5);
        anObject.damageRecoveryRefDateGen = set.getDate(6);
        anObject.damageRecoveryRefFKcontractCode = set.getString(7);
        anObject.damageRecoveryRefFKpartnerCode = set.getString(8);
        anObject.damageRecoveryRefFKdocCode = set.getString(9);
        anObject.damageRecoveryRefFKdocID = set.getInt(10);
    if(set.wasNull())
      anObject.damageRecoveryRefFKdocID = Integer.MIN_VALUE;
        anObject.damageRecoveryRefCommentGen = set.getString(11);
        anObject.damageRecoveryRefContragentName = set.getString(12);
        anObject.damageRecoveryRefContragentAddress = set.getString(13);
        anObject.damageRecoveryRefContragentPassport = set.getString(14);
        anObject.damageRecoveryRefDamageAmmount = set.getBigDecimal(15);
        if(anObject.damageRecoveryRefDamageAmmount != null)
          anObject.damageRecoveryRefDamageAmmount = anObject.damageRecoveryRefDamageAmmount.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.damageRecoveryRefUserGen = set.getString(16);
        anObject.damageRecoveryRefDateEdit = set.getDate(17);
        anObject.actRefCode = set.getInt(18);
    if(set.wasNull())
      anObject.actRefCode = Integer.MIN_VALUE;
        anObject.actRefNumberGen = set.getString(19);
        anObject.actRefDateGen = set.getDate(20);
        anObject.actRefFinDocCode = set.getInt(21);
    if(set.wasNull())
      anObject.actRefFinDocCode = Integer.MIN_VALUE;
        anObject.actRefFinDocMechanicCode = set.getInt(22);
    if(set.wasNull())
      anObject.actRefFinDocMechanicCode = Integer.MIN_VALUE;
        anObject.actRefFinMolName = set.getString(23);
        anObject.actRefFinMechanicName = set.getString(24);
        anObject.actRefInvNumber = set.getString(25);
        anObject.actRefUserGen = set.getString(26);
        anObject.actRefDateEdit = set.getDate(27);
        anObject.actRefDateAct = set.getDate(28);

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

  public int[] getFilteredCodeArrayOLD(ENDamageRecovery2ENAct aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDAMAGERECOVERY2ENACT.CODE FROM ENDAMAGERECOVERY2ENACT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDAMAGERECOVERY2ENACT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY2ENACT.CODE = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY2ENACT.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY2ENACT.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY2ENACT.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY2ENACT.MODIFY_TIME = ?";
        }
        if(aFilterObject.damageRecoveryRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDAMAGERECOVERY2ENACT.DAMAGERECOVERYREFCODE = ? ";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDAMAGERECOVERY2ENACT.ACTREFCODE = ? ";
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
                 whereStr = whereStr + " ENDAMAGERECOVERY2ENACT.USERGEN = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY2ENACT.USERGEN LIKE ?";

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
       if(aFilterObject.damageRecoveryRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.damageRecoveryRef.code);
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

  public int[] getFilteredCodeArray(ENDamageRecovery2ENActFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENDamageRecovery2ENAct aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDAMAGERECOVERY2ENACT.CODE FROM ENDAMAGERECOVERY2ENACT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDAMAGERECOVERY2ENACT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY2ENACT.CODE = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY2ENACT.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY2ENACT.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY2ENACT.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY2ENACT.MODIFY_TIME = ?";
        }
        if(aFilterObject.damageRecoveryRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDAMAGERECOVERY2ENACT.DAMAGERECOVERYREFCODE = ? ";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDAMAGERECOVERY2ENACT.ACTREFCODE = ? ";
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
                 whereStr = whereStr + " ENDAMAGERECOVERY2ENACT.USERGEN = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY2ENACT.USERGEN LIKE ?";

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
       if(aFilterObject.damageRecoveryRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.damageRecoveryRef.code);
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


   public ENDamageRecovery2ENAct getObject(int uid) throws PersistenceException
   {
    ENDamageRecovery2ENAct result = new ENDamageRecovery2ENAct();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENDamageRecovery2ENAct anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENDAMAGERECOVERY2ENACT.CODE, ENDAMAGERECOVERY2ENACT.USERGEN, ENDAMAGERECOVERY2ENACT.DATEEDIT, ENDAMAGERECOVERY2ENACT.MODIFY_TIME, ENDAMAGERECOVERY2ENACT.DAMAGERECOVERYREFCODE, ENDAMAGERECOVERY2ENACT.ACTREFCODE "
    +" FROM ENDAMAGERECOVERY2ENACT WHERE ENDAMAGERECOVERY2ENACT.CODE = ?";

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
        anObject.damageRecoveryRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.damageRecoveryRef.code = Integer.MIN_VALUE;
        anObject.actRef.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.actRef.code = Integer.MIN_VALUE;
        if(anObject.damageRecoveryRef.code != Integer.MIN_VALUE)
        {
           anObject.setDamageRecoveryRef(
      new com.ksoe.energynet.dataminer.generated.ENDamageRecoveryDAOGen(connection,getUserProfile()).getRef(anObject.damageRecoveryRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENDamageRecovery2ENActRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENDamageRecovery2ENActRef ref = new com.ksoe.energynet.valueobject.references.ENDamageRecovery2ENActRef();
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

    selectStr = "DELETE FROM  ENDAMAGERECOVERY2ENACT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENDamageRecovery2ENAct object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENDamageRecovery2ENAct.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENDamageRecovery2ENAct.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENDamageRecovery2ENAct.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDamageRecovery2ENAct.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENDamageRecovery2ENAct.getObject%} access denied");

    selectStr =

    "SELECT  ENDAMAGERECOVERY2ENACT.CODE FROM  ENDAMAGERECOVERY2ENACT WHERE  ENDAMAGERECOVERY2ENACT.CODE = ?";
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
    _checkConditionToken(condition,"code","ENDAMAGERECOVERY2ENACT.CODE");
    _checkConditionToken(condition,"usergen","ENDAMAGERECOVERY2ENACT.USERGEN");
    _checkConditionToken(condition,"dateedit","ENDAMAGERECOVERY2ENACT.DATEEDIT");
    _checkConditionToken(condition,"modify_time","ENDAMAGERECOVERY2ENACT.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"damagerecoveryref","DAMAGERECOVERYREFCODE");
    _checkConditionToken(condition,"damagerecoveryref.code","DAMAGERECOVERYREFCODE");
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

  private void _collectAutoIncrementFields(ENDamageRecovery2ENAct anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENDAMAGERECOVERY2ENACT", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENDAMAGERECOVERY2ENACT", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENDAMAGERECOVERY2ENACT", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENDAMAGERECOVERY2ENACT");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENDamageRecovery2ENActDAO
