
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

import com.ksoe.energynet.valueobject.ENReportAdditionZbytMetrology;
import com.ksoe.energynet.valueobject.filter.ENReportAdditionZbytMetrologyFilter;
import com.ksoe.energynet.valueobject.brief.ENReportAdditionZbytMetrologyShort;
import com.ksoe.energynet.valueobject.lists.ENReportAdditionZbytMetrologyShortList;


/**
 * DAO Object for ENReportAdditionZbytMetrology;
 *
 */

public class ENReportAdditionZbytMetrologyDAOGen extends GenericDataMiner {

   public ENReportAdditionZbytMetrologyDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENReportAdditionZbytMetrologyDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(ENReportAdditionZbytMetrology inObject) throws PersistenceException
   {
      ENReportAdditionZbytMetrology obj = new ENReportAdditionZbytMetrology();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.workCode == null && obj.workCode == null){}
	else
		if(inObject.workCode == null || obj.workCode == null) return false;
		else
			if ( ! inObject.workCode.equals(obj.workCode)){
				return false;
			}

	if(inObject.name == null && obj.name == null){}
	else
		if(inObject.name == null || obj.name == null) return false;
		else
			if ( ! inObject.name.equals(obj.name)){
				return false;
			}

     if (inObject.isServices != obj.isServices){
				return false;
			}

	if(inObject.zbytOrmetrology == null && obj.zbytOrmetrology == null){}
	else
		if(inObject.zbytOrmetrology == null || obj.zbytOrmetrology == null) return false;
		else
			if ( ! inObject.zbytOrmetrology.equals(obj.zbytOrmetrology)){
				return false;
			}

	if(inObject.dateStart == null && obj.dateStart == null){}
	else
		if(inObject.dateStart == null || obj.dateStart == null) return false;
		else
			if (inObject.dateStart.compareTo(obj.dateStart) != 0){
				return false;
			}

	if(inObject.dateFinal == null && obj.dateFinal == null){}
	else
		if(inObject.dateFinal == null || obj.dateFinal == null) return false;
		else
			if (inObject.dateFinal.compareTo(obj.dateFinal) != 0){
				return false;
			}
      return true;
   }

   public int add(ENReportAdditionZbytMetrology anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENReportAdditionZbytMetrology anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENREPORTADDITNZBTMTRLG (CODE,WORKCODE,NAME,ISSERVICES,ZBYTORMETROLOGY,DATESTART,DATEFINAL) VALUES (?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.workCode);
      statement.setString(3,anObject.name);
      if (anObject.isServices != Integer.MIN_VALUE )
         statement.setInt(4,anObject.isServices);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      statement.setString(5,anObject.zbytOrmetrology);
      if (anObject.dateStart == null)
        statement.setTimestamp(6,null);
      else
        statement.setTimestamp(6,new java.sql.Timestamp(anObject.dateStart.getTime()));
      if (anObject.dateFinal == null)
        statement.setTimestamp(7,null);
      else
        statement.setTimestamp(7,new java.sql.Timestamp(anObject.dateFinal.getTime()));

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
      throw new PersistenceException("Error in method {%ENReportAdditionZbytMetrologyDAOGen.add%}",e);
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

   public void save(ENReportAdditionZbytMetrology anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENReportAdditionZbytMetrology anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("WORKCODE") == 0)
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
          if(fieldNameStr.compareTo("ISSERVICES") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ZBYTORMETROLOGY") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATESTART") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEFINAL") == 0)
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
        "UPDATE ENREPORTADDITNZBTMTRLG SET  WORKCODE = ? , NAME = ? , ISSERVICES = ? , ZBYTORMETROLOGY = ? , DATESTART = ? , DATEFINAL = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENREPORTADDITIONZBYTMETROLOGY SET ";
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
      statement.setString(1,anObject.workCode);
      statement.setString(2,anObject.name);
      if (anObject.isServices != Integer.MIN_VALUE )
         statement.setInt(3,anObject.isServices);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      statement.setString(4,anObject.zbytOrmetrology);
      if (anObject.dateStart == null)
        statement.setTimestamp(5,null);
      else
        statement.setTimestamp(5,new java.sql.Timestamp(anObject.dateStart.getTime()));
      if (anObject.dateFinal == null)
        statement.setTimestamp(6,null);
      else
        statement.setTimestamp(6,new java.sql.Timestamp(anObject.dateFinal.getTime()));
          statement.setInt(7,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("WORKCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.workCode);
                continue;
             }
            if("NAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.name);
                continue;
             }
            if("ISSERVICES".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.isServices);
                continue;
             }
            if("ZBYTORMETROLOGY".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.zbytOrmetrology);
                continue;
             }
            if("DATESTART".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateStart == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateStart.getTime()));
                continue;
             }
            if("DATEFINAL".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateFinal == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateFinal.getTime()));
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

   } // end of save(ENReportAdditionZbytMetrology anObject,String[] anAttributes)


 public ENReportAdditionZbytMetrologyShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENReportAdditionZbytMetrology filterObject = new ENReportAdditionZbytMetrology();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENReportAdditionZbytMetrologyShort)list.get(0);
   return null;
  }

  public ENReportAdditionZbytMetrologyShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENReportAdditionZbytMetrologyShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENReportAdditionZbytMetrologyShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENReportAdditionZbytMetrologyShortList getFilteredList(ENReportAdditionZbytMetrology filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENReportAdditionZbytMetrologyShortList getScrollableFilteredList(ENReportAdditionZbytMetrology aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENReportAdditionZbytMetrologyShortList getScrollableFilteredList(ENReportAdditionZbytMetrology aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENReportAdditionZbytMetrologyShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENReportAdditionZbytMetrologyShortList getScrollableFilteredList(ENReportAdditionZbytMetrologyFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENReportAdditionZbytMetrologyShortList getScrollableFilteredList(ENReportAdditionZbytMetrologyFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENReportAdditionZbytMetrologyShortList getScrollableFilteredList(ENReportAdditionZbytMetrology aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENReportAdditionZbytMetrologyShortList getScrollableFilteredList(ENReportAdditionZbytMetrology aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENReportAdditionZbytMetrologyShortList result = new ENReportAdditionZbytMetrologyShortList();
    ENReportAdditionZbytMetrologyShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENREPORTADDITNZBTMTRLG.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENREPORTADDITNZBTMTRLG.CODE"+
     ",ENREPORTADDITNZBTMTRLG.WORKCODE"+
     ",ENREPORTADDITNZBTMTRLG.NAME"+
     ",ENREPORTADDITNZBTMTRLG.ISSERVICES"+
     ",ENREPORTADDITNZBTMTRLG.ZBYTORMETROLOGY"+
     ",ENREPORTADDITNZBTMTRLG.DATESTART"+
     ",ENREPORTADDITNZBTMTRLG.DATEFINAL"+

     " FROM ENREPORTADDITNZBTMTRLG " +
     //" WHERE "
  "";
    //selectStr = selectStr + " ${s} ENREPORTADDITNZBTMTRLG.CODE IN ( SELECT ENREPORTADDITNZBTMTRLG.CODE FROM ENREPORTADDITNZBTMTRLG ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.CODE = ?";
        }
         if (aFilterObject.workCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.workCode.indexOf('*',0) < 0 && aFilterObject.workCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENREPORTADDITNZBTMTRLG.WORKCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENREPORTADDITNZBTMTRLG.WORKCODE) LIKE UPPER(?)";
         }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENREPORTADDITNZBTMTRLG.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENREPORTADDITNZBTMTRLG.NAME) LIKE UPPER(?)";
         }
        if(aFilterObject.isServices != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.ISSERVICES = ?";
        }
         if (aFilterObject.zbytOrmetrology != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.zbytOrmetrology.indexOf('*',0) < 0 && aFilterObject.zbytOrmetrology.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENREPORTADDITNZBTMTRLG.ZBYTORMETROLOGY) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENREPORTADDITNZBTMTRLG.ZBYTORMETROLOGY) LIKE UPPER(?)";
         }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.DATEFINAL = ?";
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

           if(aFilterObject.workCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.workCode);
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
         if(aFilterObject.isServices != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isServices);
         }

           if(aFilterObject.zbytOrmetrology != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.zbytOrmetrology);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateFinal.getTime()));
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

        anObject = new ENReportAdditionZbytMetrologyShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.workCode = set.getString(2);
        anObject.name = set.getString(3);
        anObject.isServices = set.getInt(4);
        if ( set.wasNull() )
            anObject.isServices = Integer.MIN_VALUE;
        anObject.zbytOrmetrology = set.getString(5);
        anObject.dateStart = set.getTimestamp(6);
        anObject.dateFinal = set.getTimestamp(7);


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

  public int[] getFilteredCodeArrayOLD(ENReportAdditionZbytMetrology aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENREPORTADDITNZBTMTRLG.CODE FROM ENREPORTADDITNZBTMTRLG";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENREPORTADDITNZBTMTRLG.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.CODE = ?";
        }
         if (aFilterObject.workCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.workCode.indexOf('*',0) < 0 && aFilterObject.workCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.WORKCODE = ?";
             else
                 whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.WORKCODE LIKE ?";
         }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.NAME = ?";
             else
                 whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.NAME LIKE ?";
         }
        if(aFilterObject.isServices != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.ISSERVICES = ?";
        }
         if (aFilterObject.zbytOrmetrology != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.zbytOrmetrology.indexOf('*',0) < 0 && aFilterObject.zbytOrmetrology.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.ZBYTORMETROLOGY = ?";
             else
                 whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.ZBYTORMETROLOGY LIKE ?";
         }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.DATEFINAL = ?";
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
         if (aFilterObject.workCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.workCode.indexOf('*',0) < 0 && aFilterObject.workCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENREPORTADDITNZBTMTRLG.WORKCODE = ?";
             else
                 whereStr = whereStr + " ENREPORTADDITNZBTMTRLG.WORKCODE LIKE ?";

           if(aFilterObject.workCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.workCode);
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
                 whereStr = whereStr + " ENREPORTADDITNZBTMTRLG.NAME = ?";
             else
                 whereStr = whereStr + " ENREPORTADDITNZBTMTRLG.NAME LIKE ?";

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
         if(aFilterObject.isServices != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isServices);
         }
         if (aFilterObject.zbytOrmetrology != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.zbytOrmetrology.indexOf('*',0) < 0 && aFilterObject.zbytOrmetrology.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENREPORTADDITNZBTMTRLG.ZBYTORMETROLOGY = ?";
             else
                 whereStr = whereStr + " ENREPORTADDITNZBTMTRLG.ZBYTORMETROLOGY LIKE ?";

           if(aFilterObject.zbytOrmetrology != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.zbytOrmetrology);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateFinal.getTime()));
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

  public int[] getFilteredCodeArray(ENReportAdditionZbytMetrologyFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENReportAdditionZbytMetrology aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENREPORTADDITNZBTMTRLG.CODE FROM ENREPORTADDITNZBTMTRLG";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENREPORTADDITNZBTMTRLG.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.CODE = ?";
        }
         if (aFilterObject.workCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.workCode.indexOf('*',0) < 0 && aFilterObject.workCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.WORKCODE = ?";
             else
                 whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.WORKCODE LIKE ?";
         }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.NAME = ?";
             else
                 whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.NAME LIKE ?";
         }
        if(aFilterObject.isServices != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.ISSERVICES = ?";
        }
         if (aFilterObject.zbytOrmetrology != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.zbytOrmetrology.indexOf('*',0) < 0 && aFilterObject.zbytOrmetrology.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.ZBYTORMETROLOGY = ?";
             else
                 whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.ZBYTORMETROLOGY LIKE ?";
         }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENREPORTADDITNZBTMTRLG.DATEFINAL = ?";
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
         if (aFilterObject.workCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.workCode.indexOf('*',0) < 0 && aFilterObject.workCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENREPORTADDITNZBTMTRLG.WORKCODE = ?";
             else
                 whereStr = whereStr + " ENREPORTADDITNZBTMTRLG.WORKCODE LIKE ?";

           if(aFilterObject.workCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.workCode);
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
                 whereStr = whereStr + " ENREPORTADDITNZBTMTRLG.NAME = ?";
             else
                 whereStr = whereStr + " ENREPORTADDITNZBTMTRLG.NAME LIKE ?";

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
         if(aFilterObject.isServices != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isServices);
         }
         if (aFilterObject.zbytOrmetrology != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.zbytOrmetrology.indexOf('*',0) < 0 && aFilterObject.zbytOrmetrology.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENREPORTADDITNZBTMTRLG.ZBYTORMETROLOGY = ?";
             else
                 whereStr = whereStr + " ENREPORTADDITNZBTMTRLG.ZBYTORMETROLOGY LIKE ?";

           if(aFilterObject.zbytOrmetrology != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.zbytOrmetrology);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateFinal.getTime()));
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


   public ENReportAdditionZbytMetrology getObject(int uid) throws PersistenceException
   {
    ENReportAdditionZbytMetrology result = new ENReportAdditionZbytMetrology();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENReportAdditionZbytMetrology anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENREPORTADDITNZBTMTRLG.CODE, ENREPORTADDITNZBTMTRLG.WORKCODE, ENREPORTADDITNZBTMTRLG.NAME, ENREPORTADDITNZBTMTRLG.ISSERVICES, ENREPORTADDITNZBTMTRLG.ZBYTORMETROLOGY, ENREPORTADDITNZBTMTRLG.DATESTART, ENREPORTADDITNZBTMTRLG.DATEFINAL "
    +" FROM ENREPORTADDITNZBTMTRLG WHERE ENREPORTADDITNZBTMTRLG.CODE = ?";

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
        anObject.workCode = set.getString(2);
        anObject.name = set.getString(3);
        anObject.isServices = set.getInt(4);
        if ( set.wasNull() )
           anObject.isServices = Integer.MIN_VALUE;
        anObject.zbytOrmetrology = set.getString(5);
        anObject.dateStart = set.getTimestamp(6);
        anObject.dateFinal = set.getTimestamp(7);
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


  public com.ksoe.energynet.valueobject.references.ENReportAdditionZbytMetrologyRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENReportAdditionZbytMetrologyRef ref = new com.ksoe.energynet.valueobject.references.ENReportAdditionZbytMetrologyRef();
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

    selectStr = "DELETE FROM  ENREPORTADDITNZBTMTRLG WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENReportAdditionZbytMetrology object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENReportAdditionZbytMetrology.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENReportAdditionZbytMetrology.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENReportAdditionZbytMetrology.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENReportAdditionZbytMetrology.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENReportAdditionZbytMetrology.getObject%} access denied");

    selectStr =

    "SELECT  ENREPORTADDITNZBTMTRLG.CODE FROM  ENREPORTADDITNZBTMTRLG WHERE  ENREPORTADDITNZBTMTRLG.CODE = ?";
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
    _checkConditionToken(condition,"code","ENREPORTADDITNZBTMTRLG.CODE");
    _checkConditionToken(condition,"workcode","ENREPORTADDITNZBTMTRLG.WORKCODE");
    _checkConditionToken(condition,"name","ENREPORTADDITNZBTMTRLG.NAME");
    _checkConditionToken(condition,"isservices","ENREPORTADDITNZBTMTRLG.ISSERVICES");
    _checkConditionToken(condition,"zbytormetrology","ENREPORTADDITNZBTMTRLG.ZBYTORMETROLOGY");
    _checkConditionToken(condition,"datestart","ENREPORTADDITNZBTMTRLG.DATESTART");
    _checkConditionToken(condition,"datefinal","ENREPORTADDITNZBTMTRLG.DATEFINAL");
      // relationship conditions
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

  private void _collectAutoIncrementFields(ENReportAdditionZbytMetrology anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENREPORTADDITNZBTMTRLG", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENREPORTADDITNZBTMTRLG", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENREPORTADDITNZBTMTRLG", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENREPORTADDITNZBTMTRLG");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENReportAdditionZbytMetrologyDAO
