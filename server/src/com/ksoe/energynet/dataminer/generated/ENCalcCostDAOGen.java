
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
import com.ksoe.energynet.valueobject.ENCalcCost;
import com.ksoe.energynet.valueobject.brief.ENCalcCostShort;
import com.ksoe.energynet.valueobject.filter.ENCalcCostFilter;
import com.ksoe.energynet.valueobject.lists.ENCalcCostShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENCalcCost;
 *
 */

public class ENCalcCostDAOGen extends GenericDataMiner {

  public ENCalcCostDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENCalcCostDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENCalcCost inObject) throws PersistenceException
   {
      ENCalcCost obj = new ENCalcCost();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.directExpenses.equals(obj.directExpenses)){
       return false;
     }

     if ( ! inObject.salaryExpenses.equals(obj.salaryExpenses)){
       return false;
     }

     if ( ! inObject.socialCharges.equals(obj.socialCharges)){
       return false;
     }

     if ( ! inObject.productionExpenses.equals(obj.productionExpenses)){
       return false;
     }

     if ( ! inObject.totalExpenses.equals(obj.totalExpenses)){
       return false;
     }

     if ( ! inObject.normIncome.equals(obj.normIncome)){
       return false;
     }

     if ( ! inObject.calculationCost.equals(obj.calculationCost)){
       return false;
     }
     if (inObject.planRef.code != obj.planRef.code){
        return false;
     }
     if (inObject.plan2CTypeRef.code != obj.plan2CTypeRef.code){
        return false;
     }
      return true;
   }

   public int add(ENCalcCost anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENCalcCost anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENCALCCOST (CODE,DIRECTEXPENSES,SALARYEXPENSES,SOCIALCHARGES,PRODUCTIONEXPENSES,TOTALEXPENSES,NORMINCOME,CALCULATIONCOST,MODIFY_TIME,PLANREFCODE,PLAN2CTYPEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.directExpenses != null)
        anObject.directExpenses = anObject.directExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.directExpenses);
      if (anObject.salaryExpenses != null)
        anObject.salaryExpenses = anObject.salaryExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.salaryExpenses);
      if (anObject.socialCharges != null)
        anObject.socialCharges = anObject.socialCharges.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.socialCharges);
      if (anObject.productionExpenses != null)
        anObject.productionExpenses = anObject.productionExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.productionExpenses);
      if (anObject.totalExpenses != null)
        anObject.totalExpenses = anObject.totalExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.totalExpenses);
      if (anObject.normIncome != null)
        anObject.normIncome = anObject.normIncome.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.normIncome);
      if (anObject.calculationCost != null)
        anObject.calculationCost = anObject.calculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.calculationCost);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(9,null);
      else
        statement.setBigDecimal(9,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.planRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalcCost.planRef.code%} = {%"+anObject.planRef.code+"%}");
        statement.setInt(10,anObject.planRef.code);
      }
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.plan2CTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWork2ClassificationTypeDAOGen(connection,getUserProfile()).exists(anObject.plan2CTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalcCost.plan2CTypeRef.code%} = {%"+anObject.plan2CTypeRef.code+"%}");
        statement.setInt(11,anObject.plan2CTypeRef.code);
      }
      else
        statement.setNull(11,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENCalcCostDAOGen.add%}",e);
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

   public void save(ENCalcCost anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENCalcCost anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENCalcCost oldObject = new ENCalcCost();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENCalcCost.modify_time_Field+" FROM  ENCALCCOST WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("DIRECTEXPENSES") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SALARYEXPENSES") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SOCIALCHARGES") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PRODUCTIONEXPENSES") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TOTALEXPENSES") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NORMINCOME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CALCULATIONCOST") == 0)
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
          if(fieldNameStr.compareTo("PLAN2CTYPEREF") == 0)
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
        "UPDATE ENCALCCOST SET  DIRECTEXPENSES = ? , SALARYEXPENSES = ? , SOCIALCHARGES = ? , PRODUCTIONEXPENSES = ? , TOTALEXPENSES = ? , NORMINCOME = ? , CALCULATIONCOST = ? , MODIFY_TIME = ? , PLANREFCODE = ? , PLAN2CTYPEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENCALCCOST SET ";
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
      if (anObject.directExpenses != null)
        anObject.directExpenses = anObject.directExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.directExpenses);
      if (anObject.salaryExpenses != null)
        anObject.salaryExpenses = anObject.salaryExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.salaryExpenses);
      if (anObject.socialCharges != null)
        anObject.socialCharges = anObject.socialCharges.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.socialCharges);
      if (anObject.productionExpenses != null)
        anObject.productionExpenses = anObject.productionExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.productionExpenses);
      if (anObject.totalExpenses != null)
        anObject.totalExpenses = anObject.totalExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.totalExpenses);
      if (anObject.normIncome != null)
        anObject.normIncome = anObject.normIncome.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.normIncome);
      if (anObject.calculationCost != null)
        anObject.calculationCost = anObject.calculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.calculationCost);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(8,null);
      else
        statement.setBigDecimal(8,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.planRef.code != Integer.MIN_VALUE)
        statement.setInt(9,anObject.planRef.code);
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.plan2CTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.plan2CTypeRef.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
          statement.setInt(11,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("DIRECTEXPENSES".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.directExpenses != null)
                    anObject.directExpenses = anObject.directExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.directExpenses);
                continue;
             }
            if("SALARYEXPENSES".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.salaryExpenses != null)
                    anObject.salaryExpenses = anObject.salaryExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.salaryExpenses);
                continue;
             }
            if("SOCIALCHARGES".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.socialCharges != null)
                    anObject.socialCharges = anObject.socialCharges.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.socialCharges);
                continue;
             }
            if("PRODUCTIONEXPENSES".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.productionExpenses != null)
                    anObject.productionExpenses = anObject.productionExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.productionExpenses);
                continue;
             }
            if("TOTALEXPENSES".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.totalExpenses != null)
                    anObject.totalExpenses = anObject.totalExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.totalExpenses);
                continue;
             }
            if("NORMINCOME".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.normIncome != null)
                    anObject.normIncome = anObject.normIncome.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.normIncome);
                continue;
             }
            if("CALCULATIONCOST".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.calculationCost != null)
                    anObject.calculationCost = anObject.calculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.calculationCost);
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
            if("PLAN2CTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.plan2CTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.plan2CTypeRef.code);
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

   } // end of save(ENCalcCost anObject,String[] anAttributes)


 public ENCalcCostShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENCalcCost filterObject = new ENCalcCost();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENCalcCostShort)list.get(0);
   return null;
  }

  public ENCalcCostShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENCalcCostShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENCalcCostShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENCalcCostShortList getFilteredList(ENCalcCost filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENCalcCostShortList getScrollableFilteredList(ENCalcCost aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENCalcCostShortList getScrollableFilteredList(ENCalcCost aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENCalcCostShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENCalcCostShortList getScrollableFilteredList(ENCalcCostFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENCalcCostShortList getScrollableFilteredList(ENCalcCostFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENCalcCostShortList getScrollableFilteredList(ENCalcCost aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENCalcCostShortList getScrollableFilteredList(ENCalcCost aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENCalcCostShortList result = new ENCalcCostShortList();
    ENCalcCostShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCALCCOST.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENCALCCOST.CODE"+
     ",ENCALCCOST.DIRECTEXPENSES"+
     ",ENCALCCOST.SALARYEXPENSES"+
     ",ENCALCCOST.SOCIALCHARGES"+
     ",ENCALCCOST.PRODUCTIONEXPENSES"+
     ",ENCALCCOST.TOTALEXPENSES"+
     ",ENCALCCOST.NORMINCOME"+
     ",ENCALCCOST.CALCULATIONCOST"+

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
      ", ENPLANWORK2CLASSFCTNTP.CODE " +
      ", ENPLANWORK2CLASSFCTNTP.COUNTGEN " +
      ", ENPLANWORK2CLASSFCTNTP.USERGEN " +
      ", ENPLANWORK2CLASSFCTNTP.DATEEDIT " +
      ", ENPLANWORK2CLASSFCTNTP.MACHINEHOURS " +
      ", ENPLANWORK2CLASSFCTNTP.RELOCATIONKM " +
      ", ENPLANWORK2CLASSFCTNTP.TRANSPORTATIONLOAD " +
      ", ENPLANWORK2CLASSFCTNTP.ISPRINTONKMORMH " +
      ", ENPLANWORK2CLASSFCTNTP.COSTWORKSCONTRACTOR " +
      ", ENPLANWORK2CLASSFCTNTP.DATEGEN " +
      ", ENPLANWORK2CLASSFCTNTP.TIMESTART " +
      ", ENPLANWORK2CLASSFCTNTP.TIMEFINAL " +
      ", ENPLANWORK2CLASSFCTNTP.CODEVIRTUALBRIGADE " +
      ", ENPLANWORK2CLASSFCTNTP.ISJOBSBYTIME " +
      ", ENPLANWORK2CLASSFCTNTP.ISVISITCLIENT " +
     " FROM ENCALCCOST " +
     ", ENPLANWORK " +
     ", ENPLANWORK2CLASSFCTNTP " +
     //" WHERE "
    "";
     whereStr = " ENPLANWORK.CODE = ENCALCCOST.PLANREFCODE" ; //+
      whereStr = whereStr +" AND ENPLANWORK2CLASSFCTNTP.CODE = ENCALCCOST.PLAN2CTYPEREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENCALCCOST.CODE IN ( SELECT ENCALCCOST.CODE FROM ENCALCCOST ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.CODE = ?";
        }
        if(aFilterObject.directExpenses != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.DIRECTEXPENSES = ?";
        }
        if(aFilterObject.salaryExpenses != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.SALARYEXPENSES = ?";
        }
        if(aFilterObject.socialCharges != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.SOCIALCHARGES = ?";
        }
        if(aFilterObject.productionExpenses != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.PRODUCTIONEXPENSES = ?";
        }
        if(aFilterObject.totalExpenses != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.TOTALEXPENSES = ?";
        }
        if(aFilterObject.normIncome != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.NORMINCOME = ?";
        }
        if(aFilterObject.calculationCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.CALCULATIONCOST = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCALCCOST.PLANREFCODE = ? ";
        }
        if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCALCCOST.PLAN2CTYPEREFCODE = ? ";
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
        if(aFilterObject.directExpenses != null){
            number++;
            aFilterObject.directExpenses = aFilterObject.directExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.directExpenses);
        }
        if(aFilterObject.salaryExpenses != null){
            number++;
            aFilterObject.salaryExpenses = aFilterObject.salaryExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.salaryExpenses);
        }
        if(aFilterObject.socialCharges != null){
            number++;
            aFilterObject.socialCharges = aFilterObject.socialCharges.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.socialCharges);
        }
        if(aFilterObject.productionExpenses != null){
            number++;
            aFilterObject.productionExpenses = aFilterObject.productionExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.productionExpenses);
        }
        if(aFilterObject.totalExpenses != null){
            number++;
            aFilterObject.totalExpenses = aFilterObject.totalExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalExpenses);
        }
        if(aFilterObject.normIncome != null){
            number++;
            aFilterObject.normIncome = aFilterObject.normIncome.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.normIncome);
        }
        if(aFilterObject.calculationCost != null){
            number++;
            aFilterObject.calculationCost = aFilterObject.calculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.calculationCost);
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
       if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.plan2CTypeRef.code);
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

        anObject = new ENCalcCostShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.directExpenses = set.getBigDecimal(2);
        if(anObject.directExpenses != null)
            anObject.directExpenses = anObject.directExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.salaryExpenses = set.getBigDecimal(3);
        if(anObject.salaryExpenses != null)
            anObject.salaryExpenses = anObject.salaryExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.socialCharges = set.getBigDecimal(4);
        if(anObject.socialCharges != null)
            anObject.socialCharges = anObject.socialCharges.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.productionExpenses = set.getBigDecimal(5);
        if(anObject.productionExpenses != null)
            anObject.productionExpenses = anObject.productionExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.totalExpenses = set.getBigDecimal(6);
        if(anObject.totalExpenses != null)
            anObject.totalExpenses = anObject.totalExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.normIncome = set.getBigDecimal(7);
        if(anObject.normIncome != null)
            anObject.normIncome = anObject.normIncome.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.calculationCost = set.getBigDecimal(8);
        if(anObject.calculationCost != null)
            anObject.calculationCost = anObject.calculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

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

        anObject.plan2CTypeRefCode = set.getInt(29);
        if(set.wasNull())
        anObject.plan2CTypeRefCode = Integer.MIN_VALUE;
        anObject.plan2CTypeRefCountGen = set.getBigDecimal(30);
        if(anObject.plan2CTypeRefCountGen != null)
          anObject.plan2CTypeRefCountGen = anObject.plan2CTypeRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.plan2CTypeRefUserGen = set.getString(31);
        anObject.plan2CTypeRefDateEdit = set.getDate(32);


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

  public int[] getFilteredCodeArrayOLD(ENCalcCost aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCALCCOST.CODE FROM ENCALCCOST";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCALCCOST.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.CODE = ?";
        }
        if(aFilterObject.directExpenses != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.DIRECTEXPENSES = ?";
        }
        if(aFilterObject.salaryExpenses != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.SALARYEXPENSES = ?";
        }
        if(aFilterObject.socialCharges != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.SOCIALCHARGES = ?";
        }
        if(aFilterObject.productionExpenses != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.PRODUCTIONEXPENSES = ?";
        }
        if(aFilterObject.totalExpenses != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.TOTALEXPENSES = ?";
        }
        if(aFilterObject.normIncome != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.NORMINCOME = ?";
        }
        if(aFilterObject.calculationCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.CALCULATIONCOST = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALCCOST.PLANREFCODE = ? ";
        }
        if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALCCOST.PLAN2CTYPEREFCODE = ? ";
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
        if(aFilterObject.directExpenses != null){
            number++;
            aFilterObject.directExpenses = aFilterObject.directExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.directExpenses);
        }
        if(aFilterObject.salaryExpenses != null){
            number++;
            aFilterObject.salaryExpenses = aFilterObject.salaryExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.salaryExpenses);
        }
        if(aFilterObject.socialCharges != null){
            number++;
            aFilterObject.socialCharges = aFilterObject.socialCharges.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.socialCharges);
        }
        if(aFilterObject.productionExpenses != null){
            number++;
            aFilterObject.productionExpenses = aFilterObject.productionExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.productionExpenses);
        }
        if(aFilterObject.totalExpenses != null){
            number++;
            aFilterObject.totalExpenses = aFilterObject.totalExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalExpenses);
        }
        if(aFilterObject.normIncome != null){
            number++;
            aFilterObject.normIncome = aFilterObject.normIncome.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.normIncome);
        }
        if(aFilterObject.calculationCost != null){
            number++;
            aFilterObject.calculationCost = aFilterObject.calculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.calculationCost);
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
       if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.plan2CTypeRef.code);
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

  public int[] getFilteredCodeArray(ENCalcCostFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENCalcCost aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCALCCOST.CODE FROM ENCALCCOST";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCALCCOST.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.CODE = ?";
        }
        if(aFilterObject.directExpenses != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.DIRECTEXPENSES = ?";
        }
        if(aFilterObject.salaryExpenses != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.SALARYEXPENSES = ?";
        }
        if(aFilterObject.socialCharges != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.SOCIALCHARGES = ?";
        }
        if(aFilterObject.productionExpenses != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.PRODUCTIONEXPENSES = ?";
        }
        if(aFilterObject.totalExpenses != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.TOTALEXPENSES = ?";
        }
        if(aFilterObject.normIncome != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.NORMINCOME = ?";
        }
        if(aFilterObject.calculationCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.CALCULATIONCOST = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCCOST.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALCCOST.PLANREFCODE = ? ";
        }
        if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALCCOST.PLAN2CTYPEREFCODE = ? ";
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
        if(aFilterObject.directExpenses != null){
            number++;
            aFilterObject.directExpenses = aFilterObject.directExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.directExpenses);
        }
        if(aFilterObject.salaryExpenses != null){
            number++;
            aFilterObject.salaryExpenses = aFilterObject.salaryExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.salaryExpenses);
        }
        if(aFilterObject.socialCharges != null){
            number++;
            aFilterObject.socialCharges = aFilterObject.socialCharges.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.socialCharges);
        }
        if(aFilterObject.productionExpenses != null){
            number++;
            aFilterObject.productionExpenses = aFilterObject.productionExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.productionExpenses);
        }
        if(aFilterObject.totalExpenses != null){
            number++;
            aFilterObject.totalExpenses = aFilterObject.totalExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalExpenses);
        }
        if(aFilterObject.normIncome != null){
            number++;
            aFilterObject.normIncome = aFilterObject.normIncome.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.normIncome);
        }
        if(aFilterObject.calculationCost != null){
            number++;
            aFilterObject.calculationCost = aFilterObject.calculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.calculationCost);
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
       if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.plan2CTypeRef.code);
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


   public ENCalcCost getObject(int uid) throws PersistenceException
   {
    ENCalcCost result = new ENCalcCost();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENCalcCost anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENCALCCOST.CODE, ENCALCCOST.DIRECTEXPENSES, ENCALCCOST.SALARYEXPENSES, ENCALCCOST.SOCIALCHARGES, ENCALCCOST.PRODUCTIONEXPENSES, ENCALCCOST.TOTALEXPENSES, ENCALCCOST.NORMINCOME, ENCALCCOST.CALCULATIONCOST, ENCALCCOST.MODIFY_TIME, ENCALCCOST.PLANREFCODE, ENCALCCOST.PLAN2CTYPEREFCODE "
    +" FROM ENCALCCOST WHERE ENCALCCOST.CODE = ?";

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
        anObject.directExpenses = set.getBigDecimal(2);
        if(anObject.directExpenses != null)
            anObject.directExpenses = anObject.directExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.salaryExpenses = set.getBigDecimal(3);
        if(anObject.salaryExpenses != null)
            anObject.salaryExpenses = anObject.salaryExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.socialCharges = set.getBigDecimal(4);
        if(anObject.socialCharges != null)
            anObject.socialCharges = anObject.socialCharges.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.productionExpenses = set.getBigDecimal(5);
        if(anObject.productionExpenses != null)
            anObject.productionExpenses = anObject.productionExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.totalExpenses = set.getBigDecimal(6);
        if(anObject.totalExpenses != null)
            anObject.totalExpenses = anObject.totalExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.normIncome = set.getBigDecimal(7);
        if(anObject.normIncome != null)
            anObject.normIncome = anObject.normIncome.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.calculationCost = set.getBigDecimal(8);
        if(anObject.calculationCost != null)
            anObject.calculationCost = anObject.calculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.modify_time = set.getLong(9);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.planRef.code = set.getInt(10);
        if ( set.wasNull() )
            anObject.planRef.code = Integer.MIN_VALUE;
        anObject.plan2CTypeRef.code = set.getInt(11);
        if ( set.wasNull() )
            anObject.plan2CTypeRef.code = Integer.MIN_VALUE;
        if(anObject.planRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlanRef(
        new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
    }
        if(anObject.plan2CTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlan2CTypeRef(
        new com.ksoe.energynet.dataminer.generated.ENPlanWork2ClassificationTypeDAOGen(connection,getUserProfile()).getRef(anObject.plan2CTypeRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENCalcCostRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENCalcCostRef ref = new com.ksoe.energynet.valueobject.references.ENCalcCostRef();
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

    selectStr = "DELETE FROM  ENCALCCOST WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENCalcCost object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENCalcCost.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENCalcCost.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENCalcCost.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENCalcCost.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENCalcCost.getObject%} access denied");

    selectStr =

    "SELECT  ENCALCCOST.CODE FROM  ENCALCCOST WHERE  ENCALCCOST.CODE = ?";
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
    _checkConditionToken(condition,"code","ENCALCCOST.CODE");
    _checkConditionToken(condition,"directexpenses","ENCALCCOST.DIRECTEXPENSES");
    _checkConditionToken(condition,"salaryexpenses","ENCALCCOST.SALARYEXPENSES");
    _checkConditionToken(condition,"socialcharges","ENCALCCOST.SOCIALCHARGES");
    _checkConditionToken(condition,"productionexpenses","ENCALCCOST.PRODUCTIONEXPENSES");
    _checkConditionToken(condition,"totalexpenses","ENCALCCOST.TOTALEXPENSES");
    _checkConditionToken(condition,"normincome","ENCALCCOST.NORMINCOME");
    _checkConditionToken(condition,"calculationcost","ENCALCCOST.CALCULATIONCOST");
    _checkConditionToken(condition,"modify_time","ENCALCCOST.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"planref","PLANREFCODE");
    _checkConditionToken(condition,"planref.code","PLANREFCODE");
    _checkConditionToken(condition,"plan2ctyperef","PLAN2CTYPEREFCODE");
    _checkConditionToken(condition,"plan2ctyperef.code","PLAN2CTYPEREFCODE");
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

    private void _collectAutoIncrementFields(ENCalcCost anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENCALCCOST", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENCALCCOST", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENCALCCOST", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENCALCCOST");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENCalcCostDAO
