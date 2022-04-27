
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
import com.ksoe.energynet.valueobject.ENBuilderObject;
import com.ksoe.energynet.valueobject.brief.ENBuilderObjectShort;
import com.ksoe.energynet.valueobject.filter.ENBuilderObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENBuilderObjectShortList;
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
 * DAO Object for ENBuilderObject;
 *
 */

public class ENBuilderObjectDAOGen extends GenericDataMiner {

  public ENBuilderObjectDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENBuilderObjectDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENBuilderObject inObject) throws PersistenceException
   {
      ENBuilderObject obj = new ENBuilderObject();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.invNumber != obj.invNumber){
       return false;
     }

     if (inObject.name != obj.name){
       return false;
     }

     if (inObject.buhName != obj.buhName){
       return false;
     }

     if (inObject.yearBuild != obj.yearBuild){
       return false;
     }

     if (inObject.yearWorkingStart != obj.yearWorkingStart){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }

     if ( ! inObject.dateGen.equals(obj.dateGen)){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }
     if (inObject.objectType.code != obj.objectType.code){
        return false;
     }
     if (inObject.element.code != obj.element.code){
        return false;
     }
      return true;
   }

   public int add(ENBuilderObject anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENBuilderObject anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();
    if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENBUILDEROBJECT (CODE,INVNUMBER,NAME,BUHNAME,YEARBUILD,YEARWORKINGSTART,COMMENTGEN,DATEGEN,USERGEN,DOMAIN_INFO,MODIFY_TIME,OBJECTTYPECODE,ELEMENTCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.invNumber);
      statement.setString(3,anObject.name);
      statement.setString(4,anObject.buhName);
      if (anObject.yearBuild != Integer.MIN_VALUE )
         statement.setInt(5,anObject.yearBuild);
      else
         statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.yearWorkingStart != Integer.MIN_VALUE )
         statement.setInt(6,anObject.yearWorkingStart);
      else
         statement.setNull(6,java.sql.Types.INTEGER);
      statement.setString(7,anObject.commentGen);
      if (anObject.dateGen == null)
        statement.setDate(8,null);
      else
        statement.setDate(8,new java.sql.Date(anObject.dateGen.getTime()));
      statement.setString(9,anObject.userGen);
      statement.setString(10,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(11,null);
      else
        statement.setBigDecimal(11,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.objectType.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENBuilderObjectTypeDAOGen(connection,getUserProfile()).exists(anObject.objectType.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENBuilderObject.objectType.code%} = {%"+anObject.objectType.code+"%}");
        statement.setInt(12,anObject.objectType.code);
      }
      else
        statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.element.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.element.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENBuilderObject.element.code%} = {%"+anObject.element.code+"%}");
        statement.setInt(13,anObject.element.code);
      }
      else
        statement.setNull(13,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENBuilderObjectDAOGen.add%}",e);
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

   public void save(ENBuilderObject anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENBuilderObject anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENBuilderObject oldObject = new ENBuilderObject();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENBuilderObject.modify_time_Field + "," + ENBuilderObject.domain_info_Field+" FROM  ENBUILDEROBJECT WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("INVNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NAME") == 0)
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
          if(fieldNameStr.compareTo("YEARBUILD") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("YEARWORKINGSTART") == 0)
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
          if(fieldNameStr.compareTo("DATEGEN") == 0)
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
          if(fieldNameStr.compareTo("OBJECTTYPE") == 0)
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
        "UPDATE ENBUILDEROBJECT SET  INVNUMBER = ? , NAME = ? , BUHNAME = ? , YEARBUILD = ? , YEARWORKINGSTART = ? , COMMENTGEN = ? , DATEGEN = ? , USERGEN = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , OBJECTTYPECODE = ? , ELEMENTCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENBUILDEROBJECT SET ";
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
      statement.setString(1,anObject.invNumber);
      statement.setString(2,anObject.name);
      statement.setString(3,anObject.buhName);
      if (anObject.yearBuild != Integer.MIN_VALUE )
         statement.setInt(4,anObject.yearBuild);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.yearWorkingStart != Integer.MIN_VALUE )
         statement.setInt(5,anObject.yearWorkingStart);
      else
         statement.setNull(5,java.sql.Types.INTEGER);
      statement.setString(6,anObject.commentGen);
      if (anObject.dateGen == null)
        statement.setDate(7,null);
      else
        statement.setDate(7,new java.sql.Date(anObject.dateGen.getTime()));
      statement.setString(8,anObject.userGen);
      statement.setString(9,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(10,null);
      else
        statement.setBigDecimal(10,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.objectType.code != Integer.MIN_VALUE)
        statement.setInt(11,anObject.objectType.code);
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.element.code != Integer.MIN_VALUE)
        statement.setInt(12,anObject.element.code);
      else
        statement.setNull(12,java.sql.Types.INTEGER);
          statement.setInt(13,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("INVNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.invNumber);
                continue;
             }
            if("NAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.name);
                continue;
             }
            if("BUHNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.buhName);
                continue;
             }
            if("YEARBUILD".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.yearBuild);
                continue;
             }
            if("YEARWORKINGSTART".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.yearWorkingStart);
                continue;
             }
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
                continue;
             }
            if("DATEGEN".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateGen == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.dateGen.getTime()));
                continue;
             }
            if("USERGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.userGen);
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
            if("OBJECTTYPE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.objectType.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.objectType.code);
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

   } // end of save(ENBuilderObject anObject,String[] anAttributes)


 public ENBuilderObjectShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENBuilderObject filterObject = new ENBuilderObject();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENBuilderObjectShort)list.get(0);
   return null;
  }

  public ENBuilderObjectShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENBuilderObjectShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENBuilderObjectShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENBuilderObjectShortList getFilteredList(ENBuilderObject filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENBuilderObjectShortList getScrollableFilteredList(ENBuilderObject aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENBuilderObjectShortList getScrollableFilteredList(ENBuilderObject aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENBuilderObjectShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENBuilderObjectShortList getScrollableFilteredList(ENBuilderObjectFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENBuilderObjectShortList getScrollableFilteredList(ENBuilderObjectFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENBuilderObjectShortList getScrollableFilteredList(ENBuilderObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENBuilderObjectShortList getScrollableFilteredList(ENBuilderObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENBuilderObjectShortList result = new ENBuilderObjectShortList();
    ENBuilderObjectShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENBUILDEROBJECT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENBUILDEROBJECT.CODE"+
     ",ENBUILDEROBJECT.INVNUMBER"+
     ",ENBUILDEROBJECT.NAME"+
     ",ENBUILDEROBJECT.BUHNAME"+
     ",ENBUILDEROBJECT.YEARBUILD"+
     ",ENBUILDEROBJECT.YEARWORKINGSTART"+
     ",ENBUILDEROBJECT.USERGEN"+

      ", ENBUILDEROBJECTTYPE.CODE " +
      ", ENBUILDEROBJECTTYPE.NAME " +
      ", ENELEMENT.CODE " +
     " FROM ENBUILDEROBJECT " +
     ", ENBUILDEROBJECTTYPE " +
     ", ENELEMENT " +
     //" WHERE "
    "";
     whereStr = " ENBUILDEROBJECTTYPE.CODE = ENBUILDEROBJECT.OBJECTTYPECODE" ; //+
      whereStr = whereStr +" AND ENELEMENT.CODE = ENBUILDEROBJECT.ELEMENTCODE" ; //+
        //selectStr = selectStr + " ${s} ENBUILDEROBJECT.CODE IN ( SELECT ENBUILDEROBJECT.CODE FROM ENBUILDEROBJECT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBUILDEROBJECT.CODE = ?";
        }
         if (aFilterObject.invNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENBUILDEROBJECT.INVNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENBUILDEROBJECT.INVNUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENBUILDEROBJECT.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENBUILDEROBJECT.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.buhName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.buhName.indexOf('*',0) < 0 && aFilterObject.buhName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENBUILDEROBJECT.BUHNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENBUILDEROBJECT.BUHNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.yearBuild != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBUILDEROBJECT.YEARBUILD = ?";
        }
        if(aFilterObject.yearWorkingStart != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBUILDEROBJECT.YEARWORKINGSTART = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENBUILDEROBJECT.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENBUILDEROBJECT.COMMENTGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBUILDEROBJECT.DATEGEN = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENBUILDEROBJECT.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENBUILDEROBJECT.USERGEN) LIKE UPPER(?)";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENBUILDEROBJECT.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENBUILDEROBJECT.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBUILDEROBJECT.MODIFY_TIME = ?";
        }
        if(aFilterObject.objectType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENBUILDEROBJECT.OBJECTTYPECODE = ? ";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENBUILDEROBJECT.ELEMENTCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENBuilderObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENBuilderObject.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENBUILDEROBJECT",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENBUILDEROBJECT.DOMAIN_INFO IS NOT NULL";
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
         if(aFilterObject.yearBuild != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearBuild);
         }
         if(aFilterObject.yearWorkingStart != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearWorkingStart);
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
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
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
       if(aFilterObject.objectType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.objectType.code);
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

        anObject = new ENBuilderObjectShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.invNumber = set.getString(2);
        anObject.name = set.getString(3);
        anObject.buhName = set.getString(4);
        anObject.yearBuild = set.getInt(5);
        if ( set.wasNull() )
            anObject.yearBuild = Integer.MIN_VALUE;
        anObject.yearWorkingStart = set.getInt(6);
        if ( set.wasNull() )
            anObject.yearWorkingStart = Integer.MIN_VALUE;
        anObject.userGen = set.getString(7);

        anObject.objectTypeCode = set.getInt(8);
        if(set.wasNull())
        anObject.objectTypeCode = Integer.MIN_VALUE;
        anObject.objectTypeName = set.getString(9);
        anObject.elementCode = set.getInt(10);
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

  public int[] getFilteredCodeArrayOLD(ENBuilderObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENBUILDEROBJECT.CODE FROM ENBUILDEROBJECT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENBUILDEROBJECT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENBuilderObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENBuilderObject.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENBUILDEROBJECT",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENBUILDEROBJECT.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBUILDEROBJECT.CODE = ?";
        }
         if (aFilterObject.invNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBUILDEROBJECT.INVNUMBER = ?";
             else
                 whereStr = whereStr + "  ENBUILDEROBJECT.INVNUMBER LIKE ?";
         }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBUILDEROBJECT.NAME = ?";
             else
                 whereStr = whereStr + "  ENBUILDEROBJECT.NAME LIKE ?";
         }
         if (aFilterObject.buhName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.buhName.indexOf('*',0) < 0 && aFilterObject.buhName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBUILDEROBJECT.BUHNAME = ?";
             else
                 whereStr = whereStr + "  ENBUILDEROBJECT.BUHNAME LIKE ?";
         }
        if(aFilterObject.yearBuild != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBUILDEROBJECT.YEARBUILD = ?";
        }
        if(aFilterObject.yearWorkingStart != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBUILDEROBJECT.YEARWORKINGSTART = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBUILDEROBJECT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENBUILDEROBJECT.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBUILDEROBJECT.DATEGEN = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBUILDEROBJECT.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENBUILDEROBJECT.USERGEN LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBUILDEROBJECT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENBUILDEROBJECT.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBUILDEROBJECT.MODIFY_TIME = ?";
        }
        if(aFilterObject.objectType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENBUILDEROBJECT.OBJECTTYPECODE = ? ";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENBUILDEROBJECT.ELEMENTCODE = ? ";
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
         if (aFilterObject.invNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENBUILDEROBJECT.INVNUMBER = ?";
             else
                 whereStr = whereStr + " ENBUILDEROBJECT.INVNUMBER LIKE ?";

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
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENBUILDEROBJECT.NAME = ?";
             else
                 whereStr = whereStr + " ENBUILDEROBJECT.NAME LIKE ?";

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
         if (aFilterObject.buhName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.buhName.indexOf('*',0) < 0 && aFilterObject.buhName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENBUILDEROBJECT.BUHNAME = ?";
             else
                 whereStr = whereStr + " ENBUILDEROBJECT.BUHNAME LIKE ?";

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
         if(aFilterObject.yearBuild != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearBuild);
         }
         if(aFilterObject.yearWorkingStart != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearWorkingStart);
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENBUILDEROBJECT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENBUILDEROBJECT.COMMENTGEN LIKE ?";

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
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENBUILDEROBJECT.USERGEN = ?";
             else
                 whereStr = whereStr + " ENBUILDEROBJECT.USERGEN LIKE ?";

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
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENBUILDEROBJECT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENBUILDEROBJECT.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.objectType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.objectType.code);
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

  public int[] getFilteredCodeArray(ENBuilderObjectFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENBuilderObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENBUILDEROBJECT.CODE FROM ENBUILDEROBJECT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENBUILDEROBJECT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENBuilderObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENBuilderObject.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENBUILDEROBJECT",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENBUILDEROBJECT.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBUILDEROBJECT.CODE = ?";
        }
         if (aFilterObject.invNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBUILDEROBJECT.INVNUMBER = ?";
             else
                 whereStr = whereStr + "  ENBUILDEROBJECT.INVNUMBER LIKE ?";
         }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBUILDEROBJECT.NAME = ?";
             else
                 whereStr = whereStr + "  ENBUILDEROBJECT.NAME LIKE ?";
         }
         if (aFilterObject.buhName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.buhName.indexOf('*',0) < 0 && aFilterObject.buhName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBUILDEROBJECT.BUHNAME = ?";
             else
                 whereStr = whereStr + "  ENBUILDEROBJECT.BUHNAME LIKE ?";
         }
        if(aFilterObject.yearBuild != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBUILDEROBJECT.YEARBUILD = ?";
        }
        if(aFilterObject.yearWorkingStart != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBUILDEROBJECT.YEARWORKINGSTART = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBUILDEROBJECT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENBUILDEROBJECT.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBUILDEROBJECT.DATEGEN = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBUILDEROBJECT.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENBUILDEROBJECT.USERGEN LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBUILDEROBJECT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENBUILDEROBJECT.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBUILDEROBJECT.MODIFY_TIME = ?";
        }
        if(aFilterObject.objectType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENBUILDEROBJECT.OBJECTTYPECODE = ? ";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENBUILDEROBJECT.ELEMENTCODE = ? ";
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
         if (aFilterObject.invNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENBUILDEROBJECT.INVNUMBER = ?";
             else
                 whereStr = whereStr + " ENBUILDEROBJECT.INVNUMBER LIKE ?";

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
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENBUILDEROBJECT.NAME = ?";
             else
                 whereStr = whereStr + " ENBUILDEROBJECT.NAME LIKE ?";

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
         if (aFilterObject.buhName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.buhName.indexOf('*',0) < 0 && aFilterObject.buhName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENBUILDEROBJECT.BUHNAME = ?";
             else
                 whereStr = whereStr + " ENBUILDEROBJECT.BUHNAME LIKE ?";

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
         if(aFilterObject.yearBuild != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearBuild);
         }
         if(aFilterObject.yearWorkingStart != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearWorkingStart);
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENBUILDEROBJECT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENBUILDEROBJECT.COMMENTGEN LIKE ?";

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
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENBUILDEROBJECT.USERGEN = ?";
             else
                 whereStr = whereStr + " ENBUILDEROBJECT.USERGEN LIKE ?";

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
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENBUILDEROBJECT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENBUILDEROBJECT.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.objectType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.objectType.code);
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


   public ENBuilderObject getObject(int uid) throws PersistenceException
   {
    ENBuilderObject result = new ENBuilderObject();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENBuilderObject anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENBuilderObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENBuilderObject.getObject%} access denied");



    selectStr =
    "SELECT  ENBUILDEROBJECT.CODE, ENBUILDEROBJECT.INVNUMBER, ENBUILDEROBJECT.NAME, ENBUILDEROBJECT.BUHNAME, ENBUILDEROBJECT.YEARBUILD, ENBUILDEROBJECT.YEARWORKINGSTART, ENBUILDEROBJECT.COMMENTGEN, ENBUILDEROBJECT.DATEGEN, ENBUILDEROBJECT.USERGEN, ENBUILDEROBJECT.DOMAIN_INFO, ENBUILDEROBJECT.MODIFY_TIME, ENBUILDEROBJECT.OBJECTTYPECODE, ENBUILDEROBJECT.ELEMENTCODE "
    +" FROM ENBUILDEROBJECT WHERE ENBUILDEROBJECT.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENBUILDEROBJECT",segregationInfo,getUserProfile().getDomainInfo());
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
        anObject.invNumber = set.getString(2);
        anObject.name = set.getString(3);
        anObject.buhName = set.getString(4);
        anObject.yearBuild = set.getInt(5);
        if ( set.wasNull() )
           anObject.yearBuild = Integer.MIN_VALUE;
        anObject.yearWorkingStart = set.getInt(6);
        if ( set.wasNull() )
           anObject.yearWorkingStart = Integer.MIN_VALUE;
        anObject.commentGen = set.getString(7);
        anObject.dateGen = set.getDate(8);
        anObject.userGen = set.getString(9);
        anObject.domain_info = set.getString(10);
        anObject.modify_time = set.getLong(11);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.objectType.code = set.getInt(12);
        if ( set.wasNull() )
            anObject.objectType.code = Integer.MIN_VALUE;
        anObject.element.code = set.getInt(13);
        if ( set.wasNull() )
            anObject.element.code = Integer.MIN_VALUE;
        if(anObject.objectType.code != Integer.MIN_VALUE)
        {
           anObject.setObjectType(
        new com.ksoe.energynet.dataminer.generated.ENBuilderObjectTypeDAOGen(connection,getUserProfile()).getObject(anObject.objectType.code));
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


  public com.ksoe.energynet.valueobject.references.ENBuilderObjectRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENBuilderObjectRef ref = new com.ksoe.energynet.valueobject.references.ENBuilderObjectRef();
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

    selectStr = "DELETE FROM  ENBUILDEROBJECT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENBuilderObject object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENBuilderObject.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENBuilderObject.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENBuilderObject.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENBuilderObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENBuilderObject.getObject%} access denied");

    selectStr =

    "SELECT  ENBUILDEROBJECT.CODE FROM  ENBUILDEROBJECT WHERE  ENBUILDEROBJECT.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENBUILDEROBJECT",segregationInfo,getUserProfile().getDomainInfo());
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
    _checkConditionToken(condition,"code","ENBUILDEROBJECT.CODE");
    _checkConditionToken(condition,"invnumber","ENBUILDEROBJECT.INVNUMBER");
    _checkConditionToken(condition,"name","ENBUILDEROBJECT.NAME");
    _checkConditionToken(condition,"buhname","ENBUILDEROBJECT.BUHNAME");
    _checkConditionToken(condition,"yearbuild","ENBUILDEROBJECT.YEARBUILD");
    _checkConditionToken(condition,"yearworkingstart","ENBUILDEROBJECT.YEARWORKINGSTART");
    _checkConditionToken(condition,"commentgen","ENBUILDEROBJECT.COMMENTGEN");
    _checkConditionToken(condition,"dategen","ENBUILDEROBJECT.DATEGEN");
    _checkConditionToken(condition,"usergen","ENBUILDEROBJECT.USERGEN");
    _checkConditionToken(condition,"domain_info","ENBUILDEROBJECT.DOMAIN_INFO");
    _checkConditionToken(condition,"modify_time","ENBUILDEROBJECT.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"objecttype","OBJECTTYPECODE");
    _checkConditionToken(condition,"objecttype.code","OBJECTTYPECODE");
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

    private void _collectAutoIncrementFields(ENBuilderObject anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENBUILDEROBJECT", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENBUILDEROBJECT", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENBUILDEROBJECT", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENBUILDEROBJECT");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENBuilderObjectDAO
