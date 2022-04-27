
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

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.valueobject.ENHumenItem;
import com.ksoe.energynet.valueobject.brief.ENHumenItemShort;
import com.ksoe.energynet.valueobject.filter.ENHumenItemFilter;
import com.ksoe.energynet.valueobject.lists.ENHumenItemShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENHumenItem;
 *
 */

public class ENHumenItemDAOGen extends GenericDataMiner {

   public ENHumenItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENHumenItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   private boolean isEqual(ENHumenItem inObject) throws PersistenceException
   {
      ENHumenItem obj = new ENHumenItem();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.countGen.equals(obj.countGen)){
       return false;
     }

     if ( ! inObject.countFact.equals(obj.countFact)){
       return false;
     }

     if ( ! inObject.countFactOriginal.equals(obj.countFactOriginal)){
       return false;
     }

     if ( ! inObject.price.equals(obj.price)){
       return false;
     }

     if ( ! inObject.cost.equals(obj.cost)){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }
     if (inObject.planRef.code != obj.planRef.code){
        return false;
     }
     if (inObject.planItemRef.code != obj.planItemRef.code){
        return false;
     }
     if (inObject.positionGen.code != obj.positionGen.code){
        return false;
     }
     if (inObject.typeRef.code != obj.typeRef.code){
        return false;
     }
     if (inObject.finWorker.code != obj.finWorker.code){
        return false;
     }
      return true;
   }

   public int add(ENHumenItem anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENHumenItem anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENHUMENITEM (CODE,COUNTGEN,COUNTFACT,COUNTFACTORIGINAL,PRICE,COST,COMMENTGEN,USERGEN,DATEEDIT,MODIFY_TIME,PLANREFCODE,PLANITEMREFCODE,POSITIONGENCODE,TYPEREFCODE,FINWORKERCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.countGen);
      if (anObject.countFact != null)
        anObject.countFact = anObject.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.countFact);
      if (anObject.countFactOriginal != null)
        anObject.countFactOriginal = anObject.countFactOriginal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.countFactOriginal);
      if (anObject.price != null)
        anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.price);
      if (anObject.cost != null)
        anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.cost);
      statement.setString(7,anObject.commentGen);
      statement.setString(8,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(9,null);
      else
        statement.setDate(9,new java.sql.Date(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(10,null);
      else
        statement.setBigDecimal(10,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.planRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENHumenItem.planRef.code%} = {%"+anObject.planRef.code+"%}");
        statement.setInt(11,anObject.planRef.code);
      }
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.planItemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkItemDAOGen(connection,getUserProfile()).exists(anObject.planItemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENHumenItem.planItemRef.code%} = {%"+anObject.planItemRef.code+"%}");
        statement.setInt(12,anObject.planItemRef.code);
      }
      else
        statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.positionGen.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKPositionDAOGen(connection,getUserProfile()).exists(anObject.positionGen.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENHumenItem.positionGen.code%} = {%"+anObject.positionGen.code+"%}");
        statement.setInt(13,anObject.positionGen.code);
      }
      else
        statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.typeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemTypeDAOGen(connection,getUserProfile()).exists(anObject.typeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENHumenItem.typeRef.code%} = {%"+anObject.typeRef.code+"%}");
        statement.setInt(14,anObject.typeRef.code);
      }
      else
        statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.finWorker.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).exists(anObject.finWorker.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENHumenItem.finWorker.code%} = {%"+anObject.finWorker.code+"%}");
        statement.setInt(15,anObject.finWorker.code);
      }
      else
        statement.setNull(15,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENHumenItemDAOGen.add%}",e);
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

   public void save(ENHumenItem anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENHumenItem anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENHumenItem oldObject = new ENHumenItem();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENHumenItem.modify_time_Field + " FROM  ENHUMENITEM WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("COUNTFACT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNTFACTORIGINAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PRICE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COST") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COMMENTGEN") == 0)
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

          if(fieldNameStr.compareTo("MODIFY_TIME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PLANREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PLANITEMREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POSITIONGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TYPEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINWORKER") == 0)
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
        "UPDATE ENHUMENITEM SET  COUNTGEN = ? , COUNTFACT = ? , COUNTFACTORIGINAL = ? , PRICE = ? , COST = ? , COMMENTGEN = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , PLANREFCODE = ? , PLANITEMREFCODE = ? , POSITIONGENCODE = ? , TYPEREFCODE = ? , FINWORKERCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENHUMENITEM SET ";
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
        anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.countGen);
      if (anObject.countFact != null)
        anObject.countFact = anObject.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.countFact);
      if (anObject.countFactOriginal != null)
        anObject.countFactOriginal = anObject.countFactOriginal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.countFactOriginal);
      if (anObject.price != null)
        anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.price);
      if (anObject.cost != null)
        anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.cost);
      statement.setString(6,anObject.commentGen);
      statement.setString(7,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(8,null);
      else
        statement.setDate(8,new java.sql.Date(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(9,null);
      else
        statement.setBigDecimal(9,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.planRef.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.planRef.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.planItemRef.code != Integer.MIN_VALUE)
        statement.setInt(11,anObject.planItemRef.code);
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.positionGen.code != Integer.MIN_VALUE)
        statement.setInt(12,anObject.positionGen.code);
      else
        statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.typeRef.code != Integer.MIN_VALUE)
        statement.setInt(13,anObject.typeRef.code);
      else
        statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.finWorker.code != Integer.MIN_VALUE)
        statement.setInt(14,anObject.finWorker.code);
      else
        statement.setNull(14,java.sql.Types.INTEGER);
          statement.setInt(15,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("COUNTGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countGen != null)
                    anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countGen);
                continue;
             }
            if("COUNTFACT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countFact != null)
                    anObject.countFact = anObject.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countFact);
                continue;
             }
            if("COUNTFACTORIGINAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countFactOriginal != null)
                    anObject.countFactOriginal = anObject.countFactOriginal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countFactOriginal);
                continue;
             }
            if("PRICE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.price != null)
                    anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.price);
                continue;
             }
            if("COST".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.cost != null)
                    anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.cost);
                continue;
             }
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
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
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.dateEdit.getTime()));
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
            if("PLANREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.planRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.planRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("PLANITEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.planItemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.planItemRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("POSITIONGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.positionGen.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.positionGen.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.typeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.typeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("FINWORKER".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.finWorker.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.finWorker.code);
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

   } // end of save(ENHumenItem anObject,String[] anAttributes)


 public ENHumenItemShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENHumenItem filterObject = new ENHumenItem();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENHumenItemShort)list.get(0);
   return null;
  }

  public ENHumenItemShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENHumenItemShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENHumenItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENHumenItemShortList getFilteredList(ENHumenItem filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENHumenItemShortList getScrollableFilteredList(ENHumenItem aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENHumenItemShortList getScrollableFilteredList(ENHumenItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENHumenItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENHumenItemShortList getScrollableFilteredList(ENHumenItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENHumenItemShortList getScrollableFilteredList(ENHumenItemFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENHumenItemShortList getScrollableFilteredList(ENHumenItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENHumenItemShortList getScrollableFilteredList(ENHumenItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENHumenItemShortList result = new ENHumenItemShortList();
    ENHumenItemShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENHUMENITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENHUMENITEM.CODE"+
     ",ENHUMENITEM.COUNTGEN"+
     ",ENHUMENITEM.COUNTFACT"+
     ",ENHUMENITEM.COUNTFACTORIGINAL"+
     ",ENHUMENITEM.PRICE"+
     ",ENHUMENITEM.COST"+
     ",ENHUMENITEM.USERGEN"+
     ",ENHUMENITEM.DATEEDIT"+

      ", ENPLANWORK.CODE " +
      ", ENPLANWORK.DATEGEN " +
      ", ENPLANWORK.DATESTART " +
      ", ENPLANWORK.DATEFINAL " +
      ", ENPLANWORK.YEARGEN " +
      ", ENPLANWORK.MONTHGEN " +
      ", ENPLANWORK.YEARORIGINAL " +
      ", ENPLANWORK.MONTHORIGINAL " +
      ", ENPLANWORK.USERGEN " +
      ", ENPLANWORK.DATEEDIT " +
      ", ENPLANWORK.WORKORDERNUMBER " +
      ", ENPLANWORK.DATEWORKORDER " +
      ", ENPLANWORK.PRICONNECTIONNUMBER " +
      ", ENPLANWORK.DATEENDPRICONNECTION " +
      ", ENPLANWORK.INVESTWORKSDESCRIPTION " +
      ", ENPLANWORK.SERVICESFSIDEFINID " +
      ", ENPLANWORK.SERVICESFSIDECNNUM " +
      ", ENPLANWORK.TOTALTIMEHOURS " +
      ", ENPLANWORK.TOTALTIMEDAYS " +
      ", ENPLANWORK.INVESTITEMNUMBER " +
      ", ENPLANWORKITEM.CODE " +
      ", ENPLANWORKITEM.COUNTGEN " +
      ", ENPLANWORKITEM.TIMEGEN " +
      ", ENPLANWORKITEM.COSTGEN " +
      ", ENPLANWORKITEM.USERGEN " +
      ", ENPLANWORKITEM.DATEEDIT " +
      ", TKPOSITION.CODE " +
      ", TKPOSITION.NAME " +
      ", TKPOSITION.SAFETYGROUP " +
      ", TKPOSITION.RANK " +
      ", TKPOSITION.SHORTNAME " +
      ", ENESTIMATEITEMTYPE.CODE " +
      ", ENESTIMATEITEMTYPE.NAME " +
      ", FINWORKER.CODE " +
      ", FINWORKER.NAME " +
      ", FINWORKER.TABNUMBER " +
      ", FINWORKER.POSITIONNAME " +
      ", FINWORKER.POSITIONCODE " +
      ", FINWORKER.DEPARTMENTNAME " +
      ", FINWORKER.DEPARTMENTCODE " +
      ", FINWORKER.PRICEGEN " +
      ", FINWORKER.CATEGOR " +
      ", FINWORKER.FINCODE " +
      ", FINWORKER.ISSENTASSIGNMENT " +
      ", FINWORKER.CHARGEPERCENT " +
     " FROM ENHUMENITEM " +
     ", ENPLANWORK " +
     ", ENPLANWORKITEM " +
     ", TKPOSITION " +
     ", ENESTIMATEITEMTYPE " +
     ", FINWORKER " +
     //" WHERE "
  "";
     whereStr = " ENPLANWORK.CODE = ENHUMENITEM.PLANREFCODE" ; //+
      whereStr = whereStr +" AND ENPLANWORKITEM.CODE = ENHUMENITEM.PLANITEMREFCODE" ; //+
      whereStr = whereStr +" AND TKPOSITION.CODE = ENHUMENITEM.POSITIONGENCODE" ; //+
      whereStr = whereStr +" AND ENESTIMATEITEMTYPE.CODE = ENHUMENITEM.TYPEREFCODE" ; //+
      whereStr = whereStr +" AND FINWORKER.CODE = ENHUMENITEM.FINWORKERCODE" ; //+
    //selectStr = selectStr + " ${s} ENHUMENITEM.CODE IN ( SELECT ENHUMENITEM.CODE FROM ENHUMENITEM ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.COUNTGEN = ?";
        }
        if(aFilterObject.countFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.COUNTFACT = ?";
        }
        if(aFilterObject.countFactOriginal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.COUNTFACTORIGINAL = ?";
        }
        if(aFilterObject.price != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.PRICE = ?";
        }
        if(aFilterObject.cost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.COST = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENHUMENITEM.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENHUMENITEM.COMMENTGEN) LIKE UPPER(?)";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENHUMENITEM.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENHUMENITEM.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.DATEEDIT = ?";
        }

        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENHUMENITEM.PLANREFCODE = ? ";
        }
        if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENHUMENITEM.PLANITEMREFCODE = ? ";
        }
        if(aFilterObject.positionGen.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENHUMENITEM.POSITIONGENCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENHUMENITEM.TYPEREFCODE = ? ";
        }
        if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENHUMENITEM.FINWORKERCODE = ? ";
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
            aFilterObject.countGen = aFilterObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.countFact != null){
            number++;
            aFilterObject.countFact = aFilterObject.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFact);
        }
        if(aFilterObject.countFactOriginal != null){
            number++;
            aFilterObject.countFactOriginal = aFilterObject.countFactOriginal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFactOriginal);
        }
        if(aFilterObject.price != null){
            number++;
            aFilterObject.price = aFilterObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.price);
        }
        if(aFilterObject.cost != null){
            number++;
            aFilterObject.cost = aFilterObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.cost);
        }

           if(aFilterObject.commentGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.commentGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
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
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
        }


        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planItemRef.code);
       }
       if(aFilterObject.positionGen.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.positionGen.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker.code);
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

        anObject = new ENHumenItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.countGen = set.getBigDecimal(2);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countFact = set.getBigDecimal(3);
        if(anObject.countFact != null)
            anObject.countFact = anObject.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countFactOriginal = set.getBigDecimal(4);
        if(anObject.countFactOriginal != null)
            anObject.countFactOriginal = anObject.countFactOriginal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.price = set.getBigDecimal(5);
        if(anObject.price != null)
            anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.cost = set.getBigDecimal(6);
        if(anObject.cost != null)
            anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(7);
        anObject.dateEdit = set.getDate(8);

        anObject.planRefCode = set.getInt(9);
    if(set.wasNull())
      anObject.planRefCode = Integer.MIN_VALUE;
        anObject.planRefDateGen = set.getTimestamp(10);
        anObject.planRefDateStart = set.getDate(11);
        anObject.planRefDateFinal = set.getDate(12);
        anObject.planRefYearGen = set.getInt(13);
    if(set.wasNull())
      anObject.planRefYearGen = Integer.MIN_VALUE;
        anObject.planRefMonthGen = set.getInt(14);
    if(set.wasNull())
      anObject.planRefMonthGen = Integer.MIN_VALUE;
        anObject.planRefYearOriginal = set.getInt(15);
    if(set.wasNull())
      anObject.planRefYearOriginal = Integer.MIN_VALUE;
        anObject.planRefMonthOriginal = set.getInt(16);
    if(set.wasNull())
      anObject.planRefMonthOriginal = Integer.MIN_VALUE;
        anObject.planRefUserGen = set.getString(17);
        anObject.planRefDateEdit = set.getDate(18);
        anObject.planRefWorkOrderNumber = set.getString(19);
        anObject.planRefDateWorkOrder = set.getDate(20);
        anObject.planRefPriConnectionNumber = set.getString(21);
        anObject.planRefDateEndPriConnection = set.getDate(22);
        anObject.planRefInvestWorksDescription = set.getString(23);
        anObject.planRefServicesFSideFinId = set.getInt(24);
    if(set.wasNull())
      anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
        anObject.planRefServicesFSideCnNum = set.getString(25);
        anObject.planRefTotalTimeHours = set.getBigDecimal(26);
        if(anObject.planRefTotalTimeHours != null)
          anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planRefTotalTimeDays = set.getBigDecimal(27);
        if(anObject.planRefTotalTimeDays != null)
          anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planRefInvestItemNumber = set.getString(28);
        anObject.planItemRefCode = set.getInt(29);
    if(set.wasNull())
      anObject.planItemRefCode = Integer.MIN_VALUE;
        anObject.planItemRefCountGen = set.getBigDecimal(30);
        if(anObject.planItemRefCountGen != null)
          anObject.planItemRefCountGen = anObject.planItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planItemRefTimeGen = set.getBigDecimal(31);
        if(anObject.planItemRefTimeGen != null)
          anObject.planItemRefTimeGen = anObject.planItemRefTimeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planItemRefCostGen = set.getBigDecimal(32);
        if(anObject.planItemRefCostGen != null)
          anObject.planItemRefCostGen = anObject.planItemRefCostGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planItemRefUserGen = set.getString(33);
        anObject.planItemRefDateEdit = set.getDate(34);
        anObject.positionGenCode = set.getInt(35);
    if(set.wasNull())
      anObject.positionGenCode = Integer.MIN_VALUE;
        anObject.positionGenName = set.getString(36);
        anObject.positionGenSafetyGroup = set.getString(37);
        anObject.positionGenRank = set.getString(38);
        anObject.positionGenShortName = set.getString(39);
        anObject.typeRefCode = set.getInt(40);
    if(set.wasNull())
      anObject.typeRefCode = Integer.MIN_VALUE;
        anObject.typeRefName = set.getString(41);
        anObject.finWorkerCode = set.getInt(42);
    if(set.wasNull())
      anObject.finWorkerCode = Integer.MIN_VALUE;
        anObject.finWorkerName = set.getString(43);
        anObject.finWorkerTabNumber = set.getString(44);

        anObject.finWorkerPositionName = set.getString(45);
        anObject.finWorkerPositionCode = set.getInt(46);
    if(set.wasNull())
      anObject.finWorkerPositionCode = Integer.MIN_VALUE;
        anObject.finWorkerDepartmentName = set.getString(47);
        anObject.finWorkerDepartmentCode = set.getString(48);
        anObject.finWorkerPriceGen = set.getBigDecimal(49);
        if(anObject.finWorkerPriceGen != null)
          anObject.finWorkerPriceGen = anObject.finWorkerPriceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.finWorkerCategor = set.getInt(50);
    if(set.wasNull())
      anObject.finWorkerCategor = Integer.MIN_VALUE;
        anObject.finWorkerFinCode = set.getInt(51);
    if(set.wasNull())
      anObject.finWorkerFinCode = Integer.MIN_VALUE;
        anObject.finWorkerIsSentAssignment = set.getInt(52);
    if(set.wasNull())
      anObject.finWorkerIsSentAssignment = Integer.MIN_VALUE;
        anObject.finWorkerChargePercent = set.getBigDecimal(53);
        if(anObject.finWorkerChargePercent != null)
          anObject.finWorkerChargePercent = anObject.finWorkerChargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

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

  public int[] getFilteredCodeArrayOLD(ENHumenItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENHUMENITEM.CODE FROM ENHUMENITEM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENHUMENITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");


      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.COUNTGEN = ?";
        }
        if(aFilterObject.countFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.COUNTFACT = ?";
        }
        if(aFilterObject.countFactOriginal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.COUNTFACTORIGINAL = ?";
        }
        if(aFilterObject.price != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.PRICE = ?";
        }
        if(aFilterObject.cost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.COST = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENHUMENITEM.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENHUMENITEM.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENHUMENITEM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENHUMENITEM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.DATEEDIT = ?";
        }

        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENHUMENITEM.PLANREFCODE = ? ";
        }
        if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENHUMENITEM.PLANITEMREFCODE = ? ";
        }
        if(aFilterObject.positionGen.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENHUMENITEM.POSITIONGENCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENHUMENITEM.TYPEREFCODE = ? ";
        }
        if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENHUMENITEM.FINWORKERCODE = ? ";
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
            aFilterObject.countGen = aFilterObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.countFact != null){
            number++;
            aFilterObject.countFact = aFilterObject.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFact);
        }
        if(aFilterObject.countFactOriginal != null){
            number++;
            aFilterObject.countFactOriginal = aFilterObject.countFactOriginal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFactOriginal);
        }
        if(aFilterObject.price != null){
            number++;
            aFilterObject.price = aFilterObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.price);
        }
        if(aFilterObject.cost != null){
            number++;
            aFilterObject.cost = aFilterObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.cost);
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENHUMENITEM.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENHUMENITEM.COMMENTGEN LIKE ?";

           if(aFilterObject.commentGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.commentGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENHUMENITEM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENHUMENITEM.USERGEN LIKE ?";

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
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
        }

        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planItemRef.code);
       }
       if(aFilterObject.positionGen.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.positionGen.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker.code);
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

  public int[] getFilteredCodeArray(ENHumenItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENHumenItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENHUMENITEM.CODE FROM ENHUMENITEM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENHUMENITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.COUNTGEN = ?";
        }
        if(aFilterObject.countFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.COUNTFACT = ?";
        }
        if(aFilterObject.countFactOriginal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.COUNTFACTORIGINAL = ?";
        }
        if(aFilterObject.price != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.PRICE = ?";
        }
        if(aFilterObject.cost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.COST = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENHUMENITEM.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENHUMENITEM.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENHUMENITEM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENHUMENITEM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENHUMENITEM.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENHUMENITEM.PLANREFCODE = ? ";
        }
        if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENHUMENITEM.PLANITEMREFCODE = ? ";
        }
        if(aFilterObject.positionGen.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENHUMENITEM.POSITIONGENCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENHUMENITEM.TYPEREFCODE = ? ";
        }
        if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENHUMENITEM.FINWORKERCODE = ? ";
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
            aFilterObject.countGen = aFilterObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.countFact != null){
            number++;
            aFilterObject.countFact = aFilterObject.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFact);
        }
        if(aFilterObject.countFactOriginal != null){
            number++;
            aFilterObject.countFactOriginal = aFilterObject.countFactOriginal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFactOriginal);
        }
        if(aFilterObject.price != null){
            number++;
            aFilterObject.price = aFilterObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.price);
        }
        if(aFilterObject.cost != null){
            number++;
            aFilterObject.cost = aFilterObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.cost);
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENHUMENITEM.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENHUMENITEM.COMMENTGEN LIKE ?";

           if(aFilterObject.commentGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.commentGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENHUMENITEM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENHUMENITEM.USERGEN LIKE ?";

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
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planItemRef.code);
       }
       if(aFilterObject.positionGen.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.positionGen.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker.code);
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


   public ENHumenItem getObject(int uid) throws PersistenceException
   {
    ENHumenItem result = new ENHumenItem();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENHumenItem anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");


    selectStr =
    "SELECT  ENHUMENITEM.CODE, ENHUMENITEM.COUNTGEN, ENHUMENITEM.COUNTFACT, ENHUMENITEM.COUNTFACTORIGINAL, ENHUMENITEM.PRICE, ENHUMENITEM.COST, ENHUMENITEM.COMMENTGEN, ENHUMENITEM.USERGEN, ENHUMENITEM.DATEEDIT, ENHUMENITEM.MODIFY_TIME, ENHUMENITEM.PLANREFCODE, ENHUMENITEM.PLANITEMREFCODE, ENHUMENITEM.POSITIONGENCODE, ENHUMENITEM.TYPEREFCODE, ENHUMENITEM.FINWORKERCODE "
    +" FROM ENHUMENITEM WHERE ENHUMENITEM.CODE = ?";

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
            anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countFact = set.getBigDecimal(3);
        if(anObject.countFact != null)
            anObject.countFact = anObject.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countFactOriginal = set.getBigDecimal(4);
        if(anObject.countFactOriginal != null)
            anObject.countFactOriginal = anObject.countFactOriginal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.price = set.getBigDecimal(5);
        if(anObject.price != null)
            anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.cost = set.getBigDecimal(6);
        if(anObject.cost != null)
            anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.commentGen = set.getString(7);
        anObject.userGen = set.getString(8);
        anObject.dateEdit = set.getDate(9);
        anObject.modify_time = set.getLong(10);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.planRef.code = set.getInt(11);
        if ( set.wasNull() )
            anObject.planRef.code = Integer.MIN_VALUE;
        anObject.planItemRef.code = set.getInt(12);
        if ( set.wasNull() )
            anObject.planItemRef.code = Integer.MIN_VALUE;
        anObject.positionGen.code = set.getInt(13);
        if ( set.wasNull() )
            anObject.positionGen.code = Integer.MIN_VALUE;
        anObject.typeRef.code = set.getInt(14);
        if ( set.wasNull() )
            anObject.typeRef.code = Integer.MIN_VALUE;
        anObject.finWorker.code = set.getInt(15);
        if ( set.wasNull() )
            anObject.finWorker.code = Integer.MIN_VALUE;
        if(anObject.planRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlanRef(
      new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
    }
        if(anObject.planItemRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlanItemRef(
      new com.ksoe.energynet.dataminer.generated.ENPlanWorkItemDAOGen(connection,getUserProfile()).getRef(anObject.planItemRef.code));
    }
        if(anObject.positionGen.code != Integer.MIN_VALUE)
        {
           anObject.setPositionGen(
      new com.ksoe.techcard.dataminer.generated.TKPositionDAOGen(connection,getUserProfile()).getObject(anObject.positionGen.code));
    }
        if(anObject.typeRef.code != Integer.MIN_VALUE)
        {
           anObject.setTypeRef(
      new com.ksoe.energynet.dataminer.generated.ENEstimateItemTypeDAOGen(connection,getUserProfile()).getRef(anObject.typeRef.code));
    }
        if(anObject.finWorker.code != Integer.MIN_VALUE)
        {
           anObject.setFinWorker(
      new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).getObject(anObject.finWorker.code));
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


  public com.ksoe.energynet.valueobject.references.ENHumenItemRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENHumenItemRef ref = new com.ksoe.energynet.valueobject.references.ENHumenItemRef();
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

    selectStr = "DELETE FROM  ENHUMENITEM WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENHumenItem object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENHumenItem.getObject%} access denied");

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


    selectStr =

    "SELECT  ENHUMENITEM.CODE FROM  ENHUMENITEM WHERE  ENHUMENITEM.CODE = ?";

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
    _checkConditionToken(condition,"code","ENHUMENITEM.CODE");
    _checkConditionToken(condition,"countgen","ENHUMENITEM.COUNTGEN");
    _checkConditionToken(condition,"countfact","ENHUMENITEM.COUNTFACT");
    _checkConditionToken(condition,"countfactoriginal","ENHUMENITEM.COUNTFACTORIGINAL");
    _checkConditionToken(condition,"price","ENHUMENITEM.PRICE");
    _checkConditionToken(condition,"cost","ENHUMENITEM.COST");
    _checkConditionToken(condition,"commentgen","ENHUMENITEM.COMMENTGEN");
    _checkConditionToken(condition,"usergen","ENHUMENITEM.USERGEN");
    _checkConditionToken(condition,"dateedit","ENHUMENITEM.DATEEDIT");
    _checkConditionToken(condition,"modify_time","ENHUMENITEM.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"planref","PLANREFCODE");
    _checkConditionToken(condition,"planref.code","PLANREFCODE");
    _checkConditionToken(condition,"planitemref","PLANITEMREFCODE");
    _checkConditionToken(condition,"planitemref.code","PLANITEMREFCODE");
    _checkConditionToken(condition,"positiongen","POSITIONGENCODE");
    _checkConditionToken(condition,"positiongen.code","POSITIONGENCODE");
    _checkConditionToken(condition,"typeref","TYPEREFCODE");
    _checkConditionToken(condition,"typeref.code","TYPEREFCODE");
    //_checkConditionToken(condition,"finworker","FINWORKERCODE");
    _checkConditionToken(condition,"finworker.code","FINWORKERCODE");
    return condition.toString();
   }

   @Override
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

  private void _collectAutoIncrementFields(ENHumenItem anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENHUMENITEM", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENHUMENITEM", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENHUMENITEM", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENHUMENITEM");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENHumenItemDAO
