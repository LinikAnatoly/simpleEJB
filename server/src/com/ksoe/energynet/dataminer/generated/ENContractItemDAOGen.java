
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
import com.ksoe.energynet.valueobject.ENContractItem;
import com.ksoe.energynet.valueobject.brief.ENContractItemShort;
import com.ksoe.energynet.valueobject.filter.ENContractItemFilter;
import com.ksoe.energynet.valueobject.lists.ENContractItemShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

/**
 * DAO Object for ENContractItem;
 *
 */

public class ENContractItemDAOGen extends GenericDataMiner {

  public ENContractItemDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENContractItemDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENContractItem inObject) throws PersistenceException
   {
      ENContractItem obj = new ENContractItem();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.countGen.equals(obj.countGen)){
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

     if ( ! inObject.countReal.equals(obj.countReal)){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }
     if (inObject.material.code != obj.material.code){
        return false;
     }
     if (inObject.contract.code != obj.contract.code){
        return false;
     }
      return true;
   }

   public int add(ENContractItem anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENContractItem anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENCONTRACTITEM (CODE,COUNTGEN,PRICE,COST,COMMENTGEN,COUNTREAL,USERGEN,DATEEDIT,MODIFY_TIME,MATERIALCODE,CONTRACTCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

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
      if (anObject.price != null)
        anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.price);
      if (anObject.cost != null)
        anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.cost);
      statement.setString(5,anObject.commentGen);
      if (anObject.countReal != null)
        anObject.countReal = anObject.countReal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.countReal);
      statement.setString(7,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(8,null);
      else
        statement.setDate(8,new java.sql.Date(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(9,null);
      else
        statement.setBigDecimal(9,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.material.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKMaterialsDAOGen(connection,getUserProfile()).exists(anObject.material.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENContractItem.material.code%} = {%"+anObject.material.code+"%}");
        statement.setInt(10,anObject.material.code);
      }
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.contract.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENContractDAOGen(connection,getUserProfile()).exists(anObject.contract.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENContractItem.contract.code%} = {%"+anObject.contract.code+"%}");
        statement.setInt(11,anObject.contract.code);
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
      throw new PersistenceException("Error in method {%ENContractItemDAOGen.add%}",e);
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

   public void save(ENContractItem anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENContractItem anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENContractItem oldObject = new ENContractItem();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENContractItem.modify_time_Field+" FROM  ENCONTRACTITEM WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("COUNTREAL") == 0)
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
          if(fieldNameStr.compareTo("MATERIAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRACT") == 0)
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
        "UPDATE ENCONTRACTITEM SET  COUNTGEN = ? , PRICE = ? , COST = ? , COMMENTGEN = ? , COUNTREAL = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , MATERIALCODE = ? , CONTRACTCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENCONTRACTITEM SET ";
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
      if (anObject.price != null)
        anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.price);
      if (anObject.cost != null)
        anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.cost);
      statement.setString(4,anObject.commentGen);
      if (anObject.countReal != null)
        anObject.countReal = anObject.countReal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.countReal);
      statement.setString(6,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(7,null);
      else
        statement.setDate(7,new java.sql.Date(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(8,null);
      else
        statement.setBigDecimal(8,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.material.code != Integer.MIN_VALUE)
        statement.setInt(9,anObject.material.code);
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.contract.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.contract.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
          statement.setInt(11,anObject.code);
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
            if("COUNTREAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countReal != null)
                    anObject.countReal = anObject.countReal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countReal);
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
            if("MATERIAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.material.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.material.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("CONTRACT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.contract.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.contract.code);
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

   } // end of save(ENContractItem anObject,String[] anAttributes)


 public ENContractItemShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENContractItem filterObject = new ENContractItem();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENContractItemShort)list.get(0);
   return null;
  }

  public ENContractItemShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENContractItemShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENContractItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENContractItemShortList getFilteredList(ENContractItem filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENContractItemShortList getScrollableFilteredList(ENContractItem aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENContractItemShortList getScrollableFilteredList(ENContractItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENContractItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENContractItemShortList getScrollableFilteredList(ENContractItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENContractItemShortList getScrollableFilteredList(ENContractItemFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENContractItemShortList getScrollableFilteredList(ENContractItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENContractItemShortList getScrollableFilteredList(ENContractItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENContractItemShortList result = new ENContractItemShortList();
    ENContractItemShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCONTRACTITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENCONTRACTITEM.CODE"+
     ",ENCONTRACTITEM.COUNTGEN"+
     ",ENCONTRACTITEM.PRICE"+
     ",ENCONTRACTITEM.COST"+
     ",ENCONTRACTITEM.COUNTREAL"+
     ",ENCONTRACTITEM.USERGEN"+
     ",ENCONTRACTITEM.DATEEDIT"+

      ", TKMATERIALS.CODE " +
      ", TKMATERIALS.NAME " +
      ", TKMATERIALS.COST " +
      ", TKMATERIALS.DELIVERYDATE " +
      ", TKMATERIALS.NUMKATALOG " +
      ", TKMATERIALS.IDENTID " +
      ", ENCONTRACT.CODE " +
      ", ENCONTRACT.CONTRACTNUMBER " +
      ", ENCONTRACT.CONTRACTDATE " +
      ", ENCONTRACT.FINDOCCODE " +
      ", ENCONTRACT.FINDOCID " +
      ", ENCONTRACT.USERGEN " +
      ", ENCONTRACT.DATEEDIT " +
     " FROM ENCONTRACTITEM " +
     ", TKMATERIALS " +
     ", ENCONTRACT " +
     //" WHERE "
    "";
     whereStr = " TKMATERIALS.CODE = ENCONTRACTITEM.MATERIALCODE" ; //+
      whereStr = whereStr +" AND ENCONTRACT.CODE = ENCONTRACTITEM.CONTRACTCODE" ; //+
        //selectStr = selectStr + " ${s} ENCONTRACTITEM.CODE IN ( SELECT ENCONTRACTITEM.CODE FROM ENCONTRACTITEM ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.COUNTGEN = ?";
        }
        if(aFilterObject.price != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.PRICE = ?";
        }
        if(aFilterObject.cost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.COST = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRACTITEM.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRACTITEM.COMMENTGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.countReal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.COUNTREAL = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRACTITEM.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRACTITEM.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.MODIFY_TIME = ?";
        }
        if(aFilterObject.material.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCONTRACTITEM.MATERIALCODE = ? ";
        }
        if(aFilterObject.contract.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCONTRACTITEM.CONTRACTCODE = ? ";
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
        if(aFilterObject.countReal != null){
            number++;
            aFilterObject.countReal = aFilterObject.countReal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countReal);
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
       if(aFilterObject.material.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.material.code);
       }
       if(aFilterObject.contract.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.contract.code);
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

        anObject = new ENContractItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.countGen = set.getBigDecimal(2);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.price = set.getBigDecimal(3);
        if(anObject.price != null)
            anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.cost = set.getBigDecimal(4);
        if(anObject.cost != null)
            anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countReal = set.getBigDecimal(5);
        if(anObject.countReal != null)
            anObject.countReal = anObject.countReal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(6);
        anObject.dateEdit = set.getDate(7);

        anObject.materialCode = set.getInt(8);
        if(set.wasNull())
        anObject.materialCode = Integer.MIN_VALUE;
        anObject.materialName = set.getString(9);

        anObject.contractCode = set.getInt(14);
        if(set.wasNull())
        anObject.contractCode = Integer.MIN_VALUE;
        anObject.contractContractNumber = set.getString(15);
        anObject.contractContractDate = set.getDate(16);
        anObject.contractFinDocCode = set.getString(17);
        anObject.contractFinDocID = set.getInt(18);
        if(set.wasNull())
        anObject.contractFinDocID = Integer.MIN_VALUE;
        anObject.contractUserGen = set.getString(19);
        anObject.contractDateEdit = set.getDate(20);

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

  public int[] getFilteredCodeArrayOLD(ENContractItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCONTRACTITEM.CODE FROM ENCONTRACTITEM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCONTRACTITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.COUNTGEN = ?";
        }
        if(aFilterObject.price != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.PRICE = ?";
        }
        if(aFilterObject.cost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.COST = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRACTITEM.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENCONTRACTITEM.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.countReal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.COUNTREAL = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRACTITEM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENCONTRACTITEM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.MODIFY_TIME = ?";
        }
        if(aFilterObject.material.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCONTRACTITEM.MATERIALCODE = ? ";
        }
        if(aFilterObject.contract.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCONTRACTITEM.CONTRACTCODE = ? ";
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
                 whereStr = whereStr + " ENCONTRACTITEM.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENCONTRACTITEM.COMMENTGEN LIKE ?";

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
        if(aFilterObject.countReal != null){
            number++;
            aFilterObject.countReal = aFilterObject.countReal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countReal);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRACTITEM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENCONTRACTITEM.USERGEN LIKE ?";

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
       if(aFilterObject.material.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.material.code);
       }
       if(aFilterObject.contract.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.contract.code);
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

  public int[] getFilteredCodeArray(ENContractItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENContractItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCONTRACTITEM.CODE FROM ENCONTRACTITEM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCONTRACTITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.COUNTGEN = ?";
        }
        if(aFilterObject.price != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.PRICE = ?";
        }
        if(aFilterObject.cost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.COST = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRACTITEM.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENCONTRACTITEM.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.countReal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.COUNTREAL = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRACTITEM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENCONTRACTITEM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRACTITEM.MODIFY_TIME = ?";
        }
        if(aFilterObject.material.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCONTRACTITEM.MATERIALCODE = ? ";
        }
        if(aFilterObject.contract.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCONTRACTITEM.CONTRACTCODE = ? ";
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
                 whereStr = whereStr + " ENCONTRACTITEM.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENCONTRACTITEM.COMMENTGEN LIKE ?";

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
        if(aFilterObject.countReal != null){
            number++;
            aFilterObject.countReal = aFilterObject.countReal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countReal);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRACTITEM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENCONTRACTITEM.USERGEN LIKE ?";

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
       if(aFilterObject.material.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.material.code);
       }
       if(aFilterObject.contract.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.contract.code);
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


   public ENContractItem getObject(int uid) throws PersistenceException
   {
    ENContractItem result = new ENContractItem();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENContractItem anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENCONTRACTITEM.CODE, ENCONTRACTITEM.COUNTGEN, ENCONTRACTITEM.PRICE, ENCONTRACTITEM.COST, ENCONTRACTITEM.COMMENTGEN, ENCONTRACTITEM.COUNTREAL, ENCONTRACTITEM.USERGEN, ENCONTRACTITEM.DATEEDIT, ENCONTRACTITEM.MODIFY_TIME, ENCONTRACTITEM.MATERIALCODE, ENCONTRACTITEM.CONTRACTCODE "
    +" FROM ENCONTRACTITEM WHERE ENCONTRACTITEM.CODE = ?";

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
        anObject.price = set.getBigDecimal(3);
        if(anObject.price != null)
            anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.cost = set.getBigDecimal(4);
        if(anObject.cost != null)
            anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.commentGen = set.getString(5);
        anObject.countReal = set.getBigDecimal(6);
        if(anObject.countReal != null)
            anObject.countReal = anObject.countReal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(7);
        anObject.dateEdit = set.getDate(8);
        anObject.modify_time = set.getLong(9);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.material.code = set.getInt(10);
        if ( set.wasNull() )
            anObject.material.code = Integer.MIN_VALUE;
        anObject.contract.code = set.getInt(11);
        if ( set.wasNull() )
            anObject.contract.code = Integer.MIN_VALUE;
        if(anObject.material.code != Integer.MIN_VALUE)
        {
           anObject.setMaterial(
        new com.ksoe.techcard.dataminer.generated.TKMaterialsDAOGen(connection,getUserProfile()).getObject(anObject.material.code));
    }
        if(anObject.contract.code != Integer.MIN_VALUE)
        {
           anObject.setContract(
        new com.ksoe.energynet.dataminer.generated.ENContractDAOGen(connection,getUserProfile()).getObject(anObject.contract.code));
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


  public com.ksoe.energynet.valueobject.references.ENContractItemRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENContractItemRef ref = new com.ksoe.energynet.valueobject.references.ENContractItemRef();
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

    selectStr = "DELETE FROM  ENCONTRACTITEM WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENContractItem object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENContractItem.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENContractItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENContractItem.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENContractItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENContractItem.getObject%} access denied");

    selectStr =

    "SELECT  ENCONTRACTITEM.CODE FROM  ENCONTRACTITEM WHERE  ENCONTRACTITEM.CODE = ?";
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
    _checkConditionToken(condition,"code","ENCONTRACTITEM.CODE");
    _checkConditionToken(condition,"countgen","ENCONTRACTITEM.COUNTGEN");
    _checkConditionToken(condition,"price","ENCONTRACTITEM.PRICE");
    _checkConditionToken(condition,"cost","ENCONTRACTITEM.COST");
    _checkConditionToken(condition,"commentgen","ENCONTRACTITEM.COMMENTGEN");
    _checkConditionToken(condition,"countreal","ENCONTRACTITEM.COUNTREAL");
    _checkConditionToken(condition,"usergen","ENCONTRACTITEM.USERGEN");
    _checkConditionToken(condition,"dateedit","ENCONTRACTITEM.DATEEDIT");
    _checkConditionToken(condition,"modify_time","ENCONTRACTITEM.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"material","MATERIALCODE");
    _checkConditionToken(condition,"material.code","MATERIALCODE");
    _checkConditionToken(condition,"contract","CONTRACTCODE");
    _checkConditionToken(condition,"contract.code","CONTRACTCODE");
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

    private void _collectAutoIncrementFields(ENContractItem anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENCONTRACTITEM", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENCONTRACTITEM", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENCONTRACTITEM", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENCONTRACTITEM");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENContractItemDAO
