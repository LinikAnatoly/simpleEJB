
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
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
import com.ksoe.energynet.valueobject.ENStandardConstEntry;
import com.ksoe.energynet.valueobject.brief.ENStandardConstEntryShort;
import com.ksoe.energynet.valueobject.filter.ENStandardConstEntryFilter;
import com.ksoe.energynet.valueobject.lists.ENStandardConstEntryShortList;
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
  *  DAO Generated for ENStandardConstEntry;
  *
  */

public class ENStandardConstEntryDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENStandardConstEntryDAOGen() {super();}
  //public ENStandardConstEntryDAOGen(Connection aConnection) {super(aConnection);}
  //public ENStandardConstEntryDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENStandardConstEntryDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENStandardConstEntryDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENStandardConstEntry inObject) throws PersistenceException
   {
      ENStandardConstEntry obj = new ENStandardConstEntry();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.constEntry.equals(obj.constEntry)){
       return false;
     }

     if ( ! inObject.startDate.equals(obj.startDate)){
       return false;
     }

     if ( ! inObject.endDate.equals(obj.endDate)){
       return false;
     }
     if (inObject.constRef.code != obj.constRef.code){
        return false;
     }
      return true;
   }

   public int add(ENStandardConstEntry anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENStandardConstEntry anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENSTANDARDCONSTENTRY (CODE,CONSTENTRY,STARTDATE,ENDDATE,CONSTREFCODE) VALUES (?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.constEntry != null)
        anObject.constEntry = anObject.constEntry.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.constEntry);
      if (anObject.startDate == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.startDate.getTime()));
      if (anObject.endDate == null)
        statement.setDate(4,null);
      else
        statement.setDate(4,new java.sql.Date(anObject.endDate.getTime()));
      if (anObject.constRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENStandardConstDAOGen(connection,getUserProfile()).exists(anObject.constRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENStandardConstEntry.constRef.code%} = {%"+anObject.constRef.code+"%}");
        statement.setInt(5,anObject.constRef.code);
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
      throw new PersistenceException("Error in method {%ENStandardConstEntryDAOGen.add%}",e);
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

   public void save(ENStandardConstEntry anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENStandardConstEntry anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("CONSTENTRY") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("STARTDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ENDDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONSTREF") == 0)
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
        "UPDATE ENSTANDARDCONSTENTRY SET  CONSTENTRY = ? , STARTDATE = ? , ENDDATE = ? , CONSTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENSTANDARDCONSTENTRY SET ";
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
      if (anObject.constEntry != null)
        anObject.constEntry = anObject.constEntry.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.constEntry);

      if (anObject.startDate == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.startDate.getTime()));
      if (anObject.endDate == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.endDate.getTime()));
      if (anObject.constRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.constRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
          statement.setInt(5,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("CONSTENTRY".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.constEntry != null)
                    anObject.constEntry = anObject.constEntry.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.constEntry);
                continue;
             }
            if("STARTDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.startDate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.startDate.getTime()));
                continue;
             }
            if("ENDDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.endDate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.endDate.getTime()));
                continue;
             }
            if("CONSTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.constRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.constRef.code);
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

   } // end of save(ENStandardConstEntry anObject,String[] anAttributes)


 public ENStandardConstEntryShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENStandardConstEntry filterObject = new ENStandardConstEntry();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENStandardConstEntryShort)list.get(0);
   return null;
  }

  public ENStandardConstEntryShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENStandardConstEntryShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENStandardConstEntryShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENStandardConstEntryShortList getFilteredList(ENStandardConstEntry filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENStandardConstEntryShortList getScrollableFilteredList(ENStandardConstEntry aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENStandardConstEntryShortList getScrollableFilteredList(ENStandardConstEntry aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENStandardConstEntryShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENStandardConstEntryShortList getScrollableFilteredList(ENStandardConstEntryFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENStandardConstEntryShortList getScrollableFilteredList(ENStandardConstEntryFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENStandardConstEntryShortList getScrollableFilteredList(ENStandardConstEntry aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENStandardConstEntryShortList getScrollableFilteredList(ENStandardConstEntry aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENStandardConstEntryShortList result = new ENStandardConstEntryShortList();
    ENStandardConstEntryShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSTANDARDCONSTENTRY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENSTANDARDCONSTENTRY.CODE"+
     ",ENSTANDARDCONSTENTRY.CONSTENTRY"+
     ",ENSTANDARDCONSTENTRY.STARTDATE"+
     ",ENSTANDARDCONSTENTRY.ENDDATE"+

      ", ENSTANDARDCONST.CODE " +
      ", ENSTANDARDCONST.NAME " +
     " FROM ENSTANDARDCONSTENTRY " +
     ", ENSTANDARDCONST " +
     //" WHERE "
    "";
     whereStr = " ENSTANDARDCONST.CODE = ENSTANDARDCONSTENTRY.CONSTREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENSTANDARDCONSTENTRY.CODE IN ( SELECT ENSTANDARDCONSTENTRY.CODE FROM ENSTANDARDCONSTENTRY ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSTANDARDCONSTENTRY.CODE = ?";
        }
        if(aFilterObject.constEntry != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSTANDARDCONSTENTRY.CONSTENTRY = ?";
        }
        if(aFilterObject.startDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSTANDARDCONSTENTRY.STARTDATE = ?";
        }
        if(aFilterObject.endDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSTANDARDCONSTENTRY.ENDDATE = ?";
        }
        if(aFilterObject.constRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSTANDARDCONSTENTRY.CONSTREFCODE = ? ";
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
        if(aFilterObject.constEntry != null){
            number++;
            aFilterObject.constEntry = aFilterObject.constEntry.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.constEntry);
        }
        if(aFilterObject.startDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.startDate.getTime()));
        }
        if(aFilterObject.endDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.endDate.getTime()));
        }
       if(aFilterObject.constRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.constRef.code);
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

        anObject = new ENStandardConstEntryShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.ConstEntry = set.getBigDecimal(2);
        if(anObject.ConstEntry != null)
            anObject.ConstEntry = anObject.ConstEntry.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.startDate = set.getDate(3);
        anObject.endDate = set.getDate(4);

        anObject.constRefCode = set.getInt(5);
        if(set.wasNull())
        anObject.constRefCode = Integer.MIN_VALUE;
        anObject.constRefName = set.getString(6);

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

  public int[] getFilteredCodeArrayOLD(ENStandardConstEntry aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENSTANDARDCONSTENTRY.CODE FROM ENSTANDARDCONSTENTRY";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSTANDARDCONSTENTRY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSTANDARDCONSTENTRY.CODE = ?";
        }
        if(aFilterObject.constEntry != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSTANDARDCONSTENTRY.CONSTENTRY = ?";
        }
        if(aFilterObject.startDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSTANDARDCONSTENTRY.STARTDATE = ?";
        }
        if(aFilterObject.endDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSTANDARDCONSTENTRY.ENDDATE = ?";
        }
        if(aFilterObject.constRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSTANDARDCONSTENTRY.CONSTREFCODE = ? ";
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
        if(aFilterObject.constEntry != null){
            number++;
            aFilterObject.constEntry = aFilterObject.constEntry.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.constEntry);
        }
        if(aFilterObject.startDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.startDate.getTime()));
        }
        if(aFilterObject.endDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.endDate.getTime()));
        }
       if(aFilterObject.constRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.constRef.code);
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

/*********************************/

  public int[] getFilteredCodeArray(ENStandardConstEntryFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENStandardConstEntry aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENSTANDARDCONSTENTRY.CODE FROM ENSTANDARDCONSTENTRY";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSTANDARDCONSTENTRY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSTANDARDCONSTENTRY.CODE = ?";
        }
        if(aFilterObject.constEntry != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSTANDARDCONSTENTRY.CONSTENTRY = ?";
        }
        if(aFilterObject.startDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSTANDARDCONSTENTRY.STARTDATE = ?";
        }
        if(aFilterObject.endDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSTANDARDCONSTENTRY.ENDDATE = ?";
        }
        if(aFilterObject.constRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSTANDARDCONSTENTRY.CONSTREFCODE = ? ";
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
        if(aFilterObject.constEntry != null){
            number++;
            aFilterObject.constEntry = aFilterObject.constEntry.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.constEntry);
        }
        if(aFilterObject.startDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.startDate.getTime()));
        }
        if(aFilterObject.endDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.endDate.getTime()));
        }
       if(aFilterObject.constRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.constRef.code);
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


   public ENStandardConstEntry getObject(int uid) throws PersistenceException
   {
    ENStandardConstEntry result = new ENStandardConstEntry();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENStandardConstEntry anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENSTANDARDCONSTENTRY.CODE, ENSTANDARDCONSTENTRY.CONSTENTRY, ENSTANDARDCONSTENTRY.STARTDATE, ENSTANDARDCONSTENTRY.ENDDATE, ENSTANDARDCONSTENTRY.CONSTREFCODE "
    +" FROM ENSTANDARDCONSTENTRY WHERE ENSTANDARDCONSTENTRY.CODE = ?";

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
        anObject.constEntry = set.getBigDecimal(2);
        if(anObject.constEntry != null)
            anObject.constEntry = anObject.constEntry.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.startDate = set.getDate(3);
        anObject.endDate = set.getDate(4);
        anObject.constRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.constRef.code = Integer.MIN_VALUE;
        if(anObject.constRef.code != Integer.MIN_VALUE)
        {
           anObject.setConstRef(
        new com.ksoe.energynet.dataminer.generated.ENStandardConstDAOGen(connection,getUserProfile()).getRef(anObject.constRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENStandardConstEntryRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENStandardConstEntryRef ref = new com.ksoe.energynet.valueobject.references.ENStandardConstEntryRef();
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

    selectStr = "DELETE FROM  ENSTANDARDCONSTENTRY WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENStandardConstEntry object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENStandardConstEntry.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENStandardConstEntry.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENStandardConstEntry.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENStandardConstEntry.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENStandardConstEntry.getObject%} access denied");

    selectStr =

    "SELECT  ENSTANDARDCONSTENTRY.CODE FROM  ENSTANDARDCONSTENTRY WHERE  ENSTANDARDCONSTENTRY.CODE = ?";
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
    _checkConditionToken(condition,"code","ENSTANDARDCONSTENTRY.CODE");
    _checkConditionToken(condition,"constentry","ENSTANDARDCONSTENTRY.CONSTENTRY");
    _checkConditionToken(condition,"startdate","ENSTANDARDCONSTENTRY.STARTDATE");
    _checkConditionToken(condition,"enddate","ENSTANDARDCONSTENTRY.ENDDATE");
      // relationship conditions
    _checkConditionToken(condition,"constref","CONSTREFCODE");
    _checkConditionToken(condition,"constref.code","CONSTREFCODE");
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

   private void _collectAutoIncrementFields(ENStandardConstEntry anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENSTANDARDCONSTENTRY", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENSTANDARDCONSTENTRY", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENSTANDARDCONSTENTRY", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENSTANDARDCONSTENTRY");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENStandardConstEntryDAO

