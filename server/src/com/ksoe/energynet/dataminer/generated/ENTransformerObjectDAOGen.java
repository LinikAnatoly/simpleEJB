
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
import com.ksoe.energynet.valueobject.ENTransformerObject;
import com.ksoe.energynet.valueobject.brief.ENTransformerObjectShort;
import com.ksoe.energynet.valueobject.filter.ENTransformerObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENTransformerObjectShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENTransformerObject;
 *
 */

public class ENTransformerObjectDAOGen extends GenericDataMiner {

  public ENTransformerObjectDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransformerObjectDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTransformerObject inObject) throws PersistenceException
   {
      ENTransformerObject obj = new ENTransformerObject();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.name != obj.name){
       return false;
     }

     if (inObject.buildNumber != obj.buildNumber){
       return false;
     }

     if (inObject.buildYear != obj.buildYear){
       return false;
     }

     if ( ! inObject.voltageHi.equals(obj.voltageHi)){
       return false;
     }

     if ( ! inObject.voltageLow.equals(obj.voltageLow)){
       return false;
     }

     if ( ! inObject.nomPower.equals(obj.nomPower)){
       return false;
     }

     if (inObject.buhName != obj.buhName){
       return false;
     }

     if (inObject.invNumber != obj.invNumber){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }
     if (inObject.transformerType.code != obj.transformerType.code){
        return false;
     }
     if (inObject.element.code != obj.element.code){
        return false;
     }
      return true;
   }

   public int add(ENTransformerObject anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTransformerObject anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();
    if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTRANSFORMEROBJECT (CODE,NAME,BUILDNUMBER,BUILDYEAR,VOLTAGEHI,VOLTAGELOW,NOMPOWER,BUHNAME,INVNUMBER,COMMENTGEN,DOMAIN_INFO,MODIFY_TIME,TRANSFORMERTYPECODE,ELEMENTCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.name);
      statement.setString(3,anObject.buildNumber);
      if (anObject.buildYear != Integer.MIN_VALUE )
         statement.setInt(4,anObject.buildYear);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.voltageHi != null)
        anObject.voltageHi = anObject.voltageHi.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.voltageHi);
      if (anObject.voltageLow != null)
        anObject.voltageLow = anObject.voltageLow.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.voltageLow);
      if (anObject.nomPower != null)
        anObject.nomPower = anObject.nomPower.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.nomPower);
      statement.setString(8,anObject.buhName);
      statement.setString(9,anObject.invNumber);
      statement.setString(10,anObject.commentGen);
      statement.setString(11,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(12,null);
      else
        statement.setBigDecimal(12,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.transformerType.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.netobjects.dataminer.generated.ENTransformerTypeDAOGen(connection,getUserProfile()).exists(anObject.transformerType.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransformerObject.transformerType.code%} = {%"+anObject.transformerType.code+"%}");
        statement.setInt(13,anObject.transformerType.code);
      }
      else
        statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.element.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.element.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransformerObject.element.code%} = {%"+anObject.element.code+"%}");
        statement.setInt(14,anObject.element.code);
      }
      else
        statement.setNull(14,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTransformerObjectDAOGen.add%}",e);
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

   public void save(ENTransformerObject anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTransformerObject anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENTransformerObject oldObject = new ENTransformerObject();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENTransformerObject.modify_time_Field + "," + ENTransformerObject.domain_info_Field+" FROM  ENTRANSFORMEROBJECT WHERE CODE = ?";

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
        oldObject.domain_info = set.getString(2);
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
    if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());
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
          if(fieldNameStr.compareTo("BUILDNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("BUILDYEAR") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("VOLTAGEHI") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("VOLTAGELOW") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NOMPOWER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("BUHNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("INVNUMBER") == 0)
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
          if(fieldNameStr.compareTo("DOMAIN_INFO") == 0)
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
          if(fieldNameStr.compareTo("TRANSFORMERTYPE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ELEMENT") == 0)
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
        "UPDATE ENTRANSFORMEROBJECT SET  NAME = ? , BUILDNUMBER = ? , BUILDYEAR = ? , VOLTAGEHI = ? , VOLTAGELOW = ? , NOMPOWER = ? , BUHNAME = ? , INVNUMBER = ? , COMMENTGEN = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , TRANSFORMERTYPECODE = ? , ELEMENTCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRANSFORMEROBJECT SET ";
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
      statement.setString(2,anObject.buildNumber);
      if (anObject.buildYear != Integer.MIN_VALUE )
         statement.setInt(3,anObject.buildYear);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.voltageHi != null)
        anObject.voltageHi = anObject.voltageHi.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.voltageHi);
      if (anObject.voltageLow != null)
        anObject.voltageLow = anObject.voltageLow.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.voltageLow);
      if (anObject.nomPower != null)
        anObject.nomPower = anObject.nomPower.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.nomPower);
      statement.setString(7,anObject.buhName);
      statement.setString(8,anObject.invNumber);
      statement.setString(9,anObject.commentGen);
      statement.setString(10,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(11,null);
      else
        statement.setBigDecimal(11,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.transformerType.code != Integer.MIN_VALUE)
        statement.setInt(12,anObject.transformerType.code);
      else
        statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.element.code != Integer.MIN_VALUE)
        statement.setInt(13,anObject.element.code);
      else
        statement.setNull(13,java.sql.Types.INTEGER);
          statement.setInt(14,anObject.code);
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
            if("BUILDNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.buildNumber);
                continue;
             }
            if("BUILDYEAR".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.buildYear);
                continue;
             }
            if("VOLTAGEHI".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.voltageHi != null)
                    anObject.voltageHi = anObject.voltageHi.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.voltageHi);
                continue;
             }
            if("VOLTAGELOW".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.voltageLow != null)
                    anObject.voltageLow = anObject.voltageLow.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.voltageLow);
                continue;
             }
            if("NOMPOWER".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.nomPower != null)
                    anObject.nomPower = anObject.nomPower.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.nomPower);
                continue;
             }
            if("BUHNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.buhName);
                continue;
             }
            if("INVNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.invNumber);
                continue;
             }
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
                continue;
             }
            if("DOMAIN_INFO".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.domain_info);
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
            if("TRANSFORMERTYPE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transformerType.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transformerType.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("ELEMENT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.element.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.element.code);
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

   } // end of save(ENTransformerObject anObject,String[] anAttributes)


 public ENTransformerObjectShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTransformerObject filterObject = new ENTransformerObject();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTransformerObjectShort)list.get(0);
   return null;
  }

  public ENTransformerObjectShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTransformerObjectShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTransformerObjectShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTransformerObjectShortList getFilteredList(ENTransformerObject filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTransformerObjectShortList getScrollableFilteredList(ENTransformerObject aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTransformerObjectShortList getScrollableFilteredList(ENTransformerObject aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTransformerObjectShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTransformerObjectShortList getScrollableFilteredList(ENTransformerObjectFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTransformerObjectShortList getScrollableFilteredList(ENTransformerObjectFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTransformerObjectShortList getScrollableFilteredList(ENTransformerObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTransformerObjectShortList getScrollableFilteredList(ENTransformerObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTransformerObjectShortList result = new ENTransformerObjectShortList();
    ENTransformerObjectShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSFORMEROBJECT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRANSFORMEROBJECT.CODE"+
     ",ENTRANSFORMEROBJECT.NAME"+
     ",ENTRANSFORMEROBJECT.BUILDNUMBER"+
     ",ENTRANSFORMEROBJECT.BUILDYEAR"+
     ",ENTRANSFORMEROBJECT.VOLTAGEHI"+
     ",ENTRANSFORMEROBJECT.VOLTAGELOW"+
     ",ENTRANSFORMEROBJECT.NOMPOWER"+
     ",ENTRANSFORMEROBJECT.BUHNAME"+
     ",ENTRANSFORMEROBJECT.INVNUMBER"+

     ", ENTRANSFORMEROBJECT.TRANSFORMERTYPECODE" +
      ", ENELEMENT.CODE " +
     " FROM ENTRANSFORMEROBJECT " +
     ", ENELEMENT " +
     //" WHERE "
    "";
     whereStr = " ENELEMENT.CODE = ENTRANSFORMEROBJECT.ELEMENTCODE" ; //+
        //selectStr = selectStr + " ${s} ENTRANSFORMEROBJECT.CODE IN ( SELECT ENTRANSFORMEROBJECT.CODE FROM ENTRANSFORMEROBJECT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRANSFORMEROBJECT.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRANSFORMEROBJECT.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.buildNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.buildNumber.indexOf('*',0) < 0 && aFilterObject.buildNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRANSFORMEROBJECT.BUILDNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRANSFORMEROBJECT.BUILDNUMBER) LIKE UPPER(?)";
         }
        if(aFilterObject.buildYear != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.BUILDYEAR = ?";
        }
        if(aFilterObject.voltageHi != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.VOLTAGEHI = ?";
        }
        if(aFilterObject.voltageLow != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.VOLTAGELOW = ?";
        }
        if(aFilterObject.nomPower != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.NOMPOWER = ?";
        }
         if (aFilterObject.buhName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.buhName.indexOf('*',0) < 0 && aFilterObject.buhName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRANSFORMEROBJECT.BUHNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRANSFORMEROBJECT.BUHNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.invNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRANSFORMEROBJECT.INVNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRANSFORMEROBJECT.INVNUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRANSFORMEROBJECT.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRANSFORMEROBJECT.COMMENTGEN) LIKE UPPER(?)";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRANSFORMEROBJECT.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRANSFORMEROBJECT.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.MODIFY_TIME = ?";
        }
        if(aFilterObject.transformerType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSFORMEROBJECT.TRANSFORMERTYPECODE = ? ";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSFORMEROBJECT.ELEMENTCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTransformerObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTransformerObject.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENTRANSFORMEROBJECT",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENTRANSFORMEROBJECT.DOMAIN_INFO IS NOT NULL";
    //else
    if (whereStr.length() == 0)
        whereStr = domainWhereStr;
    else
        whereStr = " "+whereStr + " AND " +domainWhereStr;
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

           if(aFilterObject.buildNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.buildNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.buildYear != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.buildYear);
         }
        if(aFilterObject.voltageHi != null){
            number++;
            aFilterObject.voltageHi = aFilterObject.voltageHi.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.voltageHi);
        }
        if(aFilterObject.voltageLow != null){
            number++;
            aFilterObject.voltageLow = aFilterObject.voltageLow.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.voltageLow);
        }
        if(aFilterObject.nomPower != null){
            number++;
            aFilterObject.nomPower = aFilterObject.nomPower.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.nomPower);
        }

           if(aFilterObject.buhName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.buhName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.invNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.invNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
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

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.transformerType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transformerType.code);
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.element.code);
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

        anObject = new ENTransformerObjectShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.buildNumber = set.getString(3);
        anObject.buildYear = set.getInt(4);
        if ( set.wasNull() )
            anObject.buildYear = Integer.MIN_VALUE;
        anObject.voltageHi = set.getBigDecimal(5);
        if(anObject.voltageHi != null)
            anObject.voltageHi = anObject.voltageHi.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.voltageLow = set.getBigDecimal(6);
        if(anObject.voltageLow != null)
            anObject.voltageLow = anObject.voltageLow.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.nomPower = set.getBigDecimal(7);
        if(anObject.nomPower != null)
            anObject.nomPower = anObject.nomPower.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.buhName = set.getString(8);
        anObject.invNumber = set.getString(9);

        anObject.transformerTypeCode = set.getInt(10);
        if(set.wasNull())
        anObject.transformerTypeCode = Integer.MIN_VALUE;
        anObject.elementCode = set.getInt(11);
        if(set.wasNull())
        anObject.elementCode = Integer.MIN_VALUE;

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

  public int[] getFilteredCodeArrayOLD(ENTransformerObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSFORMEROBJECT.CODE FROM ENTRANSFORMEROBJECT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSFORMEROBJECT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTransformerObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTransformerObject.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENTRANSFORMEROBJECT",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENTRANSFORMEROBJECT.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.NAME = ?";
             else
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.NAME LIKE ?";
         }
         if (aFilterObject.buildNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.buildNumber.indexOf('*',0) < 0 && aFilterObject.buildNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.BUILDNUMBER = ?";
             else
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.BUILDNUMBER LIKE ?";
         }
        if(aFilterObject.buildYear != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.BUILDYEAR = ?";
        }
        if(aFilterObject.voltageHi != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.VOLTAGEHI = ?";
        }
        if(aFilterObject.voltageLow != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.VOLTAGELOW = ?";
        }
        if(aFilterObject.nomPower != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.NOMPOWER = ?";
        }
         if (aFilterObject.buhName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.buhName.indexOf('*',0) < 0 && aFilterObject.buhName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.BUHNAME = ?";
             else
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.BUHNAME LIKE ?";
         }
         if (aFilterObject.invNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.INVNUMBER = ?";
             else
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.INVNUMBER LIKE ?";
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.MODIFY_TIME = ?";
        }
        if(aFilterObject.transformerType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSFORMEROBJECT.TRANSFORMERTYPECODE = ? ";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSFORMEROBJECT.ELEMENTCODE = ? ";
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
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.NAME = ?";
             else
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.NAME LIKE ?";

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
         if (aFilterObject.buildNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.buildNumber.indexOf('*',0) < 0 && aFilterObject.buildNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.BUILDNUMBER = ?";
             else
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.BUILDNUMBER LIKE ?";

           if(aFilterObject.buildNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.buildNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.buildYear != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.buildYear);
         }
        if(aFilterObject.voltageHi != null){
            number++;
            aFilterObject.voltageHi = aFilterObject.voltageHi.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.voltageHi);
        }
        if(aFilterObject.voltageLow != null){
            number++;
            aFilterObject.voltageLow = aFilterObject.voltageLow.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.voltageLow);
        }
        if(aFilterObject.nomPower != null){
            number++;
            aFilterObject.nomPower = aFilterObject.nomPower.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.nomPower);
        }
         if (aFilterObject.buhName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.buhName.indexOf('*',0) < 0 && aFilterObject.buhName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.BUHNAME = ?";
             else
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.BUHNAME LIKE ?";

           if(aFilterObject.buhName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.buhName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.invNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.INVNUMBER = ?";
             else
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.INVNUMBER LIKE ?";

           if(aFilterObject.invNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.invNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.COMMENTGEN LIKE ?";

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
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.DOMAIN_INFO LIKE ?";

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.transformerType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transformerType.code);
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.element.code);
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

  public int[] getFilteredCodeArray(ENTransformerObjectFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTransformerObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSFORMEROBJECT.CODE FROM ENTRANSFORMEROBJECT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSFORMEROBJECT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTransformerObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTransformerObject.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENTRANSFORMEROBJECT",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENTRANSFORMEROBJECT.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.NAME = ?";
             else
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.NAME LIKE ?";
         }
         if (aFilterObject.buildNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.buildNumber.indexOf('*',0) < 0 && aFilterObject.buildNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.BUILDNUMBER = ?";
             else
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.BUILDNUMBER LIKE ?";
         }
        if(aFilterObject.buildYear != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.BUILDYEAR = ?";
        }
        if(aFilterObject.voltageHi != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.VOLTAGEHI = ?";
        }
        if(aFilterObject.voltageLow != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.VOLTAGELOW = ?";
        }
        if(aFilterObject.nomPower != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.NOMPOWER = ?";
        }
         if (aFilterObject.buhName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.buhName.indexOf('*',0) < 0 && aFilterObject.buhName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.BUHNAME = ?";
             else
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.BUHNAME LIKE ?";
         }
         if (aFilterObject.invNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.INVNUMBER = ?";
             else
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.INVNUMBER LIKE ?";
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENTRANSFORMEROBJECT.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSFORMEROBJECT.MODIFY_TIME = ?";
        }
        if(aFilterObject.transformerType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSFORMEROBJECT.TRANSFORMERTYPECODE = ? ";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSFORMEROBJECT.ELEMENTCODE = ? ";
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
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.NAME = ?";
             else
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.NAME LIKE ?";

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
         if (aFilterObject.buildNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.buildNumber.indexOf('*',0) < 0 && aFilterObject.buildNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.BUILDNUMBER = ?";
             else
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.BUILDNUMBER LIKE ?";

           if(aFilterObject.buildNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.buildNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.buildYear != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.buildYear);
         }
        if(aFilterObject.voltageHi != null){
            number++;
            aFilterObject.voltageHi = aFilterObject.voltageHi.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.voltageHi);
        }
        if(aFilterObject.voltageLow != null){
            number++;
            aFilterObject.voltageLow = aFilterObject.voltageLow.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.voltageLow);
        }
        if(aFilterObject.nomPower != null){
            number++;
            aFilterObject.nomPower = aFilterObject.nomPower.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.nomPower);
        }
         if (aFilterObject.buhName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.buhName.indexOf('*',0) < 0 && aFilterObject.buhName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.BUHNAME = ?";
             else
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.BUHNAME LIKE ?";

           if(aFilterObject.buhName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.buhName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.invNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.INVNUMBER = ?";
             else
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.INVNUMBER LIKE ?";

           if(aFilterObject.invNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.invNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.COMMENTGEN LIKE ?";

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
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENTRANSFORMEROBJECT.DOMAIN_INFO LIKE ?";

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.transformerType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transformerType.code);
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.element.code);
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


   public ENTransformerObject getObject(int uid) throws PersistenceException
   {
    ENTransformerObject result = new ENTransformerObject();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTransformerObject anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTransformerObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTransformerObject.getObject%} access denied");



    selectStr =
    "SELECT  ENTRANSFORMEROBJECT.CODE, ENTRANSFORMEROBJECT.NAME, ENTRANSFORMEROBJECT.BUILDNUMBER, ENTRANSFORMEROBJECT.BUILDYEAR, ENTRANSFORMEROBJECT.VOLTAGEHI, ENTRANSFORMEROBJECT.VOLTAGELOW, ENTRANSFORMEROBJECT.NOMPOWER, ENTRANSFORMEROBJECT.BUHNAME, ENTRANSFORMEROBJECT.INVNUMBER, ENTRANSFORMEROBJECT.COMMENTGEN, ENTRANSFORMEROBJECT.DOMAIN_INFO, ENTRANSFORMEROBJECT.MODIFY_TIME, ENTRANSFORMEROBJECT.TRANSFORMERTYPECODE, ENTRANSFORMEROBJECT.ELEMENTCODE "
    +" FROM ENTRANSFORMEROBJECT WHERE ENTRANSFORMEROBJECT.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENTRANSFORMEROBJECT",segregationInfo,getUserProfile().getDomainInfo());
    if(segregationWhereStr.length() > 0)
     selectStr = selectStr + " AND " + segregationWhereStr;

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
        anObject.buildNumber = set.getString(3);
        anObject.buildYear = set.getInt(4);
        if ( set.wasNull() )
           anObject.buildYear = Integer.MIN_VALUE;
        anObject.voltageHi = set.getBigDecimal(5);
        if(anObject.voltageHi != null)
            anObject.voltageHi = anObject.voltageHi.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.voltageLow = set.getBigDecimal(6);
        if(anObject.voltageLow != null)
            anObject.voltageLow = anObject.voltageLow.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.nomPower = set.getBigDecimal(7);
        if(anObject.nomPower != null)
            anObject.nomPower = anObject.nomPower.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.buhName = set.getString(8);
        anObject.invNumber = set.getString(9);
        anObject.commentGen = set.getString(10);
        anObject.domain_info = set.getString(11);
        anObject.modify_time = set.getLong(12);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.transformerType.code = set.getInt(13);
        if ( set.wasNull() )
            anObject.transformerType.code = Integer.MIN_VALUE;
        anObject.element.code = set.getInt(14);
        if ( set.wasNull() )
            anObject.element.code = Integer.MIN_VALUE;
        if(anObject.transformerType.code != Integer.MIN_VALUE)
        {
           anObject.setTransformerType(
        new com.ksoe.netobjects.dataminer.generated.ENTransformerTypeDAOGen(connection,getUserProfile()).getObject(anObject.transformerType.code));
    }
        if(anObject.element.code != Integer.MIN_VALUE)
        {
           anObject.setElement(
        new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getObject(anObject.element.code));
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


  public com.ksoe.energynet.valueobject.references.ENTransformerObjectRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTransformerObjectRef ref = new com.ksoe.energynet.valueobject.references.ENTransformerObjectRef();
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

    selectStr = "DELETE FROM  ENTRANSFORMEROBJECT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTransformerObject object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTransformerObject.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTransformerObject.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTransformerObject.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTransformerObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTransformerObject.getObject%} access denied");

    selectStr =

    "SELECT  ENTRANSFORMEROBJECT.CODE FROM  ENTRANSFORMEROBJECT WHERE  ENTRANSFORMEROBJECT.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENTRANSFORMEROBJECT",segregationInfo,getUserProfile().getDomainInfo());
    if(segregationWhereStr.length() > 0)
     selectStr = selectStr +
      " AND " + segregationWhereStr;
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
    _checkConditionToken(condition,"code","ENTRANSFORMEROBJECT.CODE");
    _checkConditionToken(condition,"name","ENTRANSFORMEROBJECT.NAME");
    _checkConditionToken(condition,"buildnumber","ENTRANSFORMEROBJECT.BUILDNUMBER");
    _checkConditionToken(condition,"buildyear","ENTRANSFORMEROBJECT.BUILDYEAR");
    _checkConditionToken(condition,"voltagehi","ENTRANSFORMEROBJECT.VOLTAGEHI");
    _checkConditionToken(condition,"voltagelow","ENTRANSFORMEROBJECT.VOLTAGELOW");
    _checkConditionToken(condition,"nompower","ENTRANSFORMEROBJECT.NOMPOWER");
    _checkConditionToken(condition,"buhname","ENTRANSFORMEROBJECT.BUHNAME");
    _checkConditionToken(condition,"invnumber","ENTRANSFORMEROBJECT.INVNUMBER");
    _checkConditionToken(condition,"commentgen","ENTRANSFORMEROBJECT.COMMENTGEN");
    _checkConditionToken(condition,"domain_info","ENTRANSFORMEROBJECT.DOMAIN_INFO");
    _checkConditionToken(condition,"modify_time","ENTRANSFORMEROBJECT.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"transformertype","TRANSFORMERTYPECODE");
    _checkConditionToken(condition,"transformertype.code","TRANSFORMERTYPECODE");
    _checkConditionToken(condition,"element","ELEMENTCODE");
    _checkConditionToken(condition,"element.code","ELEMENTCODE");
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

    private void _collectAutoIncrementFields(ENTransformerObject anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENTRANSFORMEROBJECT", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENTRANSFORMEROBJECT", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENTRANSFORMEROBJECT", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENTRANSFORMEROBJECT");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENTransformerObjectDAO
