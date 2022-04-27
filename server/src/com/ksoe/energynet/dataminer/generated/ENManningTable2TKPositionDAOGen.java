
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
import com.ksoe.energynet.valueobject.ENManningTable2TKPosition;
import com.ksoe.energynet.valueobject.brief.ENManningTable2TKPositionShort;
import com.ksoe.energynet.valueobject.filter.ENManningTable2TKPositionFilter;
import com.ksoe.energynet.valueobject.lists.ENManningTable2TKPositionShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

/**
 * DAO Object for ENManningTable2TKPosition;
 *
 */

public class ENManningTable2TKPositionDAOGen extends GenericDataMiner {

  public ENManningTable2TKPositionDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENManningTable2TKPositionDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENManningTable2TKPosition inObject) throws PersistenceException
   {
      ENManningTable2TKPosition obj = new ENManningTable2TKPosition();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.manningTableRef.code != obj.manningTableRef.code){
        return false;
     }
     if (inObject.tkpositionRef.code != obj.tkpositionRef.code){
        return false;
     }
      return true;
   }

   public int add(ENManningTable2TKPosition anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENManningTable2TKPosition anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();
    if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENMANNINGTABLE2TKPOSTN (CODE,DOMAIN_INFO,MODIFY_TIME,MANNINGTABLEREFCODE,TKPOSITIONREFCODE) VALUES (?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(3,null);
      else
        statement.setBigDecimal(3,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.manningTableRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENManningTableDAOGen(connection,getUserProfile()).exists(anObject.manningTableRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENManningTable2TKPosition.manningTableRef.code%} = {%"+anObject.manningTableRef.code+"%}");
        statement.setInt(4,anObject.manningTableRef.code);
      }
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.tkpositionRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKPositionDAOGen(connection,getUserProfile()).exists(anObject.tkpositionRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENManningTable2TKPosition.tkpositionRef.code%} = {%"+anObject.tkpositionRef.code+"%}");
        statement.setInt(5,anObject.tkpositionRef.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENManningTable2TKPositionDAOGen.add%}",e);
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

   public void save(ENManningTable2TKPosition anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENManningTable2TKPosition anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENManningTable2TKPosition oldObject = new ENManningTable2TKPosition();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENManningTable2TKPosition.modify_time_Field + "," + ENManningTable2TKPosition.domain_info_Field+" FROM  ENMANNINGTABLE2TKPOSTN WHERE CODE = ?";

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
        oldObject.domain_info = set.getString(2);
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
    if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());
      String selectStr;

      Vector fields = null;
      if(anAttributes != null)
       {
        String fieldNameStr;
        fields = new Vector();
        for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++)
         {
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DOMAIN_INFO") == 0)
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
          if(fieldNameStr.compareTo("MANNINGTABLEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TKPOSITIONREF") == 0)
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
        "UPDATE ENMANNINGTABLE2TKPOSTN SET  DOMAIN_INFO = ? , MODIFY_TIME = ? , MANNINGTABLEREFCODE = ? , TKPOSITIONREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENMANNINGTABLE2TKPOSITION SET ";
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
      statement.setString(1,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(2,null);
      else
        statement.setBigDecimal(2,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.manningTableRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.manningTableRef.code);
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.tkpositionRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.tkpositionRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
          statement.setInt(5,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("DOMAIN_INFO".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.domain_info);
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
            if("MANNINGTABLEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.manningTableRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.manningTableRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TKPOSITIONREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.tkpositionRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.tkpositionRef.code);
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

   } // end of save(ENManningTable2TKPosition anObject,String[] anAttributes)


 public ENManningTable2TKPositionShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENManningTable2TKPosition filterObject = new ENManningTable2TKPosition();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENManningTable2TKPositionShort)list.get(0);
   return null;
  }

  public ENManningTable2TKPositionShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENManningTable2TKPositionShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENManningTable2TKPositionShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENManningTable2TKPositionShortList getFilteredList(ENManningTable2TKPosition filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENManningTable2TKPositionShortList getScrollableFilteredList(ENManningTable2TKPosition aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENManningTable2TKPositionShortList getScrollableFilteredList(ENManningTable2TKPosition aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENManningTable2TKPositionShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENManningTable2TKPositionShortList getScrollableFilteredList(ENManningTable2TKPositionFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENManningTable2TKPositionShortList getScrollableFilteredList(ENManningTable2TKPositionFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENManningTable2TKPositionShortList getScrollableFilteredList(ENManningTable2TKPosition aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENManningTable2TKPositionShortList getScrollableFilteredList(ENManningTable2TKPosition aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENManningTable2TKPositionShortList result = new ENManningTable2TKPositionShortList();
    ENManningTable2TKPositionShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENMANNINGTABLE2TKPOSTN.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENMANNINGTABLE2TKPOSTN.CODE"+

      ", ENMANNINGTABLE.CODE " +
      ", ENMANNINGTABLE.NAME " +
      ", ENMANNINGTABLE.DATESTART " +
      ", ENMANNINGTABLE.DATEFINAL " +
      ", TKPOSITION.CODE " +
      ", TKPOSITION.NAME " +
      ", TKPOSITION.SAFETYGROUP " +
      ", TKPOSITION.RANK " +
      ", TKPOSITION.SHORTNAME " +
     " FROM ENMANNINGTABLE2TKPOSTN " +
     ", ENMANNINGTABLE " +
     ", TKPOSITION " +
     //" WHERE "
    "";
     whereStr = " ENMANNINGTABLE.CODE = ENMANNINGTABLE2TKPOSTN.MANNINGTABLEREFCODE" ; //+
      whereStr = whereStr +" AND TKPOSITION.CODE = ENMANNINGTABLE2TKPOSTN.TKPOSITIONREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENMANNINGTABLE2TKPOSTN.CODE IN ( SELECT ENMANNINGTABLE2TKPOSTN.CODE FROM ENMANNINGTABLE2TKPOSTN ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMANNINGTABLE2TKPOSTN.CODE = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENMANNINGTABLE2TKPOSTN.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENMANNINGTABLE2TKPOSTN.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMANNINGTABLE2TKPOSTN.MODIFY_TIME = ?";
        }
        if(aFilterObject.manningTableRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENMANNINGTABLE2TKPOSTN.MANNINGTABLEREFCODE = ? ";
        }
        if(aFilterObject.tkpositionRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENMANNINGTABLE2TKPOSTN.TKPOSITIONREFCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENManningTable2TKPosition.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENManningTable2TKPosition.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENMANNINGTABLE2TKPOSTN",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENMANNINGTABLE2TKPOSTN.DOMAIN_INFO IS NOT NULL";
    //else
    if (whereStr.length() == 0)
        whereStr = domainWhereStr;
    else
        whereStr = " "+whereStr + " AND " +domainWhereStr;
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

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.manningTableRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.manningTableRef.code);
       }
       if(aFilterObject.tkpositionRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tkpositionRef.code);
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

        anObject = new ENManningTable2TKPositionShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.manningTableRefCode = set.getInt(2);
        if(set.wasNull())
        anObject.manningTableRefCode = Integer.MIN_VALUE;
        anObject.manningTableRefName = set.getString(3);
        anObject.manningTableRefDateStart = set.getDate(4);
        anObject.manningTableRefDateFinal = set.getDate(5);
        anObject.tkpositionRefCode = set.getInt(6);
        if(set.wasNull())
        anObject.tkpositionRefCode = Integer.MIN_VALUE;
        anObject.tkpositionRefName = set.getString(7);
        anObject.tkpositionRefSafetyGroup = set.getString(8);
        anObject.tkpositionRefRank = set.getString(9);
        anObject.tkpositionRefShortName = set.getString(10);

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

  public int[] getFilteredCodeArrayOLD(ENManningTable2TKPosition aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENMANNINGTABLE2TKPOSTN.CODE FROM ENMANNINGTABLE2TKPOSTN";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENMANNINGTABLE2TKPOSTN.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENManningTable2TKPosition.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENManningTable2TKPosition.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENMANNINGTABLE2TKPOSTN",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENMANNINGTABLE2TKPOSTN.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMANNINGTABLE2TKPOSTN.CODE = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENMANNINGTABLE2TKPOSTN.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENMANNINGTABLE2TKPOSTN.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMANNINGTABLE2TKPOSTN.MODIFY_TIME = ?";
        }
        if(aFilterObject.manningTableRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENMANNINGTABLE2TKPOSTN.MANNINGTABLEREFCODE = ? ";
        }
        if(aFilterObject.tkpositionRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENMANNINGTABLE2TKPOSTN.TKPOSITIONREFCODE = ? ";
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
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENMANNINGTABLE2TKPOSTN.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENMANNINGTABLE2TKPOSTN.DOMAIN_INFO LIKE ?";

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.manningTableRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.manningTableRef.code);
       }
       if(aFilterObject.tkpositionRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tkpositionRef.code);
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

  public int[] getFilteredCodeArray(ENManningTable2TKPositionFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENManningTable2TKPosition aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENMANNINGTABLE2TKPOSTN.CODE FROM ENMANNINGTABLE2TKPOSTN";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENMANNINGTABLE2TKPOSTN.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENManningTable2TKPosition.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENManningTable2TKPosition.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENMANNINGTABLE2TKPOSTN",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENMANNINGTABLE2TKPOSTN.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMANNINGTABLE2TKPOSTN.CODE = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENMANNINGTABLE2TKPOSTN.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENMANNINGTABLE2TKPOSTN.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMANNINGTABLE2TKPOSTN.MODIFY_TIME = ?";
        }
        if(aFilterObject.manningTableRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENMANNINGTABLE2TKPOSTN.MANNINGTABLEREFCODE = ? ";
        }
        if(aFilterObject.tkpositionRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENMANNINGTABLE2TKPOSTN.TKPOSITIONREFCODE = ? ";
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
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENMANNINGTABLE2TKPOSTN.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENMANNINGTABLE2TKPOSTN.DOMAIN_INFO LIKE ?";

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.manningTableRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.manningTableRef.code);
       }
       if(aFilterObject.tkpositionRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tkpositionRef.code);
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


   public ENManningTable2TKPosition getObject(int uid) throws PersistenceException
   {
    ENManningTable2TKPosition result = new ENManningTable2TKPosition();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENManningTable2TKPosition anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENManningTable2TKPosition.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENManningTable2TKPosition.getObject%} access denied");



    selectStr =
    "SELECT  ENMANNINGTABLE2TKPOSTN.CODE, ENMANNINGTABLE2TKPOSTN.DOMAIN_INFO, ENMANNINGTABLE2TKPOSTN.MODIFY_TIME, ENMANNINGTABLE2TKPOSTN.MANNINGTABLEREFCODE, ENMANNINGTABLE2TKPOSTN.TKPOSITIONREFCODE "
    +" FROM ENMANNINGTABLE2TKPOSTN WHERE ENMANNINGTABLE2TKPOSTN.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENMANNINGTABLE2TKPOSTN",segregationInfo,getUserProfile().getDomainInfo());
    if(segregationWhereStr.length() > 0)
     selectStr = selectStr + " AND " + segregationWhereStr;

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
        anObject.domain_info = set.getString(2);
        anObject.modify_time = set.getLong(3);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.manningTableRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.manningTableRef.code = Integer.MIN_VALUE;
        anObject.tkpositionRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.tkpositionRef.code = Integer.MIN_VALUE;
        if(anObject.manningTableRef.code != Integer.MIN_VALUE)
        {
           anObject.setManningTableRef(
        new com.ksoe.energynet.dataminer.generated.ENManningTableDAOGen(connection,getUserProfile()).getRef(anObject.manningTableRef.code));
    }
        if(anObject.tkpositionRef.code != Integer.MIN_VALUE)
        {
           anObject.setTkpositionRef(
        new com.ksoe.techcard.dataminer.generated.TKPositionDAOGen(connection,getUserProfile()).getRef(anObject.tkpositionRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENManningTable2TKPositionRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENManningTable2TKPositionRef ref = new com.ksoe.energynet.valueobject.references.ENManningTable2TKPositionRef();
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

    selectStr = "DELETE FROM  ENMANNINGTABLE2TKPOSTN WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENManningTable2TKPosition object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENManningTable2TKPosition.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENManningTable2TKPosition.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENManningTable2TKPosition.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENManningTable2TKPosition.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENManningTable2TKPosition.getObject%} access denied");

    selectStr =

    "SELECT  ENMANNINGTABLE2TKPOSTN.CODE FROM  ENMANNINGTABLE2TKPOSTN WHERE  ENMANNINGTABLE2TKPOSTN.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENMANNINGTABLE2TKPOSTN",segregationInfo,getUserProfile().getDomainInfo());
    if(segregationWhereStr.length() > 0)
     selectStr = selectStr +
      " AND " + segregationWhereStr;
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
    _checkConditionToken(condition,"code","ENMANNINGTABLE2TKPOSTN.CODE");
    _checkConditionToken(condition,"domain_info","ENMANNINGTABLE2TKPOSTN.DOMAIN_INFO");
    _checkConditionToken(condition,"modify_time","ENMANNINGTABLE2TKPOSTN.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"manningtableref","MANNINGTABLEREFCODE");
    _checkConditionToken(condition,"manningtableref.code","MANNINGTABLEREFCODE");
    _checkConditionToken(condition,"tkpositionref","TKPOSITIONREFCODE");
    _checkConditionToken(condition,"tkpositionref.code","TKPOSITIONREFCODE");
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

    private void _collectAutoIncrementFields(ENManningTable2TKPosition anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENMANNINGTABLE2TKPOSTN", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENMANNINGTABLE2TKPOSTN", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENMANNINGTABLE2TKPOSTN", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENMANNINGTABLE2TKPOSTN");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENManningTable2TKPositionDAO
