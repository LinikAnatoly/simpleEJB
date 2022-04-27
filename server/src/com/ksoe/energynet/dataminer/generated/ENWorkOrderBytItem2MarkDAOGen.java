
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

import com.ksoe.energynet.valueobject.ENWorkOrderBytItem2Mark;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytItem2MarkFilter;
import com.ksoe.energynet.valueobject.brief.ENWorkOrderBytItem2MarkShort;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytItem2MarkShortList;


/**
 * DAO Object for ENWorkOrderBytItem2Mark;
 *
 */

public class ENWorkOrderBytItem2MarkDAOGen extends GenericDataMiner {

   public ENWorkOrderBytItem2MarkDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENWorkOrderBytItem2MarkDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(ENWorkOrderBytItem2Mark inObject) throws PersistenceException
   {
      ENWorkOrderBytItem2Mark obj = new ENWorkOrderBytItem2Mark();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.markCode != obj.markCode){
				return false;
			}

	if(inObject.markName == null && obj.markName == null){}
	else
		if(inObject.markName == null || obj.markName == null) return false;
		else
			if ( ! inObject.markName.equals(obj.markName)){
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
     if (inObject.workOrderBytItemRef.code != obj.workOrderBytItemRef.code){
        return false;
     }
      return true;
   }

   public int add(ENWorkOrderBytItem2Mark anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENWorkOrderBytItem2Mark anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENWORKORDERBYTITEM2MRK (CODE,MARKCODE,MARKNAME,MODIFY_TIME,USERADD,DATEADD,USERGEN,DATEEDIT,WORKORDERBYTITEMREFCOD) VALUES (?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.markCode != Integer.MIN_VALUE )
         statement.setInt(2,anObject.markCode);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      statement.setString(3,anObject.markName);
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
      if (anObject.workOrderBytItemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENWorkOrderBytItemDAOGen(connection,getUserProfile()).exists(anObject.workOrderBytItemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem2Mark.workOrderBytItemRef.code%} = {%"+anObject.workOrderBytItemRef.code+"%}");
        statement.setInt(9,anObject.workOrderBytItemRef.code);
      }
      else
        statement.setNull(9,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENWorkOrderBytItem2MarkDAOGen.add%}",e);
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

   public void save(ENWorkOrderBytItem2Mark anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENWorkOrderBytItem2Mark anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENWorkOrderBytItem2Mark oldObject = new ENWorkOrderBytItem2Mark();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENWorkOrderBytItem2Mark.modify_time_Field+" FROM  ENWORKORDERBYTITEM2MRK WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("MARKCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MARKNAME") == 0)
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
          if(fieldNameStr.compareTo("WORKORDERBYTITEMREF") == 0)
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
        "UPDATE ENWORKORDERBYTITEM2MRK SET  MARKCODE = ? , MARKNAME = ? , MODIFY_TIME = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , WORKORDERBYTITEMREFCOD = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENWORKORDERBYTITEM2MARK SET ";
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
      if (anObject.markCode != Integer.MIN_VALUE )
         statement.setInt(1,anObject.markCode);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.markName);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(3,null);
      else
        statement.setBigDecimal(3,new java.math.BigDecimal(anObject.modify_time));
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
      if (anObject.workOrderBytItemRef.code != Integer.MIN_VALUE)
        statement.setInt(8,anObject.workOrderBytItemRef.code);
      else
        statement.setNull(8,java.sql.Types.INTEGER);
          statement.setInt(9,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("MARKCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.markCode);
                continue;
             }
            if("MARKNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.markName);
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
            if("WORKORDERBYTITEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.workOrderBytItemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.workOrderBytItemRef.code);
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

   } // end of save(ENWorkOrderBytItem2Mark anObject,String[] anAttributes)


 public ENWorkOrderBytItem2MarkShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENWorkOrderBytItem2Mark filterObject = new ENWorkOrderBytItem2Mark();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENWorkOrderBytItem2MarkShort)list.get(0);
   return null;
  }

  public ENWorkOrderBytItem2MarkShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENWorkOrderBytItem2MarkShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENWorkOrderBytItem2MarkShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENWorkOrderBytItem2MarkShortList getFilteredList(ENWorkOrderBytItem2Mark filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENWorkOrderBytItem2MarkShortList getScrollableFilteredList(ENWorkOrderBytItem2Mark aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENWorkOrderBytItem2MarkShortList getScrollableFilteredList(ENWorkOrderBytItem2Mark aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENWorkOrderBytItem2MarkShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENWorkOrderBytItem2MarkShortList getScrollableFilteredList(ENWorkOrderBytItem2MarkFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENWorkOrderBytItem2MarkShortList getScrollableFilteredList(ENWorkOrderBytItem2MarkFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENWorkOrderBytItem2MarkShortList getScrollableFilteredList(ENWorkOrderBytItem2Mark aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENWorkOrderBytItem2MarkShortList getScrollableFilteredList(ENWorkOrderBytItem2Mark aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENWorkOrderBytItem2MarkShortList result = new ENWorkOrderBytItem2MarkShortList();
    ENWorkOrderBytItem2MarkShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENWORKORDERBYTITEM2MRK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENWORKORDERBYTITEM2MRK.CODE"+
     ",ENWORKORDERBYTITEM2MRK.MARKCODE"+
     ",ENWORKORDERBYTITEM2MRK.MARKNAME"+
     ",ENWORKORDERBYTITEM2MRK.USERADD"+
     ",ENWORKORDERBYTITEM2MRK.DATEADD"+
     ",ENWORKORDERBYTITEM2MRK.USERGEN"+
     ",ENWORKORDERBYTITEM2MRK.DATEEDIT"+

      ", ENWORKORDERBYTITEM.CODE " +
      ", ENWORKORDERBYTITEM.CONTRACTNUMBERSERVICES " +
      ", ENWORKORDERBYTITEM.ACCOUNTNUMBER " +
      ", ENWORKORDERBYTITEM.NAME " +
      ", ENWORKORDERBYTITEM.CUSTOMERNAME " +
      ", ENWORKORDERBYTITEM.ADDRESS " +
      ", ENWORKORDERBYTITEM.INVNUMBER " +
      ", ENWORKORDERBYTITEM.SERIALNUMBER " +
      ", ENWORKORDERBYTITEM.SEAL " +
      ", ENWORKORDERBYTITEM.PHONE " +
      ", ENWORKORDERBYTITEM.STATUSCODE " +
      ", ENWORKORDERBYTITEM.RPCODE " +
      ", ENWORKORDERBYTITEM.DATECOUNTERINST " +
      ", ENWORKORDERBYTITEM.DATECOUNTERCHECK " +
      ", ENWORKORDERBYTITEM.COUNTERTYPE " +
      ", ENWORKORDERBYTITEM.CLASSACCURACY " +
      ", ENWORKORDERBYTITEM.CHECKPERIOD " +
      ", ENWORKORDERBYTITEM.RPSTATUSCODE " +
      ", ENWORKORDERBYTITEM.PHASITY " +
      ", ENWORKORDERBYTITEM.DATECHECK " +
      ", ENWORKORDERBYTITEM.CHECKPERIOD1 " +
      ", ENWORKORDERBYTITEM.PLACECOUNTER " +
      ", ENWORKORDERBYTITEM.RPISWORKING " +
      ", ENWORKORDERBYTITEM.RECORDPOINTNAME " +
      ", ENWORKORDERBYTITEM.ROUTEBYTNAME " +
      ", ENWORKORDERBYTITEM.ROUTEBYTNUMBERGEN " +
      ", ENWORKORDERBYTITEM.COMMENTGEN " +
      ", ENWORKORDERBYTITEM.DATEADD " +
      ", ENWORKORDERBYTITEM.DATEEDIT " +
      ", ENWORKORDERBYTITEM.USERADD " +
      ", ENWORKORDERBYTITEM.USEREDIT " +
     " FROM ENWORKORDERBYTITEM2MRK " +
     ", ENWORKORDERBYTITEM " +
     //" WHERE "
  "";
     whereStr = " ENWORKORDERBYTITEM.CODE = ENWORKORDERBYTITEM2MRK.WORKORDERBYTITEMREFCOD" ; //+
    //selectStr = selectStr + " ${s} ENWORKORDERBYTITEM2MRK.CODE IN ( SELECT ENWORKORDERBYTITEM2MRK.CODE FROM ENWORKORDERBYTITEM2MRK ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.CODE = ?";
        }
        if(aFilterObject.markCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.MARKCODE = ?";
        }
         if (aFilterObject.markName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.markName.indexOf('*',0) < 0 && aFilterObject.markName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM2MRK.MARKNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM2MRK.MARKNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM2MRK.USERADD) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM2MRK.USERADD) LIKE UPPER(?)";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDERBYTITEM2MRK.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDERBYTITEM2MRK.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.DATEEDIT = ?";
        }
        if(aFilterObject.workOrderBytItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENWORKORDERBYTITEM2MRK.WORKORDERBYTITEMREFCOD = ? ";
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
         if(aFilterObject.markCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.markCode);
         }

           if(aFilterObject.markName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.markName);
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
       if(aFilterObject.workOrderBytItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrderBytItemRef.code);
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

        anObject = new ENWorkOrderBytItem2MarkShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.markCode = set.getInt(2);
        if ( set.wasNull() )
            anObject.markCode = Integer.MIN_VALUE;
        anObject.markName = set.getString(3);
        anObject.userAdd = set.getString(4);
        anObject.dateAdd = set.getTimestamp(5);
        anObject.userGen = set.getString(6);
        anObject.dateEdit = set.getTimestamp(7);

        anObject.workOrderBytItemRefCode = set.getInt(8);
    if(set.wasNull())
      anObject.workOrderBytItemRefCode = Integer.MIN_VALUE;
        anObject.workOrderBytItemRefContractNumberServices = set.getString(9);
        anObject.workOrderBytItemRefAccountNumber = set.getString(10);
        anObject.workOrderBytItemRefName = set.getString(11);
        anObject.workOrderBytItemRefCustomerName = set.getString(12);
        anObject.workOrderBytItemRefAddress = set.getString(13);
        anObject.workOrderBytItemRefInvNumber = set.getString(14);
        anObject.workOrderBytItemRefSerialNumber = set.getString(15);
        anObject.workOrderBytItemRefSeal = set.getString(16);
        anObject.workOrderBytItemRefPhone = set.getString(17);
        anObject.workOrderBytItemRefStatuscode = set.getInt(18);
    if(set.wasNull())
      anObject.workOrderBytItemRefStatuscode = Integer.MIN_VALUE;
        anObject.workOrderBytItemRefRpCode = set.getInt(19);
    if(set.wasNull())
      anObject.workOrderBytItemRefRpCode = Integer.MIN_VALUE;
        anObject.workOrderBytItemRefDateCounterInst = set.getDate(20);
        anObject.workOrderBytItemRefDateCounterCheck = set.getDate(21);
        anObject.workOrderBytItemRefCounterType = set.getString(22);
        anObject.workOrderBytItemRefClassAccuracy = set.getBigDecimal(23);
        if(anObject.workOrderBytItemRefClassAccuracy != null)
          anObject.workOrderBytItemRefClassAccuracy = anObject.workOrderBytItemRefClassAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.workOrderBytItemRefCheckperiod = set.getBigDecimal(24);
        if(anObject.workOrderBytItemRefCheckperiod != null)
          anObject.workOrderBytItemRefCheckperiod = anObject.workOrderBytItemRefCheckperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.workOrderBytItemRefRpStatusCode = set.getInt(25);
    if(set.wasNull())
      anObject.workOrderBytItemRefRpStatusCode = Integer.MIN_VALUE;
        anObject.workOrderBytItemRefPhasity = set.getBigDecimal(26);
        if(anObject.workOrderBytItemRefPhasity != null)
          anObject.workOrderBytItemRefPhasity = anObject.workOrderBytItemRefPhasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.workOrderBytItemRefDatecheck = set.getDate(27);
        anObject.workOrderBytItemRefCheckperiod1 = set.getBigDecimal(28);
        if(anObject.workOrderBytItemRefCheckperiod1 != null)
          anObject.workOrderBytItemRefCheckperiod1 = anObject.workOrderBytItemRefCheckperiod1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.workOrderBytItemRefPlacecounter = set.getString(29);
        anObject.workOrderBytItemRefRpIsWorking = set.getInt(30);
    if(set.wasNull())
      anObject.workOrderBytItemRefRpIsWorking = Integer.MIN_VALUE;
        anObject.workOrderBytItemRefRecordPointName = set.getString(31);
        anObject.workOrderBytItemRefRouteBytName = set.getString(32);
        anObject.workOrderBytItemRefRouteBytNumbergen = set.getString(33);
        anObject.workOrderBytItemRefCommentGen = set.getString(34);
        anObject.workOrderBytItemRefDateAdd = set.getTimestamp(35);
        anObject.workOrderBytItemRefDateEdit = set.getTimestamp(36);
        anObject.workOrderBytItemRefUserAdd = set.getString(37);
        anObject.workOrderBytItemRefUserEdit = set.getString(38);

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

  public int[] getFilteredCodeArrayOLD(ENWorkOrderBytItem2Mark aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENWORKORDERBYTITEM2MRK.CODE FROM ENWORKORDERBYTITEM2MRK";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENWORKORDERBYTITEM2MRK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.CODE = ?";
        }
        if(aFilterObject.markCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.MARKCODE = ?";
        }
         if (aFilterObject.markName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.markName.indexOf('*',0) < 0 && aFilterObject.markName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.MARKNAME = ?";
             else
                 whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.MARKNAME LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.USERADD = ?";
             else
                 whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.USERADD LIKE ?";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.DATEEDIT = ?";
        }
        if(aFilterObject.workOrderBytItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENWORKORDERBYTITEM2MRK.WORKORDERBYTITEMREFCOD = ? ";
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
         if(aFilterObject.markCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.markCode);
         }
         if (aFilterObject.markName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.markName.indexOf('*',0) < 0 && aFilterObject.markName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDERBYTITEM2MRK.MARKNAME = ?";
             else
                 whereStr = whereStr + " ENWORKORDERBYTITEM2MRK.MARKNAME LIKE ?";

           if(aFilterObject.markName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.markName);
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
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDERBYTITEM2MRK.USERADD = ?";
             else
                 whereStr = whereStr + " ENWORKORDERBYTITEM2MRK.USERADD LIKE ?";

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
                 whereStr = whereStr + " ENWORKORDERBYTITEM2MRK.USERGEN = ?";
             else
                 whereStr = whereStr + " ENWORKORDERBYTITEM2MRK.USERGEN LIKE ?";

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
       if(aFilterObject.workOrderBytItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrderBytItemRef.code);
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

  public int[] getFilteredCodeArray(ENWorkOrderBytItem2MarkFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENWorkOrderBytItem2Mark aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENWORKORDERBYTITEM2MRK.CODE FROM ENWORKORDERBYTITEM2MRK";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENWORKORDERBYTITEM2MRK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.CODE = ?";
        }
        if(aFilterObject.markCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.MARKCODE = ?";
        }
         if (aFilterObject.markName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.markName.indexOf('*',0) < 0 && aFilterObject.markName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.MARKNAME = ?";
             else
                 whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.MARKNAME LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.USERADD = ?";
             else
                 whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.USERADD LIKE ?";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDERBYTITEM2MRK.DATEEDIT = ?";
        }
        if(aFilterObject.workOrderBytItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENWORKORDERBYTITEM2MRK.WORKORDERBYTITEMREFCOD = ? ";
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
         if(aFilterObject.markCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.markCode);
         }
         if (aFilterObject.markName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.markName.indexOf('*',0) < 0 && aFilterObject.markName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDERBYTITEM2MRK.MARKNAME = ?";
             else
                 whereStr = whereStr + " ENWORKORDERBYTITEM2MRK.MARKNAME LIKE ?";

           if(aFilterObject.markName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.markName);
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
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDERBYTITEM2MRK.USERADD = ?";
             else
                 whereStr = whereStr + " ENWORKORDERBYTITEM2MRK.USERADD LIKE ?";

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
                 whereStr = whereStr + " ENWORKORDERBYTITEM2MRK.USERGEN = ?";
             else
                 whereStr = whereStr + " ENWORKORDERBYTITEM2MRK.USERGEN LIKE ?";

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
       if(aFilterObject.workOrderBytItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrderBytItemRef.code);
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


   public ENWorkOrderBytItem2Mark getObject(int uid) throws PersistenceException
   {
    ENWorkOrderBytItem2Mark result = new ENWorkOrderBytItem2Mark();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENWorkOrderBytItem2Mark anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENWORKORDERBYTITEM2MRK.CODE, ENWORKORDERBYTITEM2MRK.MARKCODE, ENWORKORDERBYTITEM2MRK.MARKNAME, ENWORKORDERBYTITEM2MRK.MODIFY_TIME, ENWORKORDERBYTITEM2MRK.USERADD, ENWORKORDERBYTITEM2MRK.DATEADD, ENWORKORDERBYTITEM2MRK.USERGEN, ENWORKORDERBYTITEM2MRK.DATEEDIT, ENWORKORDERBYTITEM2MRK.WORKORDERBYTITEMREFCOD "
    +" FROM ENWORKORDERBYTITEM2MRK WHERE ENWORKORDERBYTITEM2MRK.CODE = ?";

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
        anObject.markCode = set.getInt(2);
        if ( set.wasNull() )
           anObject.markCode = Integer.MIN_VALUE;
        anObject.markName = set.getString(3);
        anObject.modify_time = set.getLong(4);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.userAdd = set.getString(5);
        anObject.dateAdd = set.getTimestamp(6);
        anObject.userGen = set.getString(7);
        anObject.dateEdit = set.getTimestamp(8);
        anObject.workOrderBytItemRef.code = set.getInt(9);
        if ( set.wasNull() )
            anObject.workOrderBytItemRef.code = Integer.MIN_VALUE;
        if(anObject.workOrderBytItemRef.code != Integer.MIN_VALUE)
        {
           anObject.setWorkOrderBytItemRef(
      new com.ksoe.energynet.dataminer.generated.ENWorkOrderBytItemDAOGen(connection,getUserProfile()).getRef(anObject.workOrderBytItemRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENWorkOrderBytItem2MarkRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENWorkOrderBytItem2MarkRef ref = new com.ksoe.energynet.valueobject.references.ENWorkOrderBytItem2MarkRef();
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

    selectStr = "DELETE FROM  ENWORKORDERBYTITEM2MRK WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENWorkOrderBytItem2Mark object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENWorkOrderBytItem2Mark.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENWorkOrderBytItem2Mark.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENWorkOrderBytItem2Mark.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENWorkOrderBytItem2Mark.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENWorkOrderBytItem2Mark.getObject%} access denied");

    selectStr =

    "SELECT  ENWORKORDERBYTITEM2MRK.CODE FROM  ENWORKORDERBYTITEM2MRK WHERE  ENWORKORDERBYTITEM2MRK.CODE = ?";
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
    _checkConditionToken(condition,"code","ENWORKORDERBYTITEM2MRK.CODE");
    _checkConditionToken(condition,"markcode","ENWORKORDERBYTITEM2MRK.MARKCODE");
    _checkConditionToken(condition,"markname","ENWORKORDERBYTITEM2MRK.MARKNAME");
    _checkConditionToken(condition,"modify_time","ENWORKORDERBYTITEM2MRK.MODIFY_TIME");
    _checkConditionToken(condition,"useradd","ENWORKORDERBYTITEM2MRK.USERADD");
    _checkConditionToken(condition,"dateadd","ENWORKORDERBYTITEM2MRK.DATEADD");
    _checkConditionToken(condition,"usergen","ENWORKORDERBYTITEM2MRK.USERGEN");
    _checkConditionToken(condition,"dateedit","ENWORKORDERBYTITEM2MRK.DATEEDIT");
      // relationship conditions
    _checkConditionToken(condition,"workorderbytitemref","WORKORDERBYTITEMREFCOD");
    _checkConditionToken(condition,"workorderbytitemref.code","WORKORDERBYTITEMREFCOD");
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

  private void _collectAutoIncrementFields(ENWorkOrderBytItem2Mark anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENWORKORDERBYTITEM2MRK", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENWORKORDERBYTITEM2MRK", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENWORKORDERBYTITEM2MRK", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENWORKORDERBYTITEM2MRK");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENWorkOrderBytItem2MarkDAO
