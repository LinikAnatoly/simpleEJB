
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

import com.ksoe.energynet.valueobject.SCUsageInputItemOZ2SCCounter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZ2SCCounterFilter;
import com.ksoe.energynet.valueobject.brief.SCUsageInputItemOZ2SCCounterShort;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZ2SCCounterShortList;


/**
 * DAO Object for SCUsageInputItemOZ2SCCounter;
 *
 */

public class SCUsageInputItemOZ2SCCounterDAOGen extends GenericDataMiner {

  public SCUsageInputItemOZ2SCCounterDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public SCUsageInputItemOZ2SCCounterDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(SCUsageInputItemOZ2SCCounter inObject) throws PersistenceException
   {
      SCUsageInputItemOZ2SCCounter obj = new SCUsageInputItemOZ2SCCounter();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.ozRef.code != obj.ozRef.code){
        return false;
     }
     if (inObject.scCounterRef.code != obj.scCounterRef.code){
        return false;
     }
      return true;
   }

   public int add(SCUsageInputItemOZ2SCCounter anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(SCUsageInputItemOZ2SCCounter anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

	anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO SCUSAGEINPUTTMZ2SCCNTR (CODE,MODIFY_TIME,OZREFCODE,SCCOUNTERREFCODE) VALUES (?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(2,null);
      else
        statement.setBigDecimal(2,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.ozRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.SCUsageInputItemOZDAOGen(connection,getUserProfile()).exists(anObject.ozRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCUsageInputItemOZ2SCCounter.ozRef.code%} = {%"+anObject.ozRef.code+"%}");
        statement.setInt(3,anObject.ozRef.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.scCounterRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.SCCounterDAOGen(connection,getUserProfile()).exists(anObject.scCounterRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCUsageInputItemOZ2SCCounter.scCounterRef.code%} = {%"+anObject.scCounterRef.code+"%}");
        statement.setInt(4,anObject.scCounterRef.code);
      }
      else
        statement.setNull(4,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%SCUsageInputItemOZ2SCCounterDAOGen.add%}",e);
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

   public void save(SCUsageInputItemOZ2SCCounter anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(SCUsageInputItemOZ2SCCounter anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      SCUsageInputItemOZ2SCCounter oldObject = new SCUsageInputItemOZ2SCCounter();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+SCUsageInputItemOZ2SCCounter.modify_time_Field+" FROM  SCUSAGEINPUTTMZ2SCCNTR WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("MODIFY_TIME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("OZREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SCCOUNTERREF") == 0)
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
        "UPDATE SCUSAGEINPUTTMZ2SCCNTR SET  MODIFY_TIME = ? , OZREFCODE = ? , SCCOUNTERREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE SCUSAGEINPUTITEMOZ2SCCOUNTER SET ";
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
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(1,null);
      else
        statement.setBigDecimal(1,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.ozRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.ozRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.scCounterRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.scCounterRef.code);
      else
        statement.setNull(3,java.sql.Types.INTEGER);
          statement.setInt(4,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(i+1,null);
                else
                     statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
                continue;
             }
            if("OZREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.ozRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.ozRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("SCCOUNTERREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.scCounterRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.scCounterRef.code);
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

   } // end of save(SCUsageInputItemOZ2SCCounter anObject,String[] anAttributes)


 public SCUsageInputItemOZ2SCCounterShort getShortObject(int anObjectCode) throws PersistenceException
  {
   SCUsageInputItemOZ2SCCounter filterObject = new SCUsageInputItemOZ2SCCounter();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (SCUsageInputItemOZ2SCCounterShort)list.get(0);
   return null;
  }

  public SCUsageInputItemOZ2SCCounterShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public SCUsageInputItemOZ2SCCounterShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public SCUsageInputItemOZ2SCCounterShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public SCUsageInputItemOZ2SCCounterShortList getFilteredList(SCUsageInputItemOZ2SCCounter filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public SCUsageInputItemOZ2SCCounterShortList getScrollableFilteredList(SCUsageInputItemOZ2SCCounter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public SCUsageInputItemOZ2SCCounterShortList getScrollableFilteredList(SCUsageInputItemOZ2SCCounter aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public SCUsageInputItemOZ2SCCounterShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public SCUsageInputItemOZ2SCCounterShortList getScrollableFilteredList(SCUsageInputItemOZ2SCCounterFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public SCUsageInputItemOZ2SCCounterShortList getScrollableFilteredList(SCUsageInputItemOZ2SCCounterFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public SCUsageInputItemOZ2SCCounterShortList getScrollableFilteredList(SCUsageInputItemOZ2SCCounter aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public SCUsageInputItemOZ2SCCounterShortList getScrollableFilteredList(SCUsageInputItemOZ2SCCounter aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    SCUsageInputItemOZ2SCCounterShortList result = new SCUsageInputItemOZ2SCCounterShortList();
    SCUsageInputItemOZ2SCCounterShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "SCUSAGEINPUTTMZ2SCCNTR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "SCUSAGEINPUTTMZ2SCCNTR.CODE"+

      ", SCUSAGEINPUTITEMOZ.CODE " +
      ", SCUSAGEINPUTITEMOZ.NUMBERDOC " +
      ", SCUSAGEINPUTITEMOZ.COUNTERTYPE " +
      ", SCUSAGEINPUTITEMOZ.ACCOUNT " +
      ", SCUSAGEINPUTITEMOZ.COST " +
      ", SCUSAGEINPUTITEMOZ.COUNTGEN " +
      ", SCUSAGEINPUTITEMOZ.SCCODE " +
      ", SCCOUNTER.CODE " +
      ", SCCOUNTER.INVNUMBER " +
      ", SCCOUNTER.NAME " +
      ", SCCOUNTER.BUILDNUMBER " +
      ", SCCOUNTER.ACCOUNT " +
      ", SCCOUNTER.DEPARTMETFKCODE " +
      ", SCCOUNTER.MOLCODE " +
      ", SCCOUNTER.DATEIN " +
      ", SCCOUNTER.DATEBUILD " +
      ", SCCOUNTER.DATECHECK " +
      ", SCCOUNTER.COST " +
      ", SCCOUNTER.SCCODE " +
      ", SCCOUNTER.COUNTERTYPE " +
      ", SCCOUNTER.INSTALLORDERNUMBER " +
      ", SCCOUNTER.READING " +
      ", SCCOUNTER.DATEEDIT " +
     " FROM SCUSAGEINPUTTMZ2SCCNTR " +
     ", SCUSAGEINPUTITEMOZ " +
     ", SCCOUNTER " +
     //" WHERE "
	"";
     whereStr = " SCUSAGEINPUTITEMOZ.CODE = SCUSAGEINPUTTMZ2SCCNTR.OZREFCODE" ; //+
      whereStr = whereStr +" AND SCCOUNTER.CODE = SCUSAGEINPUTTMZ2SCCNTR.SCCOUNTERREFCODE" ; //+
		//selectStr = selectStr + " ${s} SCUSAGEINPUTTMZ2SCCNTR.CODE IN ( SELECT SCUSAGEINPUTTMZ2SCCNTR.CODE FROM SCUSAGEINPUTTMZ2SCCNTR ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTTMZ2SCCNTR.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTTMZ2SCCNTR.MODIFY_TIME = ?";
        }
        if(aFilterObject.ozRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "SCUSAGEINPUTTMZ2SCCNTR.OZREFCODE = ? ";
        }
        if(aFilterObject.scCounterRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "SCUSAGEINPUTTMZ2SCCNTR.SCCOUNTERREFCODE = ? ";
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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.ozRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ozRef.code);
       }
       if(aFilterObject.scCounterRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.scCounterRef.code);
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

        anObject = new SCUsageInputItemOZ2SCCounterShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.ozRefCode = set.getInt(2);
		if(set.wasNull())
		   anObject.ozRefCode = Integer.MIN_VALUE;
        anObject.ozRefNumberDoc = set.getString(3);
        anObject.ozRefCounterType = set.getString(4);
        anObject.ozRefAccount = set.getString(5);
        anObject.ozRefCost = set.getBigDecimal(6);
        if(anObject.ozRefCost != null)
          anObject.ozRefCost = anObject.ozRefCost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ozRefCountGen = set.getInt(7);
		if(set.wasNull())
		   anObject.ozRefCountGen = Integer.MIN_VALUE;
        anObject.ozRefScCode = set.getInt(8);
		if(set.wasNull())
		   anObject.ozRefScCode = Integer.MIN_VALUE;
        anObject.scCounterRefCode = set.getInt(9);
		if(set.wasNull())
		   anObject.scCounterRefCode = Integer.MIN_VALUE;
        anObject.scCounterRefInvNumber = set.getString(10);
        anObject.scCounterRefName = set.getString(11);
        anObject.scCounterRefBuildNumber = set.getString(12);
        anObject.scCounterRefAccount = set.getString(13);
        anObject.scCounterRefDepartmetFKCode = set.getString(14);
        anObject.scCounterRefMolCode = set.getString(15);
        anObject.scCounterRefDateIn = set.getDate(16);
        anObject.scCounterRefDateBuild = set.getDate(17);
        anObject.scCounterRefDateCheck = set.getDate(18);
        anObject.scCounterRefCost = set.getBigDecimal(19);
        if(anObject.scCounterRefCost != null)
          anObject.scCounterRefCost = anObject.scCounterRefCost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.scCounterRefScCode = set.getInt(20);
		if(set.wasNull())
		   anObject.scCounterRefScCode = Integer.MIN_VALUE;
        anObject.scCounterRefCounterType = set.getString(21);
        anObject.scCounterRefInstallOrderNumber = set.getString(22);
        anObject.scCounterRefReading = set.getString(23);
        anObject.scCounterRefDateEdit = set.getTimestamp(24);

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

  public int[] getFilteredCodeArrayOLD(SCUsageInputItemOZ2SCCounter aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT SCUSAGEINPUTTMZ2SCCNTR.CODE FROM SCUSAGEINPUTTMZ2SCCNTR";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "SCUSAGEINPUTTMZ2SCCNTR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTTMZ2SCCNTR.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTTMZ2SCCNTR.MODIFY_TIME = ?";
        }
        if(aFilterObject.ozRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCUSAGEINPUTTMZ2SCCNTR.OZREFCODE = ? ";
        }
        if(aFilterObject.scCounterRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCUSAGEINPUTTMZ2SCCNTR.SCCOUNTERREFCODE = ? ";
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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.ozRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ozRef.code);
       }
       if(aFilterObject.scCounterRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.scCounterRef.code);
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

  public int[] getFilteredCodeArray(SCUsageInputItemOZ2SCCounterFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
	return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(SCUsageInputItemOZ2SCCounter aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT SCUSAGEINPUTTMZ2SCCNTR.CODE FROM SCUSAGEINPUTTMZ2SCCNTR";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "SCUSAGEINPUTTMZ2SCCNTR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTTMZ2SCCNTR.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTTMZ2SCCNTR.MODIFY_TIME = ?";
        }
        if(aFilterObject.ozRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCUSAGEINPUTTMZ2SCCNTR.OZREFCODE = ? ";
        }
        if(aFilterObject.scCounterRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCUSAGEINPUTTMZ2SCCNTR.SCCOUNTERREFCODE = ? ";
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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.ozRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ozRef.code);
       }
       if(aFilterObject.scCounterRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.scCounterRef.code);
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


   public SCUsageInputItemOZ2SCCounter getObject(int uid) throws PersistenceException
   {
    SCUsageInputItemOZ2SCCounter result = new SCUsageInputItemOZ2SCCounter();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(SCUsageInputItemOZ2SCCounter anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  SCUSAGEINPUTTMZ2SCCNTR.CODE, SCUSAGEINPUTTMZ2SCCNTR.MODIFY_TIME, SCUSAGEINPUTTMZ2SCCNTR.OZREFCODE, SCUSAGEINPUTTMZ2SCCNTR.SCCOUNTERREFCODE "
    +" FROM SCUSAGEINPUTTMZ2SCCNTR WHERE SCUSAGEINPUTTMZ2SCCNTR.CODE = ?";

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
        anObject.modify_time = set.getLong(2);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.ozRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.ozRef.code = Integer.MIN_VALUE;
        anObject.scCounterRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.scCounterRef.code = Integer.MIN_VALUE;
        if(anObject.ozRef.code != Integer.MIN_VALUE)
        {
           anObject.setOzRef(
		   new com.ksoe.energynet.dataminer.generated.SCUsageInputItemOZDAOGen(connection,getUserProfile()).getRef(anObject.ozRef.code));
	   }
        if(anObject.scCounterRef.code != Integer.MIN_VALUE)
        {
           anObject.setScCounterRef(
		   new com.ksoe.energynet.dataminer.generated.SCCounterDAOGen(connection,getUserProfile()).getRef(anObject.scCounterRef.code));
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


  public com.ksoe.energynet.valueobject.references.SCUsageInputItemOZ2SCCounterRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.SCUsageInputItemOZ2SCCounterRef ref = new com.ksoe.energynet.valueobject.references.SCUsageInputItemOZ2SCCounterRef();
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

    selectStr = "DELETE FROM  SCUSAGEINPUTTMZ2SCCNTR WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SCUsageInputItemOZ2SCCounter object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%SCUsageInputItemOZ2SCCounter.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInputItemOZ2SCCounter.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%SCUsageInputItemOZ2SCCounter.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInputItemOZ2SCCounter.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%SCUsageInputItemOZ2SCCounter.getObject%} access denied");

    selectStr =

    "SELECT  SCUSAGEINPUTTMZ2SCCNTR.CODE FROM  SCUSAGEINPUTTMZ2SCCNTR WHERE  SCUSAGEINPUTTMZ2SCCNTR.CODE = ?";
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
    _checkConditionToken(condition,"code","SCUSAGEINPUTTMZ2SCCNTR.CODE");
    _checkConditionToken(condition,"modify_time","SCUSAGEINPUTTMZ2SCCNTR.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"ozref","OZREFCODE");
    _checkConditionToken(condition,"ozref.code","OZREFCODE");
    _checkConditionToken(condition,"sccounterref","SCCOUNTERREFCODE");
    _checkConditionToken(condition,"sccounterref.code","SCCOUNTERREFCODE");
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

	private void _collectAutoIncrementFields(SCUsageInputItemOZ2SCCounter anObject,
			Connection connection) throws PersistenceException {
		
		SequenceKey hashKey = new SequenceKey("SCUSAGEINPUTTMZ2SCCNTR", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("SCUSAGEINPUTTMZ2SCCNTR", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("SCUSAGEINPUTTMZ2SCCNTR", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}
		
		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
					"Can't obtain auto increment value from: SCUSAGEINPUTTMZ2SCCNTR");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of SCUsageInputItemOZ2SCCounterDAO
