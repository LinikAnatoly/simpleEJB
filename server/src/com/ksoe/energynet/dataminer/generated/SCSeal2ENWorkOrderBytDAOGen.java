
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

import com.ksoe.energynet.valueobject.SCSeal2ENWorkOrderByt;
import com.ksoe.energynet.valueobject.filter.SCSeal2ENWorkOrderBytFilter;
import com.ksoe.energynet.valueobject.brief.SCSeal2ENWorkOrderBytShort;
import com.ksoe.energynet.valueobject.lists.SCSeal2ENWorkOrderBytShortList;


/**
 * DAO Object for SCSeal2ENWorkOrderByt;
 *
 */

public class SCSeal2ENWorkOrderBytDAOGen extends GenericDataMiner {

   public SCSeal2ENWorkOrderBytDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public SCSeal2ENWorkOrderBytDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(SCSeal2ENWorkOrderByt inObject) throws PersistenceException
   {
      SCSeal2ENWorkOrderByt obj = new SCSeal2ENWorkOrderByt();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.commentGen == null && obj.commentGen == null){}
	else
		if(inObject.commentGen == null || obj.commentGen == null) return false;
		else
			if ( ! inObject.commentGen.equals(obj.commentGen)){
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
     if (inObject.sealRef.code != obj.sealRef.code){
        return false;
     }
     if (inObject.workOrderBytRef.code != obj.workOrderBytRef.code){
        return false;
     }
     if (inObject.workOrderBytItemRef.code != obj.workOrderBytItemRef.code){
        return false;
     }
     if (inObject.kindRef.code != obj.kindRef.code){
        return false;
     }
      return true;
   }

   public int add(SCSeal2ENWorkOrderByt anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(SCSeal2ENWorkOrderByt anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO SCSEAL2ENWORKORDERBYT (CODE,COMMENTGEN,MODIFY_TIME,USERADD,DATEADD,USERGEN,DATEEDIT,SEALREFCODE,WORKORDERBYTREFCODE,WORKORDERBYTITEMREFCOD,KINDREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.commentGen);
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
      if (anObject.sealRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.SCSealDAOGen(connection,getUserProfile()).exists(anObject.sealRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCSeal2ENWorkOrderByt.sealRef.code%} = {%"+anObject.sealRef.code+"%}");
        statement.setInt(8,anObject.sealRef.code);
      }
      else
        statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.workOrderBytRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENWorkOrderBytDAOGen(connection,getUserProfile()).exists(anObject.workOrderBytRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCSeal2ENWorkOrderByt.workOrderBytRef.code%} = {%"+anObject.workOrderBytRef.code+"%}");
        statement.setInt(9,anObject.workOrderBytRef.code);
      }
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.workOrderBytItemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENWorkOrderBytItemDAOGen(connection,getUserProfile()).exists(anObject.workOrderBytItemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCSeal2ENWorkOrderByt.workOrderBytItemRef.code%} = {%"+anObject.workOrderBytItemRef.code+"%}");
        statement.setInt(10,anObject.workOrderBytItemRef.code);
      }
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.kindRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.SCSeal2WorkOrderBytKindDAOGen(connection,getUserProfile()).exists(anObject.kindRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCSeal2ENWorkOrderByt.kindRef.code%} = {%"+anObject.kindRef.code+"%}");
        statement.setInt(11,anObject.kindRef.code);
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
      throw new PersistenceException("Error in method {%SCSeal2ENWorkOrderBytDAOGen.add%}",e);
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

   public void save(SCSeal2ENWorkOrderByt anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(SCSeal2ENWorkOrderByt anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      SCSeal2ENWorkOrderByt oldObject = new SCSeal2ENWorkOrderByt();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+SCSeal2ENWorkOrderByt.modify_time_Field+" FROM  SCSEAL2ENWORKORDERBYT WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("COMMENTGEN") == 0)
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
          if(fieldNameStr.compareTo("SEALREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("WORKORDERBYTREF") == 0)
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
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("KINDREF") == 0)
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
        "UPDATE SCSEAL2ENWORKORDERBYT SET  COMMENTGEN = ? , MODIFY_TIME = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , SEALREFCODE = ? , WORKORDERBYTREFCODE = ? , WORKORDERBYTITEMREFCOD = ? , KINDREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE SCSEAL2ENWORKORDERBYT SET ";
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
      statement.setString(1,anObject.commentGen);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(2,null);
      else
        statement.setBigDecimal(2,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(3,anObject.userAdd);
      if (anObject.dateAdd == null)
        statement.setTimestamp(4,null);
      else
        statement.setTimestamp(4,new java.sql.Timestamp(anObject.dateAdd.getTime()));
      statement.setString(5,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(6,null);
      else
        statement.setTimestamp(6,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.sealRef.code != Integer.MIN_VALUE)
        statement.setInt(7,anObject.sealRef.code);
      else
        statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.workOrderBytRef.code != Integer.MIN_VALUE)
        statement.setInt(8,anObject.workOrderBytRef.code);
      else
        statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.workOrderBytItemRef.code != Integer.MIN_VALUE)
        statement.setInt(9,anObject.workOrderBytItemRef.code);
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.kindRef.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.kindRef.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
          statement.setInt(11,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
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
            if("SEALREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sealRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.sealRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("WORKORDERBYTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.workOrderBytRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.workOrderBytRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
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
            if("KINDREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.kindRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.kindRef.code);
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

   } // end of save(SCSeal2ENWorkOrderByt anObject,String[] anAttributes)


 public SCSeal2ENWorkOrderBytShort getShortObject(int anObjectCode) throws PersistenceException
  {
   SCSeal2ENWorkOrderByt filterObject = new SCSeal2ENWorkOrderByt();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (SCSeal2ENWorkOrderBytShort)list.get(0);
   return null;
  }

  public SCSeal2ENWorkOrderBytShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public SCSeal2ENWorkOrderBytShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public SCSeal2ENWorkOrderBytShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public SCSeal2ENWorkOrderBytShortList getFilteredList(SCSeal2ENWorkOrderByt filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public SCSeal2ENWorkOrderBytShortList getScrollableFilteredList(SCSeal2ENWorkOrderByt aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public SCSeal2ENWorkOrderBytShortList getScrollableFilteredList(SCSeal2ENWorkOrderByt aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public SCSeal2ENWorkOrderBytShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public SCSeal2ENWorkOrderBytShortList getScrollableFilteredList(SCSeal2ENWorkOrderBytFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public SCSeal2ENWorkOrderBytShortList getScrollableFilteredList(SCSeal2ENWorkOrderBytFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public SCSeal2ENWorkOrderBytShortList getScrollableFilteredList(SCSeal2ENWorkOrderByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public SCSeal2ENWorkOrderBytShortList getScrollableFilteredList(SCSeal2ENWorkOrderByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    SCSeal2ENWorkOrderBytShortList result = new SCSeal2ENWorkOrderBytShortList();
    SCSeal2ENWorkOrderBytShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "SCSEAL2ENWORKORDERBYT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "SCSEAL2ENWORKORDERBYT.CODE"+
     ",SCSEAL2ENWORKORDERBYT.USERADD"+
     ",SCSEAL2ENWORKORDERBYT.DATEADD"+
     ",SCSEAL2ENWORKORDERBYT.USERGEN"+
     ",SCSEAL2ENWORKORDERBYT.DATEEDIT"+

      ", SCSEAL.CODE " +
      ", SCSEAL.INVNUMBER " +
      ", SCSEAL.NAME " +
      ", SCSEAL.BUILDNUMBER " +
      ", SCSEAL.ACCOUNT " +
      ", SCSEAL.DEPARTMETFKCODE " +
      ", SCSEAL.MOLCODE " +
      ", SCSEAL.MOLNAME " +
      ", SCSEAL.DATEIN " +
      ", SCSEAL.DATEBUILD " +
      ", SCSEAL.COST " +
      ", SCSEAL.SCCODE " +
      ", SCSEAL.INSTALLORDERNUMBER " +
      ", SCSEAL.COSTOLD " +
      ", SCSEAL.USERADD " +
      ", SCSEAL.DATEADD " +
      ", SCSEAL.USERGEN " +
      ", SCSEAL.DATEEDIT " +
      ", ENWORKORDERBYT.CODE " +
      ", ENWORKORDERBYT.NUMBERGEN " +
      ", ENWORKORDERBYT.DATEGEN " +
      ", ENWORKORDERBYT.COMMENTGEN " +
      ", ENWORKORDERBYT.DATEADD " +
      ", ENWORKORDERBYT.DATEEDIT " +
      ", ENWORKORDERBYT.USERADD " +
      ", ENWORKORDERBYT.USEREDIT " +
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
      ", ENWORKORDERBYTITEM.FACTCODE " +
      ", SCSEAL2WORKORDERBYTKND.CODE " +
      ", SCSEAL2WORKORDERBYTKND.NAME " +
     " FROM SCSEAL2ENWORKORDERBYT " +
     ", SCSEAL " +
     ", ENWORKORDERBYT " +
     ", ENWORKORDERBYTITEM " +
     ", SCSEAL2WORKORDERBYTKND " +
     //" WHERE "
  "";
     whereStr = " SCSEAL.CODE = SCSEAL2ENWORKORDERBYT.SEALREFCODE" ; //+
      whereStr = whereStr +" AND ENWORKORDERBYT.CODE = SCSEAL2ENWORKORDERBYT.WORKORDERBYTREFCODE" ; //+
      whereStr = whereStr +" AND ENWORKORDERBYTITEM.CODE = SCSEAL2ENWORKORDERBYT.WORKORDERBYTITEMREFCOD" ; //+
      whereStr = whereStr +" AND SCSEAL2WORKORDERBYTKND.CODE = SCSEAL2ENWORKORDERBYT.KINDREFCODE" ; //+
    //selectStr = selectStr + " ${s} SCSEAL2ENWORKORDERBYT.CODE IN ( SELECT SCSEAL2ENWORKORDERBYT.CODE FROM SCSEAL2ENWORKORDERBYT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.CODE = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(SCSEAL2ENWORKORDERBYT.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(SCSEAL2ENWORKORDERBYT.COMMENTGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(SCSEAL2ENWORKORDERBYT.USERADD) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(SCSEAL2ENWORKORDERBYT.USERADD) LIKE UPPER(?)";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(SCSEAL2ENWORKORDERBYT.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(SCSEAL2ENWORKORDERBYT.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.DATEEDIT = ?";
        }
        if(aFilterObject.sealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "SCSEAL2ENWORKORDERBYT.SEALREFCODE = ? ";
        }
        if(aFilterObject.workOrderBytRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "SCSEAL2ENWORKORDERBYT.WORKORDERBYTREFCODE = ? ";
        }
        if(aFilterObject.workOrderBytItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "SCSEAL2ENWORKORDERBYT.WORKORDERBYTITEMREFCOD = ? ";
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "SCSEAL2ENWORKORDERBYT.KINDREFCODE = ? ";
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
       if(aFilterObject.sealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.sealRef.code);
       }
       if(aFilterObject.workOrderBytRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrderBytRef.code);
       }
       if(aFilterObject.workOrderBytItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrderBytItemRef.code);
       }
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
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

        anObject = new SCSeal2ENWorkOrderBytShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.userAdd = set.getString(2);
        anObject.dateAdd = set.getTimestamp(3);
        anObject.userGen = set.getString(4);
        anObject.dateEdit = set.getTimestamp(5);

        anObject.sealRefCode = set.getInt(6);
    if(set.wasNull())
      anObject.sealRefCode = Integer.MIN_VALUE;
        anObject.sealRefInvNumber = set.getString(7);
        anObject.sealRefName = set.getString(8);
        anObject.sealRefBuildNumber = set.getString(9);
        anObject.sealRefAccount = set.getString(10);
        anObject.sealRefDepartmetFKCode = set.getString(11);
        anObject.sealRefMolCode = set.getString(12);
        anObject.sealRefMolName = set.getString(13);
        anObject.sealRefDateIn = set.getDate(14);
        anObject.sealRefDateBuild = set.getDate(15);
        anObject.sealRefCost = set.getBigDecimal(16);
        if(anObject.sealRefCost != null)
          anObject.sealRefCost = anObject.sealRefCost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sealRefScCode = set.getInt(17);
    if(set.wasNull())
      anObject.sealRefScCode = Integer.MIN_VALUE;
        anObject.sealRefInstallOrderNumber = set.getString(18);
        anObject.sealRefCostOld = set.getBigDecimal(19);
        if(anObject.sealRefCostOld != null)
          anObject.sealRefCostOld = anObject.sealRefCostOld.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sealRefUserAdd = set.getString(20);
        anObject.sealRefDateAdd = set.getTimestamp(21);
        anObject.sealRefUserGen = set.getString(22);
        anObject.sealRefDateEdit = set.getTimestamp(23);
        anObject.workOrderBytRefCode = set.getInt(24);
    if(set.wasNull())
      anObject.workOrderBytRefCode = Integer.MIN_VALUE;
        anObject.workOrderBytRefNumberGen = set.getString(25);
        anObject.workOrderBytRefDateGen = set.getDate(26);
        anObject.workOrderBytRefCommentGen = set.getString(27);
        anObject.workOrderBytRefDateAdd = set.getTimestamp(28);
        anObject.workOrderBytRefDateEdit = set.getTimestamp(29);
        anObject.workOrderBytRefUserAdd = set.getString(30);
        anObject.workOrderBytRefUserEdit = set.getString(31);
        anObject.workOrderBytItemRefCode = set.getInt(32);
    if(set.wasNull())
      anObject.workOrderBytItemRefCode = Integer.MIN_VALUE;
        anObject.workOrderBytItemRefContractNumberServices = set.getString(33);
        anObject.workOrderBytItemRefAccountNumber = set.getString(34);
        anObject.workOrderBytItemRefName = set.getString(35);
        anObject.workOrderBytItemRefCustomerName = set.getString(36);
        anObject.workOrderBytItemRefAddress = set.getString(37);
        anObject.workOrderBytItemRefInvNumber = set.getString(38);
        anObject.workOrderBytItemRefSerialNumber = set.getString(39);
        anObject.workOrderBytItemRefSeal = set.getString(40);
        anObject.workOrderBytItemRefPhone = set.getString(41);
        anObject.workOrderBytItemRefStatuscode = set.getInt(42);
    if(set.wasNull())
      anObject.workOrderBytItemRefStatuscode = Integer.MIN_VALUE;
        anObject.workOrderBytItemRefRpCode = set.getInt(43);
    if(set.wasNull())
      anObject.workOrderBytItemRefRpCode = Integer.MIN_VALUE;
        anObject.workOrderBytItemRefDateCounterInst = set.getDate(44);
        anObject.workOrderBytItemRefDateCounterCheck = set.getDate(45);
        anObject.workOrderBytItemRefCounterType = set.getString(46);
        anObject.workOrderBytItemRefClassAccuracy = set.getBigDecimal(47);
        if(anObject.workOrderBytItemRefClassAccuracy != null)
          anObject.workOrderBytItemRefClassAccuracy = anObject.workOrderBytItemRefClassAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.workOrderBytItemRefCheckperiod = set.getBigDecimal(48);
        if(anObject.workOrderBytItemRefCheckperiod != null)
          anObject.workOrderBytItemRefCheckperiod = anObject.workOrderBytItemRefCheckperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.workOrderBytItemRefRpStatusCode = set.getInt(49);
    if(set.wasNull())
      anObject.workOrderBytItemRefRpStatusCode = Integer.MIN_VALUE;
        anObject.workOrderBytItemRefPhasity = set.getBigDecimal(50);
        if(anObject.workOrderBytItemRefPhasity != null)
          anObject.workOrderBytItemRefPhasity = anObject.workOrderBytItemRefPhasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.workOrderBytItemRefDatecheck = set.getDate(51);
        anObject.workOrderBytItemRefCheckperiod1 = set.getBigDecimal(52);
        if(anObject.workOrderBytItemRefCheckperiod1 != null)
          anObject.workOrderBytItemRefCheckperiod1 = anObject.workOrderBytItemRefCheckperiod1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.workOrderBytItemRefPlacecounter = set.getString(53);
        anObject.workOrderBytItemRefRpIsWorking = set.getInt(54);
    if(set.wasNull())
      anObject.workOrderBytItemRefRpIsWorking = Integer.MIN_VALUE;
        anObject.workOrderBytItemRefRecordPointName = set.getString(55);
        anObject.workOrderBytItemRefRouteBytName = set.getString(56);
        anObject.workOrderBytItemRefRouteBytNumbergen = set.getString(57);
        anObject.workOrderBytItemRefCommentGen = set.getString(58);
        anObject.workOrderBytItemRefDateAdd = set.getTimestamp(59);
        anObject.workOrderBytItemRefDateEdit = set.getTimestamp(60);
        anObject.workOrderBytItemRefUserAdd = set.getString(61);
        anObject.workOrderBytItemRefUserEdit = set.getString(62);
        anObject.workOrderBytItemRefFactCode = set.getInt(63);
    if(set.wasNull())
      anObject.workOrderBytItemRefFactCode = Integer.MIN_VALUE;
        anObject.kindRefCode = set.getInt(64);
    if(set.wasNull())
      anObject.kindRefCode = Integer.MIN_VALUE;
        anObject.kindRefName = set.getString(65);

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

  public int[] getFilteredCodeArrayOLD(SCSeal2ENWorkOrderByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT SCSEAL2ENWORKORDERBYT.CODE FROM SCSEAL2ENWORKORDERBYT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "SCSEAL2ENWORKORDERBYT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.CODE = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.USERADD = ?";
             else
                 whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.USERADD LIKE ?";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.USERGEN = ?";
             else
                 whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.DATEEDIT = ?";
        }
        if(aFilterObject.sealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.SEALREFCODE = ? ";
        }
        if(aFilterObject.workOrderBytRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.WORKORDERBYTREFCODE = ? ";
        }
        if(aFilterObject.workOrderBytItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.WORKORDERBYTITEMREFCOD = ? ";
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.KINDREFCODE = ? ";
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
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.COMMENTGEN LIKE ?";

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
                 whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.USERADD = ?";
             else
                 whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.USERADD LIKE ?";

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
                 whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.USERGEN = ?";
             else
                 whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.USERGEN LIKE ?";

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
       if(aFilterObject.sealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.sealRef.code);
       }
       if(aFilterObject.workOrderBytRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrderBytRef.code);
       }
       if(aFilterObject.workOrderBytItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrderBytItemRef.code);
       }
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
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

  public int[] getFilteredCodeArray(SCSeal2ENWorkOrderBytFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(SCSeal2ENWorkOrderByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT SCSEAL2ENWORKORDERBYT.CODE FROM SCSEAL2ENWORKORDERBYT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "SCSEAL2ENWORKORDERBYT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.CODE = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.USERADD = ?";
             else
                 whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.USERADD LIKE ?";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.USERGEN = ?";
             else
                 whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCSEAL2ENWORKORDERBYT.DATEEDIT = ?";
        }
        if(aFilterObject.sealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.SEALREFCODE = ? ";
        }
        if(aFilterObject.workOrderBytRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.WORKORDERBYTREFCODE = ? ";
        }
        if(aFilterObject.workOrderBytItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.WORKORDERBYTITEMREFCOD = ? ";
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.KINDREFCODE = ? ";
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
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.COMMENTGEN LIKE ?";

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
                 whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.USERADD = ?";
             else
                 whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.USERADD LIKE ?";

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
                 whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.USERGEN = ?";
             else
                 whereStr = whereStr + " SCSEAL2ENWORKORDERBYT.USERGEN LIKE ?";

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
       if(aFilterObject.sealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.sealRef.code);
       }
       if(aFilterObject.workOrderBytRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrderBytRef.code);
       }
       if(aFilterObject.workOrderBytItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrderBytItemRef.code);
       }
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
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


   public SCSeal2ENWorkOrderByt getObject(int uid) throws PersistenceException
   {
    SCSeal2ENWorkOrderByt result = new SCSeal2ENWorkOrderByt();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(SCSeal2ENWorkOrderByt anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  SCSEAL2ENWORKORDERBYT.CODE, SCSEAL2ENWORKORDERBYT.COMMENTGEN, SCSEAL2ENWORKORDERBYT.MODIFY_TIME, SCSEAL2ENWORKORDERBYT.USERADD, SCSEAL2ENWORKORDERBYT.DATEADD, SCSEAL2ENWORKORDERBYT.USERGEN, SCSEAL2ENWORKORDERBYT.DATEEDIT, SCSEAL2ENWORKORDERBYT.SEALREFCODE, SCSEAL2ENWORKORDERBYT.WORKORDERBYTREFCODE, SCSEAL2ENWORKORDERBYT.WORKORDERBYTITEMREFCOD, SCSEAL2ENWORKORDERBYT.KINDREFCODE "
    +" FROM SCSEAL2ENWORKORDERBYT WHERE SCSEAL2ENWORKORDERBYT.CODE = ?";

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
        anObject.commentGen = set.getString(2);
        anObject.modify_time = set.getLong(3);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.userAdd = set.getString(4);
        anObject.dateAdd = set.getTimestamp(5);
        anObject.userGen = set.getString(6);
        anObject.dateEdit = set.getTimestamp(7);
        anObject.sealRef.code = set.getInt(8);
        if ( set.wasNull() )
            anObject.sealRef.code = Integer.MIN_VALUE;
        anObject.workOrderBytRef.code = set.getInt(9);
        if ( set.wasNull() )
            anObject.workOrderBytRef.code = Integer.MIN_VALUE;
        anObject.workOrderBytItemRef.code = set.getInt(10);
        if ( set.wasNull() )
            anObject.workOrderBytItemRef.code = Integer.MIN_VALUE;
        anObject.kindRef.code = set.getInt(11);
        if ( set.wasNull() )
            anObject.kindRef.code = Integer.MIN_VALUE;
        if(anObject.sealRef.code != Integer.MIN_VALUE)
        {
           anObject.setSealRef(
      new com.ksoe.energynet.dataminer.generated.SCSealDAOGen(connection,getUserProfile()).getRef(anObject.sealRef.code));
    }
        if(anObject.workOrderBytRef.code != Integer.MIN_VALUE)
        {
           anObject.setWorkOrderBytRef(
      new com.ksoe.energynet.dataminer.generated.ENWorkOrderBytDAOGen(connection,getUserProfile()).getRef(anObject.workOrderBytRef.code));
    }
        if(anObject.workOrderBytItemRef.code != Integer.MIN_VALUE)
        {
           anObject.setWorkOrderBytItemRef(
      new com.ksoe.energynet.dataminer.generated.ENWorkOrderBytItemDAOGen(connection,getUserProfile()).getRef(anObject.workOrderBytItemRef.code));
    }
        if(anObject.kindRef.code != Integer.MIN_VALUE)
        {
           anObject.setKindRef(
      new com.ksoe.energynet.dataminer.generated.SCSeal2WorkOrderBytKindDAOGen(connection,getUserProfile()).getRef(anObject.kindRef.code));
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


  public com.ksoe.energynet.valueobject.references.SCSeal2ENWorkOrderBytRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.SCSeal2ENWorkOrderBytRef ref = new com.ksoe.energynet.valueobject.references.SCSeal2ENWorkOrderBytRef();
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

    selectStr = "DELETE FROM  SCSEAL2ENWORKORDERBYT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SCSeal2ENWorkOrderByt object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%SCSeal2ENWorkOrderByt.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(SCSeal2ENWorkOrderByt.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%SCSeal2ENWorkOrderByt.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(SCSeal2ENWorkOrderByt.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%SCSeal2ENWorkOrderByt.getObject%} access denied");

    selectStr =

    "SELECT  SCSEAL2ENWORKORDERBYT.CODE FROM  SCSEAL2ENWORKORDERBYT WHERE  SCSEAL2ENWORKORDERBYT.CODE = ?";
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
    _checkConditionToken(condition,"code","SCSEAL2ENWORKORDERBYT.CODE");
    _checkConditionToken(condition,"commentgen","SCSEAL2ENWORKORDERBYT.COMMENTGEN");
    _checkConditionToken(condition,"modify_time","SCSEAL2ENWORKORDERBYT.MODIFY_TIME");
    _checkConditionToken(condition,"useradd","SCSEAL2ENWORKORDERBYT.USERADD");
    _checkConditionToken(condition,"dateadd","SCSEAL2ENWORKORDERBYT.DATEADD");
    _checkConditionToken(condition,"usergen","SCSEAL2ENWORKORDERBYT.USERGEN");
    _checkConditionToken(condition,"dateedit","SCSEAL2ENWORKORDERBYT.DATEEDIT");
      // relationship conditions
    _checkConditionToken(condition,"sealref","SEALREFCODE");
    _checkConditionToken(condition,"sealref.code","SEALREFCODE");
    _checkConditionToken(condition,"workorderbytref","WORKORDERBYTREFCODE");
    _checkConditionToken(condition,"workorderbytref.code","WORKORDERBYTREFCODE");
    _checkConditionToken(condition,"workorderbytitemref","WORKORDERBYTITEMREFCOD");
    _checkConditionToken(condition,"workorderbytitemref.code","WORKORDERBYTITEMREFCOD");
    _checkConditionToken(condition,"kindref","KINDREFCODE");
    _checkConditionToken(condition,"kindref.code","KINDREFCODE");
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

  private void _collectAutoIncrementFields(SCSeal2ENWorkOrderByt anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("SCSEAL2ENWORKORDERBYT", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("SCSEAL2ENWORKORDERBYT", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("SCSEAL2ENWORKORDERBYT", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: SCSEAL2ENWORKORDERBYT");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of SCSeal2ENWorkOrderBytDAO
