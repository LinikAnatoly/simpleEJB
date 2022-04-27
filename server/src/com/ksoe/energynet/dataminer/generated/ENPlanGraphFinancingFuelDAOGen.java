
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
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

import com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuel;
import com.ksoe.energynet.valueobject.filter.ENPlanGraphFinancingFuelFilter;
import com.ksoe.energynet.valueobject.brief.ENPlanGraphFinancingFuelShort;
import com.ksoe.energynet.valueobject.lists.ENPlanGraphFinancingFuelShortList;

import com.ksoe.techcard.dataminer.TKFuelTypeDAO;

/**
 * DAO Object for ENPlanGraphFinancingFuel;
 *
 */

public class ENPlanGraphFinancingFuelDAOGen extends GenericDataMiner {

   public ENPlanGraphFinancingFuelDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENPlanGraphFinancingFuelDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   protected boolean isEqual(ENPlanGraphFinancingFuel inObject) throws PersistenceException
   {
      ENPlanGraphFinancingFuel obj = new ENPlanGraphFinancingFuel();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.monthGen != obj.monthGen){
				return false;
			}

     if (inObject.yearGen != obj.yearGen){
				return false;
			}

	if(inObject.totalSum == null && obj.totalSum == null){}
	else
		if(inObject.totalSum == null || obj.totalSum == null) return false;
		else
			if ( ! inObject.totalSum.equals(obj.totalSum)){
				return false;
			}

	if(inObject.koefDekada1 == null && obj.koefDekada1 == null){}
	else
		if(inObject.koefDekada1 == null || obj.koefDekada1 == null) return false;
		else
			if ( ! inObject.koefDekada1.equals(obj.koefDekada1)){
				return false;
			}

	if(inObject.koefDekada2 == null && obj.koefDekada2 == null){}
	else
		if(inObject.koefDekada2 == null || obj.koefDekada2 == null) return false;
		else
			if ( ! inObject.koefDekada2.equals(obj.koefDekada2)){
				return false;
			}

	if(inObject.koefDekada3 == null && obj.koefDekada3 == null){}
	else
		if(inObject.koefDekada3 == null || obj.koefDekada3 == null) return false;
		else
			if ( ! inObject.koefDekada3.equals(obj.koefDekada3)){
				return false;
			}

	if(inObject.countFuelSpent == null && obj.countFuelSpent == null){}
	else
		if(inObject.countFuelSpent == null || obj.countFuelSpent == null) return false;
		else
			if ( ! inObject.countFuelSpent.equals(obj.countFuelSpent)){
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
     if (inObject.fuelTypeRef.code != obj.fuelTypeRef.code){
        return false;
     }
      return true;
   }

   public int add(ENPlanGraphFinancingFuel anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENPlanGraphFinancingFuel anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENPLANGRAPHFINANCINGFL (CODE,MONTHGEN,YEARGEN,TOTALSUM,KOEFDEKADA1,KOEFDEKADA2,KOEFDEKADA3,COUNTFUELSPENT,USERGEN,DATEEDIT,MODIFY_TIME,FUELTYPEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.monthGen != Integer.MIN_VALUE )
         statement.setInt(2,anObject.monthGen);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.yearGen != Integer.MIN_VALUE )
         statement.setInt(3,anObject.yearGen);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.totalSum != null)
        anObject.totalSum = anObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.totalSum);
      if (anObject.koefDekada1 != null)
        anObject.koefDekada1 = anObject.koefDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.koefDekada1);
      if (anObject.koefDekada2 != null)
        anObject.koefDekada2 = anObject.koefDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.koefDekada2);
      if (anObject.koefDekada3 != null)
        anObject.koefDekada3 = anObject.koefDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.koefDekada3);
      if (anObject.countFuelSpent != null)
        anObject.countFuelSpent = anObject.countFuelSpent.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.countFuelSpent);
      statement.setString(9,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(10,null);
      else
        statement.setTimestamp(10,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(11,null);
      else
        statement.setBigDecimal(11,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.fuelTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKFuelTypeDAOGen(connection,getUserProfile()).exists(anObject.fuelTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENPlanGraphFinancingFuel.fuelTypeRef.code%} = {%"+anObject.fuelTypeRef.code+"%}");
        statement.setInt(12,anObject.fuelTypeRef.code);
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
      throw new PersistenceException("Error in method {%ENPlanGraphFinancingFuelDAOGen.add%}",e);
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

   public void save(ENPlanGraphFinancingFuel anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENPlanGraphFinancingFuel anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENPlanGraphFinancingFuel oldObject = new ENPlanGraphFinancingFuel();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENPlanGraphFinancingFuel.modify_time_Field+" FROM  ENPLANGRAPHFINANCINGFL WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("TOTALSUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("KOEFDEKADA1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("KOEFDEKADA2") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("KOEFDEKADA3") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNTFUELSPENT") == 0)
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
          if(fieldNameStr.compareTo("FUELTYPEREF") == 0)
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
        "UPDATE ENPLANGRAPHFINANCINGFL SET  MONTHGEN = ? , YEARGEN = ? , TOTALSUM = ? , KOEFDEKADA1 = ? , KOEFDEKADA2 = ? , KOEFDEKADA3 = ? , COUNTFUELSPENT = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , FUELTYPEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENPLANGRAPHFINANCINGFUEL SET ";
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
      if (anObject.monthGen != Integer.MIN_VALUE )
         statement.setInt(1,anObject.monthGen);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.yearGen != Integer.MIN_VALUE )
         statement.setInt(2,anObject.yearGen);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.totalSum != null)
        anObject.totalSum = anObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.totalSum);
      if (anObject.koefDekada1 != null)
        anObject.koefDekada1 = anObject.koefDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.koefDekada1);
      if (anObject.koefDekada2 != null)
        anObject.koefDekada2 = anObject.koefDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.koefDekada2);
      if (anObject.koefDekada3 != null)
        anObject.koefDekada3 = anObject.koefDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.koefDekada3);
      if (anObject.countFuelSpent != null)
        anObject.countFuelSpent = anObject.countFuelSpent.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.countFuelSpent);
      statement.setString(8,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(9,null);
      else
        statement.setTimestamp(9,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(10,null);
      else
        statement.setBigDecimal(10,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.fuelTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(11,anObject.fuelTypeRef.code);
      else
        statement.setNull(11,java.sql.Types.INTEGER);
          statement.setInt(12,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
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
            if("TOTALSUM".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.totalSum != null)
                    anObject.totalSum = anObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.totalSum);
                continue;
             }
            if("KOEFDEKADA1".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.koefDekada1 != null)
                    anObject.koefDekada1 = anObject.koefDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.koefDekada1);
                continue;
             }
            if("KOEFDEKADA2".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.koefDekada2 != null)
                    anObject.koefDekada2 = anObject.koefDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.koefDekada2);
                continue;
             }
            if("KOEFDEKADA3".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.koefDekada3 != null)
                    anObject.koefDekada3 = anObject.koefDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.koefDekada3);
                continue;
             }
            if("COUNTFUELSPENT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countFuelSpent != null)
                    anObject.countFuelSpent = anObject.countFuelSpent.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countFuelSpent);
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
            if("FUELTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.fuelTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.fuelTypeRef.code);
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

   } // end of save(ENPlanGraphFinancingFuel anObject,String[] anAttributes)


 public ENPlanGraphFinancingFuelShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENPlanGraphFinancingFuel filterObject = new ENPlanGraphFinancingFuel();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENPlanGraphFinancingFuelShort)list.get(0);
   return null;
  }

  public ENPlanGraphFinancingFuelShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENPlanGraphFinancingFuelShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENPlanGraphFinancingFuelShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENPlanGraphFinancingFuelShortList getFilteredList(ENPlanGraphFinancingFuel filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENPlanGraphFinancingFuelShortList getScrollableFilteredList(ENPlanGraphFinancingFuel aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENPlanGraphFinancingFuelShortList getScrollableFilteredList(ENPlanGraphFinancingFuel aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENPlanGraphFinancingFuelShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENPlanGraphFinancingFuelShortList getScrollableFilteredList(ENPlanGraphFinancingFuelFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENPlanGraphFinancingFuelShortList getScrollableFilteredList(ENPlanGraphFinancingFuelFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENPlanGraphFinancingFuelShortList getScrollableFilteredList(ENPlanGraphFinancingFuel aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENPlanGraphFinancingFuelShortList getScrollableFilteredList(ENPlanGraphFinancingFuel aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENPlanGraphFinancingFuelShortList result = new ENPlanGraphFinancingFuelShortList();
    ENPlanGraphFinancingFuelShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPLANGRAPHFINANCINGFL.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENPLANGRAPHFINANCINGFL.CODE"+
     ",ENPLANGRAPHFINANCINGFL.MONTHGEN"+
     ",ENPLANGRAPHFINANCINGFL.YEARGEN"+
     ",ENPLANGRAPHFINANCINGFL.TOTALSUM"+
     ",ENPLANGRAPHFINANCINGFL.KOEFDEKADA1"+
     ",ENPLANGRAPHFINANCINGFL.KOEFDEKADA2"+
     ",ENPLANGRAPHFINANCINGFL.KOEFDEKADA3"+
     ",ENPLANGRAPHFINANCINGFL.COUNTFUELSPENT"+
     ",ENPLANGRAPHFINANCINGFL.USERGEN"+
     ",ENPLANGRAPHFINANCINGFL.DATEEDIT"+

      ", TKFUELTYPE.CODE " +
      ", TKFUELTYPE.NAME " +
     " FROM ENPLANGRAPHFINANCINGFL " +
     ", TKFUELTYPE " +
     //" WHERE "
  "";
     whereStr = " TKFUELTYPE.CODE = ENPLANGRAPHFINANCINGFL.FUELTYPEREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENPLANGRAPHFINANCINGFL.CODE IN ( SELECT ENPLANGRAPHFINANCINGFL.CODE FROM ENPLANGRAPHFINANCINGFL ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.CODE = ?";
        }
        if(aFilterObject.monthGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.MONTHGEN = ?";
        }
        if(aFilterObject.yearGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.YEARGEN = ?";
        }
        if(aFilterObject.totalSum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.TOTALSUM = ?";
        }
        if(aFilterObject.koefDekada1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.KOEFDEKADA1 = ?";
        }
        if(aFilterObject.koefDekada2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.KOEFDEKADA2 = ?";
        }
        if(aFilterObject.koefDekada3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.KOEFDEKADA3 = ?";
        }
        if(aFilterObject.countFuelSpent != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.COUNTFUELSPENT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENPLANGRAPHFINANCINGFL.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENPLANGRAPHFINANCINGFL.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.MODIFY_TIME = ?";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANGRAPHFINANCINGFL.FUELTYPEREFCODE = ? ";
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
         if(aFilterObject.monthGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.monthGen);
         }
         if(aFilterObject.yearGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearGen);
         }
        if(aFilterObject.totalSum != null){
            number++;
            aFilterObject.totalSum = aFilterObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSum);
        }
        if(aFilterObject.koefDekada1 != null){
            number++;
            aFilterObject.koefDekada1 = aFilterObject.koefDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.koefDekada1);
        }
        if(aFilterObject.koefDekada2 != null){
            number++;
            aFilterObject.koefDekada2 = aFilterObject.koefDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.koefDekada2);
        }
        if(aFilterObject.koefDekada3 != null){
            number++;
            aFilterObject.koefDekada3 = aFilterObject.koefDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.koefDekada3);
        }
        if(aFilterObject.countFuelSpent != null){
            number++;
            aFilterObject.countFuelSpent = aFilterObject.countFuelSpent.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFuelSpent);
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
       if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fuelTypeRef.code);
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

        anObject = new ENPlanGraphFinancingFuelShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.monthGen = set.getInt(2);
        if ( set.wasNull() )
            anObject.monthGen = Integer.MIN_VALUE;
        anObject.yearGen = set.getInt(3);
        if ( set.wasNull() )
            anObject.yearGen = Integer.MIN_VALUE;
        anObject.totalSum = set.getBigDecimal(4);
        if(anObject.totalSum != null)
            anObject.totalSum = anObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.koefDekada1 = set.getBigDecimal(5);
        if(anObject.koefDekada1 != null)
            anObject.koefDekada1 = anObject.koefDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.koefDekada2 = set.getBigDecimal(6);
        if(anObject.koefDekada2 != null)
            anObject.koefDekada2 = anObject.koefDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.koefDekada3 = set.getBigDecimal(7);
        if(anObject.koefDekada3 != null)
            anObject.koefDekada3 = anObject.koefDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countFuelSpent = set.getBigDecimal(8);
        if(anObject.countFuelSpent != null)
            anObject.countFuelSpent = anObject.countFuelSpent.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(9);
        anObject.dateEdit = set.getTimestamp(10);

        anObject.fuelTypeRefCode = set.getInt(11);
    if(set.wasNull())
      anObject.fuelTypeRefCode = Integer.MIN_VALUE;
        anObject.fuelTypeRefName = set.getString(12);

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

  public int[] getFilteredCodeArrayOLD(ENPlanGraphFinancingFuel aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENPLANGRAPHFINANCINGFL.CODE FROM ENPLANGRAPHFINANCINGFL";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPLANGRAPHFINANCINGFL.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.CODE = ?";
        }
        if(aFilterObject.monthGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.MONTHGEN = ?";
        }
        if(aFilterObject.yearGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.YEARGEN = ?";
        }
        if(aFilterObject.totalSum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.TOTALSUM = ?";
        }
        if(aFilterObject.koefDekada1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.KOEFDEKADA1 = ?";
        }
        if(aFilterObject.koefDekada2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.KOEFDEKADA2 = ?";
        }
        if(aFilterObject.koefDekada3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.KOEFDEKADA3 = ?";
        }
        if(aFilterObject.countFuelSpent != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.COUNTFUELSPENT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.MODIFY_TIME = ?";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANGRAPHFINANCINGFL.FUELTYPEREFCODE = ? ";
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
         if(aFilterObject.monthGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.monthGen);
         }
         if(aFilterObject.yearGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearGen);
         }
        if(aFilterObject.totalSum != null){
            number++;
            aFilterObject.totalSum = aFilterObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSum);
        }
        if(aFilterObject.koefDekada1 != null){
            number++;
            aFilterObject.koefDekada1 = aFilterObject.koefDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.koefDekada1);
        }
        if(aFilterObject.koefDekada2 != null){
            number++;
            aFilterObject.koefDekada2 = aFilterObject.koefDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.koefDekada2);
        }
        if(aFilterObject.koefDekada3 != null){
            number++;
            aFilterObject.koefDekada3 = aFilterObject.koefDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.koefDekada3);
        }
        if(aFilterObject.countFuelSpent != null){
            number++;
            aFilterObject.countFuelSpent = aFilterObject.countFuelSpent.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFuelSpent);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPLANGRAPHFINANCINGFL.USERGEN = ?";
             else
                 whereStr = whereStr + " ENPLANGRAPHFINANCINGFL.USERGEN LIKE ?";

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
       if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fuelTypeRef.code);
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

  public int[] getFilteredCodeArray(ENPlanGraphFinancingFuelFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENPlanGraphFinancingFuel aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENPLANGRAPHFINANCINGFL.CODE FROM ENPLANGRAPHFINANCINGFL";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPLANGRAPHFINANCINGFL.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.CODE = ?";
        }
        if(aFilterObject.monthGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.MONTHGEN = ?";
        }
        if(aFilterObject.yearGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.YEARGEN = ?";
        }
        if(aFilterObject.totalSum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.TOTALSUM = ?";
        }
        if(aFilterObject.koefDekada1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.KOEFDEKADA1 = ?";
        }
        if(aFilterObject.koefDekada2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.KOEFDEKADA2 = ?";
        }
        if(aFilterObject.koefDekada3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.KOEFDEKADA3 = ?";
        }
        if(aFilterObject.countFuelSpent != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.COUNTFUELSPENT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.MODIFY_TIME = ?";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANGRAPHFINANCINGFL.FUELTYPEREFCODE = ? ";
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
         if(aFilterObject.monthGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.monthGen);
         }
         if(aFilterObject.yearGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearGen);
         }
        if(aFilterObject.totalSum != null){
            number++;
            aFilterObject.totalSum = aFilterObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSum);
        }
        if(aFilterObject.koefDekada1 != null){
            number++;
            aFilterObject.koefDekada1 = aFilterObject.koefDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.koefDekada1);
        }
        if(aFilterObject.koefDekada2 != null){
            number++;
            aFilterObject.koefDekada2 = aFilterObject.koefDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.koefDekada2);
        }
        if(aFilterObject.koefDekada3 != null){
            number++;
            aFilterObject.koefDekada3 = aFilterObject.koefDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.koefDekada3);
        }
        if(aFilterObject.countFuelSpent != null){
            number++;
            aFilterObject.countFuelSpent = aFilterObject.countFuelSpent.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFuelSpent);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPLANGRAPHFINANCINGFL.USERGEN = ?";
             else
                 whereStr = whereStr + " ENPLANGRAPHFINANCINGFL.USERGEN LIKE ?";

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
       if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fuelTypeRef.code);
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


   public ENPlanGraphFinancingFuel getObject(int uid) throws PersistenceException
   {
    ENPlanGraphFinancingFuel result = new ENPlanGraphFinancingFuel();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENPlanGraphFinancingFuel anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENPLANGRAPHFINANCINGFL.CODE, ENPLANGRAPHFINANCINGFL.MONTHGEN, ENPLANGRAPHFINANCINGFL.YEARGEN, ENPLANGRAPHFINANCINGFL.TOTALSUM, ENPLANGRAPHFINANCINGFL.KOEFDEKADA1, ENPLANGRAPHFINANCINGFL.KOEFDEKADA2, ENPLANGRAPHFINANCINGFL.KOEFDEKADA3, ENPLANGRAPHFINANCINGFL.COUNTFUELSPENT, ENPLANGRAPHFINANCINGFL.USERGEN, ENPLANGRAPHFINANCINGFL.DATEEDIT, ENPLANGRAPHFINANCINGFL.MODIFY_TIME, ENPLANGRAPHFINANCINGFL.FUELTYPEREFCODE "
    +" FROM ENPLANGRAPHFINANCINGFL WHERE ENPLANGRAPHFINANCINGFL.CODE = ?";

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
        anObject.monthGen = set.getInt(2);
        if ( set.wasNull() )
           anObject.monthGen = Integer.MIN_VALUE;
        anObject.yearGen = set.getInt(3);
        if ( set.wasNull() )
           anObject.yearGen = Integer.MIN_VALUE;
        anObject.totalSum = set.getBigDecimal(4);
        if(anObject.totalSum != null)
            anObject.totalSum = anObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.koefDekada1 = set.getBigDecimal(5);
        if(anObject.koefDekada1 != null)
            anObject.koefDekada1 = anObject.koefDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.koefDekada2 = set.getBigDecimal(6);
        if(anObject.koefDekada2 != null)
            anObject.koefDekada2 = anObject.koefDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.koefDekada3 = set.getBigDecimal(7);
        if(anObject.koefDekada3 != null)
            anObject.koefDekada3 = anObject.koefDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countFuelSpent = set.getBigDecimal(8);
        if(anObject.countFuelSpent != null)
            anObject.countFuelSpent = anObject.countFuelSpent.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(9);
        anObject.dateEdit = set.getTimestamp(10);
        anObject.modify_time = set.getLong(11);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.fuelTypeRef.code = set.getInt(12);
        if ( set.wasNull() )
            anObject.fuelTypeRef.code = Integer.MIN_VALUE;
        if(anObject.fuelTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setFuelTypeRef(
      new com.ksoe.techcard.dataminer.generated.TKFuelTypeDAOGen(connection,getUserProfile()).getRef(anObject.fuelTypeRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENPlanGraphFinancingFuelRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENPlanGraphFinancingFuelRef ref = new com.ksoe.energynet.valueobject.references.ENPlanGraphFinancingFuelRef();
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

    selectStr = "DELETE FROM  ENPLANGRAPHFINANCINGFL WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENPlanGraphFinancingFuel object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENPlanGraphFinancingFuel.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanGraphFinancingFuel.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENPlanGraphFinancingFuel.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanGraphFinancingFuel.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENPlanGraphFinancingFuel.getObject%} access denied");

    selectStr =

    "SELECT  ENPLANGRAPHFINANCINGFL.CODE FROM  ENPLANGRAPHFINANCINGFL WHERE  ENPLANGRAPHFINANCINGFL.CODE = ?";
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
    _checkConditionToken(condition,"code","ENPLANGRAPHFINANCINGFL.CODE");
    _checkConditionToken(condition,"monthgen","ENPLANGRAPHFINANCINGFL.MONTHGEN");
    _checkConditionToken(condition,"yeargen","ENPLANGRAPHFINANCINGFL.YEARGEN");
    _checkConditionToken(condition,"totalsum","ENPLANGRAPHFINANCINGFL.TOTALSUM");
    _checkConditionToken(condition,"koefdekada1","ENPLANGRAPHFINANCINGFL.KOEFDEKADA1");
    _checkConditionToken(condition,"koefdekada2","ENPLANGRAPHFINANCINGFL.KOEFDEKADA2");
    _checkConditionToken(condition,"koefdekada3","ENPLANGRAPHFINANCINGFL.KOEFDEKADA3");
    _checkConditionToken(condition,"countfuelspent","ENPLANGRAPHFINANCINGFL.COUNTFUELSPENT");
    _checkConditionToken(condition,"usergen","ENPLANGRAPHFINANCINGFL.USERGEN");
    _checkConditionToken(condition,"dateedit","ENPLANGRAPHFINANCINGFL.DATEEDIT");
    _checkConditionToken(condition,"modify_time","ENPLANGRAPHFINANCINGFL.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"fueltyperef","FUELTYPEREFCODE");
    _checkConditionToken(condition,"fueltyperef.code","FUELTYPEREFCODE");
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

  private void _collectAutoIncrementFields(ENPlanGraphFinancingFuel anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENPLANGRAPHFINANCINGFL", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENPLANGRAPHFINANCINGFL", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENPLANGRAPHFINANCINGFL", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENPLANGRAPHFINANCINGFL");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENPlanGraphFinancingFuelDAO
