
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
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
import com.ksoe.energynet.valueobject.ENEstimateHistory;
import com.ksoe.energynet.valueobject.brief.ENEstimateHistoryShort;
import com.ksoe.energynet.valueobject.filter.ENEstimateHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateHistoryShortList;
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
  *  DAO Generated for ENEstimateHistory;
  *
  */

public class ENEstimateHistoryDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENEstimateHistoryDAOGen() {super();}
  //public ENEstimateHistoryDAOGen(Connection aConnection) {super(aConnection);}
  //public ENEstimateHistoryDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENEstimateHistoryDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENEstimateHistoryDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENEstimateHistory inObject) throws PersistenceException
   {
      ENEstimateHistory obj = new ENEstimateHistory();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.countFact.equals(obj.countFact)){
       return false;
     }
     if (inObject.historyTypeRef.code != obj.historyTypeRef.code){
        return false;
     }
     if (inObject.estimateItemRef.code != obj.estimateItemRef.code){
        return false;
     }
     if (inObject.rqOrderItemRef.code != obj.rqOrderItemRef.code){
        return false;
     }
     if (inObject.rqBillItemRef.code != obj.rqBillItemRef.code){
        return false;
     }
     if (inObject.fkOrderItemRef.code != obj.fkOrderItemRef.code){
        return false;
     }
      return true;
   }

   public int add(ENEstimateHistory anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENEstimateHistory anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENESTIMATEHISTORY (CODE,COUNTFACT,HISTORYTYPEREFCODE,ESTIMATEITEMREFCODE,RQORDERITEMREFCODE,RQBILLITEMREFCODE,FKORDERITEMREFCODE) VALUES (?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.countFact != null)
        anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.countFact);
      if (anObject.historyTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateHistoryTypeDAOGen(connection,getUserProfile()).exists(anObject.historyTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimateHistory.historyTypeRef.code%} = {%"+anObject.historyTypeRef.code+"%}");
        statement.setInt(3,anObject.historyTypeRef.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.estimateItemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).exists(anObject.estimateItemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimateHistory.estimateItemRef.code%} = {%"+anObject.estimateItemRef.code+"%}");
        statement.setInt(4,anObject.estimateItemRef.code);
      }
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.rqOrderItemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.rqorder.dataminer.generated.RQOrderItemDAOGen(connection,getUserProfile()).exists(anObject.rqOrderItemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.rqorder.valueobject.ENEstimateHistory.rqOrderItemRef.code%} = {%"+anObject.rqOrderItemRef.code+"%}");
        statement.setInt(5,anObject.rqOrderItemRef.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.rqBillItemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.rqorder.dataminer.generated.RQBillItemDAOGen(connection,getUserProfile()).exists(anObject.rqBillItemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.rqorder.valueobject.ENEstimateHistory.rqBillItemRef.code%} = {%"+anObject.rqBillItemRef.code+"%}");
        statement.setInt(6,anObject.rqBillItemRef.code);
      }
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.fkOrderItemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.rqorder.dataminer.generated.RQFKOrderItemDAOGen(connection,getUserProfile()).exists(anObject.fkOrderItemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.rqorder.valueobject.ENEstimateHistory.fkOrderItemRef.code%} = {%"+anObject.fkOrderItemRef.code+"%}");
        statement.setInt(7,anObject.fkOrderItemRef.code);
      }
      else
        statement.setNull(7,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENEstimateHistoryDAOGen.add%}",e);
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

   public void save(ENEstimateHistory anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENEstimateHistory anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("COUNTFACT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("HISTORYTYPEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ESTIMATEITEMREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RQORDERITEMREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RQBILLITEMREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FKORDERITEMREF") == 0)
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
        "UPDATE ENESTIMATEHISTORY SET  COUNTFACT = ? , HISTORYTYPEREFCODE = ? , ESTIMATEITEMREFCODE = ? , RQORDERITEMREFCODE = ? , RQBILLITEMREFCODE = ? , FKORDERITEMREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENESTIMATEHISTORY SET ";
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
      if (anObject.countFact != null)
        anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.countFact);

      if (anObject.historyTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.historyTypeRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.estimateItemRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.estimateItemRef.code);
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.rqOrderItemRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.rqOrderItemRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.rqBillItemRef.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.rqBillItemRef.code);
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.fkOrderItemRef.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.fkOrderItemRef.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);
          statement.setInt(7,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("COUNTFACT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countFact != null)
                    anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countFact);
                continue;
             }
            if("HISTORYTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.historyTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.historyTypeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("ESTIMATEITEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.estimateItemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.estimateItemRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("RQORDERITEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.rqOrderItemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.rqOrderItemRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("RQBILLITEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.rqBillItemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.rqBillItemRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("FKORDERITEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.fkOrderItemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.fkOrderItemRef.code);
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

   } // end of save(ENEstimateHistory anObject,String[] anAttributes)


 public ENEstimateHistoryShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENEstimateHistory filterObject = new ENEstimateHistory();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENEstimateHistoryShort)list.get(0);
   return null;
  }

  public ENEstimateHistoryShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENEstimateHistoryShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENEstimateHistoryShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENEstimateHistoryShortList getFilteredList(ENEstimateHistory filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENEstimateHistoryShortList getScrollableFilteredList(ENEstimateHistory aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENEstimateHistoryShortList getScrollableFilteredList(ENEstimateHistory aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENEstimateHistoryShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENEstimateHistoryShortList getScrollableFilteredList(ENEstimateHistoryFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENEstimateHistoryShortList getScrollableFilteredList(ENEstimateHistoryFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENEstimateHistoryShortList getScrollableFilteredList(ENEstimateHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENEstimateHistoryShortList getScrollableFilteredList(ENEstimateHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENEstimateHistoryShortList result = new ENEstimateHistoryShortList();
    ENEstimateHistoryShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENESTIMATEHISTORY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENESTIMATEHISTORY.CODE"+
     ",ENESTIMATEHISTORY.COUNTFACT"+

      ", ENESTIMATEHISTORYTYPE.CODE " +
      ", ENESTIMATEHISTORYTYPE.NAME " +
      ", ENESTIMATEITEM.CODE " +
      ", ENESTIMATEITEM.COUNTGEN " +
      ", ENESTIMATEITEM.COUNTFACT " +
      ", ENESTIMATEITEM.PRICE " +
      ", ENESTIMATEITEM.COST " +
      ", ENESTIMATEITEM.DELIVERYTIME " +
      ", ENESTIMATEITEM.USEWORKTIME " +
      ", ENESTIMATEITEM.USERGEN " +
      ", ENESTIMATEITEM.DATEEDIT " +
      ", RQORDERITEM.CODE " +
      ", RQORDERITEM.COUNTGEN " +
      ", RQORDERITEM.MATERIALNAMETXT " +
      ", RQORDERITEM.MEASUREMENTNAMETXT " +
      ", RQORDERITEM.MATERIALNAMEGEN " +
      ", RQORDERITEM.MEASUREMENTNAMEGEN " +
      ", RQORDERITEM.MATERIALNAMEGENRQ " +
      ", RQORDERITEM.MEASUREMENTNAMEGENRQ " +
      ", RQORDERITEM.COUNTFACT " +
      ", RQORDERITEM.PRICEWITHOUTNDS " +
      ", RQORDERITEM.NDS " +
      ", RQORDERITEM.PRICEWITHNDS " +
      ", RQORDERITEM.SUMWITHOUTNDS " +
      ", RQORDERITEM.SUMNDS " +
      ", RQORDERITEM.SUMGEN " +
      ", RQORDERITEM.COMMENTGEN " +
      ", RQORDERITEM.DELIVERYTIME " +
      ", RQORDERITEM.CONTRACTNUMBER " +
      ", RQORDERITEM.CONTRACTDATE " +
      ", RQORDERITEM.FINDOCCODE " +
      ", RQORDERITEM.FINDOCID " +
      ", RQORDERITEM.PLANNEDDATEPAYS " +
      ", RQORDERITEM.PLANNEDDATEDELIVERY " +
      ", RQORDERITEM.STATUSREASON " +
      ", RQORDERITEM.PAYMENTVALUE " +
      ", RQORDERITEM.USERGEN " +
      ", RQBILLITEM.CODE " +
      ", RQBILLITEM.COUNTGEN " +
      ", RQBILLITEM.MATERIALNAMETXT " +
      ", RQBILLITEM.MEASUREMENTNAMETXT " +
      ", RQBILLITEM.COUNTFACT " +
      ", RQBILLITEM.PRICEWITHOUTNDS " +
      ", RQBILLITEM.NDS " +
      ", RQBILLITEM.SUMWITHOUTNDS " +
      ", RQBILLITEM.SUMNDS " +
      ", RQBILLITEM.SUMGEN " +
      ", RQBILLITEM.COMMENTGEN " +
      ", RQBILLITEM.USERGEN " +
      ", RQFKORDERITEM.CODE " +
      ", RQFKORDERITEM.FINCODE " +
      ", RQFKORDERITEM.NOMENCLATURECODE " +
      ", RQFKORDERITEM.NOMENCLATURENUM " +
      ", RQFKORDERITEM.NOMENCLATUREBALSCH " +
      ", RQFKORDERITEM.NOMENCLATURENAME " +
      ", RQFKORDERITEM.NOMENCLATUREUNITCODE " +
      ", RQFKORDERITEM.NOMENCLATUREUNITNAME " +
      ", RQFKORDERITEM.CONTRACTNUMBER " +
      ", RQFKORDERITEM.CONTRACTDATE " +
      ", RQFKORDERITEM.FINDOCCODE " +
      ", RQFKORDERITEM.FINDOCID " +
      ", RQFKORDERITEM.MATERIALNAMETXT " +
      ", RQFKORDERITEM.MEASUREMENTNAMETXT " +
      ", RQFKORDERITEM.COUNTGEN " +
      ", RQFKORDERITEM.PRICEWITHOUTNDS " +
      ", RQFKORDERITEM.PRICEWITHNDS " +
      ", RQFKORDERITEM.PRICENDS " +
      ", RQFKORDERITEM.SUMWITHOUTNDS " +
      ", RQFKORDERITEM.SUMNDS " +
      ", RQFKORDERITEM.SUMGEN " +
      ", RQFKORDERITEM.USERGEN " +
      ", RQFKORDERITEM.COMMENTGEN " +
      ", RQFKORDERITEM.NEXT_MAT_NAME " +
      ", RQFKORDERITEM.MEASUREMENTTWOUNITS " +
      ", RQFKORDERITEM.COUNTTWOUNITS " +
      ", RQFKORDERITEM.PRICETWOUNITS " +
      ", RQFKORDERITEM.WEIGHT " +
      ", RQFKORDERITEM.SELLINGPRICEWITHOUTNDS " +
      ", RQFKORDERITEM.SELLINGCOSTWITHOUTNDS " +
      ", RQFKORDERITEM.DATEREALIZ " +
      ", RQFKORDERITEM.FUNDINGTYPE " +
     " FROM ENESTIMATEHISTORY " +
     ", ENESTIMATEHISTORYTYPE " +
     ", ENESTIMATEITEM " +
     ", RQORDERITEM " +
     ", RQBILLITEM " +
     ", RQFKORDERITEM " +
     //" WHERE "
    "";
     whereStr = " ENESTIMATEHISTORYTYPE.CODE = ENESTIMATEHISTORY.HISTORYTYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENESTIMATEITEM.CODE = ENESTIMATEHISTORY.ESTIMATEITEMREFCODE" ; //+
      whereStr = whereStr +" AND RQORDERITEM.CODE = ENESTIMATEHISTORY.RQORDERITEMREFCODE" ; //+
      whereStr = whereStr +" AND RQBILLITEM.CODE = ENESTIMATEHISTORY.RQBILLITEMREFCODE" ; //+
      whereStr = whereStr +" AND RQFKORDERITEM.CODE = ENESTIMATEHISTORY.FKORDERITEMREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENESTIMATEHISTORY.CODE IN ( SELECT ENESTIMATEHISTORY.CODE FROM ENESTIMATEHISTORY ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEHISTORY.CODE = ?";
        }
        if(aFilterObject.countFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEHISTORY.COUNTFACT = ?";
        }
        if(aFilterObject.historyTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEHISTORY.HISTORYTYPEREFCODE = ? ";
        }
        if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEHISTORY.ESTIMATEITEMREFCODE = ? ";
        }
        if(aFilterObject.rqOrderItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEHISTORY.RQORDERITEMREFCODE = ? ";
        }
        if(aFilterObject.rqBillItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEHISTORY.RQBILLITEMREFCODE = ? ";
        }
        if(aFilterObject.fkOrderItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEHISTORY.FKORDERITEMREFCODE = ? ";
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
        if(aFilterObject.countFact != null){
            number++;
            aFilterObject.countFact = aFilterObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFact);
        }
       if(aFilterObject.historyTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.historyTypeRef.code);
       }
       if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemRef.code);
       }
       if(aFilterObject.rqOrderItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.rqOrderItemRef.code);
       }
       if(aFilterObject.rqBillItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.rqBillItemRef.code);
       }
       if(aFilterObject.fkOrderItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fkOrderItemRef.code);
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

        anObject = new ENEstimateHistoryShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.countFact = set.getBigDecimal(2);
        if(anObject.countFact != null)
            anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.historyTypeRefCode = set.getInt(3);
        if(set.wasNull())
        anObject.historyTypeRefCode = Integer.MIN_VALUE;
        anObject.historyTypeRefName = set.getString(4);
        anObject.estimateItemRefCode = set.getInt(5);
        if(set.wasNull())
        anObject.estimateItemRefCode = Integer.MIN_VALUE;
        anObject.estimateItemRefCountGen = set.getBigDecimal(6);
        if(anObject.estimateItemRefCountGen != null)
          anObject.estimateItemRefCountGen = anObject.estimateItemRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemRefCountFact = set.getBigDecimal(7);
        if(anObject.estimateItemRefCountFact != null)
          anObject.estimateItemRefCountFact = anObject.estimateItemRefCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemRefPrice = set.getBigDecimal(8);
        if(anObject.estimateItemRefPrice != null)
          anObject.estimateItemRefPrice = anObject.estimateItemRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemRefCost = set.getBigDecimal(9);
        if(anObject.estimateItemRefCost != null)
          anObject.estimateItemRefCost = anObject.estimateItemRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemRefDeliveryTime = set.getInt(10);
        if(set.wasNull())
        anObject.estimateItemRefDeliveryTime = Integer.MIN_VALUE;
        anObject.estimateItemRefUseWorkTime = set.getInt(11);
        if(set.wasNull())
        anObject.estimateItemRefUseWorkTime = Integer.MIN_VALUE;
        anObject.estimateItemRefUserGen = set.getString(12);
        anObject.estimateItemRefDateEdit = set.getDate(13);
        anObject.rqOrderItemRefCode = set.getInt(14);
        if(set.wasNull())
        anObject.rqOrderItemRefCode = Integer.MIN_VALUE;
        anObject.rqOrderItemRefCountGen = set.getBigDecimal(15);
        if(anObject.rqOrderItemRefCountGen != null)
          anObject.rqOrderItemRefCountGen = anObject.rqOrderItemRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.rqOrderItemRefMaterialNameTxt = set.getString(16);
        anObject.rqOrderItemRefMeasurementNameTxt = set.getString(17);
        anObject.rqOrderItemRefMaterialNameGen = set.getString(18);
        anObject.rqOrderItemRefMeasurementNameGen = set.getString(19);
        anObject.rqOrderItemRefMaterialNameGenRQ = set.getString(20);
        anObject.rqOrderItemRefMeasurementNameGenRQ = set.getString(21);
        anObject.rqOrderItemRefCountFact = set.getBigDecimal(22);
        if(anObject.rqOrderItemRefCountFact != null)
          anObject.rqOrderItemRefCountFact = anObject.rqOrderItemRefCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.rqOrderItemRefPriceWithoutNds = set.getBigDecimal(23);
        if(anObject.rqOrderItemRefPriceWithoutNds != null)
          anObject.rqOrderItemRefPriceWithoutNds = anObject.rqOrderItemRefPriceWithoutNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.rqOrderItemRefNds = set.getBigDecimal(24);
        if(anObject.rqOrderItemRefNds != null)
          anObject.rqOrderItemRefNds = anObject.rqOrderItemRefNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.rqOrderItemRefPriceWithNds = set.getBigDecimal(25);
        if(anObject.rqOrderItemRefPriceWithNds != null)
          anObject.rqOrderItemRefPriceWithNds = anObject.rqOrderItemRefPriceWithNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.rqOrderItemRefSumWithoutNds = set.getBigDecimal(26);
        if(anObject.rqOrderItemRefSumWithoutNds != null)
          anObject.rqOrderItemRefSumWithoutNds = anObject.rqOrderItemRefSumWithoutNds.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.rqOrderItemRefSumNds = set.getBigDecimal(27);
        if(anObject.rqOrderItemRefSumNds != null)
          anObject.rqOrderItemRefSumNds = anObject.rqOrderItemRefSumNds.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.rqOrderItemRefSumGen = set.getBigDecimal(28);
        if(anObject.rqOrderItemRefSumGen != null)
          anObject.rqOrderItemRefSumGen = anObject.rqOrderItemRefSumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.rqOrderItemRefCommentGen = set.getString(29);
        anObject.rqOrderItemRefDeliveryTime = set.getInt(30);
        if(set.wasNull())
        anObject.rqOrderItemRefDeliveryTime = Integer.MIN_VALUE;
        anObject.rqOrderItemRefContractNumber = set.getString(31);
        anObject.rqOrderItemRefContractDate = set.getDate(32);
        anObject.rqOrderItemRefFinDocCode = set.getString(33);
        anObject.rqOrderItemRefFinDocID = set.getInt(34);
        if(set.wasNull())
        anObject.rqOrderItemRefFinDocID = Integer.MIN_VALUE;
        anObject.rqOrderItemRefPlannedDatePays = set.getDate(35);
        anObject.rqOrderItemRefPlannedDateDelivery = set.getDate(36);
        anObject.rqOrderItemRefStatusReason = set.getString(37);
        anObject.rqOrderItemRefPaymentValue = set.getInt(38);
        if(set.wasNull())
        anObject.rqOrderItemRefPaymentValue = Integer.MIN_VALUE;
        anObject.rqOrderItemRefUserGen = set.getString(39);
        anObject.rqBillItemRefCode = set.getInt(40);
        if(set.wasNull())
        anObject.rqBillItemRefCode = Integer.MIN_VALUE;
        anObject.rqBillItemRefCountGen = set.getBigDecimal(41);
        if(anObject.rqBillItemRefCountGen != null)
          anObject.rqBillItemRefCountGen = anObject.rqBillItemRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.rqBillItemRefMaterialNameTxt = set.getString(42);
        anObject.rqBillItemRefMeasurementNameTxt = set.getString(43);
        anObject.rqBillItemRefCountFact = set.getBigDecimal(44);
        if(anObject.rqBillItemRefCountFact != null)
          anObject.rqBillItemRefCountFact = anObject.rqBillItemRefCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.rqBillItemRefPriceWithoutNds = set.getBigDecimal(45);
        if(anObject.rqBillItemRefPriceWithoutNds != null)
          anObject.rqBillItemRefPriceWithoutNds = anObject.rqBillItemRefPriceWithoutNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.rqBillItemRefNds = set.getBigDecimal(46);
        if(anObject.rqBillItemRefNds != null)
          anObject.rqBillItemRefNds = anObject.rqBillItemRefNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.rqBillItemRefSumWithoutNds = set.getBigDecimal(47);
        if(anObject.rqBillItemRefSumWithoutNds != null)
          anObject.rqBillItemRefSumWithoutNds = anObject.rqBillItemRefSumWithoutNds.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.rqBillItemRefSumNds = set.getBigDecimal(48);
        if(anObject.rqBillItemRefSumNds != null)
          anObject.rqBillItemRefSumNds = anObject.rqBillItemRefSumNds.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.rqBillItemRefSumGen = set.getBigDecimal(49);
        if(anObject.rqBillItemRefSumGen != null)
          anObject.rqBillItemRefSumGen = anObject.rqBillItemRefSumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.rqBillItemRefCommentGen = set.getString(50);
        anObject.rqBillItemRefUserGen = set.getString(51);
        anObject.fkOrderItemRefCode = set.getInt(52);
        if(set.wasNull())
        anObject.fkOrderItemRefCode = Integer.MIN_VALUE;
        anObject.fkOrderItemRefFinCode = set.getInt(53);
        if(set.wasNull())
        anObject.fkOrderItemRefFinCode = Integer.MIN_VALUE;
        anObject.fkOrderItemRefNomenclatureCode = set.getInt(54);
        if(set.wasNull())
        anObject.fkOrderItemRefNomenclatureCode = Integer.MIN_VALUE;
        anObject.fkOrderItemRefNomenclatureNum = set.getString(55);
        anObject.fkOrderItemRefNomenclatureBalSch = set.getString(56);
        anObject.fkOrderItemRefNomenclatureName = set.getString(57);
        anObject.fkOrderItemRefNomenclatureUnitCode = set.getInt(58);
        if(set.wasNull())
        anObject.fkOrderItemRefNomenclatureUnitCode = Integer.MIN_VALUE;
        anObject.fkOrderItemRefNomenclatureUnitName = set.getString(59);
        anObject.fkOrderItemRefContractNumber = set.getString(60);
        anObject.fkOrderItemRefContractDate = set.getDate(61);
        anObject.fkOrderItemRefFinDocCode = set.getString(62);
        anObject.fkOrderItemRefFinDocID = set.getInt(63);
        if(set.wasNull())
        anObject.fkOrderItemRefFinDocID = Integer.MIN_VALUE;
        anObject.fkOrderItemRefMaterialNameTxt = set.getString(64);
        anObject.fkOrderItemRefMeasurementNameTxt = set.getString(65);
        anObject.fkOrderItemRefCountGen = set.getBigDecimal(66);
        if(anObject.fkOrderItemRefCountGen != null)
          anObject.fkOrderItemRefCountGen = anObject.fkOrderItemRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkOrderItemRefPriceWithoutNds = set.getBigDecimal(67);
        if(anObject.fkOrderItemRefPriceWithoutNds != null)
          anObject.fkOrderItemRefPriceWithoutNds = anObject.fkOrderItemRefPriceWithoutNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkOrderItemRefPriceWithNds = set.getBigDecimal(68);
        if(anObject.fkOrderItemRefPriceWithNds != null)
          anObject.fkOrderItemRefPriceWithNds = anObject.fkOrderItemRefPriceWithNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkOrderItemRefPriceNds = set.getBigDecimal(69);
        if(anObject.fkOrderItemRefPriceNds != null)
          anObject.fkOrderItemRefPriceNds = anObject.fkOrderItemRefPriceNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkOrderItemRefSumWithoutNds = set.getBigDecimal(70);
        if(anObject.fkOrderItemRefSumWithoutNds != null)
          anObject.fkOrderItemRefSumWithoutNds = anObject.fkOrderItemRefSumWithoutNds.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkOrderItemRefSumNds = set.getBigDecimal(71);
        if(anObject.fkOrderItemRefSumNds != null)
          anObject.fkOrderItemRefSumNds = anObject.fkOrderItemRefSumNds.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkOrderItemRefSumGen = set.getBigDecimal(72);
        if(anObject.fkOrderItemRefSumGen != null)
          anObject.fkOrderItemRefSumGen = anObject.fkOrderItemRefSumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkOrderItemRefUserGen = set.getString(73);
        anObject.fkOrderItemRefCommentGen = set.getString(74);
        anObject.fkOrderItemRefNext_mat_name = set.getString(75);
        anObject.fkOrderItemRefMeasurementTwoUnits = set.getString(76);
        anObject.fkOrderItemRefCountTwoUnits = set.getBigDecimal(77);
        if(anObject.fkOrderItemRefCountTwoUnits != null)
          anObject.fkOrderItemRefCountTwoUnits = anObject.fkOrderItemRefCountTwoUnits.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkOrderItemRefPriceTwoUnits = set.getBigDecimal(78);
        if(anObject.fkOrderItemRefPriceTwoUnits != null)
          anObject.fkOrderItemRefPriceTwoUnits = anObject.fkOrderItemRefPriceTwoUnits.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkOrderItemRefWeight = set.getBigDecimal(79);
        if(anObject.fkOrderItemRefWeight != null)
          anObject.fkOrderItemRefWeight = anObject.fkOrderItemRefWeight.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkOrderItemRefSellingPriceWithoutNds = set.getBigDecimal(80);
        if(anObject.fkOrderItemRefSellingPriceWithoutNds != null)
          anObject.fkOrderItemRefSellingPriceWithoutNds = anObject.fkOrderItemRefSellingPriceWithoutNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkOrderItemRefSellingCostWithoutNds = set.getBigDecimal(81);
        if(anObject.fkOrderItemRefSellingCostWithoutNds != null)
          anObject.fkOrderItemRefSellingCostWithoutNds = anObject.fkOrderItemRefSellingCostWithoutNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkOrderItemRefDateRealiz = set.getDate(82);
        anObject.fkOrderItemRefFundingType = set.getInt(83);
        if(set.wasNull())
        anObject.fkOrderItemRefFundingType = Integer.MIN_VALUE;

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

  public int[] getFilteredCodeArrayOLD(ENEstimateHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENESTIMATEHISTORY.CODE FROM ENESTIMATEHISTORY";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENESTIMATEHISTORY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEHISTORY.CODE = ?";
        }
        if(aFilterObject.countFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEHISTORY.COUNTFACT = ?";
        }
        if(aFilterObject.historyTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEHISTORY.HISTORYTYPEREFCODE = ? ";
        }
        if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEHISTORY.ESTIMATEITEMREFCODE = ? ";
        }
        if(aFilterObject.rqOrderItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEHISTORY.RQORDERITEMREFCODE = ? ";
        }
        if(aFilterObject.rqBillItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEHISTORY.RQBILLITEMREFCODE = ? ";
        }
        if(aFilterObject.fkOrderItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEHISTORY.FKORDERITEMREFCODE = ? ";
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
        if(aFilterObject.countFact != null){
            number++;
            aFilterObject.countFact = aFilterObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFact);
        }
       if(aFilterObject.historyTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.historyTypeRef.code);
       }
       if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemRef.code);
       }
       if(aFilterObject.rqOrderItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.rqOrderItemRef.code);
       }
       if(aFilterObject.rqBillItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.rqBillItemRef.code);
       }
       if(aFilterObject.fkOrderItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fkOrderItemRef.code);
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

  public int[] getFilteredCodeArray(ENEstimateHistoryFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENEstimateHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENESTIMATEHISTORY.CODE FROM ENESTIMATEHISTORY";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENESTIMATEHISTORY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEHISTORY.CODE = ?";
        }
        if(aFilterObject.countFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEHISTORY.COUNTFACT = ?";
        }
        if(aFilterObject.historyTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEHISTORY.HISTORYTYPEREFCODE = ? ";
        }
        if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEHISTORY.ESTIMATEITEMREFCODE = ? ";
        }
        if(aFilterObject.rqOrderItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEHISTORY.RQORDERITEMREFCODE = ? ";
        }
        if(aFilterObject.rqBillItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEHISTORY.RQBILLITEMREFCODE = ? ";
        }
        if(aFilterObject.fkOrderItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEHISTORY.FKORDERITEMREFCODE = ? ";
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
        if(aFilterObject.countFact != null){
            number++;
            aFilterObject.countFact = aFilterObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFact);
        }
       if(aFilterObject.historyTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.historyTypeRef.code);
       }
       if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemRef.code);
       }
       if(aFilterObject.rqOrderItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.rqOrderItemRef.code);
       }
       if(aFilterObject.rqBillItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.rqBillItemRef.code);
       }
       if(aFilterObject.fkOrderItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fkOrderItemRef.code);
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


   public ENEstimateHistory getObject(int uid) throws PersistenceException
   {
    ENEstimateHistory result = new ENEstimateHistory();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENEstimateHistory anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENESTIMATEHISTORY.CODE, ENESTIMATEHISTORY.COUNTFACT, ENESTIMATEHISTORY.HISTORYTYPEREFCODE, ENESTIMATEHISTORY.ESTIMATEITEMREFCODE, ENESTIMATEHISTORY.RQORDERITEMREFCODE, ENESTIMATEHISTORY.RQBILLITEMREFCODE, ENESTIMATEHISTORY.FKORDERITEMREFCODE "
    +" FROM ENESTIMATEHISTORY WHERE ENESTIMATEHISTORY.CODE = ?";

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
        anObject.countFact = set.getBigDecimal(2);
        if(anObject.countFact != null)
            anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.historyTypeRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.historyTypeRef.code = Integer.MIN_VALUE;
        anObject.estimateItemRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.estimateItemRef.code = Integer.MIN_VALUE;
        anObject.rqOrderItemRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.rqOrderItemRef.code = Integer.MIN_VALUE;
        anObject.rqBillItemRef.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.rqBillItemRef.code = Integer.MIN_VALUE;
        anObject.fkOrderItemRef.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.fkOrderItemRef.code = Integer.MIN_VALUE;
        if(anObject.historyTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setHistoryTypeRef(
        new com.ksoe.energynet.dataminer.generated.ENEstimateHistoryTypeDAOGen(connection,getUserProfile()).getRef(anObject.historyTypeRef.code));
    }
        if(anObject.estimateItemRef.code != Integer.MIN_VALUE)
        {
           anObject.setEstimateItemRef(
        new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).getRef(anObject.estimateItemRef.code));
    }
        if(anObject.rqOrderItemRef.code != Integer.MIN_VALUE)
        {
           anObject.setRqOrderItemRef(
        new com.ksoe.rqorder.dataminer.generated.RQOrderItemDAOGen(connection,getUserProfile()).getRef(anObject.rqOrderItemRef.code));
    }
        if(anObject.rqBillItemRef.code != Integer.MIN_VALUE)
        {
           anObject.setRqBillItemRef(
        new com.ksoe.rqorder.dataminer.generated.RQBillItemDAOGen(connection,getUserProfile()).getRef(anObject.rqBillItemRef.code));
    }
        if(anObject.fkOrderItemRef.code != Integer.MIN_VALUE)
        {
           anObject.setFkOrderItemRef(
        new com.ksoe.rqorder.dataminer.generated.RQFKOrderItemDAOGen(connection,getUserProfile()).getRef(anObject.fkOrderItemRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENEstimateHistoryRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENEstimateHistoryRef ref = new com.ksoe.energynet.valueobject.references.ENEstimateHistoryRef();
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

    selectStr = "DELETE FROM  ENESTIMATEHISTORY WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENEstimateHistory object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENEstimateHistory.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENEstimateHistory.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENEstimateHistory.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENEstimateHistory.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENEstimateHistory.getObject%} access denied");

    selectStr =

    "SELECT  ENESTIMATEHISTORY.CODE FROM  ENESTIMATEHISTORY WHERE  ENESTIMATEHISTORY.CODE = ?";
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
    _checkConditionToken(condition,"code","ENESTIMATEHISTORY.CODE");
    _checkConditionToken(condition,"countfact","ENESTIMATEHISTORY.COUNTFACT");
      // relationship conditions
    _checkConditionToken(condition,"historytyperef","HISTORYTYPEREFCODE");
    _checkConditionToken(condition,"historytyperef.code","HISTORYTYPEREFCODE");
    _checkConditionToken(condition,"estimateitemref","ESTIMATEITEMREFCODE");
    _checkConditionToken(condition,"estimateitemref.code","ESTIMATEITEMREFCODE");
    _checkConditionToken(condition,"rqorderitemref","RQORDERITEMREFCODE");
    _checkConditionToken(condition,"rqorderitemref.code","RQORDERITEMREFCODE");
    _checkConditionToken(condition,"rqbillitemref","RQBILLITEMREFCODE");
    _checkConditionToken(condition,"rqbillitemref.code","RQBILLITEMREFCODE");
    _checkConditionToken(condition,"fkorderitemref","FKORDERITEMREFCODE");
    _checkConditionToken(condition,"fkorderitemref.code","FKORDERITEMREFCODE");
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

   private void _collectAutoIncrementFields(ENEstimateHistory anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENESTIMATEHISTORY", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENESTIMATEHISTORY", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENESTIMATEHISTORY", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENESTIMATEHISTORY");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENEstimateHistoryDAO

