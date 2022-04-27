
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
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

import com.ksoe.energynet.valueobject.ENChangePersonByt;
import com.ksoe.energynet.valueobject.filter.ENChangePersonBytFilter;
import com.ksoe.energynet.valueobject.brief.ENChangePersonBytShort;
import com.ksoe.energynet.valueobject.lists.ENChangePersonBytShortList;


/**
 * DAO Object for ENChangePersonByt;
 *
 */

public class ENChangePersonBytDAOGen extends GenericDataMiner {

   public ENChangePersonBytDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENChangePersonBytDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(ENChangePersonByt inObject) throws PersistenceException
   {
      ENChangePersonByt obj = new ENChangePersonByt();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.fio == null && obj.fio == null){}
	else
		if(inObject.fio == null || obj.fio == null) return false;
		else
			if ( ! inObject.fio.equals(obj.fio)){
				return false;
			}

	if(inObject.accountNumber == null && obj.accountNumber == null){}
	else
		if(inObject.accountNumber == null || obj.accountNumber == null) return false;
		else
			if ( ! inObject.accountNumber.equals(obj.accountNumber)){
				return false;
			}

     if (inObject.packCode != obj.packCode){
				return false;
			}

	if(inObject.registrationNumber == null && obj.registrationNumber == null){}
	else
		if(inObject.registrationNumber == null || obj.registrationNumber == null) return false;
		else
			if ( ! inObject.registrationNumber.equals(obj.registrationNumber)){
				return false;
			}

	if(inObject.registrationDate == null && obj.registrationDate == null){}
	else
		if(inObject.registrationDate == null || obj.registrationDate == null) return false;
		else
			if (inObject.registrationDate.compareTo(obj.registrationDate) != 0){
				return false;
			}
     if (inObject.planRef.code != obj.planRef.code){
        return false;
     }
      return true;
   }

   public int add(ENChangePersonByt anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENChangePersonByt anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENCHANGEPERSONBYT (CODE,FIO,ACCOUNTNUMBER,PACKCODE,REGISTRATIONNUMBER,REGISTRATIONDATE,MODIFY_TIME,PLANREFCODE) VALUES (?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.fio);
      statement.setString(3,anObject.accountNumber);
      if (anObject.packCode != Integer.MIN_VALUE )
         statement.setInt(4,anObject.packCode);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      statement.setString(5,anObject.registrationNumber);
      if (anObject.registrationDate == null)
        statement.setDate(6,null);
      else
        statement.setDate(6,new java.sql.Date(anObject.registrationDate.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(7,null);
      else
        statement.setBigDecimal(7,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.planRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENChangePersonByt.planRef.code%} = {%"+anObject.planRef.code+"%}");
        statement.setInt(8,anObject.planRef.code);
      }
      else
        statement.setNull(8,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENChangePersonBytDAOGen.add%}",e);
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

   public void save(ENChangePersonByt anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENChangePersonByt anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENChangePersonByt oldObject = new ENChangePersonByt();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENChangePersonByt.modify_time_Field+" FROM  ENCHANGEPERSONBYT WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("FIO") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ACCOUNTNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PACKCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("REGISTRATIONNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("REGISTRATIONDATE") == 0)
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
         }
       if(fields.size() == 0)
         return;
       }
      if(fields == null)
       {
        selectStr =
        "UPDATE ENCHANGEPERSONBYT SET  FIO = ? , ACCOUNTNUMBER = ? , PACKCODE = ? , REGISTRATIONNUMBER = ? , REGISTRATIONDATE = ? , MODIFY_TIME = ? , PLANREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENCHANGEPERSONBYT SET ";
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
      statement.setString(1,anObject.fio);
      statement.setString(2,anObject.accountNumber);
      if (anObject.packCode != Integer.MIN_VALUE )
         statement.setInt(3,anObject.packCode);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      statement.setString(4,anObject.registrationNumber);
      if (anObject.registrationDate == null)
        statement.setDate(5,null);
      else
        statement.setDate(5,new java.sql.Date(anObject.registrationDate.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(6,null);
      else
        statement.setBigDecimal(6,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.planRef.code != Integer.MIN_VALUE)
        statement.setInt(7,anObject.planRef.code);
      else
        statement.setNull(7,java.sql.Types.INTEGER);
          statement.setInt(8,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("FIO".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.fio);
                continue;
             }
            if("ACCOUNTNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.accountNumber);
                continue;
             }
            if("PACKCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.packCode);
                continue;
             }
            if("REGISTRATIONNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.registrationNumber);
                continue;
             }
            if("REGISTRATIONDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.registrationDate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.registrationDate.getTime()));
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

   } // end of save(ENChangePersonByt anObject,String[] anAttributes)


 public ENChangePersonBytShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENChangePersonByt filterObject = new ENChangePersonByt();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENChangePersonBytShort)list.get(0);
   return null;
  }

  public ENChangePersonBytShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENChangePersonBytShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENChangePersonBytShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENChangePersonBytShortList getFilteredList(ENChangePersonByt filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENChangePersonBytShortList getScrollableFilteredList(ENChangePersonByt aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENChangePersonBytShortList getScrollableFilteredList(ENChangePersonByt aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENChangePersonBytShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENChangePersonBytShortList getScrollableFilteredList(ENChangePersonBytFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENChangePersonBytShortList getScrollableFilteredList(ENChangePersonBytFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENChangePersonBytShortList getScrollableFilteredList(ENChangePersonByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENChangePersonBytShortList getScrollableFilteredList(ENChangePersonByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENChangePersonBytShortList result = new ENChangePersonBytShortList();
    ENChangePersonBytShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCHANGEPERSONBYT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENCHANGEPERSONBYT.CODE"+
     ",ENCHANGEPERSONBYT.FIO"+
     ",ENCHANGEPERSONBYT.ACCOUNTNUMBER"+
     ",ENCHANGEPERSONBYT.PACKCODE"+
     ",ENCHANGEPERSONBYT.REGISTRATIONNUMBER"+
     ",ENCHANGEPERSONBYT.REGISTRATIONDATE"+

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
     " FROM ENCHANGEPERSONBYT " +
     ", ENPLANWORK " +
     //" WHERE "
  "";
     whereStr = " ENPLANWORK.CODE = ENCHANGEPERSONBYT.PLANREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENCHANGEPERSONBYT.CODE IN ( SELECT ENCHANGEPERSONBYT.CODE FROM ENCHANGEPERSONBYT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHANGEPERSONBYT.CODE = ?";
        }
         if (aFilterObject.fio != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.fio.indexOf('*',0) < 0 && aFilterObject.fio.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCHANGEPERSONBYT.FIO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCHANGEPERSONBYT.FIO) LIKE UPPER(?)";
         }
         if (aFilterObject.accountNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.accountNumber.indexOf('*',0) < 0 && aFilterObject.accountNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCHANGEPERSONBYT.ACCOUNTNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCHANGEPERSONBYT.ACCOUNTNUMBER) LIKE UPPER(?)";
         }
        if(aFilterObject.packCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHANGEPERSONBYT.PACKCODE = ?";
        }
         if (aFilterObject.registrationNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.registrationNumber.indexOf('*',0) < 0 && aFilterObject.registrationNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCHANGEPERSONBYT.REGISTRATIONNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCHANGEPERSONBYT.REGISTRATIONNUMBER) LIKE UPPER(?)";
         }
        if(aFilterObject.registrationDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHANGEPERSONBYT.REGISTRATIONDATE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHANGEPERSONBYT.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCHANGEPERSONBYT.PLANREFCODE = ? ";
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

           if(aFilterObject.fio != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.fio);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.accountNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.accountNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.packCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.packCode);
         }

           if(aFilterObject.registrationNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.registrationNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.registrationDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.registrationDate.getTime()));
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

        anObject = new ENChangePersonBytShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.fio = set.getString(2);
        anObject.accountNumber = set.getString(3);
        anObject.packCode = set.getInt(4);
        if ( set.wasNull() )
            anObject.packCode = Integer.MIN_VALUE;
        anObject.registrationNumber = set.getString(5);
        anObject.registrationDate = set.getDate(6);

        anObject.planRefCode = set.getInt(7);
    if(set.wasNull())
      anObject.planRefCode = Integer.MIN_VALUE;
        anObject.planRefDateGen = set.getTimestamp(8);
        anObject.planRefDateStart = set.getDate(9);
        anObject.planRefDateFinal = set.getDate(10);
        anObject.planRefYearGen = set.getInt(11);
    if(set.wasNull())
      anObject.planRefYearGen = Integer.MIN_VALUE;
        anObject.planRefMonthGen = set.getInt(12);
    if(set.wasNull())
      anObject.planRefMonthGen = Integer.MIN_VALUE;
        anObject.planRefYearOriginal = set.getInt(13);
    if(set.wasNull())
      anObject.planRefYearOriginal = Integer.MIN_VALUE;
        anObject.planRefMonthOriginal = set.getInt(14);
    if(set.wasNull())
      anObject.planRefMonthOriginal = Integer.MIN_VALUE;
        anObject.planRefUserGen = set.getString(15);
        anObject.planRefDateEdit = set.getDate(16);
        anObject.planRefWorkOrderNumber = set.getString(17);
        anObject.planRefDateWorkOrder = set.getDate(18);
        anObject.planRefPriConnectionNumber = set.getString(19);
        anObject.planRefDateEndPriConnection = set.getDate(20);
        anObject.planRefInvestWorksDescription = set.getString(21);
        anObject.planRefServicesFSideFinId = set.getInt(22);
    if(set.wasNull())
      anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
        anObject.planRefServicesFSideCnNum = set.getString(23);
        anObject.planRefTotalTimeHours = set.getBigDecimal(24);
        if(anObject.planRefTotalTimeHours != null)
          anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planRefTotalTimeDays = set.getBigDecimal(25);
        if(anObject.planRefTotalTimeDays != null)
          anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planRefInvestItemNumber = set.getString(26);

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

  public int[] getFilteredCodeArrayOLD(ENChangePersonByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCHANGEPERSONBYT.CODE FROM ENCHANGEPERSONBYT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCHANGEPERSONBYT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHANGEPERSONBYT.CODE = ?";
        }
         if (aFilterObject.fio != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.fio.indexOf('*',0) < 0 && aFilterObject.fio.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCHANGEPERSONBYT.FIO = ?";
             else
                 whereStr = whereStr + "  ENCHANGEPERSONBYT.FIO LIKE ?";
         }
         if (aFilterObject.accountNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.accountNumber.indexOf('*',0) < 0 && aFilterObject.accountNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCHANGEPERSONBYT.ACCOUNTNUMBER = ?";
             else
                 whereStr = whereStr + "  ENCHANGEPERSONBYT.ACCOUNTNUMBER LIKE ?";
         }
        if(aFilterObject.packCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHANGEPERSONBYT.PACKCODE = ?";
        }
         if (aFilterObject.registrationNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.registrationNumber.indexOf('*',0) < 0 && aFilterObject.registrationNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCHANGEPERSONBYT.REGISTRATIONNUMBER = ?";
             else
                 whereStr = whereStr + "  ENCHANGEPERSONBYT.REGISTRATIONNUMBER LIKE ?";
         }
        if(aFilterObject.registrationDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHANGEPERSONBYT.REGISTRATIONDATE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHANGEPERSONBYT.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCHANGEPERSONBYT.PLANREFCODE = ? ";
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
         if (aFilterObject.fio != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.fio.indexOf('*',0) < 0 && aFilterObject.fio.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCHANGEPERSONBYT.FIO = ?";
             else
                 whereStr = whereStr + " ENCHANGEPERSONBYT.FIO LIKE ?";

           if(aFilterObject.fio != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.fio);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.accountNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.accountNumber.indexOf('*',0) < 0 && aFilterObject.accountNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCHANGEPERSONBYT.ACCOUNTNUMBER = ?";
             else
                 whereStr = whereStr + " ENCHANGEPERSONBYT.ACCOUNTNUMBER LIKE ?";

           if(aFilterObject.accountNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.accountNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.packCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.packCode);
         }
         if (aFilterObject.registrationNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.registrationNumber.indexOf('*',0) < 0 && aFilterObject.registrationNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCHANGEPERSONBYT.REGISTRATIONNUMBER = ?";
             else
                 whereStr = whereStr + " ENCHANGEPERSONBYT.REGISTRATIONNUMBER LIKE ?";

           if(aFilterObject.registrationNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.registrationNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.registrationDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.registrationDate.getTime()));
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

  public int[] getFilteredCodeArray(ENChangePersonBytFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENChangePersonByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCHANGEPERSONBYT.CODE FROM ENCHANGEPERSONBYT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCHANGEPERSONBYT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHANGEPERSONBYT.CODE = ?";
        }
         if (aFilterObject.fio != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.fio.indexOf('*',0) < 0 && aFilterObject.fio.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCHANGEPERSONBYT.FIO = ?";
             else
                 whereStr = whereStr + "  ENCHANGEPERSONBYT.FIO LIKE ?";
         }
         if (aFilterObject.accountNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.accountNumber.indexOf('*',0) < 0 && aFilterObject.accountNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCHANGEPERSONBYT.ACCOUNTNUMBER = ?";
             else
                 whereStr = whereStr + "  ENCHANGEPERSONBYT.ACCOUNTNUMBER LIKE ?";
         }
        if(aFilterObject.packCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHANGEPERSONBYT.PACKCODE = ?";
        }
         if (aFilterObject.registrationNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.registrationNumber.indexOf('*',0) < 0 && aFilterObject.registrationNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCHANGEPERSONBYT.REGISTRATIONNUMBER = ?";
             else
                 whereStr = whereStr + "  ENCHANGEPERSONBYT.REGISTRATIONNUMBER LIKE ?";
         }
        if(aFilterObject.registrationDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHANGEPERSONBYT.REGISTRATIONDATE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHANGEPERSONBYT.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCHANGEPERSONBYT.PLANREFCODE = ? ";
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
         if (aFilterObject.fio != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.fio.indexOf('*',0) < 0 && aFilterObject.fio.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCHANGEPERSONBYT.FIO = ?";
             else
                 whereStr = whereStr + " ENCHANGEPERSONBYT.FIO LIKE ?";

           if(aFilterObject.fio != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.fio);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.accountNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.accountNumber.indexOf('*',0) < 0 && aFilterObject.accountNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCHANGEPERSONBYT.ACCOUNTNUMBER = ?";
             else
                 whereStr = whereStr + " ENCHANGEPERSONBYT.ACCOUNTNUMBER LIKE ?";

           if(aFilterObject.accountNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.accountNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.packCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.packCode);
         }
         if (aFilterObject.registrationNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.registrationNumber.indexOf('*',0) < 0 && aFilterObject.registrationNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCHANGEPERSONBYT.REGISTRATIONNUMBER = ?";
             else
                 whereStr = whereStr + " ENCHANGEPERSONBYT.REGISTRATIONNUMBER LIKE ?";

           if(aFilterObject.registrationNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.registrationNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.registrationDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.registrationDate.getTime()));
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


   public ENChangePersonByt getObject(int uid) throws PersistenceException
   {
    ENChangePersonByt result = new ENChangePersonByt();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENChangePersonByt anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENCHANGEPERSONBYT.CODE, ENCHANGEPERSONBYT.FIO, ENCHANGEPERSONBYT.ACCOUNTNUMBER, ENCHANGEPERSONBYT.PACKCODE, ENCHANGEPERSONBYT.REGISTRATIONNUMBER, ENCHANGEPERSONBYT.REGISTRATIONDATE, ENCHANGEPERSONBYT.MODIFY_TIME, ENCHANGEPERSONBYT.PLANREFCODE "
    +" FROM ENCHANGEPERSONBYT WHERE ENCHANGEPERSONBYT.CODE = ?";

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
        anObject.fio = set.getString(2);
        anObject.accountNumber = set.getString(3);
        anObject.packCode = set.getInt(4);
        if ( set.wasNull() )
           anObject.packCode = Integer.MIN_VALUE;
        anObject.registrationNumber = set.getString(5);
        anObject.registrationDate = set.getDate(6);
        anObject.modify_time = set.getLong(7);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.planRef.code = set.getInt(8);
        if ( set.wasNull() )
            anObject.planRef.code = Integer.MIN_VALUE;
        if(anObject.planRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlanRef(
      new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENChangePersonBytRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENChangePersonBytRef ref = new com.ksoe.energynet.valueobject.references.ENChangePersonBytRef();
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

    selectStr = "DELETE FROM  ENCHANGEPERSONBYT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENChangePersonByt object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENChangePersonByt.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENChangePersonByt.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENChangePersonByt.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENChangePersonByt.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENChangePersonByt.getObject%} access denied");

    selectStr =

    "SELECT  ENCHANGEPERSONBYT.CODE FROM  ENCHANGEPERSONBYT WHERE  ENCHANGEPERSONBYT.CODE = ?";
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
    _checkConditionToken(condition,"code","ENCHANGEPERSONBYT.CODE");
    _checkConditionToken(condition,"fio","ENCHANGEPERSONBYT.FIO");
    _checkConditionToken(condition,"accountnumber","ENCHANGEPERSONBYT.ACCOUNTNUMBER");
    _checkConditionToken(condition,"packcode","ENCHANGEPERSONBYT.PACKCODE");
    _checkConditionToken(condition,"registrationnumber","ENCHANGEPERSONBYT.REGISTRATIONNUMBER");
    _checkConditionToken(condition,"registrationdate","ENCHANGEPERSONBYT.REGISTRATIONDATE");
    _checkConditionToken(condition,"modify_time","ENCHANGEPERSONBYT.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"planref","PLANREFCODE");
    _checkConditionToken(condition,"planref.code","PLANREFCODE");
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

  private void _collectAutoIncrementFields(ENChangePersonByt anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENCHANGEPERSONBYT", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENCHANGEPERSONBYT", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENCHANGEPERSONBYT", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENCHANGEPERSONBYT");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENChangePersonBytDAO
