
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
import com.ksoe.energynet.valueobject.FINMolData;
import com.ksoe.energynet.valueobject.brief.FINMolDataShort;
import com.ksoe.energynet.valueobject.filter.FINMolDataFilter;
import com.ksoe.energynet.valueobject.lists.FINMolDataShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for FINMolData;
 *
 */

public class FINMolDataDAOGen extends GenericDataMiner {

  public FINMolDataDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public FINMolDataDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(FINMolData inObject) throws PersistenceException
   {
      FINMolData obj = new FINMolData();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.finMolCode != obj.finMolCode){
       return false;
     }

     if (inObject.finMolName != obj.finMolName){
       return false;
     }
     if (inObject.molTypeRef.code != obj.molTypeRef.code){
        return false;
     }
     if (inObject.act.code != obj.act.code){
        return false;
     }
     if (inObject.workOrder.code != obj.workOrder.code){
        return false;
     }
      return true;
   }

   public int add(FINMolData anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(FINMolData anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO FINMOLDATA (CODE,FINMOLCODE,FINMOLNAME,MODIFY_TIME,MOLTYPEREFCODE,ACTCODE,WORKORDERCODE) VALUES (?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.finMolCode);
      statement.setString(3,anObject.finMolName);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(4,null);
      else
        statement.setBigDecimal(4,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.molTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINMolTypeDAOGen(connection,getUserProfile()).exists(anObject.molTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINMolData.molTypeRef.code%} = {%"+anObject.molTypeRef.code+"%}");
        statement.setInt(5,anObject.molTypeRef.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.act.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).exists(anObject.act.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINMolData.act.code%} = {%"+anObject.act.code+"%}");
        statement.setInt(6,anObject.act.code);
      }
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.workOrder.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENWorkOrderDAOGen(connection,getUserProfile()).exists(anObject.workOrder.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINMolData.workOrder.code%} = {%"+anObject.workOrder.code+"%}");
        statement.setInt(7,anObject.workOrder.code);
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
      throw new PersistenceException("Error in method {%FINMolDataDAOGen.add%}",e);
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

   public void save(FINMolData anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(FINMolData anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      FINMolData oldObject = new FINMolData();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+FINMolData.modify_time_Field+" FROM  FINMOLDATA WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("FINMOLCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINMOLNAME") == 0)
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
          if(fieldNameStr.compareTo("MOLTYPEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ACT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("WORKORDER") == 0)
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
        "UPDATE FINMOLDATA SET  FINMOLCODE = ? , FINMOLNAME = ? , MODIFY_TIME = ? , MOLTYPEREFCODE = ? , ACTCODE = ? , WORKORDERCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE FINMOLDATA SET ";
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
      statement.setString(1,anObject.finMolCode);
      statement.setString(2,anObject.finMolName);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(3,null);
      else
        statement.setBigDecimal(3,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.molTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.molTypeRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.act.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.act.code);
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.workOrder.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.workOrder.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);
          statement.setInt(7,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("FINMOLCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.finMolCode);
                continue;
             }
            if("FINMOLNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.finMolName);
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
            if("MOLTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.molTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.molTypeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("ACT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.act.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.act.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("WORKORDER".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.workOrder.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.workOrder.code);
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

   } // end of save(FINMolData anObject,String[] anAttributes)


 public FINMolDataShort getShortObject(int anObjectCode) throws PersistenceException
  {
   FINMolData filterObject = new FINMolData();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (FINMolDataShort)list.get(0);
   return null;
  }

  public FINMolDataShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public FINMolDataShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public FINMolDataShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public FINMolDataShortList getFilteredList(FINMolData filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public FINMolDataShortList getScrollableFilteredList(FINMolData aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public FINMolDataShortList getScrollableFilteredList(FINMolData aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public FINMolDataShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public FINMolDataShortList getScrollableFilteredList(FINMolDataFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public FINMolDataShortList getScrollableFilteredList(FINMolDataFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public FINMolDataShortList getScrollableFilteredList(FINMolData aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public FINMolDataShortList getScrollableFilteredList(FINMolData aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    FINMolDataShortList result = new FINMolDataShortList();
    FINMolDataShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINMOLDATA.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "FINMOLDATA.CODE"+
     ",FINMOLDATA.FINMOLCODE"+
     ",FINMOLDATA.FINMOLNAME"+

      ", FINMOLTYPE.CODE " +
      ", FINMOLTYPE.NAME " +
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
      ", ENWORKORDER.CODE " +
      ", ENWORKORDER.WORKORDERNUMBER " +
      ", ENWORKORDER.DATEGEN " +
      ", ENWORKORDER.FINMOLCODE " +
      ", ENWORKORDER.FINMOLNAME " +
      ", ENWORKORDER.FINMECHANICCODE " +
      ", ENWORKORDER.FINMECHANICNAME " +
      ", ENWORKORDER.USERGEN " +
      ", ENWORKORDER.DATEEDIT " +
     " FROM FINMOLDATA " +
     ", FINMOLTYPE " +
     ", ENACT " +
     ", ENWORKORDER " +
     //" WHERE "
    "";
     whereStr = " FINMOLTYPE.CODE = FINMOLDATA.MOLTYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENACT.CODE = FINMOLDATA.ACTCODE" ; //+
      whereStr = whereStr +" AND ENWORKORDER.CODE = FINMOLDATA.WORKORDERCODE" ; //+
        //selectStr = selectStr + " ${s} FINMOLDATA.CODE IN ( SELECT FINMOLDATA.CODE FROM FINMOLDATA ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINMOLDATA.CODE = ?";
        }
         if (aFilterObject.finMolCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMolCode.indexOf('*',0) < 0 && aFilterObject.finMolCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINMOLDATA.FINMOLCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINMOLDATA.FINMOLCODE) LIKE UPPER(?)";
         }
         if (aFilterObject.finMolName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMolName.indexOf('*',0) < 0 && aFilterObject.finMolName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINMOLDATA.FINMOLNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINMOLDATA.FINMOLNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINMOLDATA.MODIFY_TIME = ?";
        }
        if(aFilterObject.molTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "FINMOLDATA.MOLTYPEREFCODE = ? ";
        }
        if(aFilterObject.act.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "FINMOLDATA.ACTCODE = ? ";
        }
        if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "FINMOLDATA.WORKORDERCODE = ? ";
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

           if(aFilterObject.finMolCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMolCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.finMolName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMolName);
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
       if(aFilterObject.molTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.molTypeRef.code);
       }
       if(aFilterObject.act.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.act.code);
       }
       if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrder.code);
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

        anObject = new FINMolDataShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.finMolCode = set.getString(2);
        anObject.finMolName = set.getString(3);

        anObject.molTypeRefCode = set.getInt(4);
        if(set.wasNull())
        anObject.molTypeRefCode = Integer.MIN_VALUE;
        anObject.molTypeRefName = set.getString(5);
        anObject.actCode = set.getInt(6);
        if(set.wasNull())
        anObject.actCode = Integer.MIN_VALUE;
        anObject.actNumberGen = set.getString(7);
        anObject.actDateGen = set.getDate(8);
        anObject.actFinDocCode = set.getInt(9);
        if(set.wasNull())
        anObject.actFinDocCode = Integer.MIN_VALUE;
        anObject.actFinDocMechanicCode = set.getInt(10);
        if(set.wasNull())
        anObject.actFinDocMechanicCode = Integer.MIN_VALUE;
        anObject.actFinMolName = set.getString(11);
        anObject.actFinMechanicName = set.getString(12);

        anObject.actUserGen = set.getString(14);
        anObject.actDateEdit = set.getDate(15);

        anObject.workOrderCode = set.getInt(17);
        if(set.wasNull())
        anObject.workOrderCode = Integer.MIN_VALUE;
        anObject.workOrderWorkOrderNumber = set.getString(18);
        anObject.workOrderDateGen = set.getDate(19);
        anObject.workOrderFinMolCode = set.getString(20);
        anObject.workOrderFinMolName = set.getString(21);
        anObject.workOrderFinMechanicCode = set.getString(22);
        anObject.workOrderFinMechanicName = set.getString(23);
        anObject.workOrderUserGen = set.getString(24);
        anObject.workOrderDateEdit = set.getDate(25);

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

  public int[] getFilteredCodeArrayOLD(FINMolData aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINMOLDATA.CODE FROM FINMOLDATA";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINMOLDATA.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINMOLDATA.CODE = ?";
        }
         if (aFilterObject.finMolCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMolCode.indexOf('*',0) < 0 && aFilterObject.finMolCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINMOLDATA.FINMOLCODE = ?";
             else
                 whereStr = whereStr + "  FINMOLDATA.FINMOLCODE LIKE ?";
         }
         if (aFilterObject.finMolName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMolName.indexOf('*',0) < 0 && aFilterObject.finMolName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINMOLDATA.FINMOLNAME = ?";
             else
                 whereStr = whereStr + "  FINMOLDATA.FINMOLNAME LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINMOLDATA.MODIFY_TIME = ?";
        }
        if(aFilterObject.molTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINMOLDATA.MOLTYPEREFCODE = ? ";
        }
        if(aFilterObject.act.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINMOLDATA.ACTCODE = ? ";
        }
        if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINMOLDATA.WORKORDERCODE = ? ";
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
         if (aFilterObject.finMolCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finMolCode.indexOf('*',0) < 0 && aFilterObject.finMolCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINMOLDATA.FINMOLCODE = ?";
             else
                 whereStr = whereStr + " FINMOLDATA.FINMOLCODE LIKE ?";

           if(aFilterObject.finMolCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMolCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.finMolName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finMolName.indexOf('*',0) < 0 && aFilterObject.finMolName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINMOLDATA.FINMOLNAME = ?";
             else
                 whereStr = whereStr + " FINMOLDATA.FINMOLNAME LIKE ?";

           if(aFilterObject.finMolName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMolName);
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
       if(aFilterObject.molTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.molTypeRef.code);
       }
       if(aFilterObject.act.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.act.code);
       }
       if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrder.code);
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

  public int[] getFilteredCodeArray(FINMolDataFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(FINMolData aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINMOLDATA.CODE FROM FINMOLDATA";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINMOLDATA.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINMOLDATA.CODE = ?";
        }
         if (aFilterObject.finMolCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMolCode.indexOf('*',0) < 0 && aFilterObject.finMolCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINMOLDATA.FINMOLCODE = ?";
             else
                 whereStr = whereStr + "  FINMOLDATA.FINMOLCODE LIKE ?";
         }
         if (aFilterObject.finMolName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMolName.indexOf('*',0) < 0 && aFilterObject.finMolName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINMOLDATA.FINMOLNAME = ?";
             else
                 whereStr = whereStr + "  FINMOLDATA.FINMOLNAME LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINMOLDATA.MODIFY_TIME = ?";
        }
        if(aFilterObject.molTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINMOLDATA.MOLTYPEREFCODE = ? ";
        }
        if(aFilterObject.act.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINMOLDATA.ACTCODE = ? ";
        }
        if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINMOLDATA.WORKORDERCODE = ? ";
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
         if (aFilterObject.finMolCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finMolCode.indexOf('*',0) < 0 && aFilterObject.finMolCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINMOLDATA.FINMOLCODE = ?";
             else
                 whereStr = whereStr + " FINMOLDATA.FINMOLCODE LIKE ?";

           if(aFilterObject.finMolCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMolCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.finMolName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finMolName.indexOf('*',0) < 0 && aFilterObject.finMolName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINMOLDATA.FINMOLNAME = ?";
             else
                 whereStr = whereStr + " FINMOLDATA.FINMOLNAME LIKE ?";

           if(aFilterObject.finMolName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMolName);
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
       if(aFilterObject.molTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.molTypeRef.code);
       }
       if(aFilterObject.act.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.act.code);
       }
       if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrder.code);
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


   public FINMolData getObject(int uid) throws PersistenceException
   {
    FINMolData result = new FINMolData();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(FINMolData anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  FINMOLDATA.CODE, FINMOLDATA.FINMOLCODE, FINMOLDATA.FINMOLNAME, FINMOLDATA.MODIFY_TIME, FINMOLDATA.MOLTYPEREFCODE, FINMOLDATA.ACTCODE, FINMOLDATA.WORKORDERCODE "
    +" FROM FINMOLDATA WHERE FINMOLDATA.CODE = ?";

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
        anObject.finMolCode = set.getString(2);
        anObject.finMolName = set.getString(3);
        anObject.modify_time = set.getLong(4);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.molTypeRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.molTypeRef.code = Integer.MIN_VALUE;
        anObject.act.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.act.code = Integer.MIN_VALUE;
        anObject.workOrder.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.workOrder.code = Integer.MIN_VALUE;
        if(anObject.molTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setMolTypeRef(
        new com.ksoe.energynet.dataminer.generated.FINMolTypeDAOGen(connection,getUserProfile()).getRef(anObject.molTypeRef.code));
    }
        if(anObject.act.code != Integer.MIN_VALUE)
        {
           anObject.setAct(
        new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).getObject(anObject.act.code));
    }
        if(anObject.workOrder.code != Integer.MIN_VALUE)
        {
           anObject.setWorkOrder(
        new com.ksoe.energynet.dataminer.generated.ENWorkOrderDAOGen(connection,getUserProfile()).getObject(anObject.workOrder.code));
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


  public com.ksoe.energynet.valueobject.references.FINMolDataRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.FINMolDataRef ref = new com.ksoe.energynet.valueobject.references.FINMolDataRef();
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

    selectStr = "DELETE FROM  FINMOLDATA WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    FINMolData object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%FINMolData.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(FINMolData.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%FINMolData.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINMolData.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FINMolData.getObject%} access denied");

    selectStr =

    "SELECT  FINMOLDATA.CODE FROM  FINMOLDATA WHERE  FINMOLDATA.CODE = ?";
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
    _checkConditionToken(condition,"code","FINMOLDATA.CODE");
    _checkConditionToken(condition,"finmolcode","FINMOLDATA.FINMOLCODE");
    _checkConditionToken(condition,"finmolname","FINMOLDATA.FINMOLNAME");
    _checkConditionToken(condition,"modify_time","FINMOLDATA.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"moltyperef","MOLTYPEREFCODE");
    _checkConditionToken(condition,"moltyperef.code","MOLTYPEREFCODE");
    _checkConditionToken(condition,"act","ACTCODE");
    _checkConditionToken(condition,"act.code","ACTCODE");
    _checkConditionToken(condition,"workorder","WORKORDERCODE");
    _checkConditionToken(condition,"workorder.code","WORKORDERCODE");
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

    private void _collectAutoIncrementFields(FINMolData anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("FINMOLDATA", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("FINMOLDATA", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("FINMOLDATA", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: FINMOLDATA");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of FINMolDataDAO
