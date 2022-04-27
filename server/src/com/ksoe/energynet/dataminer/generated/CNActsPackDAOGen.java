
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
import com.ksoe.energynet.valueobject.CNActsPack;
import com.ksoe.energynet.valueobject.brief.CNActsPackShort;
import com.ksoe.energynet.valueobject.filter.CNActsPackFilter;
import com.ksoe.energynet.valueobject.lists.CNActsPackShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for CNActsPack;
 *
 */

public class CNActsPackDAOGen extends GenericDataMiner {

  public CNActsPackDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public CNActsPackDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(CNActsPack inObject) throws PersistenceException
   {
      CNActsPack obj = new CNActsPack();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.name != obj.name){
       return false;
     }

     if (inObject.address != obj.address){
       return false;
     }

     if (inObject.address_jur != obj.address_jur){
       return false;
     }

     if (inObject.purpose != obj.purpose){
       return false;
     }

     if (inObject.business_type != obj.business_type){
       return false;
     }

     if (inObject.blank_number != obj.blank_number){
       return false;
     }

     if (inObject.act_number != obj.act_number){
       return false;
     }

     if ( ! inObject.act_date.equals(obj.act_date)){
       return false;
     }

     if ( ! inObject.act_sum.equals(obj.act_sum)){
       return false;
     }

     if ( ! inObject.pay_date.equals(obj.pay_date)){
       return false;
     }

     if ( ! inObject.pay_sum.equals(obj.pay_sum)){
       return false;
     }

     if (inObject.is_ksoe != obj.is_ksoe){
       return false;
     }

     if (inObject.status != obj.status){
       return false;
     }

     if (inObject.id_ren != obj.id_ren){
       return false;
     }

     if (inObject.renName != obj.renName){
       return false;
     }

     if (inObject.id_pack_status != obj.id_pack_status){
       return false;
     }

     if (inObject.statusName != obj.statusName){
       return false;
     }

     if (inObject.id_waiting_status != obj.id_waiting_status){
       return false;
     }

     if (inObject.waitingStatus != obj.waitingStatus){
       return false;
     }
     if (inObject.subsystemRef.code != obj.subsystemRef.code){
        return false;
     }
     if (inObject.dfPackRef.code != obj.dfPackRef.code){
        return false;
     }
      return true;
   }

   public int add(CNActsPack anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(CNActsPack anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO CNACTSPACK (CODE,NAME,ADDRESS,ADDRESS_JUR,PURPOSE,BUSINESS_TYPE,BLANK_NUMBER,ACT_NUMBER,ACT_DATE,ACT_SUM,PAY_DATE,PAY_SUM,IS_KSOE,STATUS,ID_REN,RENNAME,ID_PACK_STATUS,STATUSNAME,ID_WAITING_STATUS,WAITINGSTATUS,SUBSYSTEMREFCODE,DFPACKREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.name);
      statement.setString(3,anObject.address);
      statement.setString(4,anObject.address_jur);
      statement.setString(5,anObject.purpose);
      statement.setString(6,anObject.business_type);
      statement.setString(7,anObject.blank_number);
      statement.setString(8,anObject.act_number);
      if (anObject.act_date == null)
        statement.setDate(9,null);
      else
        statement.setDate(9,new java.sql.Date(anObject.act_date.getTime()));
      if (anObject.act_sum != null)
        anObject.act_sum = anObject.act_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.act_sum);
      if (anObject.pay_date == null)
        statement.setDate(11,null);
      else
        statement.setDate(11,new java.sql.Date(anObject.pay_date.getTime()));
      if (anObject.pay_sum != null)
        anObject.pay_sum = anObject.pay_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.pay_sum);
      if (anObject.is_ksoe != Integer.MIN_VALUE )
         statement.setInt(13,anObject.is_ksoe);
      else
         statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.status != Integer.MIN_VALUE )
         statement.setInt(14,anObject.status);
      else
         statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.id_ren != Integer.MIN_VALUE )
         statement.setInt(15,anObject.id_ren);
      else
         statement.setNull(15,java.sql.Types.INTEGER);
      statement.setString(16,anObject.renName);
      if (anObject.id_pack_status != Integer.MIN_VALUE )
         statement.setInt(17,anObject.id_pack_status);
      else
         statement.setNull(17,java.sql.Types.INTEGER);
      statement.setString(18,anObject.statusName);
      if (anObject.id_waiting_status != Integer.MIN_VALUE )
         statement.setInt(19,anObject.id_waiting_status);
      else
         statement.setNull(19,java.sql.Types.INTEGER);
      statement.setString(20,anObject.waitingStatus);
      if (anObject.subsystemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).exists(anObject.subsystemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNActsPack.subsystemRef.code%} = {%"+anObject.subsystemRef.code+"%}");
        statement.setInt(21,anObject.subsystemRef.code);
      }
      else
        statement.setNull(21,java.sql.Types.INTEGER);
      if (anObject.dfPackRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.docflow.dataminer.generated.DFPackDAOGen(connection,getUserProfile()).exists(anObject.dfPackRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNActsPack.dfPackRef.code%} = {%"+anObject.dfPackRef.code+"%}");
        statement.setInt(22,anObject.dfPackRef.code);
      }
      else
        statement.setNull(22,java.sql.Types.INTEGER);

      statement.execute();
      return anObject.code;
     }
    catch(SQLException e)
     {
           _sequenceTable.clear();
           new SystemException(e.getMessage(), e);
      return Integer.MIN_VALUE;
     }
        catch(Exception e)
     {
      _sequenceTable.clear();
      throw new PersistenceException("Error in method {%CNActsPackDAOGen.add%}",e);
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

   public void save(CNActsPack anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(CNActsPack anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("NAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ADDRESS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ADDRESS_JUR") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PURPOSE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("BUSINESS_TYPE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("BLANK_NUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ACT_NUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ACT_DATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ACT_SUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PAY_DATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PAY_SUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("IS_KSOE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("STATUS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ID_REN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RENNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ID_PACK_STATUS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("STATUSNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ID_WAITING_STATUS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("WAITINGSTATUS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUBSYSTEMREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DFPACKREF") == 0)
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
        "UPDATE CNACTSPACK SET  NAME = ? , ADDRESS = ? , ADDRESS_JUR = ? , PURPOSE = ? , BUSINESS_TYPE = ? , BLANK_NUMBER = ? , ACT_NUMBER = ? , ACT_DATE = ? , ACT_SUM = ? , PAY_DATE = ? , PAY_SUM = ? , IS_KSOE = ? , STATUS = ? , ID_REN = ? , RENNAME = ? , ID_PACK_STATUS = ? , STATUSNAME = ? , ID_WAITING_STATUS = ? , WAITINGSTATUS = ? , SUBSYSTEMREFCODE = ? , DFPACKREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE CNACTSPACK SET ";
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
      statement.setString(1,anObject.name);
      statement.setString(2,anObject.address);
      statement.setString(3,anObject.address_jur);
      statement.setString(4,anObject.purpose);
      statement.setString(5,anObject.business_type);
      statement.setString(6,anObject.blank_number);
      statement.setString(7,anObject.act_number);
      if (anObject.act_date == null)
        statement.setDate(8,null);
      else
        statement.setDate(8,new java.sql.Date(anObject.act_date.getTime()));
      if (anObject.act_sum != null)
        anObject.act_sum = anObject.act_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.act_sum);

      if (anObject.pay_date == null)
        statement.setDate(10,null);
      else
        statement.setDate(10,new java.sql.Date(anObject.pay_date.getTime()));
      if (anObject.pay_sum != null)
        anObject.pay_sum = anObject.pay_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.pay_sum);

      if (anObject.is_ksoe != Integer.MIN_VALUE )
         statement.setInt(12,anObject.is_ksoe);
      else
         statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.status != Integer.MIN_VALUE )
         statement.setInt(13,anObject.status);
      else
         statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.id_ren != Integer.MIN_VALUE )
         statement.setInt(14,anObject.id_ren);
      else
         statement.setNull(14,java.sql.Types.INTEGER);
      statement.setString(15,anObject.renName);
      if (anObject.id_pack_status != Integer.MIN_VALUE )
         statement.setInt(16,anObject.id_pack_status);
      else
         statement.setNull(16,java.sql.Types.INTEGER);
      statement.setString(17,anObject.statusName);
      if (anObject.id_waiting_status != Integer.MIN_VALUE )
         statement.setInt(18,anObject.id_waiting_status);
      else
         statement.setNull(18,java.sql.Types.INTEGER);
      statement.setString(19,anObject.waitingStatus);
      if (anObject.subsystemRef.code != Integer.MIN_VALUE)
        statement.setInt(20,anObject.subsystemRef.code);
      else
        statement.setNull(20,java.sql.Types.INTEGER);
      if (anObject.dfPackRef.code != Integer.MIN_VALUE)
        statement.setInt(21,anObject.dfPackRef.code);
      else
        statement.setNull(21,java.sql.Types.INTEGER);
          statement.setInt(22,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("NAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.name);
                continue;
             }
            if("ADDRESS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.address);
                continue;
             }
            if("ADDRESS_JUR".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.address_jur);
                continue;
             }
            if("PURPOSE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.purpose);
                continue;
             }
            if("BUSINESS_TYPE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.business_type);
                continue;
             }
            if("BLANK_NUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.blank_number);
                continue;
             }
            if("ACT_NUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.act_number);
                continue;
             }
            if("ACT_DATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.act_date == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.act_date.getTime()));
                continue;
             }
            if("ACT_SUM".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.act_sum != null)
                    anObject.act_sum = anObject.act_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.act_sum);
                continue;
             }
            if("PAY_DATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.pay_date == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.pay_date.getTime()));
                continue;
             }
            if("PAY_SUM".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.pay_sum != null)
                    anObject.pay_sum = anObject.pay_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.pay_sum);
                continue;
             }
            if("IS_KSOE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.is_ksoe);
                continue;
             }
            if("STATUS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.status);
                continue;
             }
            if("ID_REN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.id_ren);
                continue;
             }
            if("RENNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.renName);
                continue;
             }
            if("ID_PACK_STATUS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.id_pack_status);
                continue;
             }
            if("STATUSNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.statusName);
                continue;
             }
            if("ID_WAITING_STATUS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.id_waiting_status);
                continue;
             }
            if("WAITINGSTATUS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.waitingStatus);
                continue;
             }
            if("SUBSYSTEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.subsystemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.subsystemRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("DFPACKREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.dfPackRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.dfPackRef.code);
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
        new SystemException(e.getMessage(), e);
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

   } // end of save(CNActsPack anObject,String[] anAttributes)


 public CNActsPackShort getShortObject(int anObjectCode) throws PersistenceException
  {
   CNActsPack filterObject = new CNActsPack();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (CNActsPackShort)list.get(0);
   return null;
  }

  public CNActsPackShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public CNActsPackShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public CNActsPackShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public CNActsPackShortList getFilteredList(CNActsPack filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public CNActsPackShortList getScrollableFilteredList(CNActsPack aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public CNActsPackShortList getScrollableFilteredList(CNActsPack aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public CNActsPackShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public CNActsPackShortList getScrollableFilteredList(CNActsPackFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public CNActsPackShortList getScrollableFilteredList(CNActsPackFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public CNActsPackShortList getScrollableFilteredList(CNActsPack aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public CNActsPackShortList getScrollableFilteredList(CNActsPack aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    CNActsPackShortList result = new CNActsPackShortList();
    CNActsPackShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNACTSPACK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "CNACTSPACK.CODE"+
     ",CNACTSPACK.NAME"+
     ",CNACTSPACK.ADDRESS"+
     ",CNACTSPACK.ADDRESS_JUR"+
     ",CNACTSPACK.PURPOSE"+
     ",CNACTSPACK.BUSINESS_TYPE"+
     ",CNACTSPACK.BLANK_NUMBER"+
     ",CNACTSPACK.ACT_NUMBER"+
     ",CNACTSPACK.ACT_DATE"+
     ",CNACTSPACK.ACT_SUM"+
     ",CNACTSPACK.PAY_DATE"+
     ",CNACTSPACK.PAY_SUM"+
     ",CNACTSPACK.IS_KSOE"+
     ",CNACTSPACK.STATUS"+
     ",CNACTSPACK.ID_REN"+
     ",CNACTSPACK.RENNAME"+
     ",CNACTSPACK.ID_PACK_STATUS"+
     ",CNACTSPACK.STATUSNAME"+
     ",CNACTSPACK.ID_WAITING_STATUS"+
     ",CNACTSPACK.WAITINGSTATUS"+

      ", CNSUBSYSTEMTYPE.CODE " +
      ", CNSUBSYSTEMTYPE.NAME " +
     ", CNACTSPACK.DFPACKREFCODE" +
     " FROM CNACTSPACK " +
     ", CNSUBSYSTEMTYPE " +
     //" WHERE "
    "";
     whereStr = " CNSUBSYSTEMTYPE.CODE = CNACTSPACK.SUBSYSTEMREFCODE" ; //+
        //selectStr = selectStr + " ${s} CNACTSPACK.CODE IN ( SELECT CNACTSPACK.CODE FROM CNACTSPACK ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNACTSPACK.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNACTSPACK.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.address != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNACTSPACK.ADDRESS) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNACTSPACK.ADDRESS) LIKE UPPER(?)";
         }
         if (aFilterObject.address_jur != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.address_jur.indexOf('*',0) < 0 && aFilterObject.address_jur.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNACTSPACK.ADDRESS_JUR) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNACTSPACK.ADDRESS_JUR) LIKE UPPER(?)";
         }
         if (aFilterObject.purpose != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.purpose.indexOf('*',0) < 0 && aFilterObject.purpose.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNACTSPACK.PURPOSE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNACTSPACK.PURPOSE) LIKE UPPER(?)";
         }
         if (aFilterObject.business_type != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.business_type.indexOf('*',0) < 0 && aFilterObject.business_type.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNACTSPACK.BUSINESS_TYPE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNACTSPACK.BUSINESS_TYPE) LIKE UPPER(?)";
         }
         if (aFilterObject.blank_number != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.blank_number.indexOf('*',0) < 0 && aFilterObject.blank_number.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNACTSPACK.BLANK_NUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNACTSPACK.BLANK_NUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.act_number != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.act_number.indexOf('*',0) < 0 && aFilterObject.act_number.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNACTSPACK.ACT_NUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNACTSPACK.ACT_NUMBER) LIKE UPPER(?)";
         }
        if(aFilterObject.act_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.ACT_DATE = ?";
        }
        if(aFilterObject.act_sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.ACT_SUM = ?";
        }
        if(aFilterObject.pay_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.PAY_DATE = ?";
        }
        if(aFilterObject.pay_sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.PAY_SUM = ?";
        }
        if(aFilterObject.is_ksoe != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.IS_KSOE = ?";
        }
        if(aFilterObject.status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.STATUS = ?";
        }
        if(aFilterObject.id_ren != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.ID_REN = ?";
        }
         if (aFilterObject.renName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.renName.indexOf('*',0) < 0 && aFilterObject.renName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNACTSPACK.RENNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNACTSPACK.RENNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.id_pack_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.ID_PACK_STATUS = ?";
        }
         if (aFilterObject.statusName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.statusName.indexOf('*',0) < 0 && aFilterObject.statusName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNACTSPACK.STATUSNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNACTSPACK.STATUSNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.id_waiting_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.ID_WAITING_STATUS = ?";
        }
         if (aFilterObject.waitingStatus != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.waitingStatus.indexOf('*',0) < 0 && aFilterObject.waitingStatus.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNACTSPACK.WAITINGSTATUS) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNACTSPACK.WAITINGSTATUS) LIKE UPPER(?)";
         }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNACTSPACK.SUBSYSTEMREFCODE = ? ";
        }
        if(aFilterObject.dfPackRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNACTSPACK.DFPACKREFCODE = ? ";
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

           if(aFilterObject.name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.address != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.address);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.address_jur != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.address_jur);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.purpose != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.purpose);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.business_type != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.business_type);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.blank_number != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.blank_number);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.act_number != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.act_number);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.act_date != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.act_date.getTime()));
        }
        if(aFilterObject.act_sum != null){
            number++;
            aFilterObject.act_sum = aFilterObject.act_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.act_sum);
        }
        if(aFilterObject.pay_date != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.pay_date.getTime()));
        }
        if(aFilterObject.pay_sum != null){
            number++;
            aFilterObject.pay_sum = aFilterObject.pay_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pay_sum);
        }
         if(aFilterObject.is_ksoe != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_ksoe);
         }
         if(aFilterObject.status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.status);
         }
         if(aFilterObject.id_ren != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_ren);
         }

           if(aFilterObject.renName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.renName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.id_pack_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_pack_status);
         }

           if(aFilterObject.statusName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.statusName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.id_waiting_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_waiting_status);
         }

           if(aFilterObject.waitingStatus != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.waitingStatus);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
       }
       if(aFilterObject.dfPackRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.dfPackRef.code);
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

        anObject = new CNActsPackShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.address = set.getString(3);
        anObject.address_jur = set.getString(4);
        anObject.purpose = set.getString(5);
        anObject.business_type = set.getString(6);
        anObject.blank_number = set.getString(7);
        anObject.act_number = set.getString(8);
        anObject.act_date = set.getDate(9);
        anObject.act_sum = set.getBigDecimal(10);
        if(anObject.act_sum != null)
            anObject.act_sum = anObject.act_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pay_date = set.getDate(11);
        anObject.pay_sum = set.getBigDecimal(12);
        if(anObject.pay_sum != null)
            anObject.pay_sum = anObject.pay_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.is_ksoe = set.getInt(13);
        if ( set.wasNull() )
            anObject.is_ksoe = Integer.MIN_VALUE;
        anObject.status = set.getInt(14);
        if ( set.wasNull() )
            anObject.status = Integer.MIN_VALUE;
        anObject.id_ren = set.getInt(15);
        if ( set.wasNull() )
            anObject.id_ren = Integer.MIN_VALUE;
        anObject.renName = set.getString(16);
        anObject.id_pack_status = set.getInt(17);
        if ( set.wasNull() )
            anObject.id_pack_status = Integer.MIN_VALUE;
        anObject.statusName = set.getString(18);
        anObject.id_waiting_status = set.getInt(19);
        if ( set.wasNull() )
            anObject.id_waiting_status = Integer.MIN_VALUE;
        anObject.waitingStatus = set.getString(20);

        anObject.subsystemRefCode = set.getInt(21);
        if(set.wasNull())
        anObject.subsystemRefCode = Integer.MIN_VALUE;
        anObject.subsystemRefName = set.getString(22);
        anObject.dfPackRefCode = set.getInt(23);
        if(set.wasNull())
        anObject.dfPackRefCode = Integer.MIN_VALUE;

         result.list.add(anObject);
       }

      result.setTotalCount(i);
      return result;
     }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      new SystemException(e.getMessage(), e);
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

  public int[] getFilteredCodeArrayOLD(CNActsPack aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT CNACTSPACK.CODE FROM CNACTSPACK";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNACTSPACK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.NAME = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.NAME LIKE ?";
         }
         if (aFilterObject.address != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.ADDRESS = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.ADDRESS LIKE ?";
         }
         if (aFilterObject.address_jur != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.address_jur.indexOf('*',0) < 0 && aFilterObject.address_jur.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.ADDRESS_JUR = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.ADDRESS_JUR LIKE ?";
         }
         if (aFilterObject.purpose != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.purpose.indexOf('*',0) < 0 && aFilterObject.purpose.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.PURPOSE = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.PURPOSE LIKE ?";
         }
         if (aFilterObject.business_type != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.business_type.indexOf('*',0) < 0 && aFilterObject.business_type.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.BUSINESS_TYPE = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.BUSINESS_TYPE LIKE ?";
         }
         if (aFilterObject.blank_number != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.blank_number.indexOf('*',0) < 0 && aFilterObject.blank_number.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.BLANK_NUMBER = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.BLANK_NUMBER LIKE ?";
         }
         if (aFilterObject.act_number != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.act_number.indexOf('*',0) < 0 && aFilterObject.act_number.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.ACT_NUMBER = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.ACT_NUMBER LIKE ?";
         }
        if(aFilterObject.act_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.ACT_DATE = ?";
        }
        if(aFilterObject.act_sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.ACT_SUM = ?";
        }
        if(aFilterObject.pay_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.PAY_DATE = ?";
        }
        if(aFilterObject.pay_sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.PAY_SUM = ?";
        }
        if(aFilterObject.is_ksoe != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.IS_KSOE = ?";
        }
        if(aFilterObject.status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.STATUS = ?";
        }
        if(aFilterObject.id_ren != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.ID_REN = ?";
        }
         if (aFilterObject.renName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.renName.indexOf('*',0) < 0 && aFilterObject.renName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.RENNAME = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.RENNAME LIKE ?";
         }
        if(aFilterObject.id_pack_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.ID_PACK_STATUS = ?";
        }
         if (aFilterObject.statusName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.statusName.indexOf('*',0) < 0 && aFilterObject.statusName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.STATUSNAME = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.STATUSNAME LIKE ?";
         }
        if(aFilterObject.id_waiting_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.ID_WAITING_STATUS = ?";
        }
         if (aFilterObject.waitingStatus != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.waitingStatus.indexOf('*',0) < 0 && aFilterObject.waitingStatus.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.WAITINGSTATUS = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.WAITINGSTATUS LIKE ?";
         }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNACTSPACK.SUBSYSTEMREFCODE = ? ";
        }
        if(aFilterObject.dfPackRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNACTSPACK.DFPACKREFCODE = ? ";
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
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.NAME = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.NAME LIKE ?";

           if(aFilterObject.name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.address != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.ADDRESS = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.ADDRESS LIKE ?";

           if(aFilterObject.address != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.address);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.address_jur != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.address_jur.indexOf('*',0) < 0 && aFilterObject.address_jur.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.ADDRESS_JUR = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.ADDRESS_JUR LIKE ?";

           if(aFilterObject.address_jur != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.address_jur);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.purpose != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.purpose.indexOf('*',0) < 0 && aFilterObject.purpose.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.PURPOSE = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.PURPOSE LIKE ?";

           if(aFilterObject.purpose != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.purpose);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.business_type != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.business_type.indexOf('*',0) < 0 && aFilterObject.business_type.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.BUSINESS_TYPE = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.BUSINESS_TYPE LIKE ?";

           if(aFilterObject.business_type != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.business_type);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.blank_number != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.blank_number.indexOf('*',0) < 0 && aFilterObject.blank_number.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.BLANK_NUMBER = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.BLANK_NUMBER LIKE ?";

           if(aFilterObject.blank_number != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.blank_number);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.act_number != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.act_number.indexOf('*',0) < 0 && aFilterObject.act_number.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.ACT_NUMBER = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.ACT_NUMBER LIKE ?";

           if(aFilterObject.act_number != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.act_number);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.act_date != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.act_date.getTime()));
        }
        if(aFilterObject.act_sum != null){
            number++;
            aFilterObject.act_sum = aFilterObject.act_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.act_sum);
        }
        if(aFilterObject.pay_date != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.pay_date.getTime()));
        }
        if(aFilterObject.pay_sum != null){
            number++;
            aFilterObject.pay_sum = aFilterObject.pay_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pay_sum);
        }
         if(aFilterObject.is_ksoe != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_ksoe);
         }
         if(aFilterObject.status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.status);
         }
         if(aFilterObject.id_ren != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_ren);
         }
         if (aFilterObject.renName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.renName.indexOf('*',0) < 0 && aFilterObject.renName.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.RENNAME = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.RENNAME LIKE ?";

           if(aFilterObject.renName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.renName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.id_pack_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_pack_status);
         }
         if (aFilterObject.statusName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.statusName.indexOf('*',0) < 0 && aFilterObject.statusName.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.STATUSNAME = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.STATUSNAME LIKE ?";

           if(aFilterObject.statusName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.statusName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.id_waiting_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_waiting_status);
         }
         if (aFilterObject.waitingStatus != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.waitingStatus.indexOf('*',0) < 0 && aFilterObject.waitingStatus.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.WAITINGSTATUS = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.WAITINGSTATUS LIKE ?";

           if(aFilterObject.waitingStatus != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.waitingStatus);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
       }
       if(aFilterObject.dfPackRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.dfPackRef.code);
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
      new SystemException(e.getMessage(), e);
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

  public int[] getFilteredCodeArray(CNActsPackFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(CNActsPack aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT CNACTSPACK.CODE FROM CNACTSPACK";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNACTSPACK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.NAME = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.NAME LIKE ?";
         }
         if (aFilterObject.address != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.ADDRESS = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.ADDRESS LIKE ?";
         }
         if (aFilterObject.address_jur != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.address_jur.indexOf('*',0) < 0 && aFilterObject.address_jur.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.ADDRESS_JUR = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.ADDRESS_JUR LIKE ?";
         }
         if (aFilterObject.purpose != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.purpose.indexOf('*',0) < 0 && aFilterObject.purpose.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.PURPOSE = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.PURPOSE LIKE ?";
         }
         if (aFilterObject.business_type != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.business_type.indexOf('*',0) < 0 && aFilterObject.business_type.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.BUSINESS_TYPE = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.BUSINESS_TYPE LIKE ?";
         }
         if (aFilterObject.blank_number != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.blank_number.indexOf('*',0) < 0 && aFilterObject.blank_number.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.BLANK_NUMBER = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.BLANK_NUMBER LIKE ?";
         }
         if (aFilterObject.act_number != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.act_number.indexOf('*',0) < 0 && aFilterObject.act_number.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.ACT_NUMBER = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.ACT_NUMBER LIKE ?";
         }
        if(aFilterObject.act_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.ACT_DATE = ?";
        }
        if(aFilterObject.act_sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.ACT_SUM = ?";
        }
        if(aFilterObject.pay_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.PAY_DATE = ?";
        }
        if(aFilterObject.pay_sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.PAY_SUM = ?";
        }
        if(aFilterObject.is_ksoe != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.IS_KSOE = ?";
        }
        if(aFilterObject.status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.STATUS = ?";
        }
        if(aFilterObject.id_ren != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.ID_REN = ?";
        }
         if (aFilterObject.renName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.renName.indexOf('*',0) < 0 && aFilterObject.renName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.RENNAME = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.RENNAME LIKE ?";
         }
        if(aFilterObject.id_pack_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.ID_PACK_STATUS = ?";
        }
         if (aFilterObject.statusName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.statusName.indexOf('*',0) < 0 && aFilterObject.statusName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.STATUSNAME = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.STATUSNAME LIKE ?";
         }
        if(aFilterObject.id_waiting_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSPACK.ID_WAITING_STATUS = ?";
        }
         if (aFilterObject.waitingStatus != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.waitingStatus.indexOf('*',0) < 0 && aFilterObject.waitingStatus.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSPACK.WAITINGSTATUS = ?";
             else
                 whereStr = whereStr + "  CNACTSPACK.WAITINGSTATUS LIKE ?";
         }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNACTSPACK.SUBSYSTEMREFCODE = ? ";
        }
        if(aFilterObject.dfPackRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNACTSPACK.DFPACKREFCODE = ? ";
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
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.NAME = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.NAME LIKE ?";

           if(aFilterObject.name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.address != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.ADDRESS = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.ADDRESS LIKE ?";

           if(aFilterObject.address != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.address);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.address_jur != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.address_jur.indexOf('*',0) < 0 && aFilterObject.address_jur.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.ADDRESS_JUR = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.ADDRESS_JUR LIKE ?";

           if(aFilterObject.address_jur != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.address_jur);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.purpose != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.purpose.indexOf('*',0) < 0 && aFilterObject.purpose.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.PURPOSE = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.PURPOSE LIKE ?";

           if(aFilterObject.purpose != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.purpose);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.business_type != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.business_type.indexOf('*',0) < 0 && aFilterObject.business_type.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.BUSINESS_TYPE = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.BUSINESS_TYPE LIKE ?";

           if(aFilterObject.business_type != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.business_type);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.blank_number != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.blank_number.indexOf('*',0) < 0 && aFilterObject.blank_number.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.BLANK_NUMBER = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.BLANK_NUMBER LIKE ?";

           if(aFilterObject.blank_number != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.blank_number);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.act_number != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.act_number.indexOf('*',0) < 0 && aFilterObject.act_number.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.ACT_NUMBER = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.ACT_NUMBER LIKE ?";

           if(aFilterObject.act_number != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.act_number);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.act_date != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.act_date.getTime()));
        }
        if(aFilterObject.act_sum != null){
            number++;
            aFilterObject.act_sum = aFilterObject.act_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.act_sum);
        }
        if(aFilterObject.pay_date != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.pay_date.getTime()));
        }
        if(aFilterObject.pay_sum != null){
            number++;
            aFilterObject.pay_sum = aFilterObject.pay_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pay_sum);
        }
         if(aFilterObject.is_ksoe != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_ksoe);
         }
         if(aFilterObject.status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.status);
         }
         if(aFilterObject.id_ren != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_ren);
         }
         if (aFilterObject.renName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.renName.indexOf('*',0) < 0 && aFilterObject.renName.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.RENNAME = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.RENNAME LIKE ?";

           if(aFilterObject.renName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.renName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.id_pack_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_pack_status);
         }
         if (aFilterObject.statusName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.statusName.indexOf('*',0) < 0 && aFilterObject.statusName.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.STATUSNAME = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.STATUSNAME LIKE ?";

           if(aFilterObject.statusName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.statusName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.id_waiting_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_waiting_status);
         }
         if (aFilterObject.waitingStatus != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.waitingStatus.indexOf('*',0) < 0 && aFilterObject.waitingStatus.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSPACK.WAITINGSTATUS = ?";
             else
                 whereStr = whereStr + " CNACTSPACK.WAITINGSTATUS LIKE ?";

           if(aFilterObject.waitingStatus != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.waitingStatus);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
       }
       if(aFilterObject.dfPackRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.dfPackRef.code);
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
      new SystemException(e.getMessage(), e);
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


   public CNActsPack getObject(int uid) throws PersistenceException
   {
    CNActsPack result = new CNActsPack();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(CNActsPack anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  CNACTSPACK.CODE, CNACTSPACK.NAME, CNACTSPACK.ADDRESS, CNACTSPACK.ADDRESS_JUR, CNACTSPACK.PURPOSE, CNACTSPACK.BUSINESS_TYPE, CNACTSPACK.BLANK_NUMBER, CNACTSPACK.ACT_NUMBER, CNACTSPACK.ACT_DATE, CNACTSPACK.ACT_SUM, CNACTSPACK.PAY_DATE, CNACTSPACK.PAY_SUM, CNACTSPACK.IS_KSOE, CNACTSPACK.STATUS, CNACTSPACK.ID_REN, CNACTSPACK.RENNAME, CNACTSPACK.ID_PACK_STATUS, CNACTSPACK.STATUSNAME, CNACTSPACK.ID_WAITING_STATUS, CNACTSPACK.WAITINGSTATUS, CNACTSPACK.SUBSYSTEMREFCODE, CNACTSPACK.DFPACKREFCODE "
    +" FROM CNACTSPACK WHERE CNACTSPACK.CODE = ?";

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
        anObject.name = set.getString(2);
        anObject.address = set.getString(3);
        anObject.address_jur = set.getString(4);
        anObject.purpose = set.getString(5);
        anObject.business_type = set.getString(6);
        anObject.blank_number = set.getString(7);
        anObject.act_number = set.getString(8);
        anObject.act_date = set.getDate(9);
        anObject.act_sum = set.getBigDecimal(10);
        if(anObject.act_sum != null)
            anObject.act_sum = anObject.act_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pay_date = set.getDate(11);
        anObject.pay_sum = set.getBigDecimal(12);
        if(anObject.pay_sum != null)
            anObject.pay_sum = anObject.pay_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.is_ksoe = set.getInt(13);
        if ( set.wasNull() )
           anObject.is_ksoe = Integer.MIN_VALUE;
        anObject.status = set.getInt(14);
        if ( set.wasNull() )
           anObject.status = Integer.MIN_VALUE;
        anObject.id_ren = set.getInt(15);
        if ( set.wasNull() )
           anObject.id_ren = Integer.MIN_VALUE;
        anObject.renName = set.getString(16);
        anObject.id_pack_status = set.getInt(17);
        if ( set.wasNull() )
           anObject.id_pack_status = Integer.MIN_VALUE;
        anObject.statusName = set.getString(18);
        anObject.id_waiting_status = set.getInt(19);
        if ( set.wasNull() )
           anObject.id_waiting_status = Integer.MIN_VALUE;
        anObject.waitingStatus = set.getString(20);
        anObject.subsystemRef.code = set.getInt(21);
        if ( set.wasNull() )
            anObject.subsystemRef.code = Integer.MIN_VALUE;
        anObject.dfPackRef.code = set.getInt(22);
        if ( set.wasNull() )
            anObject.dfPackRef.code = Integer.MIN_VALUE;
        if(anObject.subsystemRef.code != Integer.MIN_VALUE)
        {
           anObject.setSubsystemRef(
        new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).getRef(anObject.subsystemRef.code));
    }
        if(anObject.dfPackRef.code != Integer.MIN_VALUE)
        {
           anObject.setDfPackRef(
        new com.ksoe.docflow.dataminer.generated.DFPackDAOGen(connection,getUserProfile()).getRef(anObject.dfPackRef.code));
    }
      }
    }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      new SystemException(e.getMessage(), e);
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


  public com.ksoe.energynet.valueobject.references.CNActsPackRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.CNActsPackRef ref = new com.ksoe.energynet.valueobject.references.CNActsPackRef();
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

    selectStr = "DELETE FROM  CNACTSPACK WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    CNActsPack object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%CNActsPack.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(CNActsPack.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%CNActsPack.remove%} access denied");

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
      new SystemException(e.getMessage(), e);
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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(CNActsPack.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%CNActsPack.getObject%} access denied");

    selectStr =

    "SELECT  CNACTSPACK.CODE FROM  CNACTSPACK WHERE  CNACTSPACK.CODE = ?";
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
      new SystemException(e.getMessage(), e);
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
    _checkConditionToken(condition,"code","CNACTSPACK.CODE");
    _checkConditionToken(condition,"name","CNACTSPACK.NAME");
    _checkConditionToken(condition,"address","CNACTSPACK.ADDRESS");
    _checkConditionToken(condition,"address_jur","CNACTSPACK.ADDRESS_JUR");
    _checkConditionToken(condition,"purpose","CNACTSPACK.PURPOSE");
    _checkConditionToken(condition,"business_type","CNACTSPACK.BUSINESS_TYPE");
    _checkConditionToken(condition,"blank_number","CNACTSPACK.BLANK_NUMBER");
    _checkConditionToken(condition,"act_number","CNACTSPACK.ACT_NUMBER");
    _checkConditionToken(condition,"act_date","CNACTSPACK.ACT_DATE");
    _checkConditionToken(condition,"act_sum","CNACTSPACK.ACT_SUM");
    _checkConditionToken(condition,"pay_date","CNACTSPACK.PAY_DATE");
    _checkConditionToken(condition,"pay_sum","CNACTSPACK.PAY_SUM");
    _checkConditionToken(condition,"is_ksoe","CNACTSPACK.IS_KSOE");
    _checkConditionToken(condition,"status","CNACTSPACK.STATUS");
    _checkConditionToken(condition,"id_ren","CNACTSPACK.ID_REN");
    _checkConditionToken(condition,"renname","CNACTSPACK.RENNAME");
    _checkConditionToken(condition,"id_pack_status","CNACTSPACK.ID_PACK_STATUS");
    _checkConditionToken(condition,"statusname","CNACTSPACK.STATUSNAME");
    _checkConditionToken(condition,"id_waiting_status","CNACTSPACK.ID_WAITING_STATUS");
    _checkConditionToken(condition,"waitingstatus","CNACTSPACK.WAITINGSTATUS");
      // relationship conditions
    _checkConditionToken(condition,"subsystemref","SUBSYSTEMREFCODE");
    _checkConditionToken(condition,"subsystemref.code","SUBSYSTEMREFCODE");
    _checkConditionToken(condition,"dfpackref","DFPACKREFCODE");
    _checkConditionToken(condition,"dfpackref.code","DFPACKREFCODE");
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

   private void _collectAutoIncrementFields(CNActsPack anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("CNACTSPACK", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("CNACTSPACK", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("CNACTSPACK", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: CNACTSPACK");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of CNActsPackDAO
