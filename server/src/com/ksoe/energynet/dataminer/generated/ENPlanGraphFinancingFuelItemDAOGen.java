
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

import com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuelItem;
import com.ksoe.energynet.valueobject.filter.ENPlanGraphFinancingFuelItemFilter;
import com.ksoe.energynet.valueobject.brief.ENPlanGraphFinancingFuelItemShort;
import com.ksoe.energynet.valueobject.lists.ENPlanGraphFinancingFuelItemShortList;


/**
 * DAO Object for ENPlanGraphFinancingFuelItem;
 *
 */

public class ENPlanGraphFinancingFuelItemDAOGen extends GenericDataMiner {

   public ENPlanGraphFinancingFuelItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENPlanGraphFinancingFuelItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   protected boolean isEqual(ENPlanGraphFinancingFuelItem inObject) throws PersistenceException
   {
      ENPlanGraphFinancingFuelItem obj = new ENPlanGraphFinancingFuelItem();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.totalSum == null && obj.totalSum == null){}
	else
		if(inObject.totalSum == null || obj.totalSum == null) return false;
		else
			if ( ! inObject.totalSum.equals(obj.totalSum)){
				return false;
			}

	if(inObject.sumDekada1 == null && obj.sumDekada1 == null){}
	else
		if(inObject.sumDekada1 == null || obj.sumDekada1 == null) return false;
		else
			if ( ! inObject.sumDekada1.equals(obj.sumDekada1)){
				return false;
			}

	if(inObject.sumDekada2 == null && obj.sumDekada2 == null){}
	else
		if(inObject.sumDekada2 == null || obj.sumDekada2 == null) return false;
		else
			if ( ! inObject.sumDekada2.equals(obj.sumDekada2)){
				return false;
			}

	if(inObject.sumDekada3 == null && obj.sumDekada3 == null){}
	else
		if(inObject.sumDekada3 == null || obj.sumDekada3 == null) return false;
		else
			if ( ! inObject.sumDekada3.equals(obj.sumDekada3)){
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
     if (inObject.departmentRef.code != obj.departmentRef.code){
        return false;
     }
     if (inObject.planGraphRef.code != obj.planGraphRef.code){
        return false;
     }
      return true;
   }

   public int add(ENPlanGraphFinancingFuelItem anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENPlanGraphFinancingFuelItem anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENPLANGRAPHFINNCNGFLTM (CODE,TOTALSUM,SUMDEKADA1,SUMDEKADA2,SUMDEKADA3,COUNTFUELSPENT,USERGEN,DATEEDIT,MODIFY_TIME,DEPARTMENTREFCODE,PLANGRAPHREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.totalSum != null)
        anObject.totalSum = anObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.totalSum);
      if (anObject.sumDekada1 != null)
        anObject.sumDekada1 = anObject.sumDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.sumDekada1);
      if (anObject.sumDekada2 != null)
        anObject.sumDekada2 = anObject.sumDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.sumDekada2);
      if (anObject.sumDekada3 != null)
        anObject.sumDekada3 = anObject.sumDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.sumDekada3);
      if (anObject.countFuelSpent != null)
        anObject.countFuelSpent = anObject.countFuelSpent.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.countFuelSpent);
      statement.setString(7,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(8,null);
      else
        statement.setTimestamp(8,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(9,null);
      else
        statement.setBigDecimal(9,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.departmentRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.departmentRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuelItem.departmentRef.code%} = {%"+anObject.departmentRef.code+"%}");
        statement.setInt(10,anObject.departmentRef.code);
      }
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.planGraphRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanGraphFinancingFuelDAOGen(connection,getUserProfile()).exists(anObject.planGraphRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuelItem.planGraphRef.code%} = {%"+anObject.planGraphRef.code+"%}");
        statement.setInt(11,anObject.planGraphRef.code);
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
      throw new PersistenceException("Error in method {%ENPlanGraphFinancingFuelItemDAOGen.add%}",e);
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

   public void save(ENPlanGraphFinancingFuelItem anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENPlanGraphFinancingFuelItem anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENPlanGraphFinancingFuelItem oldObject = new ENPlanGraphFinancingFuelItem();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENPlanGraphFinancingFuelItem.modify_time_Field+" FROM  ENPLANGRAPHFINNCNGFLTM WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("TOTALSUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMDEKADA1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMDEKADA2") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMDEKADA3") == 0)
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
          if(fieldNameStr.compareTo("DEPARTMENTREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PLANGRAPHREF") == 0)
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
        "UPDATE ENPLANGRAPHFINNCNGFLTM SET  TOTALSUM = ? , SUMDEKADA1 = ? , SUMDEKADA2 = ? , SUMDEKADA3 = ? , COUNTFUELSPENT = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , DEPARTMENTREFCODE = ? , PLANGRAPHREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENPLANGRAPHFINANCINGFUELITEM SET ";
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
      if (anObject.totalSum != null)
        anObject.totalSum = anObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.totalSum);
      if (anObject.sumDekada1 != null)
        anObject.sumDekada1 = anObject.sumDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.sumDekada1);
      if (anObject.sumDekada2 != null)
        anObject.sumDekada2 = anObject.sumDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.sumDekada2);
      if (anObject.sumDekada3 != null)
        anObject.sumDekada3 = anObject.sumDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.sumDekada3);
      if (anObject.countFuelSpent != null)
        anObject.countFuelSpent = anObject.countFuelSpent.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.countFuelSpent);
      statement.setString(6,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(7,null);
      else
        statement.setTimestamp(7,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(8,null);
      else
        statement.setBigDecimal(8,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.departmentRef.code != Integer.MIN_VALUE)
        statement.setInt(9,anObject.departmentRef.code);
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.planGraphRef.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.planGraphRef.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
          statement.setInt(11,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("TOTALSUM".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.totalSum != null)
                    anObject.totalSum = anObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.totalSum);
                continue;
             }
            if("SUMDEKADA1".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumDekada1 != null)
                    anObject.sumDekada1 = anObject.sumDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumDekada1);
                continue;
             }
            if("SUMDEKADA2".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumDekada2 != null)
                    anObject.sumDekada2 = anObject.sumDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumDekada2);
                continue;
             }
            if("SUMDEKADA3".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumDekada3 != null)
                    anObject.sumDekada3 = anObject.sumDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumDekada3);
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
            if("DEPARTMENTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.departmentRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.departmentRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("PLANGRAPHREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.planGraphRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.planGraphRef.code);
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

   } // end of save(ENPlanGraphFinancingFuelItem anObject,String[] anAttributes)


 public ENPlanGraphFinancingFuelItemShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENPlanGraphFinancingFuelItem filterObject = new ENPlanGraphFinancingFuelItem();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENPlanGraphFinancingFuelItemShort)list.get(0);
   return null;
  }

  public ENPlanGraphFinancingFuelItemShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENPlanGraphFinancingFuelItemShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENPlanGraphFinancingFuelItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENPlanGraphFinancingFuelItemShortList getFilteredList(ENPlanGraphFinancingFuelItem filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENPlanGraphFinancingFuelItemShortList getScrollableFilteredList(ENPlanGraphFinancingFuelItem aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENPlanGraphFinancingFuelItemShortList getScrollableFilteredList(ENPlanGraphFinancingFuelItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENPlanGraphFinancingFuelItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENPlanGraphFinancingFuelItemShortList getScrollableFilteredList(ENPlanGraphFinancingFuelItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENPlanGraphFinancingFuelItemShortList getScrollableFilteredList(ENPlanGraphFinancingFuelItemFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENPlanGraphFinancingFuelItemShortList getScrollableFilteredList(ENPlanGraphFinancingFuelItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENPlanGraphFinancingFuelItemShortList getScrollableFilteredList(ENPlanGraphFinancingFuelItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENPlanGraphFinancingFuelItemShortList result = new ENPlanGraphFinancingFuelItemShortList();
    ENPlanGraphFinancingFuelItemShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPLANGRAPHFINNCNGFLTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENPLANGRAPHFINNCNGFLTM.CODE"+
     ",ENPLANGRAPHFINNCNGFLTM.TOTALSUM"+
     ",ENPLANGRAPHFINNCNGFLTM.SUMDEKADA1"+
     ",ENPLANGRAPHFINNCNGFLTM.SUMDEKADA2"+
     ",ENPLANGRAPHFINNCNGFLTM.SUMDEKADA3"+
     ",ENPLANGRAPHFINNCNGFLTM.COUNTFUELSPENT"+
     ",ENPLANGRAPHFINNCNGFLTM.USERGEN"+
     ",ENPLANGRAPHFINNCNGFLTM.DATEEDIT"+

      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
      ", ENPLANGRAPHFINANCINGFL.CODE " +
      ", ENPLANGRAPHFINANCINGFL.MONTHGEN " +
      ", ENPLANGRAPHFINANCINGFL.YEARGEN " +
      ", ENPLANGRAPHFINANCINGFL.TOTALSUM " +
      ", ENPLANGRAPHFINANCINGFL.KOEFDEKADA1 " +
      ", ENPLANGRAPHFINANCINGFL.KOEFDEKADA2 " +
      ", ENPLANGRAPHFINANCINGFL.KOEFDEKADA3 " +
      ", ENPLANGRAPHFINANCINGFL.COUNTFUELSPENT " +
      ", ENPLANGRAPHFINANCINGFL.USERGEN " +
      ", ENPLANGRAPHFINANCINGFL.DATEEDIT " +
     " FROM ENPLANGRAPHFINNCNGFLTM " +
     ", ENDEPARTMENT " +
     ", ENPLANGRAPHFINANCINGFL " +
     //" WHERE "
  "";
     whereStr = " ENDEPARTMENT.CODE = ENPLANGRAPHFINNCNGFLTM.DEPARTMENTREFCODE" ; //+
      whereStr = whereStr +" AND ENPLANGRAPHFINANCINGFL.CODE = ENPLANGRAPHFINNCNGFLTM.PLANGRAPHREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENPLANGRAPHFINNCNGFLTM.CODE IN ( SELECT ENPLANGRAPHFINNCNGFLTM.CODE FROM ENPLANGRAPHFINNCNGFLTM ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.CODE = ?";
        }
        if(aFilterObject.totalSum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.TOTALSUM = ?";
        }
        if(aFilterObject.sumDekada1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.SUMDEKADA1 = ?";
        }
        if(aFilterObject.sumDekada2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.SUMDEKADA2 = ?";
        }
        if(aFilterObject.sumDekada3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.SUMDEKADA3 = ?";
        }
        if(aFilterObject.countFuelSpent != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.COUNTFUELSPENT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENPLANGRAPHFINNCNGFLTM.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENPLANGRAPHFINNCNGFLTM.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.MODIFY_TIME = ?";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANGRAPHFINNCNGFLTM.DEPARTMENTREFCODE = ? ";
        }
        if(aFilterObject.planGraphRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANGRAPHFINNCNGFLTM.PLANGRAPHREFCODE = ? ";
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
        if(aFilterObject.totalSum != null){
            number++;
            aFilterObject.totalSum = aFilterObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSum);
        }
        if(aFilterObject.sumDekada1 != null){
            number++;
            aFilterObject.sumDekada1 = aFilterObject.sumDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumDekada1);
        }
        if(aFilterObject.sumDekada2 != null){
            number++;
            aFilterObject.sumDekada2 = aFilterObject.sumDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumDekada2);
        }
        if(aFilterObject.sumDekada3 != null){
            number++;
            aFilterObject.sumDekada3 = aFilterObject.sumDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumDekada3);
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
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.departmentRef.code);
       }
       if(aFilterObject.planGraphRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planGraphRef.code);
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

        anObject = new ENPlanGraphFinancingFuelItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.totalSum = set.getBigDecimal(2);
        if(anObject.totalSum != null)
            anObject.totalSum = anObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumDekada1 = set.getBigDecimal(3);
        if(anObject.sumDekada1 != null)
            anObject.sumDekada1 = anObject.sumDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumDekada2 = set.getBigDecimal(4);
        if(anObject.sumDekada2 != null)
            anObject.sumDekada2 = anObject.sumDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumDekada3 = set.getBigDecimal(5);
        if(anObject.sumDekada3 != null)
            anObject.sumDekada3 = anObject.sumDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countFuelSpent = set.getBigDecimal(6);
        if(anObject.countFuelSpent != null)
            anObject.countFuelSpent = anObject.countFuelSpent.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(7);
        anObject.dateEdit = set.getTimestamp(8);

        anObject.departmentRefCode = set.getInt(9);
    if(set.wasNull())
      anObject.departmentRefCode = Integer.MIN_VALUE;
        anObject.departmentRefShortName = set.getString(10);
        anObject.departmentRefDateStart = set.getDate(11);
        anObject.departmentRefDateFinal = set.getDate(12);
        anObject.departmentRefRenCode = set.getInt(13);
    if(set.wasNull())
      anObject.departmentRefRenCode = Integer.MIN_VALUE;
        anObject.departmentRefShpzBalans = set.getString(14);
        anObject.departmentRefKau_table_id_1884 = set.getInt(15);
    if(set.wasNull())
      anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
        anObject.departmentRefKau_1884 = set.getString(16);
        anObject.departmentRefName_1884 = set.getString(17);
        anObject.planGraphRefCode = set.getInt(18);
    if(set.wasNull())
      anObject.planGraphRefCode = Integer.MIN_VALUE;
        anObject.planGraphRefMonthGen = set.getInt(19);
    if(set.wasNull())
      anObject.planGraphRefMonthGen = Integer.MIN_VALUE;
        anObject.planGraphRefYearGen = set.getInt(20);
    if(set.wasNull())
      anObject.planGraphRefYearGen = Integer.MIN_VALUE;
        anObject.planGraphRefTotalSum = set.getBigDecimal(21);
        if(anObject.planGraphRefTotalSum != null)
          anObject.planGraphRefTotalSum = anObject.planGraphRefTotalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planGraphRefKoefDekada1 = set.getBigDecimal(22);
        if(anObject.planGraphRefKoefDekada1 != null)
          anObject.planGraphRefKoefDekada1 = anObject.planGraphRefKoefDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planGraphRefKoefDekada2 = set.getBigDecimal(23);
        if(anObject.planGraphRefKoefDekada2 != null)
          anObject.planGraphRefKoefDekada2 = anObject.planGraphRefKoefDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planGraphRefKoefDekada3 = set.getBigDecimal(24);
        if(anObject.planGraphRefKoefDekada3 != null)
          anObject.planGraphRefKoefDekada3 = anObject.planGraphRefKoefDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planGraphRefCountFuelSpent = set.getBigDecimal(25);
        if(anObject.planGraphRefCountFuelSpent != null)
          anObject.planGraphRefCountFuelSpent = anObject.planGraphRefCountFuelSpent.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planGraphRefUserGen = set.getString(26);
        anObject.planGraphRefDateEdit = set.getTimestamp(27);

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

  public int[] getFilteredCodeArrayOLD(ENPlanGraphFinancingFuelItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENPLANGRAPHFINNCNGFLTM.CODE FROM ENPLANGRAPHFINNCNGFLTM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPLANGRAPHFINNCNGFLTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.CODE = ?";
        }
        if(aFilterObject.totalSum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.TOTALSUM = ?";
        }
        if(aFilterObject.sumDekada1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.SUMDEKADA1 = ?";
        }
        if(aFilterObject.sumDekada2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.SUMDEKADA2 = ?";
        }
        if(aFilterObject.sumDekada3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.SUMDEKADA3 = ?";
        }
        if(aFilterObject.countFuelSpent != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.COUNTFUELSPENT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.MODIFY_TIME = ?";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANGRAPHFINNCNGFLTM.DEPARTMENTREFCODE = ? ";
        }
        if(aFilterObject.planGraphRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANGRAPHFINNCNGFLTM.PLANGRAPHREFCODE = ? ";
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
        if(aFilterObject.totalSum != null){
            number++;
            aFilterObject.totalSum = aFilterObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSum);
        }
        if(aFilterObject.sumDekada1 != null){
            number++;
            aFilterObject.sumDekada1 = aFilterObject.sumDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumDekada1);
        }
        if(aFilterObject.sumDekada2 != null){
            number++;
            aFilterObject.sumDekada2 = aFilterObject.sumDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumDekada2);
        }
        if(aFilterObject.sumDekada3 != null){
            number++;
            aFilterObject.sumDekada3 = aFilterObject.sumDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumDekada3);
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
                 whereStr = whereStr + " ENPLANGRAPHFINNCNGFLTM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENPLANGRAPHFINNCNGFLTM.USERGEN LIKE ?";

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
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.departmentRef.code);
       }
       if(aFilterObject.planGraphRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planGraphRef.code);
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

  public int[] getFilteredCodeArray(ENPlanGraphFinancingFuelItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENPlanGraphFinancingFuelItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENPLANGRAPHFINNCNGFLTM.CODE FROM ENPLANGRAPHFINNCNGFLTM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPLANGRAPHFINNCNGFLTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.CODE = ?";
        }
        if(aFilterObject.totalSum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.TOTALSUM = ?";
        }
        if(aFilterObject.sumDekada1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.SUMDEKADA1 = ?";
        }
        if(aFilterObject.sumDekada2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.SUMDEKADA2 = ?";
        }
        if(aFilterObject.sumDekada3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.SUMDEKADA3 = ?";
        }
        if(aFilterObject.countFuelSpent != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.COUNTFUELSPENT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANGRAPHFINNCNGFLTM.MODIFY_TIME = ?";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANGRAPHFINNCNGFLTM.DEPARTMENTREFCODE = ? ";
        }
        if(aFilterObject.planGraphRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANGRAPHFINNCNGFLTM.PLANGRAPHREFCODE = ? ";
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
        if(aFilterObject.totalSum != null){
            number++;
            aFilterObject.totalSum = aFilterObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSum);
        }
        if(aFilterObject.sumDekada1 != null){
            number++;
            aFilterObject.sumDekada1 = aFilterObject.sumDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumDekada1);
        }
        if(aFilterObject.sumDekada2 != null){
            number++;
            aFilterObject.sumDekada2 = aFilterObject.sumDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumDekada2);
        }
        if(aFilterObject.sumDekada3 != null){
            number++;
            aFilterObject.sumDekada3 = aFilterObject.sumDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumDekada3);
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
                 whereStr = whereStr + " ENPLANGRAPHFINNCNGFLTM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENPLANGRAPHFINNCNGFLTM.USERGEN LIKE ?";

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
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.departmentRef.code);
       }
       if(aFilterObject.planGraphRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planGraphRef.code);
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


   public ENPlanGraphFinancingFuelItem getObject(int uid) throws PersistenceException
   {
    ENPlanGraphFinancingFuelItem result = new ENPlanGraphFinancingFuelItem();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENPlanGraphFinancingFuelItem anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENPLANGRAPHFINNCNGFLTM.CODE, ENPLANGRAPHFINNCNGFLTM.TOTALSUM, ENPLANGRAPHFINNCNGFLTM.SUMDEKADA1, ENPLANGRAPHFINNCNGFLTM.SUMDEKADA2, ENPLANGRAPHFINNCNGFLTM.SUMDEKADA3, ENPLANGRAPHFINNCNGFLTM.COUNTFUELSPENT, ENPLANGRAPHFINNCNGFLTM.USERGEN, ENPLANGRAPHFINNCNGFLTM.DATEEDIT, ENPLANGRAPHFINNCNGFLTM.MODIFY_TIME, ENPLANGRAPHFINNCNGFLTM.DEPARTMENTREFCODE, ENPLANGRAPHFINNCNGFLTM.PLANGRAPHREFCODE "
    +" FROM ENPLANGRAPHFINNCNGFLTM WHERE ENPLANGRAPHFINNCNGFLTM.CODE = ?";

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
        anObject.totalSum = set.getBigDecimal(2);
        if(anObject.totalSum != null)
            anObject.totalSum = anObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumDekada1 = set.getBigDecimal(3);
        if(anObject.sumDekada1 != null)
            anObject.sumDekada1 = anObject.sumDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumDekada2 = set.getBigDecimal(4);
        if(anObject.sumDekada2 != null)
            anObject.sumDekada2 = anObject.sumDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumDekada3 = set.getBigDecimal(5);
        if(anObject.sumDekada3 != null)
            anObject.sumDekada3 = anObject.sumDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countFuelSpent = set.getBigDecimal(6);
        if(anObject.countFuelSpent != null)
            anObject.countFuelSpent = anObject.countFuelSpent.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(7);
        anObject.dateEdit = set.getTimestamp(8);
        anObject.modify_time = set.getLong(9);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.departmentRef.code = set.getInt(10);
        if ( set.wasNull() )
            anObject.departmentRef.code = Integer.MIN_VALUE;
        anObject.planGraphRef.code = set.getInt(11);
        if ( set.wasNull() )
            anObject.planGraphRef.code = Integer.MIN_VALUE;
        if(anObject.departmentRef.code != Integer.MIN_VALUE)
        {
           anObject.setDepartmentRef(
      new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.departmentRef.code));
    }
        if(anObject.planGraphRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlanGraphRef(
      new com.ksoe.energynet.dataminer.generated.ENPlanGraphFinancingFuelDAOGen(connection,getUserProfile()).getRef(anObject.planGraphRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENPlanGraphFinancingFuelItemRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENPlanGraphFinancingFuelItemRef ref = new com.ksoe.energynet.valueobject.references.ENPlanGraphFinancingFuelItemRef();
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

    selectStr = "DELETE FROM  ENPLANGRAPHFINNCNGFLTM WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENPlanGraphFinancingFuelItem object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENPlanGraphFinancingFuelItem.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanGraphFinancingFuelItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENPlanGraphFinancingFuelItem.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanGraphFinancingFuelItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENPlanGraphFinancingFuelItem.getObject%} access denied");

    selectStr =

    "SELECT  ENPLANGRAPHFINNCNGFLTM.CODE FROM  ENPLANGRAPHFINNCNGFLTM WHERE  ENPLANGRAPHFINNCNGFLTM.CODE = ?";
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
    _checkConditionToken(condition,"code","ENPLANGRAPHFINNCNGFLTM.CODE");
    _checkConditionToken(condition,"totalsum","ENPLANGRAPHFINNCNGFLTM.TOTALSUM");
    _checkConditionToken(condition,"sumdekada1","ENPLANGRAPHFINNCNGFLTM.SUMDEKADA1");
    _checkConditionToken(condition,"sumdekada2","ENPLANGRAPHFINNCNGFLTM.SUMDEKADA2");
    _checkConditionToken(condition,"sumdekada3","ENPLANGRAPHFINNCNGFLTM.SUMDEKADA3");
    _checkConditionToken(condition,"countfuelspent","ENPLANGRAPHFINNCNGFLTM.COUNTFUELSPENT");
    _checkConditionToken(condition,"usergen","ENPLANGRAPHFINNCNGFLTM.USERGEN");
    _checkConditionToken(condition,"dateedit","ENPLANGRAPHFINNCNGFLTM.DATEEDIT");
    _checkConditionToken(condition,"modify_time","ENPLANGRAPHFINNCNGFLTM.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"departmentref","DEPARTMENTREFCODE");
    _checkConditionToken(condition,"departmentref.code","DEPARTMENTREFCODE");
    _checkConditionToken(condition,"plangraphref","PLANGRAPHREFCODE");
    _checkConditionToken(condition,"plangraphref.code","PLANGRAPHREFCODE");
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

  private void _collectAutoIncrementFields(ENPlanGraphFinancingFuelItem anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENPLANGRAPHFINNCNGFLTM", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENPLANGRAPHFINNCNGFLTM", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENPLANGRAPHFINNCNGFLTM", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENPLANGRAPHFINNCNGFLTM");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENPlanGraphFinancingFuelItemDAO
