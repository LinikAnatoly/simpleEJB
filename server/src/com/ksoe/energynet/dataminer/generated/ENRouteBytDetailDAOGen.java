
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


import java.util.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.energynet.valueobject.ENRouteBytDetail;
import com.ksoe.energynet.valueobject.filter.ENRouteBytDetailFilter;
import com.ksoe.energynet.valueobject.brief.ENRouteBytDetailShort;
import com.ksoe.energynet.valueobject.lists.ENRouteBytDetailShortList;


/**
 * DAO Object for ENRouteBytDetail;
 *
 */

public class ENRouteBytDetailDAOGen extends GenericDataMiner {

   public ENRouteBytDetailDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENRouteBytDetailDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   protected boolean isEqual(ENRouteBytDetail inObject) throws PersistenceException
   {
      ENRouteBytDetail obj = new ENRouteBytDetail();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.name == null && obj.name == null){}
	else
		if(inObject.name == null || obj.name == null) return false;
		else
			if ( ! inObject.name.equals(obj.name)){
				return false;
			}

	if(inObject.numbergen == null && obj.numbergen == null){}
	else
		if(inObject.numbergen == null || obj.numbergen == null) return false;
		else
			if ( ! inObject.numbergen.equals(obj.numbergen)){
				return false;
			}

     if (inObject.routeCode != obj.routeCode){
				return false;
			}

     if (inObject.rpCode != obj.rpCode){
				return false;
			}

	if(inObject.rpName == null && obj.rpName == null){}
	else
		if(inObject.rpName == null || obj.rpName == null) return false;
		else
			if ( ! inObject.rpName.equals(obj.rpName)){
				return false;
			}

     if (inObject.entryCode != obj.entryCode){
				return false;
			}

     if (inObject.statusCode != obj.statusCode){
				return false;
			}
     if (inObject.planRef.code != obj.planRef.code){
        return false;
     }
     if (inObject.element.code != obj.element.code){
        return false;
     }
      return true;
   }

   public int add(ENRouteBytDetail anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENRouteBytDetail anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENROUTEBYTDETAIL (CODE,NAME,NUMBERGEN,ROUTECODE,RPCODE,RPNAME,ENTRYCODE,STATUSCODE,MODIFY_TIME,PLANREFCODE,ELEMENTCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

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
      if (anObject.rpCode != Integer.MIN_VALUE )
         statement.setInt(5,anObject.rpCode);
      else
         statement.setNull(5,java.sql.Types.INTEGER);
      statement.setString(6,anObject.rpName);
      if (anObject.entryCode != Integer.MIN_VALUE )
         statement.setInt(7,anObject.entryCode);
      else
         statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.statusCode != Integer.MIN_VALUE )
         statement.setInt(8,anObject.statusCode);
      else
         statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(9,null);
      else
        statement.setBigDecimal(9,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.planRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENRouteBytDetail.planRef.code%} = {%"+anObject.planRef.code+"%}");
        statement.setInt(10,anObject.planRef.code);
      }
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.element.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.element.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENRouteBytDetail.element.code%} = {%"+anObject.element.code+"%}");
        statement.setInt(11,anObject.element.code);
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
      throw new PersistenceException("Error in method {%ENRouteBytDetailDAOGen.add%}",e);
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

   public void save(ENRouteBytDetail anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENRouteBytDetail anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENRouteBytDetail oldObject = new ENRouteBytDetail();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENRouteBytDetail.modify_time_Field + " FROM  ENROUTEBYTDETAIL WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("RPCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RPNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ENTRYCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("STATUSCODE") == 0)
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
        "UPDATE ENROUTEBYTDETAIL SET  NAME = ? , NUMBERGEN = ? , ROUTECODE = ? , RPCODE = ? , RPNAME = ? , ENTRYCODE = ? , STATUSCODE = ? , MODIFY_TIME = ? , PLANREFCODE = ? , ELEMENTCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENROUTEBYTDETAIL SET ";
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
      if (anObject.rpCode != Integer.MIN_VALUE )
         statement.setInt(4,anObject.rpCode);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      statement.setString(5,anObject.rpName);
      if (anObject.entryCode != Integer.MIN_VALUE )
         statement.setInt(6,anObject.entryCode);
      else
         statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.statusCode != Integer.MIN_VALUE )
         statement.setInt(7,anObject.statusCode);
      else
         statement.setNull(7,java.sql.Types.INTEGER);
  
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(8,null);
      else
        statement.setBigDecimal(8,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.planRef.code != Integer.MIN_VALUE)
        statement.setInt(9,anObject.planRef.code);
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.element.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.element.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
          statement.setInt(11,anObject.code);
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
            if("RPCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.rpCode);
                continue;
             }
            if("RPNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.rpName);
                continue;
             }
            if("ENTRYCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.entryCode);
                continue;
             }
            if("STATUSCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.statusCode);
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

   } // end of save(ENRouteBytDetail anObject,String[] anAttributes)


 public ENRouteBytDetailShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENRouteBytDetail filterObject = new ENRouteBytDetail();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENRouteBytDetailShort)list.get(0);
   return null;
  }

  public ENRouteBytDetailShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENRouteBytDetailShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENRouteBytDetailShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENRouteBytDetailShortList getFilteredList(ENRouteBytDetail filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENRouteBytDetailShortList getScrollableFilteredList(ENRouteBytDetail aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENRouteBytDetailShortList getScrollableFilteredList(ENRouteBytDetail aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENRouteBytDetailShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENRouteBytDetailShortList getScrollableFilteredList(ENRouteBytDetailFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENRouteBytDetailShortList getScrollableFilteredList(ENRouteBytDetailFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENRouteBytDetailShortList getScrollableFilteredList(ENRouteBytDetail aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENRouteBytDetailShortList getScrollableFilteredList(ENRouteBytDetail aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENRouteBytDetailShortList result = new ENRouteBytDetailShortList();
    ENRouteBytDetailShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENROUTEBYTDETAIL.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENROUTEBYTDETAIL.CODE"+
     ",ENROUTEBYTDETAIL.NAME"+
     ",ENROUTEBYTDETAIL.NUMBERGEN"+
     ",ENROUTEBYTDETAIL.ROUTECODE"+
     ",ENROUTEBYTDETAIL.RPCODE"+
     ",ENROUTEBYTDETAIL.RPNAME"+
     ",ENROUTEBYTDETAIL.ENTRYCODE"+
     ",ENROUTEBYTDETAIL.STATUSCODE"+

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
      ", ENELEMENT.CODE " +
     " FROM ENROUTEBYTDETAIL " +
     ", ENPLANWORK " +
     ", ENELEMENT " +
     //" WHERE "
  "";
     whereStr = " ENPLANWORK.CODE = ENROUTEBYTDETAIL.PLANREFCODE" ; //+
      whereStr = whereStr +" AND ENELEMENT.CODE = ENROUTEBYTDETAIL.ELEMENTCODE" ; //+
    //selectStr = selectStr + " ${s} ENROUTEBYTDETAIL.CODE IN ( SELECT ENROUTEBYTDETAIL.CODE FROM ENROUTEBYTDETAIL ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENROUTEBYTDETAIL.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENROUTEBYTDETAIL.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENROUTEBYTDETAIL.NUMBERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENROUTEBYTDETAIL.NUMBERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.routeCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.ROUTECODE = ?";
        }
        if(aFilterObject.rpCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.RPCODE = ?";
        }
         if (aFilterObject.rpName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.rpName.indexOf('*',0) < 0 && aFilterObject.rpName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENROUTEBYTDETAIL.RPNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENROUTEBYTDETAIL.RPNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.entryCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.ENTRYCODE = ?";
        }
        if(aFilterObject.statusCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.STATUSCODE = ?";
        }

        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENROUTEBYTDETAIL.PLANREFCODE = ? ";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENROUTEBYTDETAIL.ELEMENTCODE = ? ";
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
         if(aFilterObject.rpCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.rpCode);
         }

           if(aFilterObject.rpName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.rpName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.entryCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.entryCode);
         }
         if(aFilterObject.statusCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.statusCode);
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
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.element.code);
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

        anObject = new ENRouteBytDetailShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.numbergen = set.getString(3);
        anObject.routeCode = set.getInt(4);
        if ( set.wasNull() )
            anObject.routeCode = Integer.MIN_VALUE;
        anObject.rpCode = set.getInt(5);
        if ( set.wasNull() )
            anObject.rpCode = Integer.MIN_VALUE;
        anObject.rpName = set.getString(6);
        anObject.entryCode = set.getInt(7);
        if ( set.wasNull() )
            anObject.entryCode = Integer.MIN_VALUE;
        anObject.statusCode = set.getInt(8);
        if ( set.wasNull() )
            anObject.statusCode = Integer.MIN_VALUE;

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
        anObject.elementCode = set.getInt(29);
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

  public int[] getFilteredCodeArrayOLD(ENRouteBytDetail aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENROUTEBYTDETAIL.CODE FROM ENROUTEBYTDETAIL";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENROUTEBYTDETAIL.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
   
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENROUTEBYTDETAIL.NAME = ?";
             else
                 whereStr = whereStr + "  ENROUTEBYTDETAIL.NAME LIKE ?";
         }
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENROUTEBYTDETAIL.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENROUTEBYTDETAIL.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.routeCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.ROUTECODE = ?";
        }
        if(aFilterObject.rpCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.RPCODE = ?";
        }
         if (aFilterObject.rpName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.rpName.indexOf('*',0) < 0 && aFilterObject.rpName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENROUTEBYTDETAIL.RPNAME = ?";
             else
                 whereStr = whereStr + "  ENROUTEBYTDETAIL.RPNAME LIKE ?";
         }
        if(aFilterObject.entryCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.ENTRYCODE = ?";
        }
        if(aFilterObject.statusCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.STATUSCODE = ?";
        }

        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENROUTEBYTDETAIL.PLANREFCODE = ? ";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENROUTEBYTDETAIL.ELEMENTCODE = ? ";
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
                 whereStr = whereStr + " ENROUTEBYTDETAIL.NAME = ?";
             else
                 whereStr = whereStr + " ENROUTEBYTDETAIL.NAME LIKE ?";

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
                 whereStr = whereStr + " ENROUTEBYTDETAIL.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENROUTEBYTDETAIL.NUMBERGEN LIKE ?";

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
         if(aFilterObject.rpCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.rpCode);
         }
         if (aFilterObject.rpName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.rpName.indexOf('*',0) < 0 && aFilterObject.rpName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENROUTEBYTDETAIL.RPNAME = ?";
             else
                 whereStr = whereStr + " ENROUTEBYTDETAIL.RPNAME LIKE ?";

           if(aFilterObject.rpName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.rpName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.entryCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.entryCode);
         }
         if(aFilterObject.statusCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.statusCode);
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

  public int[] getFilteredCodeArray(ENRouteBytDetailFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENRouteBytDetail aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENROUTEBYTDETAIL.CODE FROM ENROUTEBYTDETAIL";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENROUTEBYTDETAIL.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENROUTEBYTDETAIL.NAME = ?";
             else
                 whereStr = whereStr + "  ENROUTEBYTDETAIL.NAME LIKE ?";
         }
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENROUTEBYTDETAIL.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENROUTEBYTDETAIL.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.routeCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.ROUTECODE = ?";
        }
        if(aFilterObject.rpCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.RPCODE = ?";
        }
         if (aFilterObject.rpName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.rpName.indexOf('*',0) < 0 && aFilterObject.rpName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENROUTEBYTDETAIL.RPNAME = ?";
             else
                 whereStr = whereStr + "  ENROUTEBYTDETAIL.RPNAME LIKE ?";
         }
        if(aFilterObject.entryCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.ENTRYCODE = ?";
        }
        if(aFilterObject.statusCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.STATUSCODE = ?";
        }

        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROUTEBYTDETAIL.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENROUTEBYTDETAIL.PLANREFCODE = ? ";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENROUTEBYTDETAIL.ELEMENTCODE = ? ";
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
                 whereStr = whereStr + " ENROUTEBYTDETAIL.NAME = ?";
             else
                 whereStr = whereStr + " ENROUTEBYTDETAIL.NAME LIKE ?";

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
                 whereStr = whereStr + " ENROUTEBYTDETAIL.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENROUTEBYTDETAIL.NUMBERGEN LIKE ?";

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
         if(aFilterObject.rpCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.rpCode);
         }
         if (aFilterObject.rpName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.rpName.indexOf('*',0) < 0 && aFilterObject.rpName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENROUTEBYTDETAIL.RPNAME = ?";
             else
                 whereStr = whereStr + " ENROUTEBYTDETAIL.RPNAME LIKE ?";

           if(aFilterObject.rpName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.rpName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.entryCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.entryCode);
         }
         if(aFilterObject.statusCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.statusCode);
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


   public ENRouteBytDetail getObject(int uid) throws PersistenceException
   {
    ENRouteBytDetail result = new ENRouteBytDetail();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENRouteBytDetail anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr =
    "SELECT  ENROUTEBYTDETAIL.CODE, ENROUTEBYTDETAIL.NAME, ENROUTEBYTDETAIL.NUMBERGEN, ENROUTEBYTDETAIL.ROUTECODE, ENROUTEBYTDETAIL.RPCODE, ENROUTEBYTDETAIL.RPNAME, ENROUTEBYTDETAIL.ENTRYCODE, ENROUTEBYTDETAIL.STATUSCODE, ENROUTEBYTDETAIL.MODIFY_TIME, ENROUTEBYTDETAIL.PLANREFCODE, ENROUTEBYTDETAIL.ELEMENTCODE "
    +" FROM ENROUTEBYTDETAIL WHERE ENROUTEBYTDETAIL.CODE = ?";

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
        anObject.rpCode = set.getInt(5);
        if ( set.wasNull() )
           anObject.rpCode = Integer.MIN_VALUE;
        anObject.rpName = set.getString(6);
        anObject.entryCode = set.getInt(7);
        if ( set.wasNull() )
           anObject.entryCode = Integer.MIN_VALUE;
        anObject.statusCode = set.getInt(8);
        if ( set.wasNull() )
           anObject.statusCode = Integer.MIN_VALUE;
        anObject.modify_time = set.getLong(9);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.planRef.code = set.getInt(10);
        if ( set.wasNull() )
            anObject.planRef.code = Integer.MIN_VALUE;
        anObject.element.code = set.getInt(11);
        if ( set.wasNull() )
            anObject.element.code = Integer.MIN_VALUE;
        if(anObject.planRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlanRef(
      new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENRouteBytDetailRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENRouteBytDetailRef ref = new com.ksoe.energynet.valueobject.references.ENRouteBytDetailRef();
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

    selectStr = "DELETE FROM  ENROUTEBYTDETAIL WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENRouteBytDetail object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENRouteBytDetail.getObject%} access denied");

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

    "SELECT  ENROUTEBYTDETAIL.CODE FROM  ENROUTEBYTDETAIL WHERE  ENROUTEBYTDETAIL.CODE = ?";
    
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
    _checkConditionToken(condition,"code","ENROUTEBYTDETAIL.CODE");
    _checkConditionToken(condition,"name","ENROUTEBYTDETAIL.NAME");
    _checkConditionToken(condition,"numbergen","ENROUTEBYTDETAIL.NUMBERGEN");
    _checkConditionToken(condition,"routecode","ENROUTEBYTDETAIL.ROUTECODE");
    _checkConditionToken(condition,"rpcode","ENROUTEBYTDETAIL.RPCODE");
    _checkConditionToken(condition,"rpname","ENROUTEBYTDETAIL.RPNAME");
    _checkConditionToken(condition,"entrycode","ENROUTEBYTDETAIL.ENTRYCODE");
    _checkConditionToken(condition,"statuscode","ENROUTEBYTDETAIL.STATUSCODE");
    _checkConditionToken(condition,"modify_time","ENROUTEBYTDETAIL.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"planref","PLANREFCODE");
    _checkConditionToken(condition,"planref.code","PLANREFCODE");
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

  private void _collectAutoIncrementFields(ENRouteBytDetail anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENROUTEBYTDETAIL", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENROUTEBYTDETAIL", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENROUTEBYTDETAIL", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENROUTEBYTDETAIL");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENRouteBytDetailDAO
