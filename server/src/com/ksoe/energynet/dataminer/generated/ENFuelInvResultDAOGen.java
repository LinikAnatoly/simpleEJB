
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

import com.ksoe.energynet.valueobject.ENFuelInvResult;
import com.ksoe.energynet.valueobject.filter.ENFuelInvResultFilter;
import com.ksoe.energynet.valueobject.brief.ENFuelInvResultShort;
import com.ksoe.energynet.valueobject.lists.ENFuelInvResultShortList;

import com.ksoe.techcard.dataminer.TKFuelTypeDAO;

/**
 * DAO Object for ENFuelInvResult;
 *
 */

public class ENFuelInvResultDAOGen extends GenericDataMiner {

   public ENFuelInvResultDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENFuelInvResultDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   protected boolean isEqual(ENFuelInvResult inObject) throws PersistenceException
   {
      ENFuelInvResult obj = new ENFuelInvResult();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.deltaCount == null && obj.deltaCount == null){}
	else
		if(inObject.deltaCount == null || obj.deltaCount == null) return false;
		else
			if ( ! inObject.deltaCount.equals(obj.deltaCount)){
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
			if ( ! inObject.dateEdit.equals(obj.dateEdit)){
				return false;
			}
     if (inObject.inventarizationRef.code != obj.inventarizationRef.code){
        return false;
     }
     if (inObject.fuelTypeRef.code != obj.fuelTypeRef.code){
        return false;
     }
     if (inObject.typeRef.code != obj.typeRef.code){
        return false;
     }
     if (inObject.fkorderitemRef.code != obj.fkorderitemRef.code){
        return false;
     }
     if (inObject.estimateItemRef.code != obj.estimateItemRef.code){
        return false;
     }
      return true;
   }

   public int add(ENFuelInvResult anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENFuelInvResult anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENFUELINVRESULT (CODE,DELTACOUNT,USERGEN,DATEEDIT,MODIFY_TIME,INVENTARIZATIONREFCODE,FUELTYPEREFCODE,TYPEREFCODE,FKORDERITEMREFCODE,ESTIMATEITEMREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.deltaCount != null)
        anObject.deltaCount = anObject.deltaCount.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.deltaCount);
      statement.setString(3,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(4,null);
      else
        statement.setTimestamp(4,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(5,null);
      else
        statement.setBigDecimal(5,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.inventarizationRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENFuelInventarizationDAOGen(connection,getUserProfile()).exists(anObject.inventarizationRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENFuelInvResult.inventarizationRef.code%} = {%"+anObject.inventarizationRef.code+"%}");
        statement.setInt(6,anObject.inventarizationRef.code);
      }
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.fuelTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKFuelTypeDAOGen(connection,getUserProfile()).exists(anObject.fuelTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENFuelInvResult.fuelTypeRef.code%} = {%"+anObject.fuelTypeRef.code+"%}");
        statement.setInt(7,anObject.fuelTypeRef.code);
      }
      else
        statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.typeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENFuelInvResultTypeDAOGen(connection,getUserProfile()).exists(anObject.typeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENFuelInvResult.typeRef.code%} = {%"+anObject.typeRef.code+"%}");
        statement.setInt(8,anObject.typeRef.code);
      }
      else
        statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.fkorderitemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.rqorder.dataminer.generated.RQFKOrderItemDAOGen(connection,getUserProfile()).exists(anObject.fkorderitemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENFuelInvResult.fkorderitemRef.code%} = {%"+anObject.fkorderitemRef.code+"%}");
        statement.setInt(9,anObject.fkorderitemRef.code);
      }
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.estimateItemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).exists(anObject.estimateItemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENFuelInvResult.estimateItemRef.code%} = {%"+anObject.estimateItemRef.code+"%}");
        statement.setInt(10,anObject.estimateItemRef.code);
      }
      else
        statement.setNull(10,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENFuelInvResultDAOGen.add%}",e);
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

   public void save(ENFuelInvResult anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENFuelInvResult anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENFuelInvResult oldObject = new ENFuelInvResult();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENFuelInvResult.modify_time_Field+" FROM  ENFUELINVRESULT WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("DELTACOUNT") == 0)
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
          if(fieldNameStr.compareTo("INVENTARIZATIONREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FUELTYPEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TYPEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FKORDERITEMREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ESTIMATEITEMREF") == 0)
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
        "UPDATE ENFUELINVRESULT SET  DELTACOUNT = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , INVENTARIZATIONREFCODE = ? , FUELTYPEREFCODE = ? , TYPEREFCODE = ? , FKORDERITEMREFCODE = ? , ESTIMATEITEMREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENFUELINVRESULT SET ";
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
      if (anObject.deltaCount != null)
        anObject.deltaCount = anObject.deltaCount.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.deltaCount);
      statement.setString(2,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(3,null);
      else
        statement.setTimestamp(3,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(4,null);
      else
        statement.setBigDecimal(4,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.inventarizationRef.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.inventarizationRef.code);
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.fuelTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.fuelTypeRef.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.typeRef.code != Integer.MIN_VALUE)
        statement.setInt(7,anObject.typeRef.code);
      else
        statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.fkorderitemRef.code != Integer.MIN_VALUE)
        statement.setInt(8,anObject.fkorderitemRef.code);
      else
        statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.estimateItemRef.code != Integer.MIN_VALUE)
        statement.setInt(9,anObject.estimateItemRef.code);
      else
        statement.setNull(9,java.sql.Types.INTEGER);
          statement.setInt(10,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("DELTACOUNT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.deltaCount != null)
                    anObject.deltaCount = anObject.deltaCount.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.deltaCount);
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
            if("INVENTARIZATIONREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.inventarizationRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.inventarizationRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("FUELTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.fuelTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.fuelTypeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.typeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.typeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("FKORDERITEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.fkorderitemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.fkorderitemRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("ESTIMATEITEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.estimateItemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.estimateItemRef.code);
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

   } // end of save(ENFuelInvResult anObject,String[] anAttributes)


 public ENFuelInvResultShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENFuelInvResult filterObject = new ENFuelInvResult();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENFuelInvResultShort)list.get(0);
   return null;
  }

  public ENFuelInvResultShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENFuelInvResultShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENFuelInvResultShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENFuelInvResultShortList getFilteredList(ENFuelInvResult filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENFuelInvResultShortList getScrollableFilteredList(ENFuelInvResult aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENFuelInvResultShortList getScrollableFilteredList(ENFuelInvResult aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENFuelInvResultShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENFuelInvResultShortList getScrollableFilteredList(ENFuelInvResultFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENFuelInvResultShortList getScrollableFilteredList(ENFuelInvResultFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENFuelInvResultShortList getScrollableFilteredList(ENFuelInvResult aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENFuelInvResultShortList getScrollableFilteredList(ENFuelInvResult aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENFuelInvResultShortList result = new ENFuelInvResultShortList();
    ENFuelInvResultShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENFUELINVRESULT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENFUELINVRESULT.CODE"+
     ",ENFUELINVRESULT.DELTACOUNT"+
     ",ENFUELINVRESULT.USERGEN"+
     ",ENFUELINVRESULT.DATEEDIT"+

      ", ENFUELINVENTARIZATION.CODE " +
      ", ENFUELINVENTARIZATION.NUMBERGEN " +
      ", ENFUELINVENTARIZATION.DATEGEN " +
      ", ENFUELINVENTARIZATION.MOLCODE " +
      ", ENFUELINVENTARIZATION.MOLNAME " +
      ", ENFUELINVENTARIZATION.COMMENTGEN " +
      ", ENFUELINVENTARIZATION.USERADD " +
      ", ENFUELINVENTARIZATION.DATEADD " +
      ", ENFUELINVENTARIZATION.USERGEN " +
      ", ENFUELINVENTARIZATION.DATEEDIT " +
      ", TKFUELTYPE.CODE " +
      ", TKFUELTYPE.NAME " +
      ", ENFUELINVRESULTTYPE.CODE " +
      ", ENFUELINVRESULTTYPE.NAME " +
     ", ENFUELINVRESULT.FKORDERITEMREFCODE" +
      ", ENESTIMATEITEM.CODE " +
      ", ENESTIMATEITEM.COUNTGEN " +
      ", ENESTIMATEITEM.COUNTFACT " +
      ", ENESTIMATEITEM.PRICE " +
      ", ENESTIMATEITEM.COST " +
      ", ENESTIMATEITEM.ISUSEVAT " +
      ", ENESTIMATEITEM.DELIVERYTIME " +
      ", ENESTIMATEITEM.USEWORKTIME " +
      ", ENESTIMATEITEM.USERGEN " +
      ", ENESTIMATEITEM.DATEEDIT " +
     " FROM ENFUELINVRESULT " +
     ", ENFUELINVENTARIZATION " +
     ", TKFUELTYPE " +
     ", ENFUELINVRESULTTYPE " +
     ", ENESTIMATEITEM " +
     //" WHERE "
  "";
     whereStr = " ENFUELINVENTARIZATION.CODE = ENFUELINVRESULT.INVENTARIZATIONREFCODE" ; //+
      whereStr = whereStr +" AND TKFUELTYPE.CODE = ENFUELINVRESULT.FUELTYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENFUELINVRESULTTYPE.CODE = ENFUELINVRESULT.TYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENESTIMATEITEM.CODE = ENFUELINVRESULT.ESTIMATEITEMREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENFUELINVRESULT.CODE IN ( SELECT ENFUELINVRESULT.CODE FROM ENFUELINVRESULT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVRESULT.CODE = ?";
        }
        if(aFilterObject.deltaCount != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVRESULT.DELTACOUNT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENFUELINVRESULT.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENFUELINVRESULT.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVRESULT.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVRESULT.MODIFY_TIME = ?";
        }
        if(aFilterObject.inventarizationRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENFUELINVRESULT.INVENTARIZATIONREFCODE = ? ";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENFUELINVRESULT.FUELTYPEREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENFUELINVRESULT.TYPEREFCODE = ? ";
        }
        if(aFilterObject.fkorderitemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENFUELINVRESULT.FKORDERITEMREFCODE = ? ";
        }
        if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENFUELINVRESULT.ESTIMATEITEMREFCODE = ? ";
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
        if(aFilterObject.deltaCount != null){
            number++;
            aFilterObject.deltaCount = aFilterObject.deltaCount.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deltaCount);
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
       if(aFilterObject.inventarizationRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.inventarizationRef.code);
       }
       if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fuelTypeRef.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.fkorderitemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fkorderitemRef.code);
       }
       if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemRef.code);
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

        anObject = new ENFuelInvResultShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.deltaCount = set.getBigDecimal(2);
        if(anObject.deltaCount != null)
            anObject.deltaCount = anObject.deltaCount.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(3);
        anObject.dateEdit = set.getTimestamp(4);

        anObject.inventarizationRefCode = set.getInt(5);
    if(set.wasNull())
      anObject.inventarizationRefCode = Integer.MIN_VALUE;
        anObject.inventarizationRefNumberGen = set.getString(6);
        anObject.inventarizationRefDateGen = set.getTimestamp(7);
        anObject.inventarizationRefMolCode = set.getString(8);
        anObject.inventarizationRefMolName = set.getString(9);
        anObject.inventarizationRefCommentGen = set.getString(10);
        anObject.inventarizationRefUserAdd = set.getString(11);
        anObject.inventarizationRefDateAdd = set.getTimestamp(12);
        anObject.inventarizationRefUserGen = set.getString(13);
        anObject.inventarizationRefDateEdit = set.getTimestamp(14);
        anObject.fuelTypeRefCode = set.getInt(15);
    if(set.wasNull())
      anObject.fuelTypeRefCode = Integer.MIN_VALUE;
        anObject.fuelTypeRefName = set.getString(16);
        anObject.typeRefCode = set.getInt(17);
    if(set.wasNull())
      anObject.typeRefCode = Integer.MIN_VALUE;
        anObject.typeRefName = set.getString(18);
        anObject.fkorderitemRefCode = set.getInt(19);
    if(set.wasNull())
      anObject.fkorderitemRefCode = Integer.MIN_VALUE;
        anObject.estimateItemRefCode = set.getInt(20);
    if(set.wasNull())
      anObject.estimateItemRefCode = Integer.MIN_VALUE;
        anObject.estimateItemRefCountGen = set.getBigDecimal(21);
        if(anObject.estimateItemRefCountGen != null)
          anObject.estimateItemRefCountGen = anObject.estimateItemRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemRefCountFact = set.getBigDecimal(22);
        if(anObject.estimateItemRefCountFact != null)
          anObject.estimateItemRefCountFact = anObject.estimateItemRefCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemRefPrice = set.getBigDecimal(23);
        if(anObject.estimateItemRefPrice != null)
          anObject.estimateItemRefPrice = anObject.estimateItemRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemRefCost = set.getBigDecimal(24);
        if(anObject.estimateItemRefCost != null)
          anObject.estimateItemRefCost = anObject.estimateItemRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemRefIsUseVAT = set.getInt(25);
    if(set.wasNull())
      anObject.estimateItemRefIsUseVAT = Integer.MIN_VALUE;
        anObject.estimateItemRefDeliveryTime = set.getInt(26);
    if(set.wasNull())
      anObject.estimateItemRefDeliveryTime = Integer.MIN_VALUE;
        anObject.estimateItemRefUseWorkTime = set.getInt(27);
    if(set.wasNull())
      anObject.estimateItemRefUseWorkTime = Integer.MIN_VALUE;
        anObject.estimateItemRefUserGen = set.getString(28);
        anObject.estimateItemRefDateEdit = set.getDate(29);

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

  public int[] getFilteredCodeArrayOLD(ENFuelInvResult aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENFUELINVRESULT.CODE FROM ENFUELINVRESULT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENFUELINVRESULT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVRESULT.CODE = ?";
        }
        if(aFilterObject.deltaCount != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVRESULT.DELTACOUNT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENFUELINVRESULT.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENFUELINVRESULT.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVRESULT.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVRESULT.MODIFY_TIME = ?";
        }
        if(aFilterObject.inventarizationRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVRESULT.INVENTARIZATIONREFCODE = ? ";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVRESULT.FUELTYPEREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVRESULT.TYPEREFCODE = ? ";
        }
        if(aFilterObject.fkorderitemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVRESULT.FKORDERITEMREFCODE = ? ";
        }
        if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVRESULT.ESTIMATEITEMREFCODE = ? ";
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
        if(aFilterObject.deltaCount != null){
            number++;
            aFilterObject.deltaCount = aFilterObject.deltaCount.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deltaCount);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENFUELINVRESULT.USERGEN = ?";
             else
                 whereStr = whereStr + " ENFUELINVRESULT.USERGEN LIKE ?";

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
       if(aFilterObject.inventarizationRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.inventarizationRef.code);
       }
       if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fuelTypeRef.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.fkorderitemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fkorderitemRef.code);
       }
       if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemRef.code);
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

  public int[] getFilteredCodeArray(ENFuelInvResultFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENFuelInvResult aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENFUELINVRESULT.CODE FROM ENFUELINVRESULT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENFUELINVRESULT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVRESULT.CODE = ?";
        }
        if(aFilterObject.deltaCount != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVRESULT.DELTACOUNT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENFUELINVRESULT.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENFUELINVRESULT.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVRESULT.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVRESULT.MODIFY_TIME = ?";
        }
        if(aFilterObject.inventarizationRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVRESULT.INVENTARIZATIONREFCODE = ? ";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVRESULT.FUELTYPEREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVRESULT.TYPEREFCODE = ? ";
        }
        if(aFilterObject.fkorderitemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVRESULT.FKORDERITEMREFCODE = ? ";
        }
        if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVRESULT.ESTIMATEITEMREFCODE = ? ";
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
        if(aFilterObject.deltaCount != null){
            number++;
            aFilterObject.deltaCount = aFilterObject.deltaCount.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deltaCount);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENFUELINVRESULT.USERGEN = ?";
             else
                 whereStr = whereStr + " ENFUELINVRESULT.USERGEN LIKE ?";

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
       if(aFilterObject.inventarizationRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.inventarizationRef.code);
       }
       if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fuelTypeRef.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.fkorderitemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fkorderitemRef.code);
       }
       if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemRef.code);
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


   public ENFuelInvResult getObject(int uid) throws PersistenceException
   {
    ENFuelInvResult result = new ENFuelInvResult();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENFuelInvResult anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENFUELINVRESULT.CODE, ENFUELINVRESULT.DELTACOUNT, ENFUELINVRESULT.USERGEN, ENFUELINVRESULT.DATEEDIT, ENFUELINVRESULT.MODIFY_TIME, ENFUELINVRESULT.INVENTARIZATIONREFCODE, ENFUELINVRESULT.FUELTYPEREFCODE, ENFUELINVRESULT.TYPEREFCODE, ENFUELINVRESULT.FKORDERITEMREFCODE, ENFUELINVRESULT.ESTIMATEITEMREFCODE "
    +" FROM ENFUELINVRESULT WHERE ENFUELINVRESULT.CODE = ?";

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
        anObject.deltaCount = set.getBigDecimal(2);
        if(anObject.deltaCount != null)
            anObject.deltaCount = anObject.deltaCount.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(3);
        anObject.dateEdit = set.getTimestamp(4);
        anObject.modify_time = set.getLong(5);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.inventarizationRef.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.inventarizationRef.code = Integer.MIN_VALUE;
        anObject.fuelTypeRef.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.fuelTypeRef.code = Integer.MIN_VALUE;
        anObject.typeRef.code = set.getInt(8);
        if ( set.wasNull() )
            anObject.typeRef.code = Integer.MIN_VALUE;
        anObject.fkorderitemRef.code = set.getInt(9);
        if ( set.wasNull() )
            anObject.fkorderitemRef.code = Integer.MIN_VALUE;
        anObject.estimateItemRef.code = set.getInt(10);
        if ( set.wasNull() )
            anObject.estimateItemRef.code = Integer.MIN_VALUE;
        if(anObject.inventarizationRef.code != Integer.MIN_VALUE)
        {
           anObject.setInventarizationRef(
      new com.ksoe.energynet.dataminer.generated.ENFuelInventarizationDAOGen(connection,getUserProfile()).getRef(anObject.inventarizationRef.code));
    }
        if(anObject.fuelTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setFuelTypeRef(
      new com.ksoe.techcard.dataminer.generated.TKFuelTypeDAOGen(connection,getUserProfile()).getRef(anObject.fuelTypeRef.code));
    }
        if(anObject.typeRef.code != Integer.MIN_VALUE)
        {
           anObject.setTypeRef(
      new com.ksoe.energynet.dataminer.generated.ENFuelInvResultTypeDAOGen(connection,getUserProfile()).getRef(anObject.typeRef.code));
    }
        if(anObject.fkorderitemRef.code != Integer.MIN_VALUE)
        {
           anObject.setFkorderitemRef(
      new com.ksoe.rqorder.dataminer.generated.RQFKOrderItemDAOGen(connection,getUserProfile()).getRef(anObject.fkorderitemRef.code));
    }
        if(anObject.estimateItemRef.code != Integer.MIN_VALUE)
        {
           anObject.setEstimateItemRef(
      new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).getRef(anObject.estimateItemRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENFuelInvResultRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENFuelInvResultRef ref = new com.ksoe.energynet.valueobject.references.ENFuelInvResultRef();
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

    selectStr = "DELETE FROM  ENFUELINVRESULT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENFuelInvResult object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENFuelInvResult.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENFuelInvResult.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENFuelInvResult.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENFuelInvResult.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENFuelInvResult.getObject%} access denied");

    selectStr =

    "SELECT  ENFUELINVRESULT.CODE FROM  ENFUELINVRESULT WHERE  ENFUELINVRESULT.CODE = ?";
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
    _checkConditionToken(condition,"code","ENFUELINVRESULT.CODE");
    _checkConditionToken(condition,"deltacount","ENFUELINVRESULT.DELTACOUNT");
    _checkConditionToken(condition,"usergen","ENFUELINVRESULT.USERGEN");
    _checkConditionToken(condition,"dateedit","ENFUELINVRESULT.DATEEDIT");
    _checkConditionToken(condition,"modify_time","ENFUELINVRESULT.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"inventarizationref","INVENTARIZATIONREFCODE");
    _checkConditionToken(condition,"inventarizationref.code","INVENTARIZATIONREFCODE");
    _checkConditionToken(condition,"fueltyperef","FUELTYPEREFCODE");
    _checkConditionToken(condition,"fueltyperef.code","FUELTYPEREFCODE");
    _checkConditionToken(condition,"typeref","TYPEREFCODE");
    _checkConditionToken(condition,"typeref.code","TYPEREFCODE");
    _checkConditionToken(condition,"fkorderitemref","FKORDERITEMREFCODE");
    _checkConditionToken(condition,"fkorderitemref.code","FKORDERITEMREFCODE");
    _checkConditionToken(condition,"estimateitemref","ESTIMATEITEMREFCODE");
    _checkConditionToken(condition,"estimateitemref.code","ESTIMATEITEMREFCODE");
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

  private void _collectAutoIncrementFields(ENFuelInvResult anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENFUELINVRESULT", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENFUELINVRESULT", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENFUELINVRESULT", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENFUELINVRESULT");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENFuelInvResultDAO
