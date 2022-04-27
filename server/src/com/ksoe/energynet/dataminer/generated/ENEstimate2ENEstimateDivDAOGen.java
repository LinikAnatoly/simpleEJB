
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
import com.ksoe.energynet.valueobject.ENEstimate2ENEstimateDiv;
import com.ksoe.energynet.valueobject.brief.ENEstimate2ENEstimateDivShort;
import com.ksoe.energynet.valueobject.filter.ENEstimate2ENEstimateDivFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimate2ENEstimateDivShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENEstimate2ENEstimateDiv;
 *
 */

public class ENEstimate2ENEstimateDivDAOGen extends GenericDataMiner {

  public ENEstimate2ENEstimateDivDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENEstimate2ENEstimateDivDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENEstimate2ENEstimateDiv inObject) throws PersistenceException
   {
      ENEstimate2ENEstimateDiv obj = new ENEstimate2ENEstimateDiv();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.countGen.equals(obj.countGen)){
       return false;
     }
     if (inObject.estimateItemInRef.code != obj.estimateItemInRef.code){
        return false;
     }
     if (inObject.estimateItemOutRef.code != obj.estimateItemOutRef.code){
        return false;
     }
      return true;
   }

   public int add(ENEstimate2ENEstimateDiv anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENEstimate2ENEstimateDiv anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENESTIMATE2ENESTIMATDV (CODE,COUNTGEN,MODIFY_TIME,ESTIMATEITEMINREFCODE,ESTIMATEITEMOUTREFCODE) VALUES (?,?,?,?,?)";

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
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(3,null);
      else
        statement.setBigDecimal(3,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.estimateItemInRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).exists(anObject.estimateItemInRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimate2ENEstimateDiv.estimateItemInRef.code%} = {%"+anObject.estimateItemInRef.code+"%}");
        statement.setInt(4,anObject.estimateItemInRef.code);
      }
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.estimateItemOutRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).exists(anObject.estimateItemOutRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimate2ENEstimateDiv.estimateItemOutRef.code%} = {%"+anObject.estimateItemOutRef.code+"%}");
        statement.setInt(5,anObject.estimateItemOutRef.code);
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
      throw new PersistenceException("Error in method {%ENEstimate2ENEstimateDivDAOGen.add%}",e);
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

   public void save(ENEstimate2ENEstimateDiv anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENEstimate2ENEstimateDiv anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENEstimate2ENEstimateDiv oldObject = new ENEstimate2ENEstimateDiv();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENEstimate2ENEstimateDiv.modify_time_Field+" FROM  ENESTIMATE2ENESTIMATDV WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("COUNTGEN") == 0)
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
          if(fieldNameStr.compareTo("ESTIMATEITEMINREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ESTIMATEITEMOUTREF") == 0)
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
        "UPDATE ENESTIMATE2ENESTIMATDV SET  COUNTGEN = ? , MODIFY_TIME = ? , ESTIMATEITEMINREFCODE = ? , ESTIMATEITEMOUTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENESTIMATE2ENESTIMATEDIV SET ";
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

      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(2,null);
      else
        statement.setBigDecimal(2,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.estimateItemInRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.estimateItemInRef.code);
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.estimateItemOutRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.estimateItemOutRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
          statement.setInt(5,anObject.code);
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
            if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(i+1,null);
                else
                     statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
                continue;
             }
            if("ESTIMATEITEMINREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.estimateItemInRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.estimateItemInRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("ESTIMATEITEMOUTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.estimateItemOutRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.estimateItemOutRef.code);
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

   } // end of save(ENEstimate2ENEstimateDiv anObject,String[] anAttributes)


 public ENEstimate2ENEstimateDivShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENEstimate2ENEstimateDiv filterObject = new ENEstimate2ENEstimateDiv();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENEstimate2ENEstimateDivShort)list.get(0);
   return null;
  }

  public ENEstimate2ENEstimateDivShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENEstimate2ENEstimateDivShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENEstimate2ENEstimateDivShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENEstimate2ENEstimateDivShortList getFilteredList(ENEstimate2ENEstimateDiv filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENEstimate2ENEstimateDivShortList getScrollableFilteredList(ENEstimate2ENEstimateDiv aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENEstimate2ENEstimateDivShortList getScrollableFilteredList(ENEstimate2ENEstimateDiv aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENEstimate2ENEstimateDivShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENEstimate2ENEstimateDivShortList getScrollableFilteredList(ENEstimate2ENEstimateDivFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENEstimate2ENEstimateDivShortList getScrollableFilteredList(ENEstimate2ENEstimateDivFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENEstimate2ENEstimateDivShortList getScrollableFilteredList(ENEstimate2ENEstimateDiv aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENEstimate2ENEstimateDivShortList getScrollableFilteredList(ENEstimate2ENEstimateDiv aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENEstimate2ENEstimateDivShortList result = new ENEstimate2ENEstimateDivShortList();
    ENEstimate2ENEstimateDivShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENESTIMATE2ENESTIMATDV.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENESTIMATE2ENESTIMATDV.CODE"+
     ",ENESTIMATE2ENESTIMATDV.COUNTGEN"+

      ", ENESTIMATEITEM.CODE " +
      ", ENESTIMATEITEM.COUNTGEN " +
      ", ENESTIMATEITEM.COUNTFACT " +
      ", ENESTIMATEITEM.PRICE " +
      ", ENESTIMATEITEM.COST " +
      ", ENESTIMATEITEM.ISUSEVAT " +
      ", ENESTIMATEITEM.DELIVERYTIME " +
      ", ENESTIMATEITEM.USEWORKTIME " +
      ", ENESTIMATEITEM.USERGEN " +
      ", ENESTIMATEITEM.DATEEDIT " +
      ", ENESTIMATEITEM.CODE " +
      ", ENESTIMATEITEM.COUNTGEN " +
      ", ENESTIMATEITEM.COUNTFACT " +
      ", ENESTIMATEITEM.PRICE " +
      ", ENESTIMATEITEM.COST " +
      ", ENESTIMATEITEM.ISUSEVAT " +
      ", ENESTIMATEITEM.DELIVERYTIME " +
      ", ENESTIMATEITEM.USEWORKTIME " +
      ", ENESTIMATEITEM.USERGEN " +
      ", ENESTIMATEITEM.DATEEDIT " +
     " FROM ENESTIMATE2ENESTIMATDV " +
     ", ENESTIMATEITEM " +
     ", ENESTIMATEITEM " +
     //" WHERE "
    "";
     whereStr = " ENESTIMATEITEM.CODE = ENESTIMATE2ENESTIMATDV.ESTIMATEITEMINREFCODE" ; //+
      whereStr = whereStr +" AND ENESTIMATEITEM.CODE = ENESTIMATE2ENESTIMATDV.ESTIMATEITEMOUTREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENESTIMATE2ENESTIMATDV.CODE IN ( SELECT ENESTIMATE2ENESTIMATDV.CODE FROM ENESTIMATE2ENESTIMATDV ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATE2ENESTIMATDV.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATE2ENESTIMATDV.COUNTGEN = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATE2ENESTIMATDV.MODIFY_TIME = ?";
        }
        if(aFilterObject.estimateItemInRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATE2ENESTIMATDV.ESTIMATEITEMINREFCODE = ? ";
        }
        if(aFilterObject.estimateItemOutRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATE2ENESTIMATDV.ESTIMATEITEMOUTREFCODE = ? ";
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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.estimateItemInRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemInRef.code);
       }
       if(aFilterObject.estimateItemOutRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemOutRef.code);
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

        anObject = new ENEstimate2ENEstimateDivShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.countGen = set.getBigDecimal(2);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.estimateItemInRefCode = set.getInt(3);
        if(set.wasNull())
        anObject.estimateItemInRefCode = Integer.MIN_VALUE;
        anObject.estimateItemInRefCountGen = set.getBigDecimal(4);
        if(anObject.estimateItemInRefCountGen != null)
          anObject.estimateItemInRefCountGen = anObject.estimateItemInRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemInRefCountFact = set.getBigDecimal(5);
        if(anObject.estimateItemInRefCountFact != null)
          anObject.estimateItemInRefCountFact = anObject.estimateItemInRefCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemInRefPrice = set.getBigDecimal(6);
        if(anObject.estimateItemInRefPrice != null)
          anObject.estimateItemInRefPrice = anObject.estimateItemInRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemInRefCost = set.getBigDecimal(7);
        if(anObject.estimateItemInRefCost != null)
          anObject.estimateItemInRefCost = anObject.estimateItemInRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemInRefIsUseVAT = set.getInt(8);
        if(set.wasNull())
        anObject.estimateItemInRefIsUseVAT = Integer.MIN_VALUE;
        anObject.estimateItemInRefDeliveryTime = set.getInt(9);
        if(set.wasNull())
        anObject.estimateItemInRefDeliveryTime = Integer.MIN_VALUE;
        anObject.estimateItemInRefUseWorkTime = set.getInt(10);
        if(set.wasNull())
        anObject.estimateItemInRefUseWorkTime = Integer.MIN_VALUE;
        anObject.estimateItemInRefUserGen = set.getString(11);
        anObject.estimateItemInRefDateEdit = set.getDate(12);
        anObject.estimateItemOutRefCode = set.getInt(13);
        if(set.wasNull())
        anObject.estimateItemOutRefCode = Integer.MIN_VALUE;
        anObject.estimateItemOutRefCountGen = set.getBigDecimal(14);
        if(anObject.estimateItemOutRefCountGen != null)
          anObject.estimateItemOutRefCountGen = anObject.estimateItemOutRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemOutRefCountFact = set.getBigDecimal(15);
        if(anObject.estimateItemOutRefCountFact != null)
          anObject.estimateItemOutRefCountFact = anObject.estimateItemOutRefCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemOutRefPrice = set.getBigDecimal(16);
        if(anObject.estimateItemOutRefPrice != null)
          anObject.estimateItemOutRefPrice = anObject.estimateItemOutRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemOutRefCost = set.getBigDecimal(17);
        if(anObject.estimateItemOutRefCost != null)
          anObject.estimateItemOutRefCost = anObject.estimateItemOutRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemOutRefIsUseVAT = set.getInt(18);
        if(set.wasNull())
        anObject.estimateItemOutRefIsUseVAT = Integer.MIN_VALUE;
        anObject.estimateItemOutRefDeliveryTime = set.getInt(19);
        if(set.wasNull())
        anObject.estimateItemOutRefDeliveryTime = Integer.MIN_VALUE;
        anObject.estimateItemOutRefUseWorkTime = set.getInt(20);
        if(set.wasNull())
        anObject.estimateItemOutRefUseWorkTime = Integer.MIN_VALUE;
        anObject.estimateItemOutRefUserGen = set.getString(21);
        anObject.estimateItemOutRefDateEdit = set.getDate(22);

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

  public int[] getFilteredCodeArrayOLD(ENEstimate2ENEstimateDiv aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENESTIMATE2ENESTIMATDV.CODE FROM ENESTIMATE2ENESTIMATDV";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENESTIMATE2ENESTIMATDV.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATE2ENESTIMATDV.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATE2ENESTIMATDV.COUNTGEN = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATE2ENESTIMATDV.MODIFY_TIME = ?";
        }
        if(aFilterObject.estimateItemInRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATE2ENESTIMATDV.ESTIMATEITEMINREFCODE = ? ";
        }
        if(aFilterObject.estimateItemOutRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATE2ENESTIMATDV.ESTIMATEITEMOUTREFCODE = ? ";
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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.estimateItemInRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemInRef.code);
       }
       if(aFilterObject.estimateItemOutRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemOutRef.code);
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

  public int[] getFilteredCodeArray(ENEstimate2ENEstimateDivFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENEstimate2ENEstimateDiv aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENESTIMATE2ENESTIMATDV.CODE FROM ENESTIMATE2ENESTIMATDV";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENESTIMATE2ENESTIMATDV.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATE2ENESTIMATDV.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATE2ENESTIMATDV.COUNTGEN = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATE2ENESTIMATDV.MODIFY_TIME = ?";
        }
        if(aFilterObject.estimateItemInRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATE2ENESTIMATDV.ESTIMATEITEMINREFCODE = ? ";
        }
        if(aFilterObject.estimateItemOutRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATE2ENESTIMATDV.ESTIMATEITEMOUTREFCODE = ? ";
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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.estimateItemInRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemInRef.code);
       }
       if(aFilterObject.estimateItemOutRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemOutRef.code);
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


   public ENEstimate2ENEstimateDiv getObject(int uid) throws PersistenceException
   {
    ENEstimate2ENEstimateDiv result = new ENEstimate2ENEstimateDiv();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENEstimate2ENEstimateDiv anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENESTIMATE2ENESTIMATDV.CODE, ENESTIMATE2ENESTIMATDV.COUNTGEN, ENESTIMATE2ENESTIMATDV.MODIFY_TIME, ENESTIMATE2ENESTIMATDV.ESTIMATEITEMINREFCODE, ENESTIMATE2ENESTIMATDV.ESTIMATEITEMOUTREFCODE "
    +" FROM ENESTIMATE2ENESTIMATDV WHERE ENESTIMATE2ENESTIMATDV.CODE = ?";

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
        anObject.modify_time = set.getLong(3);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.estimateItemInRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.estimateItemInRef.code = Integer.MIN_VALUE;
        anObject.estimateItemOutRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.estimateItemOutRef.code = Integer.MIN_VALUE;
        if(anObject.estimateItemInRef.code != Integer.MIN_VALUE)
        {
           anObject.setEstimateItemInRef(
        new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).getRef(anObject.estimateItemInRef.code));
    }
        if(anObject.estimateItemOutRef.code != Integer.MIN_VALUE)
        {
           anObject.setEstimateItemOutRef(
        new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).getRef(anObject.estimateItemOutRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENEstimate2ENEstimateDivRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENEstimate2ENEstimateDivRef ref = new com.ksoe.energynet.valueobject.references.ENEstimate2ENEstimateDivRef();
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

    selectStr = "DELETE FROM  ENESTIMATE2ENESTIMATDV WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENEstimate2ENEstimateDiv object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENEstimate2ENEstimateDiv.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENEstimate2ENEstimateDiv.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENEstimate2ENEstimateDiv.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENEstimate2ENEstimateDiv.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENEstimate2ENEstimateDiv.getObject%} access denied");

    selectStr =

    "SELECT  ENESTIMATE2ENESTIMATDV.CODE FROM  ENESTIMATE2ENESTIMATDV WHERE  ENESTIMATE2ENESTIMATDV.CODE = ?";
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
    _checkConditionToken(condition,"code","ENESTIMATE2ENESTIMATDV.CODE");
    _checkConditionToken(condition,"countgen","ENESTIMATE2ENESTIMATDV.COUNTGEN");
    _checkConditionToken(condition,"modify_time","ENESTIMATE2ENESTIMATDV.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"estimateiteminref","ESTIMATEITEMINREFCODE");
    _checkConditionToken(condition,"estimateiteminref.code","ESTIMATEITEMINREFCODE");
    _checkConditionToken(condition,"estimateitemoutref","ESTIMATEITEMOUTREFCODE");
    _checkConditionToken(condition,"estimateitemoutref.code","ESTIMATEITEMOUTREFCODE");
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

   private void _collectAutoIncrementFields(ENEstimate2ENEstimateDiv anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENESTIMATE2ENESTIMATDV", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENESTIMATE2ENESTIMATDV", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENESTIMATE2ENESTIMATDV", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENESTIMATE2ENESTIMATDV");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENEstimate2ENEstimateDivDAO
