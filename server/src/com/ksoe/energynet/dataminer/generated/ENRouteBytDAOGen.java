
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
import com.ksoe.energynet.valueobject.ENRouteByt;
import com.ksoe.energynet.valueobject.brief.ENRouteBytShort;
import com.ksoe.energynet.valueobject.filter.ENRouteBytFilter;
import com.ksoe.energynet.valueobject.lists.ENRouteBytShortList;
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
 * DAO Object for ENRouteByt;
 *
 */

public class ENRouteBytDAOGen extends GenericDataMiner {

  public ENRouteBytDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENRouteBytDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENRouteByt inObject) throws PersistenceException
   {
      ENRouteByt obj = new ENRouteByt();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.name != obj.name){
       return false;
     }

     if (inObject.numbergen != obj.numbergen){
       return false;
     }

     if (inObject.routeCode != obj.routeCode){
       return false;
     }
     if (inObject.element.code != obj.element.code){
        return false;
     }
      return true;
   }

   public int add(ENRouteByt anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENRouteByt anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();
    if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENROUTEBYT (CODE,NAME,NUMBERGEN,ROUTECODE,DOMAIN_INFO,MODIFY_TIME,ELEMENTCODE) VALUES (?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.name);
      statement.setString(3,anObject.numbergen);
      if (anObject.routeCode != Integer.MIN_VALUE )
         statement.setInt(4,anObject.routeCode);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      statement.setString(5,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(6,null);
      else
        statement.setBigDecimal(6,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.element.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.element.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENRouteByt.element.code%} = {%"+anObject.element.code+"%}");
        statement.setInt(7,anObject.element.code);
      }
      else
        statement.setNull(7,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENRouteBytDAOGen.add%}",e);
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

   public void save(ENRouteByt anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENRouteByt anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENRouteByt oldObject = new ENRouteByt();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENRouteByt.modify_time_Field + "," + ENRouteByt.domain_info_Field+" FROM  ENROUTEBYT WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("NUMBERGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ROUTECODE") == 0)
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
        "UPDATE ENROUTEBYT SET  NAME = ? , NUMBERGEN = ? , ROUTECODE = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , ELEMENTCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENROUTEBYT SET ";
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
      statement.setString(2,anObject.numbergen);
      if (anObject.routeCode != Integer.MIN_VALUE )
         statement.setInt(3,anObject.routeCode);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      statement.setString(4,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(5,null);
      else
        statement.setBigDecimal(5,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.element.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.element.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);
          statement.setInt(7,anObject.code);
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
            if("NUMBERGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.numbergen);
                continue;
             }
            if("ROUTECODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.routeCode);
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

   } // end of save(ENRouteByt anObject,String[] anAttributes)


 public ENRouteBytShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENRouteByt filterObject = new ENRouteByt();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENRouteBytShort)list.get(0);
   return null;
  }

  public ENRouteBytShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENRouteBytShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENRouteBytShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENRouteBytShortList getFilteredList(ENRouteByt filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENRouteBytShortList getScrollableFilteredList(ENRouteByt aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENRouteBytShortList getScrollableFilteredList(ENRouteByt aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENRouteBytShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENRouteBytShortList getScrollableFilteredList(ENRouteBytFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENRouteBytShortList getScrollableFilteredList(ENRouteBytFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENRouteBytShortList getScrollableFilteredList(ENRouteByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENRouteBytShortList getScrollableFilteredList(ENRouteByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENRouteBytShortList result = new ENRouteBytShortList();
    ENRouteBytShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENROUTEBYT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENROUTEBYT.CODE"+
     ",ENROUTEBYT.NAME"+
     ",ENROUTEBYT.NUMBERGEN"+
     ",ENROUTEBYT.ROUTECODE"+

      ", ENELEMENT.CODE " +
     " FROM ENROUTEBYT " +
     ", ENELEMENT " +
     //" WHERE "
    "";
     whereStr = " ENELEMENT.CODE = ENROUTEBYT.ELEMENTCODE" ; //+
        //selectStr = selectStr + " ${s} ENROUTEBYT.CODE IN ( SELECT ENROUTEBYT.CODE FROM ENROUTEBYT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYT.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENROUTEBYT.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENROUTEBYT.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENROUTEBYT.NUMBERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENROUTEBYT.NUMBERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.routeCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYT.ROUTECODE = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENROUTEBYT.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENROUTEBYT.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYT.MODIFY_TIME = ?";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENROUTEBYT.ELEMENTCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRouteByt.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENRouteByt.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENROUTEBYT",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENROUTEBYT.DOMAIN_INFO IS NOT NULL";
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

           if(aFilterObject.numbergen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numbergen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.routeCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.routeCode);
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

        anObject = new ENRouteBytShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.numbergen = set.getString(3);
        anObject.routeCode = set.getInt(4);
        if ( set.wasNull() )
            anObject.routeCode = Integer.MIN_VALUE;

        anObject.elementCode = set.getInt(5);
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

  public int[] getFilteredCodeArrayOLD(ENRouteByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENROUTEBYT.CODE FROM ENROUTEBYT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENROUTEBYT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRouteByt.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENRouteByt.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENROUTEBYT",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENROUTEBYT.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYT.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENROUTEBYT.NAME = ?";
             else
                 whereStr = whereStr + "  ENROUTEBYT.NAME LIKE ?";
         }
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENROUTEBYT.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENROUTEBYT.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.routeCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYT.ROUTECODE = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENROUTEBYT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENROUTEBYT.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYT.MODIFY_TIME = ?";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENROUTEBYT.ELEMENTCODE = ? ";
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
                 whereStr = whereStr + " ENROUTEBYT.NAME = ?";
             else
                 whereStr = whereStr + " ENROUTEBYT.NAME LIKE ?";

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
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENROUTEBYT.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENROUTEBYT.NUMBERGEN LIKE ?";

           if(aFilterObject.numbergen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numbergen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.routeCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.routeCode);
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENROUTEBYT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENROUTEBYT.DOMAIN_INFO LIKE ?";

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

  public int[] getFilteredCodeArray(ENRouteBytFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENRouteByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENROUTEBYT.CODE FROM ENROUTEBYT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENROUTEBYT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRouteByt.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENRouteByt.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENROUTEBYT",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENROUTEBYT.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYT.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENROUTEBYT.NAME = ?";
             else
                 whereStr = whereStr + "  ENROUTEBYT.NAME LIKE ?";
         }
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENROUTEBYT.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENROUTEBYT.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.routeCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYT.ROUTECODE = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENROUTEBYT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENROUTEBYT.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYT.MODIFY_TIME = ?";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENROUTEBYT.ELEMENTCODE = ? ";
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
                 whereStr = whereStr + " ENROUTEBYT.NAME = ?";
             else
                 whereStr = whereStr + " ENROUTEBYT.NAME LIKE ?";

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
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENROUTEBYT.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENROUTEBYT.NUMBERGEN LIKE ?";

           if(aFilterObject.numbergen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numbergen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.routeCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.routeCode);
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENROUTEBYT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENROUTEBYT.DOMAIN_INFO LIKE ?";

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


   public ENRouteByt getObject(int uid) throws PersistenceException
   {
    ENRouteByt result = new ENRouteByt();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENRouteByt anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRouteByt.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENRouteByt.getObject%} access denied");



    selectStr =
    "SELECT  ENROUTEBYT.CODE, ENROUTEBYT.NAME, ENROUTEBYT.NUMBERGEN, ENROUTEBYT.ROUTECODE, ENROUTEBYT.DOMAIN_INFO, ENROUTEBYT.MODIFY_TIME, ENROUTEBYT.ELEMENTCODE "
    +" FROM ENROUTEBYT WHERE ENROUTEBYT.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENROUTEBYT",segregationInfo,getUserProfile().getDomainInfo());
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
        anObject.numbergen = set.getString(3);
        anObject.routeCode = set.getInt(4);
        if ( set.wasNull() )
           anObject.routeCode = Integer.MIN_VALUE;
        anObject.domain_info = set.getString(5);
        anObject.modify_time = set.getLong(6);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.element.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.element.code = Integer.MIN_VALUE;
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


  public com.ksoe.energynet.valueobject.references.ENRouteBytRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENRouteBytRef ref = new com.ksoe.energynet.valueobject.references.ENRouteBytRef();
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

    selectStr = "DELETE FROM  ENROUTEBYT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENRouteByt object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENRouteByt.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENRouteByt.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENRouteByt.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRouteByt.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENRouteByt.getObject%} access denied");

    selectStr =

    "SELECT  ENROUTEBYT.CODE FROM  ENROUTEBYT WHERE  ENROUTEBYT.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENROUTEBYT",segregationInfo,getUserProfile().getDomainInfo());
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
    _checkConditionToken(condition,"code","ENROUTEBYT.CODE");
    _checkConditionToken(condition,"name","ENROUTEBYT.NAME");
    _checkConditionToken(condition,"numbergen","ENROUTEBYT.NUMBERGEN");
    _checkConditionToken(condition,"routecode","ENROUTEBYT.ROUTECODE");
    _checkConditionToken(condition,"domain_info","ENROUTEBYT.DOMAIN_INFO");
    _checkConditionToken(condition,"modify_time","ENROUTEBYT.MODIFY_TIME");
      // relationship conditions
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

    private void _collectAutoIncrementFields(ENRouteByt anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENROUTEBYT", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENROUTEBYT", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENROUTEBYT", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENROUTEBYT");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENRouteBytDAO
