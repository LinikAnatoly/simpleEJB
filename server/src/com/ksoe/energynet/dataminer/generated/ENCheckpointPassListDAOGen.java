
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
import com.ksoe.energynet.valueobject.ENCheckpointPassList;
import com.ksoe.energynet.valueobject.brief.ENCheckpointPassListShort;
import com.ksoe.energynet.valueobject.filter.ENCheckpointPassListFilter;
import com.ksoe.energynet.valueobject.lists.ENCheckpointPassListShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENCheckpointPassList;
 *
 */

public class ENCheckpointPassListDAOGen extends GenericDataMiner {

  public ENCheckpointPassListDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENCheckpointPassListDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENCheckpointPassList inObject) throws PersistenceException
   {
      ENCheckpointPassList obj = new ENCheckpointPassList();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.dateStart.equals(obj.dateStart)){
       return false;
     }

     if ( ! inObject.dateFinal.equals(obj.dateFinal)){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }
     if (inObject.checkpointRef.code != obj.checkpointRef.code){
        return false;
     }
     if (inObject.transportDepartmentRef.code != obj.transportDepartmentRef.code){
        return false;
     }
      return true;
   }

   public int add(ENCheckpointPassList anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENCheckpointPassList anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENCHECKPOINTPASSLIST (CODE,DATESTART,DATEFINAL,MODIFY_TIME,USERGEN,DATEEDIT,CHECKPOINTREFCODE,TRANSPORTDEPARTMNTRFCD) VALUES (?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.dateStart == null)
        statement.setTimestamp(2,null);
      else
        statement.setTimestamp(2,new java.sql.Timestamp(anObject.dateStart.getTime()));
      if (anObject.dateFinal == null)
        statement.setTimestamp(3,null);
      else
        statement.setTimestamp(3,new java.sql.Timestamp(anObject.dateFinal.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(4,null);
      else
        statement.setBigDecimal(4,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(5,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(6,null);
      else
        statement.setTimestamp(6,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.checkpointRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENCheckpointDAOGen(connection,getUserProfile()).exists(anObject.checkpointRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCheckpointPassList.checkpointRef.code%} = {%"+anObject.checkpointRef.code+"%}");
        statement.setInt(7,anObject.checkpointRef.code);
      }
      else
        statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.transportDepartmentRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransportDepartmentDAOGen(connection,getUserProfile()).exists(anObject.transportDepartmentRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCheckpointPassList.transportDepartmentRef.code%} = {%"+anObject.transportDepartmentRef.code+"%}");
        statement.setInt(8,anObject.transportDepartmentRef.code);
      }
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
      throw new PersistenceException("Error in method {%ENCheckpointPassListDAOGen.add%}",e);
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

   public void save(ENCheckpointPassList anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENCheckpointPassList anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENCheckpointPassList oldObject = new ENCheckpointPassList();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENCheckpointPassList.modify_time_Field+" FROM  ENCHECKPOINTPASSLIST WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("DATESTART") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEFINAL") == 0)
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
          if(fieldNameStr.compareTo("CHECKPOINTREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRANSPORTDEPARTMENTREF") == 0)
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
        "UPDATE ENCHECKPOINTPASSLIST SET  DATESTART = ? , DATEFINAL = ? , MODIFY_TIME = ? , USERGEN = ? , DATEEDIT = ? , CHECKPOINTREFCODE = ? , TRANSPORTDEPARTMNTRFCD = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENCHECKPOINTPASSLIST SET ";
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
      if (anObject.dateStart == null)
        statement.setDate(1,null);
      else
        statement.setTimestamp(1,new java.sql.Timestamp(anObject.dateStart.getTime()));
      if (anObject.dateFinal == null)
        statement.setDate(2,null);
      else
        statement.setTimestamp(2,new java.sql.Timestamp(anObject.dateFinal.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(3,null);
      else
        statement.setBigDecimal(3,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(4,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(5,null);
      else
        statement.setTimestamp(5,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.checkpointRef.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.checkpointRef.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.transportDepartmentRef.code != Integer.MIN_VALUE)
        statement.setInt(7,anObject.transportDepartmentRef.code);
      else
        statement.setNull(7,java.sql.Types.INTEGER);
          statement.setInt(8,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("DATESTART".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateStart == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateStart.getTime()));
                continue;
             }
            if("DATEFINAL".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateFinal == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateFinal.getTime()));
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
            if("CHECKPOINTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.checkpointRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.checkpointRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRANSPORTDEPARTMENTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportDepartmentRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportDepartmentRef.code);
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

   } // end of save(ENCheckpointPassList anObject,String[] anAttributes)


 public ENCheckpointPassListShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENCheckpointPassList filterObject = new ENCheckpointPassList();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENCheckpointPassListShort)list.get(0);
   return null;
  }

  public ENCheckpointPassListShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENCheckpointPassListShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENCheckpointPassListShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENCheckpointPassListShortList getFilteredList(ENCheckpointPassList filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENCheckpointPassListShortList getScrollableFilteredList(ENCheckpointPassList aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENCheckpointPassListShortList getScrollableFilteredList(ENCheckpointPassList aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENCheckpointPassListShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENCheckpointPassListShortList getScrollableFilteredList(ENCheckpointPassListFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENCheckpointPassListShortList getScrollableFilteredList(ENCheckpointPassListFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENCheckpointPassListShortList getScrollableFilteredList(ENCheckpointPassList aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENCheckpointPassListShortList getScrollableFilteredList(ENCheckpointPassList aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENCheckpointPassListShortList result = new ENCheckpointPassListShortList();
    ENCheckpointPassListShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCHECKPOINTPASSLIST.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENCHECKPOINTPASSLIST.CODE"+
     ",ENCHECKPOINTPASSLIST.DATESTART"+
     ",ENCHECKPOINTPASSLIST.DATEFINAL"+
     ",ENCHECKPOINTPASSLIST.USERGEN"+
     ",ENCHECKPOINTPASSLIST.DATEEDIT"+

      ", ENCHECKPOINT.CODE " +
      ", ENCHECKPOINT.NAME " +
      ", ENTRANSPORTDEPARTMENT.CODE " +
      ", ENTRANSPORTDEPARTMENT.NAME " +
     " FROM ENCHECKPOINTPASSLIST " +
     ", ENCHECKPOINT " +
     ", ENTRANSPORTDEPARTMENT " +
     //" WHERE "
    "";
     whereStr = " ENCHECKPOINT.CODE = ENCHECKPOINTPASSLIST.CHECKPOINTREFCODE" ; //+
      whereStr = whereStr +" AND ENTRANSPORTDEPARTMENT.CODE = ENCHECKPOINTPASSLIST.TRANSPORTDEPARTMNTRFCD" ; //+
        //selectStr = selectStr + " ${s} ENCHECKPOINTPASSLIST.CODE IN ( SELECT ENCHECKPOINTPASSLIST.CODE FROM ENCHECKPOINTPASSLIST ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLIST.CODE = ?";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLIST.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLIST.DATEFINAL = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLIST.MODIFY_TIME = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCHECKPOINTPASSLIST.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCHECKPOINTPASSLIST.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLIST.DATEEDIT = ?";
        }
        if(aFilterObject.checkpointRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCHECKPOINTPASSLIST.CHECKPOINTREFCODE = ? ";
        }
        if(aFilterObject.transportDepartmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCHECKPOINTPASSLIST.TRANSPORTDEPARTMNTRFCD = ? ";
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
        if(aFilterObject.dateStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
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
       if(aFilterObject.checkpointRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.checkpointRef.code);
       }
       if(aFilterObject.transportDepartmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportDepartmentRef.code);
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

        anObject = new ENCheckpointPassListShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.dateStart = set.getTimestamp(2);
        anObject.dateFinal = set.getTimestamp(3);
        anObject.userGen = set.getString(4);
        anObject.dateEdit = set.getTimestamp(5);

        anObject.checkpointRefCode = set.getInt(6);
        if(set.wasNull())
        anObject.checkpointRefCode = Integer.MIN_VALUE;
        anObject.checkpointRefName = set.getString(7);
        anObject.transportDepartmentRefCode = set.getInt(8);
        if(set.wasNull())
        anObject.transportDepartmentRefCode = Integer.MIN_VALUE;
        anObject.transportDepartmentRefName = set.getString(9);

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

  public int[] getFilteredCodeArrayOLD(ENCheckpointPassList aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCHECKPOINTPASSLIST.CODE FROM ENCHECKPOINTPASSLIST";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCHECKPOINTPASSLIST.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLIST.CODE = ?";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLIST.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLIST.DATEFINAL = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLIST.MODIFY_TIME = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCHECKPOINTPASSLIST.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENCHECKPOINTPASSLIST.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLIST.DATEEDIT = ?";
        }
        if(aFilterObject.checkpointRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCHECKPOINTPASSLIST.CHECKPOINTREFCODE = ? ";
        }
        if(aFilterObject.transportDepartmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCHECKPOINTPASSLIST.TRANSPORTDEPARTMNTRFCD = ? ";
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
        if(aFilterObject.dateStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCHECKPOINTPASSLIST.USERGEN = ?";
             else
                 whereStr = whereStr + " ENCHECKPOINTPASSLIST.USERGEN LIKE ?";

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
       if(aFilterObject.checkpointRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.checkpointRef.code);
       }
       if(aFilterObject.transportDepartmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportDepartmentRef.code);
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

  public int[] getFilteredCodeArray(ENCheckpointPassListFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENCheckpointPassList aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCHECKPOINTPASSLIST.CODE FROM ENCHECKPOINTPASSLIST";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCHECKPOINTPASSLIST.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLIST.CODE = ?";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLIST.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLIST.DATEFINAL = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLIST.MODIFY_TIME = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCHECKPOINTPASSLIST.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENCHECKPOINTPASSLIST.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLIST.DATEEDIT = ?";
        }
        if(aFilterObject.checkpointRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCHECKPOINTPASSLIST.CHECKPOINTREFCODE = ? ";
        }
        if(aFilterObject.transportDepartmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCHECKPOINTPASSLIST.TRANSPORTDEPARTMNTRFCD = ? ";
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
        if(aFilterObject.dateStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCHECKPOINTPASSLIST.USERGEN = ?";
             else
                 whereStr = whereStr + " ENCHECKPOINTPASSLIST.USERGEN LIKE ?";

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
       if(aFilterObject.checkpointRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.checkpointRef.code);
       }
       if(aFilterObject.transportDepartmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportDepartmentRef.code);
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


   public ENCheckpointPassList getObject(int uid) throws PersistenceException
   {
    ENCheckpointPassList result = new ENCheckpointPassList();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENCheckpointPassList anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENCHECKPOINTPASSLIST.CODE, ENCHECKPOINTPASSLIST.DATESTART, ENCHECKPOINTPASSLIST.DATEFINAL, ENCHECKPOINTPASSLIST.MODIFY_TIME, ENCHECKPOINTPASSLIST.USERGEN, ENCHECKPOINTPASSLIST.DATEEDIT, ENCHECKPOINTPASSLIST.CHECKPOINTREFCODE, ENCHECKPOINTPASSLIST.TRANSPORTDEPARTMNTRFCD "
    +" FROM ENCHECKPOINTPASSLIST WHERE ENCHECKPOINTPASSLIST.CODE = ?";

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
        anObject.dateStart = set.getTimestamp(2);
        anObject.dateFinal = set.getTimestamp(3);
        anObject.modify_time = set.getLong(4);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.userGen = set.getString(5);
        anObject.dateEdit = set.getTimestamp(6);
        anObject.checkpointRef.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.checkpointRef.code = Integer.MIN_VALUE;
        anObject.transportDepartmentRef.code = set.getInt(8);
        if ( set.wasNull() )
            anObject.transportDepartmentRef.code = Integer.MIN_VALUE;
        if(anObject.checkpointRef.code != Integer.MIN_VALUE)
        {
           anObject.setCheckpointRef(
        new com.ksoe.energynet.dataminer.generated.ENCheckpointDAOGen(connection,getUserProfile()).getRef(anObject.checkpointRef.code));
    }
        if(anObject.transportDepartmentRef.code != Integer.MIN_VALUE)
        {
           anObject.setTransportDepartmentRef(
        new com.ksoe.energynet.dataminer.generated.ENTransportDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.transportDepartmentRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENCheckpointPassListRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENCheckpointPassListRef ref = new com.ksoe.energynet.valueobject.references.ENCheckpointPassListRef();
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

    selectStr = "DELETE FROM  ENCHECKPOINTPASSLIST WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENCheckpointPassList object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENCheckpointPassList.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENCheckpointPassList.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENCheckpointPassList.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENCheckpointPassList.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENCheckpointPassList.getObject%} access denied");

    selectStr =

    "SELECT  ENCHECKPOINTPASSLIST.CODE FROM  ENCHECKPOINTPASSLIST WHERE  ENCHECKPOINTPASSLIST.CODE = ?";
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
//    _checkConditionToken(condition,"||"," OR ");
    _checkConditionToken(condition,"&&"," AND ");
    _checkConditionToken(condition,"==","=");
    _checkConditionToken(condition,"!=","<>");
    _checkConditionToken(condition,"code","ENCHECKPOINTPASSLIST.CODE");
    _checkConditionToken(condition,"datestart","ENCHECKPOINTPASSLIST.DATESTART");
    _checkConditionToken(condition,"datefinal","ENCHECKPOINTPASSLIST.DATEFINAL");
    _checkConditionToken(condition,"modify_time","ENCHECKPOINTPASSLIST.MODIFY_TIME");
    _checkConditionToken(condition,"usergen","ENCHECKPOINTPASSLIST.USERGEN");
    _checkConditionToken(condition,"dateedit","ENCHECKPOINTPASSLIST.DATEEDIT");
      // relationship conditions
    _checkConditionToken(condition,"checkpointref","CHECKPOINTREFCODE");
    _checkConditionToken(condition,"checkpointref.code","CHECKPOINTREFCODE");
    _checkConditionToken(condition,"transportdepartmentref","TRANSPORTDEPARTMNTRFCD");
    _checkConditionToken(condition,"transportdepartmentref.code","TRANSPORTDEPARTMNTRFCD");
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

   private void _collectAutoIncrementFields(ENCheckpointPassList anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENCHECKPOINTPASSLIST", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENCHECKPOINTPASSLIST", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENCHECKPOINTPASSLIST", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENCHECKPOINTPASSLIST");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENCheckpointPassListDAO
