
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
import com.ksoe.energynet.valueobject.ENEstimateItemPlanPay;
import com.ksoe.energynet.valueobject.brief.ENEstimateItemPlanPayShort;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemPlanPayFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemPlanPayShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

/**
 * DAO Object for ENEstimateItemPlanPay;
 *
 */

public class ENEstimateItemPlanPayDAOGen extends GenericDataMiner {

  public ENEstimateItemPlanPayDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENEstimateItemPlanPayDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENEstimateItemPlanPay inObject) throws PersistenceException
   {
      ENEstimateItemPlanPay obj = new ENEstimateItemPlanPay();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.percentPay.equals(obj.percentPay)){
       return false;
     }

     if ( ! inObject.datePay.equals(obj.datePay)){
       return false;
     }

     if (inObject.userAdd != obj.userAdd){
       return false;
     }

     if ( ! inObject.dateAdd.equals(obj.dateAdd)){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }
     if (inObject.typePayRef.code != obj.typePayRef.code){
        return false;
     }
     if (inObject.estimateItemRef.code != obj.estimateItemRef.code){
        return false;
     }
      return true;
   }

   public int add(ENEstimateItemPlanPay anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENEstimateItemPlanPay anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENESTIMATEITEMPLANPAY (CODE,PERCENTPAY,DATEPAY,MODIFY_TIME,USERADD,DATEADD,USERGEN,DATEEDIT,TYPEPAYREFCODE,ESTIMATEITEMREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.percentPay != null)
        anObject.percentPay = anObject.percentPay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.percentPay);
      if (anObject.datePay == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.datePay.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(4,null);
      else
        statement.setBigDecimal(4,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(5,anObject.userAdd);
      if (anObject.dateAdd == null)
        statement.setTimestamp(6,null);
      else
        statement.setTimestamp(6,new java.sql.Timestamp(anObject.dateAdd.getTime()));
      statement.setString(7,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(8,null);
      else
        statement.setTimestamp(8,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.typePayRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.rqorder.dataminer.generated.RQOrderItemTypePayDAOGen(connection,getUserProfile()).exists(anObject.typePayRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.rqorder.valueobject.ENEstimateItemPlanPay.typePayRef.code%} = {%"+anObject.typePayRef.code+"%}");
        statement.setInt(9,anObject.typePayRef.code);
      }
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.estimateItemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).exists(anObject.estimateItemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimateItemPlanPay.estimateItemRef.code%} = {%"+anObject.estimateItemRef.code+"%}");
        statement.setInt(10,anObject.estimateItemRef.code);
      }
      else
        statement.setNull(10,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENEstimateItemPlanPayDAOGen.add%}",e);
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

   public void save(ENEstimateItemPlanPay anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENEstimateItemPlanPay anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENEstimateItemPlanPay oldObject = new ENEstimateItemPlanPay();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENEstimateItemPlanPay.modify_time_Field+" FROM  ENESTIMATEITEMPLANPAY WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("PERCENTPAY") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEPAY") == 0)
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
          if(fieldNameStr.compareTo("USERADD") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEADD") == 0)
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
          if(fieldNameStr.compareTo("TYPEPAYREF") == 0)
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
         }
       if(fields.size() == 0)
         return;
       }
      if(fields == null)
       {
        selectStr =
        "UPDATE ENESTIMATEITEMPLANPAY SET  PERCENTPAY = ? , DATEPAY = ? , MODIFY_TIME = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , TYPEPAYREFCODE = ? , ESTIMATEITEMREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENESTIMATEITEMPLANPAY SET ";
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
      if (anObject.percentPay != null)
        anObject.percentPay = anObject.percentPay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.percentPay);

      if (anObject.datePay == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.datePay.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(3,null);
      else
        statement.setBigDecimal(3,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(4,anObject.userAdd);
      if (anObject.dateAdd == null)
        statement.setDate(5,null);
      else
        statement.setTimestamp(5,new java.sql.Timestamp(anObject.dateAdd.getTime()));
      statement.setString(6,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(7,null);
      else
        statement.setTimestamp(7,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.typePayRef.code != Integer.MIN_VALUE)
        statement.setInt(8,anObject.typePayRef.code);
      else
        statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.estimateItemRef.code != Integer.MIN_VALUE)
        statement.setInt(9,anObject.estimateItemRef.code);
      else
        statement.setNull(9,java.sql.Types.INTEGER);
          statement.setInt(10,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("PERCENTPAY".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.percentPay != null)
                    anObject.percentPay = anObject.percentPay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.percentPay);
                continue;
             }
            if("DATEPAY".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.datePay == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.datePay.getTime()));
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
            if("USERADD".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.userAdd);
                continue;
             }
            if("DATEADD".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateAdd == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateAdd.getTime()));
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
            if("TYPEPAYREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.typePayRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.typePayRef.code);
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

   } // end of save(ENEstimateItemPlanPay anObject,String[] anAttributes)


 public ENEstimateItemPlanPayShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENEstimateItemPlanPay filterObject = new ENEstimateItemPlanPay();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENEstimateItemPlanPayShort)list.get(0);
   return null;
  }

  public ENEstimateItemPlanPayShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENEstimateItemPlanPayShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENEstimateItemPlanPayShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENEstimateItemPlanPayShortList getFilteredList(ENEstimateItemPlanPay filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENEstimateItemPlanPayShortList getScrollableFilteredList(ENEstimateItemPlanPay aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENEstimateItemPlanPayShortList getScrollableFilteredList(ENEstimateItemPlanPay aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENEstimateItemPlanPayShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENEstimateItemPlanPayShortList getScrollableFilteredList(ENEstimateItemPlanPayFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENEstimateItemPlanPayShortList getScrollableFilteredList(ENEstimateItemPlanPayFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENEstimateItemPlanPayShortList getScrollableFilteredList(ENEstimateItemPlanPay aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENEstimateItemPlanPayShortList getScrollableFilteredList(ENEstimateItemPlanPay aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENEstimateItemPlanPayShortList result = new ENEstimateItemPlanPayShortList();
    ENEstimateItemPlanPayShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENESTIMATEITEMPLANPAY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENESTIMATEITEMPLANPAY.CODE"+
     ",ENESTIMATEITEMPLANPAY.PERCENTPAY"+
     ",ENESTIMATEITEMPLANPAY.DATEPAY"+
     ",ENESTIMATEITEMPLANPAY.USERADD"+
     ",ENESTIMATEITEMPLANPAY.DATEADD"+
     ",ENESTIMATEITEMPLANPAY.USERGEN"+
     ",ENESTIMATEITEMPLANPAY.DATEEDIT"+

      ", RQORDERITEMTYPEPAY.CODE " +
      ", RQORDERITEMTYPEPAY.NAME " +
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
     " FROM ENESTIMATEITEMPLANPAY " +
     ", RQORDERITEMTYPEPAY " +
     ", ENESTIMATEITEM " +
     //" WHERE "
    "";
     whereStr = " RQORDERITEMTYPEPAY.CODE = ENESTIMATEITEMPLANPAY.TYPEPAYREFCODE" ; //+
      whereStr = whereStr +" AND ENESTIMATEITEM.CODE = ENESTIMATEITEMPLANPAY.ESTIMATEITEMREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENESTIMATEITEMPLANPAY.CODE IN ( SELECT ENESTIMATEITEMPLANPAY.CODE FROM ENESTIMATEITEMPLANPAY ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.CODE = ?";
        }
        if(aFilterObject.percentPay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.PERCENTPAY = ?";
        }
        if(aFilterObject.datePay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.DATEPAY = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENESTIMATEITEMPLANPAY.USERADD) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENESTIMATEITEMPLANPAY.USERADD) LIKE UPPER(?)";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENESTIMATEITEMPLANPAY.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENESTIMATEITEMPLANPAY.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.DATEEDIT = ?";
        }
        if(aFilterObject.typePayRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEMPLANPAY.TYPEPAYREFCODE = ? ";
        }
        if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEMPLANPAY.ESTIMATEITEMREFCODE = ? ";
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
        if(aFilterObject.percentPay != null){
            number++;
            aFilterObject.percentPay = aFilterObject.percentPay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.percentPay);
        }
        if(aFilterObject.datePay != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.datePay.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }

           if(aFilterObject.userAdd != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userAdd);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.dateAdd != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
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
       if(aFilterObject.typePayRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typePayRef.code);
       }
       if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemRef.code);
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

        anObject = new ENEstimateItemPlanPayShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.percentPay = set.getBigDecimal(2);
        if(anObject.percentPay != null)
            anObject.percentPay = anObject.percentPay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.datePay = set.getDate(3);
        anObject.userAdd = set.getString(4);
        anObject.dateAdd = set.getTimestamp(5);
        anObject.userGen = set.getString(6);
        anObject.dateEdit = set.getTimestamp(7);

        anObject.typePayRefCode = set.getInt(8);
        if(set.wasNull())
        anObject.typePayRefCode = Integer.MIN_VALUE;
        anObject.typePayRefName = set.getString(9);
        anObject.estimateItemRefCode = set.getInt(10);
        if(set.wasNull())
        anObject.estimateItemRefCode = Integer.MIN_VALUE;
        anObject.estimateItemRefCountGen = set.getBigDecimal(11);
        if(anObject.estimateItemRefCountGen != null)
          anObject.estimateItemRefCountGen = anObject.estimateItemRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemRefCountFact = set.getBigDecimal(12);
        if(anObject.estimateItemRefCountFact != null)
          anObject.estimateItemRefCountFact = anObject.estimateItemRefCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemRefPrice = set.getBigDecimal(13);
        if(anObject.estimateItemRefPrice != null)
          anObject.estimateItemRefPrice = anObject.estimateItemRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemRefCost = set.getBigDecimal(14);
        if(anObject.estimateItemRefCost != null)
          anObject.estimateItemRefCost = anObject.estimateItemRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemRefIsUseVAT = set.getInt(15);
        if(set.wasNull())
        anObject.estimateItemRefIsUseVAT = Integer.MIN_VALUE;
        anObject.estimateItemRefDeliveryTime = set.getInt(16);
        if(set.wasNull())
        anObject.estimateItemRefDeliveryTime = Integer.MIN_VALUE;
        anObject.estimateItemRefUseWorkTime = set.getInt(17);
        if(set.wasNull())
        anObject.estimateItemRefUseWorkTime = Integer.MIN_VALUE;
        anObject.estimateItemRefUserGen = set.getString(18);
        anObject.estimateItemRefDateEdit = set.getDate(19);

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

  public int[] getFilteredCodeArrayOLD(ENEstimateItemPlanPay aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENESTIMATEITEMPLANPAY.CODE FROM ENESTIMATEITEMPLANPAY";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENESTIMATEITEMPLANPAY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.CODE = ?";
        }
        if(aFilterObject.percentPay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.PERCENTPAY = ?";
        }
        if(aFilterObject.datePay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.DATEPAY = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.USERADD = ?";
             else
                 whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.USERADD LIKE ?";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.DATEEDIT = ?";
        }
        if(aFilterObject.typePayRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEITEMPLANPAY.TYPEPAYREFCODE = ? ";
        }
        if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEITEMPLANPAY.ESTIMATEITEMREFCODE = ? ";
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
        if(aFilterObject.percentPay != null){
            number++;
            aFilterObject.percentPay = aFilterObject.percentPay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.percentPay);
        }
        if(aFilterObject.datePay != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.datePay.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENESTIMATEITEMPLANPAY.USERADD = ?";
             else
                 whereStr = whereStr + " ENESTIMATEITEMPLANPAY.USERADD LIKE ?";

           if(aFilterObject.userAdd != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userAdd);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateAdd != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENESTIMATEITEMPLANPAY.USERGEN = ?";
             else
                 whereStr = whereStr + " ENESTIMATEITEMPLANPAY.USERGEN LIKE ?";

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
       if(aFilterObject.typePayRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typePayRef.code);
       }
       if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemRef.code);
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

  public int[] getFilteredCodeArray(ENEstimateItemPlanPayFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENEstimateItemPlanPay aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENESTIMATEITEMPLANPAY.CODE FROM ENESTIMATEITEMPLANPAY";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENESTIMATEITEMPLANPAY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.CODE = ?";
        }
        if(aFilterObject.percentPay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.PERCENTPAY = ?";
        }
        if(aFilterObject.datePay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.DATEPAY = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.USERADD = ?";
             else
                 whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.USERADD LIKE ?";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMPLANPAY.DATEEDIT = ?";
        }
        if(aFilterObject.typePayRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEITEMPLANPAY.TYPEPAYREFCODE = ? ";
        }
        if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEITEMPLANPAY.ESTIMATEITEMREFCODE = ? ";
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
        if(aFilterObject.percentPay != null){
            number++;
            aFilterObject.percentPay = aFilterObject.percentPay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.percentPay);
        }
        if(aFilterObject.datePay != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.datePay.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENESTIMATEITEMPLANPAY.USERADD = ?";
             else
                 whereStr = whereStr + " ENESTIMATEITEMPLANPAY.USERADD LIKE ?";

           if(aFilterObject.userAdd != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userAdd);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateAdd != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENESTIMATEITEMPLANPAY.USERGEN = ?";
             else
                 whereStr = whereStr + " ENESTIMATEITEMPLANPAY.USERGEN LIKE ?";

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
       if(aFilterObject.typePayRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typePayRef.code);
       }
       if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemRef.code);
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


   public ENEstimateItemPlanPay getObject(int uid) throws PersistenceException
   {
    ENEstimateItemPlanPay result = new ENEstimateItemPlanPay();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENEstimateItemPlanPay anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENESTIMATEITEMPLANPAY.CODE, ENESTIMATEITEMPLANPAY.PERCENTPAY, ENESTIMATEITEMPLANPAY.DATEPAY, ENESTIMATEITEMPLANPAY.MODIFY_TIME, ENESTIMATEITEMPLANPAY.USERADD, ENESTIMATEITEMPLANPAY.DATEADD, ENESTIMATEITEMPLANPAY.USERGEN, ENESTIMATEITEMPLANPAY.DATEEDIT, ENESTIMATEITEMPLANPAY.TYPEPAYREFCODE, ENESTIMATEITEMPLANPAY.ESTIMATEITEMREFCODE "
    +" FROM ENESTIMATEITEMPLANPAY WHERE ENESTIMATEITEMPLANPAY.CODE = ?";

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
        anObject.percentPay = set.getBigDecimal(2);
        if(anObject.percentPay != null)
            anObject.percentPay = anObject.percentPay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.datePay = set.getDate(3);
        anObject.modify_time = set.getLong(4);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.userAdd = set.getString(5);
        anObject.dateAdd = set.getTimestamp(6);
        anObject.userGen = set.getString(7);
        anObject.dateEdit = set.getTimestamp(8);
        anObject.typePayRef.code = set.getInt(9);
        if ( set.wasNull() )
            anObject.typePayRef.code = Integer.MIN_VALUE;
        anObject.estimateItemRef.code = set.getInt(10);
        if ( set.wasNull() )
            anObject.estimateItemRef.code = Integer.MIN_VALUE;
        if(anObject.typePayRef.code != Integer.MIN_VALUE)
        {
           anObject.setTypePayRef(
        new com.ksoe.rqorder.dataminer.generated.RQOrderItemTypePayDAOGen(connection,getUserProfile()).getRef(anObject.typePayRef.code));
    }
        if(anObject.estimateItemRef.code != Integer.MIN_VALUE)
        {
           anObject.setEstimateItemRef(
        new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).getRef(anObject.estimateItemRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENEstimateItemPlanPayRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENEstimateItemPlanPayRef ref = new com.ksoe.energynet.valueobject.references.ENEstimateItemPlanPayRef();
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

    selectStr = "DELETE FROM  ENESTIMATEITEMPLANPAY WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENEstimateItemPlanPay object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENEstimateItemPlanPay.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENEstimateItemPlanPay.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENEstimateItemPlanPay.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENEstimateItemPlanPay.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENEstimateItemPlanPay.getObject%} access denied");

    selectStr =

    "SELECT  ENESTIMATEITEMPLANPAY.CODE FROM  ENESTIMATEITEMPLANPAY WHERE  ENESTIMATEITEMPLANPAY.CODE = ?";
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
    _checkConditionToken(condition,"code","ENESTIMATEITEMPLANPAY.CODE");
    _checkConditionToken(condition,"percentpay","ENESTIMATEITEMPLANPAY.PERCENTPAY");
    _checkConditionToken(condition,"datepay","ENESTIMATEITEMPLANPAY.DATEPAY");
    _checkConditionToken(condition,"modify_time","ENESTIMATEITEMPLANPAY.MODIFY_TIME");
    _checkConditionToken(condition,"useradd","ENESTIMATEITEMPLANPAY.USERADD");
    _checkConditionToken(condition,"dateadd","ENESTIMATEITEMPLANPAY.DATEADD");
    _checkConditionToken(condition,"usergen","ENESTIMATEITEMPLANPAY.USERGEN");
    _checkConditionToken(condition,"dateedit","ENESTIMATEITEMPLANPAY.DATEEDIT");
      // relationship conditions
    _checkConditionToken(condition,"typepayref","TYPEPAYREFCODE");
    _checkConditionToken(condition,"typepayref.code","TYPEPAYREFCODE");
    _checkConditionToken(condition,"estimateitemref","ESTIMATEITEMREFCODE");
    _checkConditionToken(condition,"estimateitemref.code","ESTIMATEITEMREFCODE");
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

   private void _collectAutoIncrementFields(ENEstimateItemPlanPay anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENESTIMATEITEMPLANPAY", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENESTIMATEITEMPLANPAY", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENESTIMATEITEMPLANPAY", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENESTIMATEITEMPLANPAY");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENEstimateItemPlanPayDAO
