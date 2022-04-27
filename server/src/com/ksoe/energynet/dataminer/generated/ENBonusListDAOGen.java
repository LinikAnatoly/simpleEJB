
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

import com.ksoe.energynet.valueobject.ENBonusList;
import com.ksoe.energynet.valueobject.filter.ENBonusListFilter;
import com.ksoe.energynet.valueobject.brief.ENBonusListShort;
import com.ksoe.energynet.valueobject.lists.ENBonusListShortList;


/**
 * DAO Object for ENBonusList;
 *
 */

public class ENBonusListDAOGen extends GenericDataMiner {

   public ENBonusListDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENBonusListDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(ENBonusList inObject) throws PersistenceException
   {
      ENBonusList obj = new ENBonusList();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.numberGen == null && obj.numberGen == null){}
	else
		if(inObject.numberGen == null || obj.numberGen == null) return false;
		else
			if ( ! inObject.numberGen.equals(obj.numberGen)){
				return false;
			}

     if (inObject.monthGen != obj.monthGen){
				return false;
			}

     if (inObject.yearGen != obj.yearGen){
				return false;
			}

	if(inObject.userAdd == null && obj.userAdd == null){}
	else
		if(inObject.userAdd == null || obj.userAdd == null) return false;
		else
			if ( ! inObject.userAdd.equals(obj.userAdd)){
				return false;
			}

	if(inObject.dateAdd == null && obj.dateAdd == null){}
	else
		if(inObject.dateAdd == null || obj.dateAdd == null) return false;
		else
			if (inObject.dateAdd.compareTo(obj.dateAdd) != 0){
				return false;
			}

	if(inObject.userGen == null && obj.userGen == null){}
	else
		if(inObject.userGen == null || obj.userGen == null) return false;
		else
			if ( ! inObject.userGen.equals(obj.userGen)){
				return false;
			}

	if(inObject.dateEdit == null && obj.dateEdit == null){}
	else
		if(inObject.dateEdit == null || obj.dateEdit == null) return false;
		else
			if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
				return false;
			}
     if (inObject.department.code != obj.department.code){
        return false;
     }
     if (inObject.kindRef.code != obj.kindRef.code){
        return false;
     }
     if (inObject.status.code != obj.status.code){
        return false;
     }
      return true;
   }

   public int add(ENBonusList anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENBonusList anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENBONUSLIST (CODE,NUMBERGEN,MONTHGEN,YEARGEN,USERADD,DATEADD,USERGEN,DATEEDIT,MODIFY_TIME,DEPARTMENTCODE,KINDREFCODE,STATUSCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.numberGen);
      if (anObject.monthGen != Integer.MIN_VALUE )
         statement.setInt(3,anObject.monthGen);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.yearGen != Integer.MIN_VALUE )
         statement.setInt(4,anObject.yearGen);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
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
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(9,null);
      else
        statement.setBigDecimal(9,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.department.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.department.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENBonusList.department.code%} = {%"+anObject.department.code+"%}");
        statement.setInt(10,anObject.department.code);
      }
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.kindRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINWorkerKindDAOGen(connection,getUserProfile()).exists(anObject.kindRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENBonusList.kindRef.code%} = {%"+anObject.kindRef.code+"%}");
        statement.setInt(11,anObject.kindRef.code);
      }
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.status.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENBonusListStatusDAOGen(connection,getUserProfile()).exists(anObject.status.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENBonusList.status.code%} = {%"+anObject.status.code+"%}");
        statement.setInt(12,anObject.status.code);
      }
      else
        statement.setNull(12,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENBonusListDAOGen.add%}",e);
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

   public void save(ENBonusList anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENBonusList anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENBonusList oldObject = new ENBonusList();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENBonusList.modify_time_Field+" FROM  ENBONUSLIST WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("NUMBERGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MONTHGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("YEARGEN") == 0)
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
          if(fieldNameStr.compareTo("MODIFY_TIME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DEPARTMENT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("KINDREF") == 0)
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
         }
       if(fields.size() == 0)
         return;
       }
      if(fields == null)
       {
        selectStr =
        "UPDATE ENBONUSLIST SET  NUMBERGEN = ? , MONTHGEN = ? , YEARGEN = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , DEPARTMENTCODE = ? , KINDREFCODE = ? , STATUSCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENBONUSLIST SET ";
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
      statement.setString(1,anObject.numberGen);
      if (anObject.monthGen != Integer.MIN_VALUE )
         statement.setInt(2,anObject.monthGen);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.yearGen != Integer.MIN_VALUE )
         statement.setInt(3,anObject.yearGen);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      statement.setString(4,anObject.userAdd);
      if (anObject.dateAdd == null)
        statement.setTimestamp(5,null);
      else
        statement.setTimestamp(5,new java.sql.Timestamp(anObject.dateAdd.getTime()));
      statement.setString(6,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(7,null);
      else
        statement.setTimestamp(7,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(8,null);
      else
        statement.setBigDecimal(8,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.department.code != Integer.MIN_VALUE)
        statement.setInt(9,anObject.department.code);
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.kindRef.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.kindRef.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.status.code != Integer.MIN_VALUE)
        statement.setInt(11,anObject.status.code);
      else
        statement.setNull(11,java.sql.Types.INTEGER);
          statement.setInt(12,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("NUMBERGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.numberGen);
                continue;
             }
            if("MONTHGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.monthGen);
                continue;
             }
            if("YEARGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.yearGen);
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
            if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(i+1,null);
                else
                     statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
                continue;
             }
            if("DEPARTMENT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.department.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.department.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("KINDREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.kindRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.kindRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("STATUS".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.status.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.status.code);
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

   } // end of save(ENBonusList anObject,String[] anAttributes)


 public ENBonusListShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENBonusList filterObject = new ENBonusList();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENBonusListShort)list.get(0);
   return null;
  }

  public ENBonusListShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENBonusListShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENBonusListShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENBonusListShortList getFilteredList(ENBonusList filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENBonusListShortList getScrollableFilteredList(ENBonusList aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENBonusListShortList getScrollableFilteredList(ENBonusList aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENBonusListShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENBonusListShortList getScrollableFilteredList(ENBonusListFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENBonusListShortList getScrollableFilteredList(ENBonusListFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENBonusListShortList getScrollableFilteredList(ENBonusList aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENBonusListShortList getScrollableFilteredList(ENBonusList aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENBonusListShortList result = new ENBonusListShortList();
    ENBonusListShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENBONUSLIST.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENBONUSLIST.CODE"+
     ",ENBONUSLIST.NUMBERGEN"+
     ",ENBONUSLIST.MONTHGEN"+
     ",ENBONUSLIST.YEARGEN"+
     ",ENBONUSLIST.USERADD"+
     ",ENBONUSLIST.DATEADD"+
     ",ENBONUSLIST.USERGEN"+
     ",ENBONUSLIST.DATEEDIT"+

      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
      ", ENDEPARTMENT.HRMORGANIZATIONID " +
      ", FINWORKERKIND.CODE " +
      ", case when FINWORKERKIND.CODE = 2 then 'Енергозбут Електромонтери' else  FINWORKERKIND.NAME end " +
      ", ENBONUSLISTSTATUS.CODE " +
      ", ENBONUSLISTSTATUS.NAME " +
     " FROM ENBONUSLIST " +
     ", ENDEPARTMENT " +
     ", FINWORKERKIND " +
     ", ENBONUSLISTSTATUS " +
     //" WHERE "
  "";
     whereStr = " ENDEPARTMENT.CODE = ENBONUSLIST.DEPARTMENTCODE" ; //+
      whereStr = whereStr +" AND FINWORKERKIND.CODE = ENBONUSLIST.KINDREFCODE" ; //+
      whereStr = whereStr +" AND ENBONUSLISTSTATUS.CODE = ENBONUSLIST.STATUSCODE" ; //+
    //selectStr = selectStr + " ${s} ENBONUSLIST.CODE IN ( SELECT ENBONUSLIST.CODE FROM ENBONUSLIST ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.CODE = ?";
        }
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENBONUSLIST.NUMBERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENBONUSLIST.NUMBERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.monthGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.MONTHGEN = ?";
        }
        if(aFilterObject.yearGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.YEARGEN = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENBONUSLIST.USERADD) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENBONUSLIST.USERADD) LIKE UPPER(?)";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENBONUSLIST.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENBONUSLIST.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.MODIFY_TIME = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENBONUSLIST.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENBONUSLIST.KINDREFCODE = ? ";
        }
        if(aFilterObject.status.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENBONUSLIST.STATUSCODE = ? ";
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

           if(aFilterObject.numberGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numberGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.monthGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.monthGen);
         }
         if(aFilterObject.yearGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearGen);
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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
       }
       if(aFilterObject.status.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.status.code);
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

        anObject = new ENBonusListShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.numberGen = set.getString(2);
        anObject.monthGen = set.getInt(3);
        if ( set.wasNull() )
            anObject.monthGen = Integer.MIN_VALUE;
        anObject.yearGen = set.getInt(4);
        if ( set.wasNull() )
            anObject.yearGen = Integer.MIN_VALUE;
        anObject.userAdd = set.getString(5);
        anObject.dateAdd = set.getTimestamp(6);
        anObject.userGen = set.getString(7);
        anObject.dateEdit = set.getTimestamp(8);

        anObject.departmentCode = set.getInt(9);
    if(set.wasNull())
      anObject.departmentCode = Integer.MIN_VALUE;
        anObject.departmentShortName = set.getString(10);
        anObject.departmentDateStart = set.getDate(11);
        anObject.departmentDateFinal = set.getDate(12);
        anObject.departmentRenCode = set.getInt(13);
    if(set.wasNull())
      anObject.departmentRenCode = Integer.MIN_VALUE;
        anObject.departmentShpzBalans = set.getString(14);
        anObject.departmentKau_table_id_1884 = set.getInt(15);
    if(set.wasNull())
      anObject.departmentKau_table_id_1884 = Integer.MIN_VALUE;
        anObject.departmentKau_1884 = set.getString(16);
        anObject.departmentName_1884 = set.getString(17);
        anObject.departmentHrmorganizationid = set.getString(18);
        anObject.kindRefCode = set.getInt(19);
    if(set.wasNull())
      anObject.kindRefCode = Integer.MIN_VALUE;
        anObject.kindRefName = set.getString(20);
        anObject.statusCode = set.getInt(21);
    if(set.wasNull())
      anObject.statusCode = Integer.MIN_VALUE;
        anObject.statusName = set.getString(22);

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

  public int[] getFilteredCodeArrayOLD(ENBonusList aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENBONUSLIST.CODE FROM ENBONUSLIST";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENBONUSLIST.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.CODE = ?";
        }
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBONUSLIST.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENBONUSLIST.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.monthGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.MONTHGEN = ?";
        }
        if(aFilterObject.yearGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.YEARGEN = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBONUSLIST.USERADD = ?";
             else
                 whereStr = whereStr + "  ENBONUSLIST.USERADD LIKE ?";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBONUSLIST.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENBONUSLIST.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.MODIFY_TIME = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENBONUSLIST.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENBONUSLIST.KINDREFCODE = ? ";
        }
        if(aFilterObject.status.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENBONUSLIST.STATUSCODE = ? ";
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
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENBONUSLIST.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENBONUSLIST.NUMBERGEN LIKE ?";

           if(aFilterObject.numberGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numberGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.monthGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.monthGen);
         }
         if(aFilterObject.yearGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearGen);
         }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENBONUSLIST.USERADD = ?";
             else
                 whereStr = whereStr + " ENBONUSLIST.USERADD LIKE ?";

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
                 whereStr = whereStr + " ENBONUSLIST.USERGEN = ?";
             else
                 whereStr = whereStr + " ENBONUSLIST.USERGEN LIKE ?";

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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
       }
       if(aFilterObject.status.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.status.code);
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

  public int[] getFilteredCodeArray(ENBonusListFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENBonusList aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENBONUSLIST.CODE FROM ENBONUSLIST";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENBONUSLIST.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.CODE = ?";
        }
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBONUSLIST.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENBONUSLIST.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.monthGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.MONTHGEN = ?";
        }
        if(aFilterObject.yearGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.YEARGEN = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBONUSLIST.USERADD = ?";
             else
                 whereStr = whereStr + "  ENBONUSLIST.USERADD LIKE ?";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENBONUSLIST.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENBONUSLIST.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENBONUSLIST.MODIFY_TIME = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENBONUSLIST.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENBONUSLIST.KINDREFCODE = ? ";
        }
        if(aFilterObject.status.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENBONUSLIST.STATUSCODE = ? ";
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
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENBONUSLIST.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENBONUSLIST.NUMBERGEN LIKE ?";

           if(aFilterObject.numberGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numberGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.monthGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.monthGen);
         }
         if(aFilterObject.yearGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearGen);
         }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENBONUSLIST.USERADD = ?";
             else
                 whereStr = whereStr + " ENBONUSLIST.USERADD LIKE ?";

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
                 whereStr = whereStr + " ENBONUSLIST.USERGEN = ?";
             else
                 whereStr = whereStr + " ENBONUSLIST.USERGEN LIKE ?";

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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
       }
       if(aFilterObject.status.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.status.code);
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


   public ENBonusList getObject(int uid) throws PersistenceException
   {
    ENBonusList result = new ENBonusList();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENBonusList anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENBONUSLIST.CODE, ENBONUSLIST.NUMBERGEN, ENBONUSLIST.MONTHGEN, ENBONUSLIST.YEARGEN, ENBONUSLIST.USERADD, ENBONUSLIST.DATEADD, ENBONUSLIST.USERGEN, ENBONUSLIST.DATEEDIT, ENBONUSLIST.MODIFY_TIME, ENBONUSLIST.DEPARTMENTCODE, ENBONUSLIST.KINDREFCODE, ENBONUSLIST.STATUSCODE "
    +" FROM ENBONUSLIST WHERE ENBONUSLIST.CODE = ?";

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
        anObject.numberGen = set.getString(2);
        anObject.monthGen = set.getInt(3);
        if ( set.wasNull() )
           anObject.monthGen = Integer.MIN_VALUE;
        anObject.yearGen = set.getInt(4);
        if ( set.wasNull() )
           anObject.yearGen = Integer.MIN_VALUE;
        anObject.userAdd = set.getString(5);
        anObject.dateAdd = set.getTimestamp(6);
        anObject.userGen = set.getString(7);
        anObject.dateEdit = set.getTimestamp(8);
        anObject.modify_time = set.getLong(9);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.department.code = set.getInt(10);
        if ( set.wasNull() )
            anObject.department.code = Integer.MIN_VALUE;
        anObject.kindRef.code = set.getInt(11);
        if ( set.wasNull() )
            anObject.kindRef.code = Integer.MIN_VALUE;
        anObject.status.code = set.getInt(12);
        if ( set.wasNull() )
            anObject.status.code = Integer.MIN_VALUE;
        if(anObject.department.code != Integer.MIN_VALUE)
        {
           anObject.setDepartment(
      new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.department.code));
    }
        if(anObject.kindRef.code != Integer.MIN_VALUE)
        {
           anObject.setKindRef(
      new com.ksoe.energynet.dataminer.generated.FINWorkerKindDAOGen(connection,getUserProfile()).getRef(anObject.kindRef.code));
    }
        if(anObject.status.code != Integer.MIN_VALUE)
        {
           anObject.setStatus(
      new com.ksoe.energynet.dataminer.generated.ENBonusListStatusDAOGen(connection,getUserProfile()).getRef(anObject.status.code));
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


  public com.ksoe.energynet.valueobject.references.ENBonusListRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENBonusListRef ref = new com.ksoe.energynet.valueobject.references.ENBonusListRef();
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

    selectStr = "DELETE FROM  ENBONUSLIST WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENBonusList object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENBonusList.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENBonusList.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENBonusList.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENBonusList.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENBonusList.getObject%} access denied");

    selectStr =

    "SELECT  ENBONUSLIST.CODE FROM  ENBONUSLIST WHERE  ENBONUSLIST.CODE = ?";
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
    _checkConditionToken(condition,"code","ENBONUSLIST.CODE");
    _checkConditionToken(condition,"numbergen","ENBONUSLIST.NUMBERGEN");
    _checkConditionToken(condition,"monthgen","ENBONUSLIST.MONTHGEN");
    _checkConditionToken(condition,"yeargen","ENBONUSLIST.YEARGEN");
    _checkConditionToken(condition,"useradd","ENBONUSLIST.USERADD");
    _checkConditionToken(condition,"dateadd","ENBONUSLIST.DATEADD");
    _checkConditionToken(condition,"usergen","ENBONUSLIST.USERGEN");
    _checkConditionToken(condition,"dateedit","ENBONUSLIST.DATEEDIT");
    _checkConditionToken(condition,"modify_time","ENBONUSLIST.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"department","DEPARTMENTCODE");
    _checkConditionToken(condition,"department.code","DEPARTMENTCODE");
    _checkConditionToken(condition,"kindref","KINDREFCODE");
    _checkConditionToken(condition,"kindref.code","KINDREFCODE");
    _checkConditionToken(condition,"status","STATUSCODE");
    _checkConditionToken(condition,"status.code","STATUSCODE");
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

  private void _collectAutoIncrementFields(ENBonusList anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENBONUSLIST", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENBONUSLIST", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENBONUSLIST", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENBONUSLIST");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENBonusListDAO
