
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

import com.ksoe.energynet.valueobject.ENFuelDistributionSheetItem;
import com.ksoe.energynet.valueobject.filter.ENFuelDistributionSheetItemFilter;
import com.ksoe.energynet.valueobject.brief.ENFuelDistributionSheetItemShort;
import com.ksoe.energynet.valueobject.lists.ENFuelDistributionSheetItemShortList;


/**
 * DAO Object for ENFuelDistributionSheetItem;
 *
 */

public class ENFuelDistributionSheetItemDAOGen extends GenericDataMiner {

   public ENFuelDistributionSheetItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENFuelDistributionSheetItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   protected boolean isEqual(ENFuelDistributionSheetItem inObject) throws PersistenceException
   {
      ENFuelDistributionSheetItem obj = new ENFuelDistributionSheetItem();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.decadeNumber != obj.decadeNumber){
				return false;
			}

	if(inObject.countGen == null && obj.countGen == null){}
	else
		if(inObject.countGen == null || obj.countGen == null) return false;
		else
			if ( ! inObject.countGen.equals(obj.countGen)){
				return false;
			}

	if(inObject.count1 == null && obj.count1 == null){}
	else
		if(inObject.count1 == null || obj.count1 == null) return false;
		else
			if ( ! inObject.count1.equals(obj.count1)){
				return false;
			}

	if(inObject.count2 == null && obj.count2 == null){}
	else
		if(inObject.count2 == null || obj.count2 == null) return false;
		else
			if ( ! inObject.count2.equals(obj.count2)){
				return false;
			}

	if(inObject.count3 == null && obj.count3 == null){}
	else
		if(inObject.count3 == null || obj.count3 == null) return false;
		else
			if ( ! inObject.count3.equals(obj.count3)){
				return false;
			}

	if(inObject.count4 == null && obj.count4 == null){}
	else
		if(inObject.count4 == null || obj.count4 == null) return false;
		else
			if ( ! inObject.count4.equals(obj.count4)){
				return false;
			}

	if(inObject.count5 == null && obj.count5 == null){}
	else
		if(inObject.count5 == null || obj.count5 == null) return false;
		else
			if ( ! inObject.count5.equals(obj.count5)){
				return false;
			}

	if(inObject.count6 == null && obj.count6 == null){}
	else
		if(inObject.count6 == null || obj.count6 == null) return false;
		else
			if ( ! inObject.count6.equals(obj.count6)){
				return false;
			}

	if(inObject.count7 == null && obj.count7 == null){}
	else
		if(inObject.count7 == null || obj.count7 == null) return false;
		else
			if ( ! inObject.count7.equals(obj.count7)){
				return false;
			}

     if (inObject.isConfirmed != obj.isConfirmed){
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
     if (inObject.fuelDistributionRef.code != obj.fuelDistributionRef.code){
        return false;
     }
      return true;
   }

   public int add(ENFuelDistributionSheetItem anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENFuelDistributionSheetItem anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENFUELDISTRIBUTINSHTTM (CODE,DECADENUMBER,COUNTGEN,COUNT1,COUNT2,COUNT3,COUNT4,COUNT5,COUNT6,COUNT7,ISCONFIRMED,USERGEN,DATEEDIT,MODIFY_TIME,DEPARTMENTREFCODE,FUELDISTRIBUTIONREFCOD) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.decadeNumber != Integer.MIN_VALUE )
         statement.setInt(2,anObject.decadeNumber);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.countGen);
      if (anObject.count1 != null)
        anObject.count1 = anObject.count1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.count1);
      if (anObject.count2 != null)
        anObject.count2 = anObject.count2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.count2);
      if (anObject.count3 != null)
        anObject.count3 = anObject.count3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.count3);
      if (anObject.count4 != null)
        anObject.count4 = anObject.count4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.count4);
      if (anObject.count5 != null)
        anObject.count5 = anObject.count5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.count5);
      if (anObject.count6 != null)
        anObject.count6 = anObject.count6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.count6);
      if (anObject.count7 != null)
        anObject.count7 = anObject.count7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.count7);
      if (anObject.isConfirmed != Integer.MIN_VALUE )
         statement.setInt(11,anObject.isConfirmed);
      else
         statement.setNull(11,java.sql.Types.INTEGER);
      statement.setString(12,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(13,null);
      else
        statement.setTimestamp(13,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(14,null);
      else
        statement.setBigDecimal(14,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.departmentRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.departmentRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENFuelDistributionSheetItem.departmentRef.code%} = {%"+anObject.departmentRef.code+"%}");
        statement.setInt(15,anObject.departmentRef.code);
      }
      else
        statement.setNull(15,java.sql.Types.INTEGER);
      if (anObject.fuelDistributionRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENFuelDistributionSheetDAOGen(connection,getUserProfile()).exists(anObject.fuelDistributionRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENFuelDistributionSheetItem.fuelDistributionRef.code%} = {%"+anObject.fuelDistributionRef.code+"%}");
        statement.setInt(16,anObject.fuelDistributionRef.code);
      }
      else
        statement.setNull(16,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENFuelDistributionSheetItemDAOGen.add%}",e);
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

   public void save(ENFuelDistributionSheetItem anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENFuelDistributionSheetItem anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENFuelDistributionSheetItem oldObject = new ENFuelDistributionSheetItem();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENFuelDistributionSheetItem.modify_time_Field+" FROM  ENFUELDISTRIBUTINSHTTM WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("DECADENUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNTGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNT1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNT2") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNT3") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNT4") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNT5") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNT6") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNT7") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ISCONFIRMED") == 0)
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
          if(fieldNameStr.compareTo("FUELDISTRIBUTIONREF") == 0)
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
        "UPDATE ENFUELDISTRIBUTINSHTTM SET  DECADENUMBER = ? , COUNTGEN = ? , COUNT1 = ? , COUNT2 = ? , COUNT3 = ? , COUNT4 = ? , COUNT5 = ? , COUNT6 = ? , COUNT7 = ? , ISCONFIRMED = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , DEPARTMENTREFCODE = ? , FUELDISTRIBUTIONREFCOD = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENFUELDISTRIBUTIONSHEETITEM SET ";
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
      if (anObject.decadeNumber != Integer.MIN_VALUE )
         statement.setInt(1,anObject.decadeNumber);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.countGen);
      if (anObject.count1 != null)
        anObject.count1 = anObject.count1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.count1);
      if (anObject.count2 != null)
        anObject.count2 = anObject.count2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.count2);
      if (anObject.count3 != null)
        anObject.count3 = anObject.count3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.count3);
      if (anObject.count4 != null)
        anObject.count4 = anObject.count4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.count4);
      if (anObject.count5 != null)
        anObject.count5 = anObject.count5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.count5);
      if (anObject.count6 != null)
        anObject.count6 = anObject.count6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.count6);
      if (anObject.count7 != null)
        anObject.count7 = anObject.count7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.count7);
      if (anObject.isConfirmed != Integer.MIN_VALUE )
         statement.setInt(10,anObject.isConfirmed);
      else
         statement.setNull(10,java.sql.Types.INTEGER);
      statement.setString(11,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(12,null);
      else
        statement.setTimestamp(12,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(13,null);
      else
        statement.setBigDecimal(13,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.departmentRef.code != Integer.MIN_VALUE)
        statement.setInt(14,anObject.departmentRef.code);
      else
        statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.fuelDistributionRef.code != Integer.MIN_VALUE)
        statement.setInt(15,anObject.fuelDistributionRef.code);
      else
        statement.setNull(15,java.sql.Types.INTEGER);
          statement.setInt(16,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("DECADENUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.decadeNumber);
                continue;
             }
            if("COUNTGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countGen != null)
                    anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countGen);
                continue;
             }
            if("COUNT1".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.count1 != null)
                    anObject.count1 = anObject.count1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.count1);
                continue;
             }
            if("COUNT2".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.count2 != null)
                    anObject.count2 = anObject.count2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.count2);
                continue;
             }
            if("COUNT3".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.count3 != null)
                    anObject.count3 = anObject.count3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.count3);
                continue;
             }
            if("COUNT4".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.count4 != null)
                    anObject.count4 = anObject.count4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.count4);
                continue;
             }
            if("COUNT5".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.count5 != null)
                    anObject.count5 = anObject.count5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.count5);
                continue;
             }
            if("COUNT6".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.count6 != null)
                    anObject.count6 = anObject.count6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.count6);
                continue;
             }
            if("COUNT7".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.count7 != null)
                    anObject.count7 = anObject.count7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.count7);
                continue;
             }
            if("ISCONFIRMED".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.isConfirmed);
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
            if("FUELDISTRIBUTIONREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.fuelDistributionRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.fuelDistributionRef.code);
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

   } // end of save(ENFuelDistributionSheetItem anObject,String[] anAttributes)


 public ENFuelDistributionSheetItemShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENFuelDistributionSheetItem filterObject = new ENFuelDistributionSheetItem();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENFuelDistributionSheetItemShort)list.get(0);
   return null;
  }

  public ENFuelDistributionSheetItemShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENFuelDistributionSheetItemShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENFuelDistributionSheetItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENFuelDistributionSheetItemShortList getFilteredList(ENFuelDistributionSheetItem filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENFuelDistributionSheetItemShortList getScrollableFilteredList(ENFuelDistributionSheetItem aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENFuelDistributionSheetItemShortList getScrollableFilteredList(ENFuelDistributionSheetItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENFuelDistributionSheetItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENFuelDistributionSheetItemShortList getScrollableFilteredList(ENFuelDistributionSheetItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENFuelDistributionSheetItemShortList getScrollableFilteredList(ENFuelDistributionSheetItemFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENFuelDistributionSheetItemShortList getScrollableFilteredList(ENFuelDistributionSheetItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENFuelDistributionSheetItemShortList getScrollableFilteredList(ENFuelDistributionSheetItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENFuelDistributionSheetItemShortList result = new ENFuelDistributionSheetItemShortList();
    ENFuelDistributionSheetItemShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENFUELDISTRIBUTINSHTTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENFUELDISTRIBUTINSHTTM.CODE"+
     ",ENFUELDISTRIBUTINSHTTM.DECADENUMBER"+
     ",ENFUELDISTRIBUTINSHTTM.COUNTGEN"+
     ",ENFUELDISTRIBUTINSHTTM.COUNT1"+
     ",ENFUELDISTRIBUTINSHTTM.COUNT2"+
     ",ENFUELDISTRIBUTINSHTTM.COUNT3"+
     ",ENFUELDISTRIBUTINSHTTM.COUNT4"+
     ",ENFUELDISTRIBUTINSHTTM.COUNT5"+
     ",ENFUELDISTRIBUTINSHTTM.COUNT6"+
     ",ENFUELDISTRIBUTINSHTTM.COUNT7"+
     ",ENFUELDISTRIBUTINSHTTM.ISCONFIRMED"+
     ",ENFUELDISTRIBUTINSHTTM.USERGEN"+
     ",ENFUELDISTRIBUTINSHTTM.DATEEDIT"+

      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
      ", ENFUELDISTRIBUTIONSHET.CODE " +
      ", ENFUELDISTRIBUTIONSHET.MONTHGEN " +
      ", ENFUELDISTRIBUTIONSHET.YEARGEN " +
      ", ENFUELDISTRIBUTIONSHET.TOTALSUM " +
      ", ENFUELDISTRIBUTIONSHET.SUM1 " +
      ", ENFUELDISTRIBUTIONSHET.SUM2 " +
      ", ENFUELDISTRIBUTIONSHET.SUM3 " +
      ", ENFUELDISTRIBUTIONSHET.SUM4 " +
      ", ENFUELDISTRIBUTIONSHET.SUM5 " +
      ", ENFUELDISTRIBUTIONSHET.SUM6 " +
      ", ENFUELDISTRIBUTIONSHET.SUM7 " +
      ", ENFUELDISTRIBUTIONSHET.SUM1DEC1 " +
      ", ENFUELDISTRIBUTIONSHET.SUM2DEC1 " +
      ", ENFUELDISTRIBUTIONSHET.SUM3DEC1 " +
      ", ENFUELDISTRIBUTIONSHET.SUM4DEC1 " +
      ", ENFUELDISTRIBUTIONSHET.SUM5DEC1 " +
      ", ENFUELDISTRIBUTIONSHET.SUM6DEC1 " +
      ", ENFUELDISTRIBUTIONSHET.SUM7DEC1 " +
      ", ENFUELDISTRIBUTIONSHET.SUM1DEC2 " +
      ", ENFUELDISTRIBUTIONSHET.SUM2DEC2 " +
      ", ENFUELDISTRIBUTIONSHET.SUM3DEC2 " +
      ", ENFUELDISTRIBUTIONSHET.SUM4DEC2 " +
      ", ENFUELDISTRIBUTIONSHET.SUM5DEC2 " +
      ", ENFUELDISTRIBUTIONSHET.SUM6DEC2 " +
      ", ENFUELDISTRIBUTIONSHET.SUM7DEC2 " +
      ", ENFUELDISTRIBUTIONSHET.SUM1DEC3 " +
      ", ENFUELDISTRIBUTIONSHET.SUM2DEC3 " +
      ", ENFUELDISTRIBUTIONSHET.SUM3DEC3 " +
      ", ENFUELDISTRIBUTIONSHET.SUM4DEC3 " +
      ", ENFUELDISTRIBUTIONSHET.SUM5DEC3 " +
      ", ENFUELDISTRIBUTIONSHET.SUM6DEC3 " +
      ", ENFUELDISTRIBUTIONSHET.SUM7DEC3 " +
      ", ENFUELDISTRIBUTIONSHET.USERGEN " +
      ", ENFUELDISTRIBUTIONSHET.DATEEDIT " +
     " FROM ENFUELDISTRIBUTINSHTTM " +
     ", ENDEPARTMENT " +
     ", ENFUELDISTRIBUTIONSHET " +
     //" WHERE "
  "";
     whereStr = " ENDEPARTMENT.CODE = ENFUELDISTRIBUTINSHTTM.DEPARTMENTREFCODE" ; //+
      whereStr = whereStr +" AND ENFUELDISTRIBUTIONSHET.CODE = ENFUELDISTRIBUTINSHTTM.FUELDISTRIBUTIONREFCOD" ; //+
    //selectStr = selectStr + " ${s} ENFUELDISTRIBUTINSHTTM.CODE IN ( SELECT ENFUELDISTRIBUTINSHTTM.CODE FROM ENFUELDISTRIBUTINSHTTM ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.CODE = ?";
        }
        if(aFilterObject.decadeNumber != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.DECADENUMBER = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNTGEN = ?";
        }
        if(aFilterObject.count1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT1 = ?";
        }
        if(aFilterObject.count2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT2 = ?";
        }
        if(aFilterObject.count3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT3 = ?";
        }
        if(aFilterObject.count4 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT4 = ?";
        }
        if(aFilterObject.count5 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT5 = ?";
        }
        if(aFilterObject.count6 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT6 = ?";
        }
        if(aFilterObject.count7 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT7 = ?";
        }
        if(aFilterObject.isConfirmed != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.ISCONFIRMED = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENFUELDISTRIBUTINSHTTM.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENFUELDISTRIBUTINSHTTM.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.MODIFY_TIME = ?";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENFUELDISTRIBUTINSHTTM.DEPARTMENTREFCODE = ? ";
        }
        if(aFilterObject.fuelDistributionRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENFUELDISTRIBUTINSHTTM.FUELDISTRIBUTIONREFCOD = ? ";
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
         if(aFilterObject.decadeNumber != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.decadeNumber);
         }
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.count1 != null){
            number++;
            aFilterObject.count1 = aFilterObject.count1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count1);
        }
        if(aFilterObject.count2 != null){
            number++;
            aFilterObject.count2 = aFilterObject.count2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count2);
        }
        if(aFilterObject.count3 != null){
            number++;
            aFilterObject.count3 = aFilterObject.count3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count3);
        }
        if(aFilterObject.count4 != null){
            number++;
            aFilterObject.count4 = aFilterObject.count4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count4);
        }
        if(aFilterObject.count5 != null){
            number++;
            aFilterObject.count5 = aFilterObject.count5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count5);
        }
        if(aFilterObject.count6 != null){
            number++;
            aFilterObject.count6 = aFilterObject.count6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count6);
        }
        if(aFilterObject.count7 != null){
            number++;
            aFilterObject.count7 = aFilterObject.count7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count7);
        }
         if(aFilterObject.isConfirmed != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isConfirmed);
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
       if(aFilterObject.fuelDistributionRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fuelDistributionRef.code);
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

        anObject = new ENFuelDistributionSheetItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.decadeNumber = set.getInt(2);
        if ( set.wasNull() )
            anObject.decadeNumber = Integer.MIN_VALUE;
        anObject.countGen = set.getBigDecimal(3);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.count1 = set.getBigDecimal(4);
        if(anObject.count1 != null)
            anObject.count1 = anObject.count1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.count2 = set.getBigDecimal(5);
        if(anObject.count2 != null)
            anObject.count2 = anObject.count2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.count3 = set.getBigDecimal(6);
        if(anObject.count3 != null)
            anObject.count3 = anObject.count3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.count4 = set.getBigDecimal(7);
        if(anObject.count4 != null)
            anObject.count4 = anObject.count4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.count5 = set.getBigDecimal(8);
        if(anObject.count5 != null)
            anObject.count5 = anObject.count5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.count6 = set.getBigDecimal(9);
        if(anObject.count6 != null)
            anObject.count6 = anObject.count6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.count7 = set.getBigDecimal(10);
        if(anObject.count7 != null)
            anObject.count7 = anObject.count7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.isConfirmed = set.getInt(11);
        if ( set.wasNull() )
            anObject.isConfirmed = Integer.MIN_VALUE;
        anObject.userGen = set.getString(12);
        anObject.dateEdit = set.getTimestamp(13);

        anObject.departmentRefCode = set.getInt(14);
    if(set.wasNull())
      anObject.departmentRefCode = Integer.MIN_VALUE;
        anObject.departmentRefShortName = set.getString(15);
        anObject.departmentRefDateStart = set.getDate(16);
        anObject.departmentRefDateFinal = set.getDate(17);
        anObject.departmentRefRenCode = set.getInt(18);
    if(set.wasNull())
      anObject.departmentRefRenCode = Integer.MIN_VALUE;
        anObject.departmentRefShpzBalans = set.getString(19);
        anObject.departmentRefKau_table_id_1884 = set.getInt(20);
    if(set.wasNull())
      anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
        anObject.departmentRefKau_1884 = set.getString(21);
        anObject.departmentRefName_1884 = set.getString(22);
        anObject.fuelDistributionRefCode = set.getInt(23);
    if(set.wasNull())
      anObject.fuelDistributionRefCode = Integer.MIN_VALUE;
        anObject.fuelDistributionRefMonthGen = set.getInt(24);
    if(set.wasNull())
      anObject.fuelDistributionRefMonthGen = Integer.MIN_VALUE;
        anObject.fuelDistributionRefYearGen = set.getInt(25);
    if(set.wasNull())
      anObject.fuelDistributionRefYearGen = Integer.MIN_VALUE;
        anObject.fuelDistributionRefTotalSum = set.getBigDecimal(26);
        if(anObject.fuelDistributionRefTotalSum != null)
          anObject.fuelDistributionRefTotalSum = anObject.fuelDistributionRefTotalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum1 = set.getBigDecimal(27);
        if(anObject.fuelDistributionRefSum1 != null)
          anObject.fuelDistributionRefSum1 = anObject.fuelDistributionRefSum1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum2 = set.getBigDecimal(28);
        if(anObject.fuelDistributionRefSum2 != null)
          anObject.fuelDistributionRefSum2 = anObject.fuelDistributionRefSum2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum3 = set.getBigDecimal(29);
        if(anObject.fuelDistributionRefSum3 != null)
          anObject.fuelDistributionRefSum3 = anObject.fuelDistributionRefSum3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum4 = set.getBigDecimal(30);
        if(anObject.fuelDistributionRefSum4 != null)
          anObject.fuelDistributionRefSum4 = anObject.fuelDistributionRefSum4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum5 = set.getBigDecimal(31);
        if(anObject.fuelDistributionRefSum5 != null)
          anObject.fuelDistributionRefSum5 = anObject.fuelDistributionRefSum5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum6 = set.getBigDecimal(32);
        if(anObject.fuelDistributionRefSum6 != null)
          anObject.fuelDistributionRefSum6 = anObject.fuelDistributionRefSum6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum7 = set.getBigDecimal(33);
        if(anObject.fuelDistributionRefSum7 != null)
          anObject.fuelDistributionRefSum7 = anObject.fuelDistributionRefSum7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum1dec1 = set.getBigDecimal(34);
        if(anObject.fuelDistributionRefSum1dec1 != null)
          anObject.fuelDistributionRefSum1dec1 = anObject.fuelDistributionRefSum1dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum2dec1 = set.getBigDecimal(35);
        if(anObject.fuelDistributionRefSum2dec1 != null)
          anObject.fuelDistributionRefSum2dec1 = anObject.fuelDistributionRefSum2dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum3dec1 = set.getBigDecimal(36);
        if(anObject.fuelDistributionRefSum3dec1 != null)
          anObject.fuelDistributionRefSum3dec1 = anObject.fuelDistributionRefSum3dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum4dec1 = set.getBigDecimal(37);
        if(anObject.fuelDistributionRefSum4dec1 != null)
          anObject.fuelDistributionRefSum4dec1 = anObject.fuelDistributionRefSum4dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum5dec1 = set.getBigDecimal(38);
        if(anObject.fuelDistributionRefSum5dec1 != null)
          anObject.fuelDistributionRefSum5dec1 = anObject.fuelDistributionRefSum5dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum6dec1 = set.getBigDecimal(39);
        if(anObject.fuelDistributionRefSum6dec1 != null)
          anObject.fuelDistributionRefSum6dec1 = anObject.fuelDistributionRefSum6dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum7dec1 = set.getBigDecimal(40);
        if(anObject.fuelDistributionRefSum7dec1 != null)
          anObject.fuelDistributionRefSum7dec1 = anObject.fuelDistributionRefSum7dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum1dec2 = set.getBigDecimal(41);
        if(anObject.fuelDistributionRefSum1dec2 != null)
          anObject.fuelDistributionRefSum1dec2 = anObject.fuelDistributionRefSum1dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum2dec2 = set.getBigDecimal(42);
        if(anObject.fuelDistributionRefSum2dec2 != null)
          anObject.fuelDistributionRefSum2dec2 = anObject.fuelDistributionRefSum2dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum3dec2 = set.getBigDecimal(43);
        if(anObject.fuelDistributionRefSum3dec2 != null)
          anObject.fuelDistributionRefSum3dec2 = anObject.fuelDistributionRefSum3dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum4dec2 = set.getBigDecimal(44);
        if(anObject.fuelDistributionRefSum4dec2 != null)
          anObject.fuelDistributionRefSum4dec2 = anObject.fuelDistributionRefSum4dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum5dec2 = set.getBigDecimal(45);
        if(anObject.fuelDistributionRefSum5dec2 != null)
          anObject.fuelDistributionRefSum5dec2 = anObject.fuelDistributionRefSum5dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum6dec2 = set.getBigDecimal(46);
        if(anObject.fuelDistributionRefSum6dec2 != null)
          anObject.fuelDistributionRefSum6dec2 = anObject.fuelDistributionRefSum6dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum7dec2 = set.getBigDecimal(47);
        if(anObject.fuelDistributionRefSum7dec2 != null)
          anObject.fuelDistributionRefSum7dec2 = anObject.fuelDistributionRefSum7dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum1dec3 = set.getBigDecimal(48);
        if(anObject.fuelDistributionRefSum1dec3 != null)
          anObject.fuelDistributionRefSum1dec3 = anObject.fuelDistributionRefSum1dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum2dec3 = set.getBigDecimal(49);
        if(anObject.fuelDistributionRefSum2dec3 != null)
          anObject.fuelDistributionRefSum2dec3 = anObject.fuelDistributionRefSum2dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum3dec3 = set.getBigDecimal(50);
        if(anObject.fuelDistributionRefSum3dec3 != null)
          anObject.fuelDistributionRefSum3dec3 = anObject.fuelDistributionRefSum3dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum4dec3 = set.getBigDecimal(51);
        if(anObject.fuelDistributionRefSum4dec3 != null)
          anObject.fuelDistributionRefSum4dec3 = anObject.fuelDistributionRefSum4dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum5dec3 = set.getBigDecimal(52);
        if(anObject.fuelDistributionRefSum5dec3 != null)
          anObject.fuelDistributionRefSum5dec3 = anObject.fuelDistributionRefSum5dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum6dec3 = set.getBigDecimal(53);
        if(anObject.fuelDistributionRefSum6dec3 != null)
          anObject.fuelDistributionRefSum6dec3 = anObject.fuelDistributionRefSum6dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefSum7dec3 = set.getBigDecimal(54);
        if(anObject.fuelDistributionRefSum7dec3 != null)
          anObject.fuelDistributionRefSum7dec3 = anObject.fuelDistributionRefSum7dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelDistributionRefUserGen = set.getString(55);
        anObject.fuelDistributionRefDateEdit = set.getTimestamp(56);

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

  public int[] getFilteredCodeArrayOLD(ENFuelDistributionSheetItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENFUELDISTRIBUTINSHTTM.CODE FROM ENFUELDISTRIBUTINSHTTM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENFUELDISTRIBUTINSHTTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.CODE = ?";
        }
        if(aFilterObject.decadeNumber != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.DECADENUMBER = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNTGEN = ?";
        }
        if(aFilterObject.count1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT1 = ?";
        }
        if(aFilterObject.count2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT2 = ?";
        }
        if(aFilterObject.count3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT3 = ?";
        }
        if(aFilterObject.count4 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT4 = ?";
        }
        if(aFilterObject.count5 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT5 = ?";
        }
        if(aFilterObject.count6 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT6 = ?";
        }
        if(aFilterObject.count7 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT7 = ?";
        }
        if(aFilterObject.isConfirmed != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.ISCONFIRMED = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.MODIFY_TIME = ?";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELDISTRIBUTINSHTTM.DEPARTMENTREFCODE = ? ";
        }
        if(aFilterObject.fuelDistributionRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELDISTRIBUTINSHTTM.FUELDISTRIBUTIONREFCOD = ? ";
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
         if(aFilterObject.decadeNumber != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.decadeNumber);
         }
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.count1 != null){
            number++;
            aFilterObject.count1 = aFilterObject.count1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count1);
        }
        if(aFilterObject.count2 != null){
            number++;
            aFilterObject.count2 = aFilterObject.count2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count2);
        }
        if(aFilterObject.count3 != null){
            number++;
            aFilterObject.count3 = aFilterObject.count3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count3);
        }
        if(aFilterObject.count4 != null){
            number++;
            aFilterObject.count4 = aFilterObject.count4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count4);
        }
        if(aFilterObject.count5 != null){
            number++;
            aFilterObject.count5 = aFilterObject.count5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count5);
        }
        if(aFilterObject.count6 != null){
            number++;
            aFilterObject.count6 = aFilterObject.count6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count6);
        }
        if(aFilterObject.count7 != null){
            number++;
            aFilterObject.count7 = aFilterObject.count7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count7);
        }
         if(aFilterObject.isConfirmed != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isConfirmed);
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENFUELDISTRIBUTINSHTTM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENFUELDISTRIBUTINSHTTM.USERGEN LIKE ?";

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
       if(aFilterObject.fuelDistributionRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fuelDistributionRef.code);
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

  public int[] getFilteredCodeArray(ENFuelDistributionSheetItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENFuelDistributionSheetItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENFUELDISTRIBUTINSHTTM.CODE FROM ENFUELDISTRIBUTINSHTTM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENFUELDISTRIBUTINSHTTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.CODE = ?";
        }
        if(aFilterObject.decadeNumber != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.DECADENUMBER = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNTGEN = ?";
        }
        if(aFilterObject.count1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT1 = ?";
        }
        if(aFilterObject.count2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT2 = ?";
        }
        if(aFilterObject.count3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT3 = ?";
        }
        if(aFilterObject.count4 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT4 = ?";
        }
        if(aFilterObject.count5 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT5 = ?";
        }
        if(aFilterObject.count6 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT6 = ?";
        }
        if(aFilterObject.count7 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.COUNT7 = ?";
        }
        if(aFilterObject.isConfirmed != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.ISCONFIRMED = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTINSHTTM.MODIFY_TIME = ?";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELDISTRIBUTINSHTTM.DEPARTMENTREFCODE = ? ";
        }
        if(aFilterObject.fuelDistributionRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELDISTRIBUTINSHTTM.FUELDISTRIBUTIONREFCOD = ? ";
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
         if(aFilterObject.decadeNumber != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.decadeNumber);
         }
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.count1 != null){
            number++;
            aFilterObject.count1 = aFilterObject.count1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count1);
        }
        if(aFilterObject.count2 != null){
            number++;
            aFilterObject.count2 = aFilterObject.count2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count2);
        }
        if(aFilterObject.count3 != null){
            number++;
            aFilterObject.count3 = aFilterObject.count3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count3);
        }
        if(aFilterObject.count4 != null){
            number++;
            aFilterObject.count4 = aFilterObject.count4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count4);
        }
        if(aFilterObject.count5 != null){
            number++;
            aFilterObject.count5 = aFilterObject.count5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count5);
        }
        if(aFilterObject.count6 != null){
            number++;
            aFilterObject.count6 = aFilterObject.count6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count6);
        }
        if(aFilterObject.count7 != null){
            number++;
            aFilterObject.count7 = aFilterObject.count7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.count7);
        }
         if(aFilterObject.isConfirmed != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isConfirmed);
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENFUELDISTRIBUTINSHTTM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENFUELDISTRIBUTINSHTTM.USERGEN LIKE ?";

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
       if(aFilterObject.fuelDistributionRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fuelDistributionRef.code);
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


   public ENFuelDistributionSheetItem getObject(int uid) throws PersistenceException
   {
    ENFuelDistributionSheetItem result = new ENFuelDistributionSheetItem();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENFuelDistributionSheetItem anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENFUELDISTRIBUTINSHTTM.CODE, ENFUELDISTRIBUTINSHTTM.DECADENUMBER, ENFUELDISTRIBUTINSHTTM.COUNTGEN, ENFUELDISTRIBUTINSHTTM.COUNT1, ENFUELDISTRIBUTINSHTTM.COUNT2, ENFUELDISTRIBUTINSHTTM.COUNT3, ENFUELDISTRIBUTINSHTTM.COUNT4, ENFUELDISTRIBUTINSHTTM.COUNT5, ENFUELDISTRIBUTINSHTTM.COUNT6, ENFUELDISTRIBUTINSHTTM.COUNT7, ENFUELDISTRIBUTINSHTTM.ISCONFIRMED, ENFUELDISTRIBUTINSHTTM.USERGEN, ENFUELDISTRIBUTINSHTTM.DATEEDIT, ENFUELDISTRIBUTINSHTTM.MODIFY_TIME, ENFUELDISTRIBUTINSHTTM.DEPARTMENTREFCODE, ENFUELDISTRIBUTINSHTTM.FUELDISTRIBUTIONREFCOD "
    +" FROM ENFUELDISTRIBUTINSHTTM WHERE ENFUELDISTRIBUTINSHTTM.CODE = ?";

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
        anObject.decadeNumber = set.getInt(2);
        if ( set.wasNull() )
           anObject.decadeNumber = Integer.MIN_VALUE;
        anObject.countGen = set.getBigDecimal(3);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.count1 = set.getBigDecimal(4);
        if(anObject.count1 != null)
            anObject.count1 = anObject.count1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.count2 = set.getBigDecimal(5);
        if(anObject.count2 != null)
            anObject.count2 = anObject.count2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.count3 = set.getBigDecimal(6);
        if(anObject.count3 != null)
            anObject.count3 = anObject.count3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.count4 = set.getBigDecimal(7);
        if(anObject.count4 != null)
            anObject.count4 = anObject.count4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.count5 = set.getBigDecimal(8);
        if(anObject.count5 != null)
            anObject.count5 = anObject.count5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.count6 = set.getBigDecimal(9);
        if(anObject.count6 != null)
            anObject.count6 = anObject.count6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.count7 = set.getBigDecimal(10);
        if(anObject.count7 != null)
            anObject.count7 = anObject.count7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.isConfirmed = set.getInt(11);
        if ( set.wasNull() )
           anObject.isConfirmed = Integer.MIN_VALUE;
        anObject.userGen = set.getString(12);
        anObject.dateEdit = set.getTimestamp(13);
        anObject.modify_time = set.getLong(14);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.departmentRef.code = set.getInt(15);
        if ( set.wasNull() )
            anObject.departmentRef.code = Integer.MIN_VALUE;
        anObject.fuelDistributionRef.code = set.getInt(16);
        if ( set.wasNull() )
            anObject.fuelDistributionRef.code = Integer.MIN_VALUE;
        if(anObject.departmentRef.code != Integer.MIN_VALUE)
        {
           anObject.setDepartmentRef(
      new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.departmentRef.code));
    }
        if(anObject.fuelDistributionRef.code != Integer.MIN_VALUE)
        {
           anObject.setFuelDistributionRef(
      new com.ksoe.energynet.dataminer.generated.ENFuelDistributionSheetDAOGen(connection,getUserProfile()).getRef(anObject.fuelDistributionRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENFuelDistributionSheetItemRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENFuelDistributionSheetItemRef ref = new com.ksoe.energynet.valueobject.references.ENFuelDistributionSheetItemRef();
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

    selectStr = "DELETE FROM  ENFUELDISTRIBUTINSHTTM WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENFuelDistributionSheetItem object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENFuelDistributionSheetItem.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENFuelDistributionSheetItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENFuelDistributionSheetItem.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENFuelDistributionSheetItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENFuelDistributionSheetItem.getObject%} access denied");

    selectStr =

    "SELECT  ENFUELDISTRIBUTINSHTTM.CODE FROM  ENFUELDISTRIBUTINSHTTM WHERE  ENFUELDISTRIBUTINSHTTM.CODE = ?";
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
    _checkConditionToken(condition,"code","ENFUELDISTRIBUTINSHTTM.CODE");
    _checkConditionToken(condition,"decadenumber","ENFUELDISTRIBUTINSHTTM.DECADENUMBER");
    _checkConditionToken(condition,"countgen","ENFUELDISTRIBUTINSHTTM.COUNTGEN");
    _checkConditionToken(condition,"count1","ENFUELDISTRIBUTINSHTTM.COUNT1");
    _checkConditionToken(condition,"count2","ENFUELDISTRIBUTINSHTTM.COUNT2");
    _checkConditionToken(condition,"count3","ENFUELDISTRIBUTINSHTTM.COUNT3");
    _checkConditionToken(condition,"count4","ENFUELDISTRIBUTINSHTTM.COUNT4");
    _checkConditionToken(condition,"count5","ENFUELDISTRIBUTINSHTTM.COUNT5");
    _checkConditionToken(condition,"count6","ENFUELDISTRIBUTINSHTTM.COUNT6");
    _checkConditionToken(condition,"count7","ENFUELDISTRIBUTINSHTTM.COUNT7");
    _checkConditionToken(condition,"isconfirmed","ENFUELDISTRIBUTINSHTTM.ISCONFIRMED");
    _checkConditionToken(condition,"usergen","ENFUELDISTRIBUTINSHTTM.USERGEN");
    _checkConditionToken(condition,"dateedit","ENFUELDISTRIBUTINSHTTM.DATEEDIT");
    _checkConditionToken(condition,"modify_time","ENFUELDISTRIBUTINSHTTM.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"departmentref","DEPARTMENTREFCODE");
    _checkConditionToken(condition,"departmentref.code","DEPARTMENTREFCODE");
    _checkConditionToken(condition,"fueldistributionref","FUELDISTRIBUTIONREFCOD");
    _checkConditionToken(condition,"fueldistributionref.code","FUELDISTRIBUTIONREFCOD");
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

  private void _collectAutoIncrementFields(ENFuelDistributionSheetItem anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENFUELDISTRIBUTINSHTTM", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENFUELDISTRIBUTINSHTTM", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENFUELDISTRIBUTINSHTTM", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENFUELDISTRIBUTINSHTTM");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENFuelDistributionSheetItemDAO
