
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

import com.ksoe.energynet.valueobject.ENFuelDistributionSheet;
import com.ksoe.energynet.valueobject.filter.ENFuelDistributionSheetFilter;
import com.ksoe.energynet.valueobject.brief.ENFuelDistributionSheetShort;
import com.ksoe.energynet.valueobject.lists.ENFuelDistributionSheetShortList;

import com.ksoe.techcard.dataminer.TKFuelTypeDAO;

/**
 * DAO Object for ENFuelDistributionSheet;
 *
 */

public class ENFuelDistributionSheetDAOGen extends GenericDataMiner {

   public ENFuelDistributionSheetDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENFuelDistributionSheetDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   protected boolean isEqual(ENFuelDistributionSheet inObject) throws PersistenceException
   {
      ENFuelDistributionSheet obj = new ENFuelDistributionSheet();
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

	if(inObject.sum1 == null && obj.sum1 == null){}
	else
		if(inObject.sum1 == null || obj.sum1 == null) return false;
		else
			if ( ! inObject.sum1.equals(obj.sum1)){
				return false;
			}

	if(inObject.sum2 == null && obj.sum2 == null){}
	else
		if(inObject.sum2 == null || obj.sum2 == null) return false;
		else
			if ( ! inObject.sum2.equals(obj.sum2)){
				return false;
			}

	if(inObject.sum3 == null && obj.sum3 == null){}
	else
		if(inObject.sum3 == null || obj.sum3 == null) return false;
		else
			if ( ! inObject.sum3.equals(obj.sum3)){
				return false;
			}

	if(inObject.sum4 == null && obj.sum4 == null){}
	else
		if(inObject.sum4 == null || obj.sum4 == null) return false;
		else
			if ( ! inObject.sum4.equals(obj.sum4)){
				return false;
			}

	if(inObject.sum5 == null && obj.sum5 == null){}
	else
		if(inObject.sum5 == null || obj.sum5 == null) return false;
		else
			if ( ! inObject.sum5.equals(obj.sum5)){
				return false;
			}

	if(inObject.sum6 == null && obj.sum6 == null){}
	else
		if(inObject.sum6 == null || obj.sum6 == null) return false;
		else
			if ( ! inObject.sum6.equals(obj.sum6)){
				return false;
			}

	if(inObject.sum7 == null && obj.sum7 == null){}
	else
		if(inObject.sum7 == null || obj.sum7 == null) return false;
		else
			if ( ! inObject.sum7.equals(obj.sum7)){
				return false;
			}

	if(inObject.sum1dec1 == null && obj.sum1dec1 == null){}
	else
		if(inObject.sum1dec1 == null || obj.sum1dec1 == null) return false;
		else
			if ( ! inObject.sum1dec1.equals(obj.sum1dec1)){
				return false;
			}

	if(inObject.sum2dec1 == null && obj.sum2dec1 == null){}
	else
		if(inObject.sum2dec1 == null || obj.sum2dec1 == null) return false;
		else
			if ( ! inObject.sum2dec1.equals(obj.sum2dec1)){
				return false;
			}

	if(inObject.sum3dec1 == null && obj.sum3dec1 == null){}
	else
		if(inObject.sum3dec1 == null || obj.sum3dec1 == null) return false;
		else
			if ( ! inObject.sum3dec1.equals(obj.sum3dec1)){
				return false;
			}

	if(inObject.sum4dec1 == null && obj.sum4dec1 == null){}
	else
		if(inObject.sum4dec1 == null || obj.sum4dec1 == null) return false;
		else
			if ( ! inObject.sum4dec1.equals(obj.sum4dec1)){
				return false;
			}

	if(inObject.sum5dec1 == null && obj.sum5dec1 == null){}
	else
		if(inObject.sum5dec1 == null || obj.sum5dec1 == null) return false;
		else
			if ( ! inObject.sum5dec1.equals(obj.sum5dec1)){
				return false;
			}

	if(inObject.sum6dec1 == null && obj.sum6dec1 == null){}
	else
		if(inObject.sum6dec1 == null || obj.sum6dec1 == null) return false;
		else
			if ( ! inObject.sum6dec1.equals(obj.sum6dec1)){
				return false;
			}

	if(inObject.sum7dec1 == null && obj.sum7dec1 == null){}
	else
		if(inObject.sum7dec1 == null || obj.sum7dec1 == null) return false;
		else
			if ( ! inObject.sum7dec1.equals(obj.sum7dec1)){
				return false;
			}

	if(inObject.sum1dec2 == null && obj.sum1dec2 == null){}
	else
		if(inObject.sum1dec2 == null || obj.sum1dec2 == null) return false;
		else
			if ( ! inObject.sum1dec2.equals(obj.sum1dec2)){
				return false;
			}

	if(inObject.sum2dec2 == null && obj.sum2dec2 == null){}
	else
		if(inObject.sum2dec2 == null || obj.sum2dec2 == null) return false;
		else
			if ( ! inObject.sum2dec2.equals(obj.sum2dec2)){
				return false;
			}

	if(inObject.sum3dec2 == null && obj.sum3dec2 == null){}
	else
		if(inObject.sum3dec2 == null || obj.sum3dec2 == null) return false;
		else
			if ( ! inObject.sum3dec2.equals(obj.sum3dec2)){
				return false;
			}

	if(inObject.sum4dec2 == null && obj.sum4dec2 == null){}
	else
		if(inObject.sum4dec2 == null || obj.sum4dec2 == null) return false;
		else
			if ( ! inObject.sum4dec2.equals(obj.sum4dec2)){
				return false;
			}

	if(inObject.sum5dec2 == null && obj.sum5dec2 == null){}
	else
		if(inObject.sum5dec2 == null || obj.sum5dec2 == null) return false;
		else
			if ( ! inObject.sum5dec2.equals(obj.sum5dec2)){
				return false;
			}

	if(inObject.sum6dec2 == null && obj.sum6dec2 == null){}
	else
		if(inObject.sum6dec2 == null || obj.sum6dec2 == null) return false;
		else
			if ( ! inObject.sum6dec2.equals(obj.sum6dec2)){
				return false;
			}

	if(inObject.sum7dec2 == null && obj.sum7dec2 == null){}
	else
		if(inObject.sum7dec2 == null || obj.sum7dec2 == null) return false;
		else
			if ( ! inObject.sum7dec2.equals(obj.sum7dec2)){
				return false;
			}

	if(inObject.sum1dec3 == null && obj.sum1dec3 == null){}
	else
		if(inObject.sum1dec3 == null || obj.sum1dec3 == null) return false;
		else
			if ( ! inObject.sum1dec3.equals(obj.sum1dec3)){
				return false;
			}

	if(inObject.sum2dec3 == null && obj.sum2dec3 == null){}
	else
		if(inObject.sum2dec3 == null || obj.sum2dec3 == null) return false;
		else
			if ( ! inObject.sum2dec3.equals(obj.sum2dec3)){
				return false;
			}

	if(inObject.sum3dec3 == null && obj.sum3dec3 == null){}
	else
		if(inObject.sum3dec3 == null || obj.sum3dec3 == null) return false;
		else
			if ( ! inObject.sum3dec3.equals(obj.sum3dec3)){
				return false;
			}

	if(inObject.sum4dec3 == null && obj.sum4dec3 == null){}
	else
		if(inObject.sum4dec3 == null || obj.sum4dec3 == null) return false;
		else
			if ( ! inObject.sum4dec3.equals(obj.sum4dec3)){
				return false;
			}

	if(inObject.sum5dec3 == null && obj.sum5dec3 == null){}
	else
		if(inObject.sum5dec3 == null || obj.sum5dec3 == null) return false;
		else
			if ( ! inObject.sum5dec3.equals(obj.sum5dec3)){
				return false;
			}

	if(inObject.sum6dec3 == null && obj.sum6dec3 == null){}
	else
		if(inObject.sum6dec3 == null || obj.sum6dec3 == null) return false;
		else
			if ( ! inObject.sum6dec3.equals(obj.sum6dec3)){
				return false;
			}

	if(inObject.sum7dec3 == null && obj.sum7dec3 == null){}
	else
		if(inObject.sum7dec3 == null || obj.sum7dec3 == null) return false;
		else
			if ( ! inObject.sum7dec3.equals(obj.sum7dec3)){
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

   public int add(ENFuelDistributionSheet anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENFuelDistributionSheet anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENFUELDISTRIBUTIONSHET (CODE,MONTHGEN,YEARGEN,TOTALSUM,SUM1,SUM2,SUM3,SUM4,SUM5,SUM6,SUM7,SUM1DEC1,SUM2DEC1,SUM3DEC1,SUM4DEC1,SUM5DEC1,SUM6DEC1,SUM7DEC1,SUM1DEC2,SUM2DEC2,SUM3DEC2,SUM4DEC2,SUM5DEC2,SUM6DEC2,SUM7DEC2,SUM1DEC3,SUM2DEC3,SUM3DEC3,SUM4DEC3,SUM5DEC3,SUM6DEC3,SUM7DEC3,USERGEN,DATEEDIT,MODIFY_TIME,FUELTYPEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

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
      if (anObject.sum1 != null)
        anObject.sum1 = anObject.sum1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.sum1);
      if (anObject.sum2 != null)
        anObject.sum2 = anObject.sum2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.sum2);
      if (anObject.sum3 != null)
        anObject.sum3 = anObject.sum3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.sum3);
      if (anObject.sum4 != null)
        anObject.sum4 = anObject.sum4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.sum4);
      if (anObject.sum5 != null)
        anObject.sum5 = anObject.sum5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.sum5);
      if (anObject.sum6 != null)
        anObject.sum6 = anObject.sum6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.sum6);
      if (anObject.sum7 != null)
        anObject.sum7 = anObject.sum7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.sum7);
      if (anObject.sum1dec1 != null)
        anObject.sum1dec1 = anObject.sum1dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.sum1dec1);
      if (anObject.sum2dec1 != null)
        anObject.sum2dec1 = anObject.sum2dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(13,anObject.sum2dec1);
      if (anObject.sum3dec1 != null)
        anObject.sum3dec1 = anObject.sum3dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(14,anObject.sum3dec1);
      if (anObject.sum4dec1 != null)
        anObject.sum4dec1 = anObject.sum4dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(15,anObject.sum4dec1);
      if (anObject.sum5dec1 != null)
        anObject.sum5dec1 = anObject.sum5dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(16,anObject.sum5dec1);
      if (anObject.sum6dec1 != null)
        anObject.sum6dec1 = anObject.sum6dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(17,anObject.sum6dec1);
      if (anObject.sum7dec1 != null)
        anObject.sum7dec1 = anObject.sum7dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(18,anObject.sum7dec1);
      if (anObject.sum1dec2 != null)
        anObject.sum1dec2 = anObject.sum1dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(19,anObject.sum1dec2);
      if (anObject.sum2dec2 != null)
        anObject.sum2dec2 = anObject.sum2dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(20,anObject.sum2dec2);
      if (anObject.sum3dec2 != null)
        anObject.sum3dec2 = anObject.sum3dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(21,anObject.sum3dec2);
      if (anObject.sum4dec2 != null)
        anObject.sum4dec2 = anObject.sum4dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(22,anObject.sum4dec2);
      if (anObject.sum5dec2 != null)
        anObject.sum5dec2 = anObject.sum5dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(23,anObject.sum5dec2);
      if (anObject.sum6dec2 != null)
        anObject.sum6dec2 = anObject.sum6dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(24,anObject.sum6dec2);
      if (anObject.sum7dec2 != null)
        anObject.sum7dec2 = anObject.sum7dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(25,anObject.sum7dec2);
      if (anObject.sum1dec3 != null)
        anObject.sum1dec3 = anObject.sum1dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(26,anObject.sum1dec3);
      if (anObject.sum2dec3 != null)
        anObject.sum2dec3 = anObject.sum2dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(27,anObject.sum2dec3);
      if (anObject.sum3dec3 != null)
        anObject.sum3dec3 = anObject.sum3dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(28,anObject.sum3dec3);
      if (anObject.sum4dec3 != null)
        anObject.sum4dec3 = anObject.sum4dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(29,anObject.sum4dec3);
      if (anObject.sum5dec3 != null)
        anObject.sum5dec3 = anObject.sum5dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(30,anObject.sum5dec3);
      if (anObject.sum6dec3 != null)
        anObject.sum6dec3 = anObject.sum6dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(31,anObject.sum6dec3);
      if (anObject.sum7dec3 != null)
        anObject.sum7dec3 = anObject.sum7dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(32,anObject.sum7dec3);
      statement.setString(33,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(34,null);
      else
        statement.setTimestamp(34,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(35,null);
      else
        statement.setBigDecimal(35,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.fuelTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKFuelTypeDAOGen(connection,getUserProfile()).exists(anObject.fuelTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENFuelDistributionSheet.fuelTypeRef.code%} = {%"+anObject.fuelTypeRef.code+"%}");
        statement.setInt(36,anObject.fuelTypeRef.code);
      }
      else
        statement.setNull(36,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENFuelDistributionSheetDAOGen.add%}",e);
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

   public void save(ENFuelDistributionSheet anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENFuelDistributionSheet anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENFuelDistributionSheet oldObject = new ENFuelDistributionSheet();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENFuelDistributionSheet.modify_time_Field+" FROM  ENFUELDISTRIBUTIONSHET WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("SUM1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM2") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM3") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM4") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM5") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM6") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM7") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM1DEC1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM2DEC1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM3DEC1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM4DEC1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM5DEC1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM6DEC1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM7DEC1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM1DEC2") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM2DEC2") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM3DEC2") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM4DEC2") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM5DEC2") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM6DEC2") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM7DEC2") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM1DEC3") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM2DEC3") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM3DEC3") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM4DEC3") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM5DEC3") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM6DEC3") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM7DEC3") == 0)
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
        "UPDATE ENFUELDISTRIBUTIONSHET SET  MONTHGEN = ? , YEARGEN = ? , TOTALSUM = ? , SUM1 = ? , SUM2 = ? , SUM3 = ? , SUM4 = ? , SUM5 = ? , SUM6 = ? , SUM7 = ? , SUM1DEC1 = ? , SUM2DEC1 = ? , SUM3DEC1 = ? , SUM4DEC1 = ? , SUM5DEC1 = ? , SUM6DEC1 = ? , SUM7DEC1 = ? , SUM1DEC2 = ? , SUM2DEC2 = ? , SUM3DEC2 = ? , SUM4DEC2 = ? , SUM5DEC2 = ? , SUM6DEC2 = ? , SUM7DEC2 = ? , SUM1DEC3 = ? , SUM2DEC3 = ? , SUM3DEC3 = ? , SUM4DEC3 = ? , SUM5DEC3 = ? , SUM6DEC3 = ? , SUM7DEC3 = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , FUELTYPEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENFUELDISTRIBUTIONSHEET SET ";
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
      if (anObject.sum1 != null)
        anObject.sum1 = anObject.sum1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.sum1);
      if (anObject.sum2 != null)
        anObject.sum2 = anObject.sum2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.sum2);
      if (anObject.sum3 != null)
        anObject.sum3 = anObject.sum3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.sum3);
      if (anObject.sum4 != null)
        anObject.sum4 = anObject.sum4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.sum4);
      if (anObject.sum5 != null)
        anObject.sum5 = anObject.sum5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.sum5);
      if (anObject.sum6 != null)
        anObject.sum6 = anObject.sum6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.sum6);
      if (anObject.sum7 != null)
        anObject.sum7 = anObject.sum7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.sum7);
      if (anObject.sum1dec1 != null)
        anObject.sum1dec1 = anObject.sum1dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.sum1dec1);
      if (anObject.sum2dec1 != null)
        anObject.sum2dec1 = anObject.sum2dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.sum2dec1);
      if (anObject.sum3dec1 != null)
        anObject.sum3dec1 = anObject.sum3dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(13,anObject.sum3dec1);
      if (anObject.sum4dec1 != null)
        anObject.sum4dec1 = anObject.sum4dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(14,anObject.sum4dec1);
      if (anObject.sum5dec1 != null)
        anObject.sum5dec1 = anObject.sum5dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(15,anObject.sum5dec1);
      if (anObject.sum6dec1 != null)
        anObject.sum6dec1 = anObject.sum6dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(16,anObject.sum6dec1);
      if (anObject.sum7dec1 != null)
        anObject.sum7dec1 = anObject.sum7dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(17,anObject.sum7dec1);
      if (anObject.sum1dec2 != null)
        anObject.sum1dec2 = anObject.sum1dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(18,anObject.sum1dec2);
      if (anObject.sum2dec2 != null)
        anObject.sum2dec2 = anObject.sum2dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(19,anObject.sum2dec2);
      if (anObject.sum3dec2 != null)
        anObject.sum3dec2 = anObject.sum3dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(20,anObject.sum3dec2);
      if (anObject.sum4dec2 != null)
        anObject.sum4dec2 = anObject.sum4dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(21,anObject.sum4dec2);
      if (anObject.sum5dec2 != null)
        anObject.sum5dec2 = anObject.sum5dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(22,anObject.sum5dec2);
      if (anObject.sum6dec2 != null)
        anObject.sum6dec2 = anObject.sum6dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(23,anObject.sum6dec2);
      if (anObject.sum7dec2 != null)
        anObject.sum7dec2 = anObject.sum7dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(24,anObject.sum7dec2);
      if (anObject.sum1dec3 != null)
        anObject.sum1dec3 = anObject.sum1dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(25,anObject.sum1dec3);
      if (anObject.sum2dec3 != null)
        anObject.sum2dec3 = anObject.sum2dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(26,anObject.sum2dec3);
      if (anObject.sum3dec3 != null)
        anObject.sum3dec3 = anObject.sum3dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(27,anObject.sum3dec3);
      if (anObject.sum4dec3 != null)
        anObject.sum4dec3 = anObject.sum4dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(28,anObject.sum4dec3);
      if (anObject.sum5dec3 != null)
        anObject.sum5dec3 = anObject.sum5dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(29,anObject.sum5dec3);
      if (anObject.sum6dec3 != null)
        anObject.sum6dec3 = anObject.sum6dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(30,anObject.sum6dec3);
      if (anObject.sum7dec3 != null)
        anObject.sum7dec3 = anObject.sum7dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(31,anObject.sum7dec3);
      statement.setString(32,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(33,null);
      else
        statement.setTimestamp(33,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(34,null);
      else
        statement.setBigDecimal(34,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.fuelTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(35,anObject.fuelTypeRef.code);
      else
        statement.setNull(35,java.sql.Types.INTEGER);
          statement.setInt(36,anObject.code);
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
            if("SUM1".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum1 != null)
                    anObject.sum1 = anObject.sum1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum1);
                continue;
             }
            if("SUM2".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum2 != null)
                    anObject.sum2 = anObject.sum2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum2);
                continue;
             }
            if("SUM3".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum3 != null)
                    anObject.sum3 = anObject.sum3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum3);
                continue;
             }
            if("SUM4".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum4 != null)
                    anObject.sum4 = anObject.sum4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum4);
                continue;
             }
            if("SUM5".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum5 != null)
                    anObject.sum5 = anObject.sum5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum5);
                continue;
             }
            if("SUM6".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum6 != null)
                    anObject.sum6 = anObject.sum6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum6);
                continue;
             }
            if("SUM7".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum7 != null)
                    anObject.sum7 = anObject.sum7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum7);
                continue;
             }
            if("SUM1DEC1".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum1dec1 != null)
                    anObject.sum1dec1 = anObject.sum1dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum1dec1);
                continue;
             }
            if("SUM2DEC1".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum2dec1 != null)
                    anObject.sum2dec1 = anObject.sum2dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum2dec1);
                continue;
             }
            if("SUM3DEC1".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum3dec1 != null)
                    anObject.sum3dec1 = anObject.sum3dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum3dec1);
                continue;
             }
            if("SUM4DEC1".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum4dec1 != null)
                    anObject.sum4dec1 = anObject.sum4dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum4dec1);
                continue;
             }
            if("SUM5DEC1".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum5dec1 != null)
                    anObject.sum5dec1 = anObject.sum5dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum5dec1);
                continue;
             }
            if("SUM6DEC1".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum6dec1 != null)
                    anObject.sum6dec1 = anObject.sum6dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum6dec1);
                continue;
             }
            if("SUM7DEC1".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum7dec1 != null)
                    anObject.sum7dec1 = anObject.sum7dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum7dec1);
                continue;
             }
            if("SUM1DEC2".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum1dec2 != null)
                    anObject.sum1dec2 = anObject.sum1dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum1dec2);
                continue;
             }
            if("SUM2DEC2".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum2dec2 != null)
                    anObject.sum2dec2 = anObject.sum2dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum2dec2);
                continue;
             }
            if("SUM3DEC2".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum3dec2 != null)
                    anObject.sum3dec2 = anObject.sum3dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum3dec2);
                continue;
             }
            if("SUM4DEC2".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum4dec2 != null)
                    anObject.sum4dec2 = anObject.sum4dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum4dec2);
                continue;
             }
            if("SUM5DEC2".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum5dec2 != null)
                    anObject.sum5dec2 = anObject.sum5dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum5dec2);
                continue;
             }
            if("SUM6DEC2".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum6dec2 != null)
                    anObject.sum6dec2 = anObject.sum6dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum6dec2);
                continue;
             }
            if("SUM7DEC2".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum7dec2 != null)
                    anObject.sum7dec2 = anObject.sum7dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum7dec2);
                continue;
             }
            if("SUM1DEC3".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum1dec3 != null)
                    anObject.sum1dec3 = anObject.sum1dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum1dec3);
                continue;
             }
            if("SUM2DEC3".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum2dec3 != null)
                    anObject.sum2dec3 = anObject.sum2dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum2dec3);
                continue;
             }
            if("SUM3DEC3".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum3dec3 != null)
                    anObject.sum3dec3 = anObject.sum3dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum3dec3);
                continue;
             }
            if("SUM4DEC3".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum4dec3 != null)
                    anObject.sum4dec3 = anObject.sum4dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum4dec3);
                continue;
             }
            if("SUM5DEC3".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum5dec3 != null)
                    anObject.sum5dec3 = anObject.sum5dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum5dec3);
                continue;
             }
            if("SUM6DEC3".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum6dec3 != null)
                    anObject.sum6dec3 = anObject.sum6dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum6dec3);
                continue;
             }
            if("SUM7DEC3".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum7dec3 != null)
                    anObject.sum7dec3 = anObject.sum7dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum7dec3);
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

   } // end of save(ENFuelDistributionSheet anObject,String[] anAttributes)


 public ENFuelDistributionSheetShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENFuelDistributionSheet filterObject = new ENFuelDistributionSheet();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENFuelDistributionSheetShort)list.get(0);
   return null;
  }

  public ENFuelDistributionSheetShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENFuelDistributionSheetShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENFuelDistributionSheetShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENFuelDistributionSheetShortList getFilteredList(ENFuelDistributionSheet filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENFuelDistributionSheetShortList getScrollableFilteredList(ENFuelDistributionSheet aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENFuelDistributionSheetShortList getScrollableFilteredList(ENFuelDistributionSheet aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENFuelDistributionSheetShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENFuelDistributionSheetShortList getScrollableFilteredList(ENFuelDistributionSheetFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENFuelDistributionSheetShortList getScrollableFilteredList(ENFuelDistributionSheetFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENFuelDistributionSheetShortList getScrollableFilteredList(ENFuelDistributionSheet aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENFuelDistributionSheetShortList getScrollableFilteredList(ENFuelDistributionSheet aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENFuelDistributionSheetShortList result = new ENFuelDistributionSheetShortList();
    ENFuelDistributionSheetShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENFUELDISTRIBUTIONSHET.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENFUELDISTRIBUTIONSHET.CODE"+
     ",ENFUELDISTRIBUTIONSHET.MONTHGEN"+
     ",ENFUELDISTRIBUTIONSHET.YEARGEN"+
     ",ENFUELDISTRIBUTIONSHET.TOTALSUM"+
     ",ENFUELDISTRIBUTIONSHET.SUM1"+
     ",ENFUELDISTRIBUTIONSHET.SUM2"+
     ",ENFUELDISTRIBUTIONSHET.SUM3"+
     ",ENFUELDISTRIBUTIONSHET.SUM4"+
     ",ENFUELDISTRIBUTIONSHET.SUM5"+
     ",ENFUELDISTRIBUTIONSHET.SUM6"+
     ",ENFUELDISTRIBUTIONSHET.SUM7"+
     ",ENFUELDISTRIBUTIONSHET.SUM1DEC1"+
     ",ENFUELDISTRIBUTIONSHET.SUM2DEC1"+
     ",ENFUELDISTRIBUTIONSHET.SUM3DEC1"+
     ",ENFUELDISTRIBUTIONSHET.SUM4DEC1"+
     ",ENFUELDISTRIBUTIONSHET.SUM5DEC1"+
     ",ENFUELDISTRIBUTIONSHET.SUM6DEC1"+
     ",ENFUELDISTRIBUTIONSHET.SUM7DEC1"+
     ",ENFUELDISTRIBUTIONSHET.SUM1DEC2"+
     ",ENFUELDISTRIBUTIONSHET.SUM2DEC2"+
     ",ENFUELDISTRIBUTIONSHET.SUM3DEC2"+
     ",ENFUELDISTRIBUTIONSHET.SUM4DEC2"+
     ",ENFUELDISTRIBUTIONSHET.SUM5DEC2"+
     ",ENFUELDISTRIBUTIONSHET.SUM6DEC2"+
     ",ENFUELDISTRIBUTIONSHET.SUM7DEC2"+
     ",ENFUELDISTRIBUTIONSHET.SUM1DEC3"+
     ",ENFUELDISTRIBUTIONSHET.SUM2DEC3"+
     ",ENFUELDISTRIBUTIONSHET.SUM3DEC3"+
     ",ENFUELDISTRIBUTIONSHET.SUM4DEC3"+
     ",ENFUELDISTRIBUTIONSHET.SUM5DEC3"+
     ",ENFUELDISTRIBUTIONSHET.SUM6DEC3"+
     ",ENFUELDISTRIBUTIONSHET.SUM7DEC3"+
     ",ENFUELDISTRIBUTIONSHET.USERGEN"+
     ",ENFUELDISTRIBUTIONSHET.DATEEDIT"+

      ", TKFUELTYPE.CODE " +
      ", TKFUELTYPE.NAME " +
     " FROM ENFUELDISTRIBUTIONSHET " +
     ", TKFUELTYPE " +
     //" WHERE "
  "";
     whereStr = " TKFUELTYPE.CODE = ENFUELDISTRIBUTIONSHET.FUELTYPEREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENFUELDISTRIBUTIONSHET.CODE IN ( SELECT ENFUELDISTRIBUTIONSHET.CODE FROM ENFUELDISTRIBUTIONSHET ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.CODE = ?";
        }
        if(aFilterObject.monthGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.MONTHGEN = ?";
        }
        if(aFilterObject.yearGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.YEARGEN = ?";
        }
        if(aFilterObject.totalSum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.TOTALSUM = ?";
        }
        if(aFilterObject.sum1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM1 = ?";
        }
        if(aFilterObject.sum2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM2 = ?";
        }
        if(aFilterObject.sum3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM3 = ?";
        }
        if(aFilterObject.sum4 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM4 = ?";
        }
        if(aFilterObject.sum5 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM5 = ?";
        }
        if(aFilterObject.sum6 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM6 = ?";
        }
        if(aFilterObject.sum7 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM7 = ?";
        }
        if(aFilterObject.sum1dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM1DEC1 = ?";
        }
        if(aFilterObject.sum2dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM2DEC1 = ?";
        }
        if(aFilterObject.sum3dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM3DEC1 = ?";
        }
        if(aFilterObject.sum4dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM4DEC1 = ?";
        }
        if(aFilterObject.sum5dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM5DEC1 = ?";
        }
        if(aFilterObject.sum6dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM6DEC1 = ?";
        }
        if(aFilterObject.sum7dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM7DEC1 = ?";
        }
        if(aFilterObject.sum1dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM1DEC2 = ?";
        }
        if(aFilterObject.sum2dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM2DEC2 = ?";
        }
        if(aFilterObject.sum3dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM3DEC2 = ?";
        }
        if(aFilterObject.sum4dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM4DEC2 = ?";
        }
        if(aFilterObject.sum5dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM5DEC2 = ?";
        }
        if(aFilterObject.sum6dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM6DEC2 = ?";
        }
        if(aFilterObject.sum7dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM7DEC2 = ?";
        }
        if(aFilterObject.sum1dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM1DEC3 = ?";
        }
        if(aFilterObject.sum2dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM2DEC3 = ?";
        }
        if(aFilterObject.sum3dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM3DEC3 = ?";
        }
        if(aFilterObject.sum4dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM4DEC3 = ?";
        }
        if(aFilterObject.sum5dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM5DEC3 = ?";
        }
        if(aFilterObject.sum6dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM6DEC3 = ?";
        }
        if(aFilterObject.sum7dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM7DEC3 = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENFUELDISTRIBUTIONSHET.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENFUELDISTRIBUTIONSHET.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.MODIFY_TIME = ?";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENFUELDISTRIBUTIONSHET.FUELTYPEREFCODE = ? ";
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
        if(aFilterObject.sum1 != null){
            number++;
            aFilterObject.sum1 = aFilterObject.sum1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum1);
        }
        if(aFilterObject.sum2 != null){
            number++;
            aFilterObject.sum2 = aFilterObject.sum2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum2);
        }
        if(aFilterObject.sum3 != null){
            number++;
            aFilterObject.sum3 = aFilterObject.sum3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum3);
        }
        if(aFilterObject.sum4 != null){
            number++;
            aFilterObject.sum4 = aFilterObject.sum4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum4);
        }
        if(aFilterObject.sum5 != null){
            number++;
            aFilterObject.sum5 = aFilterObject.sum5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum5);
        }
        if(aFilterObject.sum6 != null){
            number++;
            aFilterObject.sum6 = aFilterObject.sum6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum6);
        }
        if(aFilterObject.sum7 != null){
            number++;
            aFilterObject.sum7 = aFilterObject.sum7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum7);
        }
        if(aFilterObject.sum1dec1 != null){
            number++;
            aFilterObject.sum1dec1 = aFilterObject.sum1dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum1dec1);
        }
        if(aFilterObject.sum2dec1 != null){
            number++;
            aFilterObject.sum2dec1 = aFilterObject.sum2dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum2dec1);
        }
        if(aFilterObject.sum3dec1 != null){
            number++;
            aFilterObject.sum3dec1 = aFilterObject.sum3dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum3dec1);
        }
        if(aFilterObject.sum4dec1 != null){
            number++;
            aFilterObject.sum4dec1 = aFilterObject.sum4dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum4dec1);
        }
        if(aFilterObject.sum5dec1 != null){
            number++;
            aFilterObject.sum5dec1 = aFilterObject.sum5dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum5dec1);
        }
        if(aFilterObject.sum6dec1 != null){
            number++;
            aFilterObject.sum6dec1 = aFilterObject.sum6dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum6dec1);
        }
        if(aFilterObject.sum7dec1 != null){
            number++;
            aFilterObject.sum7dec1 = aFilterObject.sum7dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum7dec1);
        }
        if(aFilterObject.sum1dec2 != null){
            number++;
            aFilterObject.sum1dec2 = aFilterObject.sum1dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum1dec2);
        }
        if(aFilterObject.sum2dec2 != null){
            number++;
            aFilterObject.sum2dec2 = aFilterObject.sum2dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum2dec2);
        }
        if(aFilterObject.sum3dec2 != null){
            number++;
            aFilterObject.sum3dec2 = aFilterObject.sum3dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum3dec2);
        }
        if(aFilterObject.sum4dec2 != null){
            number++;
            aFilterObject.sum4dec2 = aFilterObject.sum4dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum4dec2);
        }
        if(aFilterObject.sum5dec2 != null){
            number++;
            aFilterObject.sum5dec2 = aFilterObject.sum5dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum5dec2);
        }
        if(aFilterObject.sum6dec2 != null){
            number++;
            aFilterObject.sum6dec2 = aFilterObject.sum6dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum6dec2);
        }
        if(aFilterObject.sum7dec2 != null){
            number++;
            aFilterObject.sum7dec2 = aFilterObject.sum7dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum7dec2);
        }
        if(aFilterObject.sum1dec3 != null){
            number++;
            aFilterObject.sum1dec3 = aFilterObject.sum1dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum1dec3);
        }
        if(aFilterObject.sum2dec3 != null){
            number++;
            aFilterObject.sum2dec3 = aFilterObject.sum2dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum2dec3);
        }
        if(aFilterObject.sum3dec3 != null){
            number++;
            aFilterObject.sum3dec3 = aFilterObject.sum3dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum3dec3);
        }
        if(aFilterObject.sum4dec3 != null){
            number++;
            aFilterObject.sum4dec3 = aFilterObject.sum4dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum4dec3);
        }
        if(aFilterObject.sum5dec3 != null){
            number++;
            aFilterObject.sum5dec3 = aFilterObject.sum5dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum5dec3);
        }
        if(aFilterObject.sum6dec3 != null){
            number++;
            aFilterObject.sum6dec3 = aFilterObject.sum6dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum6dec3);
        }
        if(aFilterObject.sum7dec3 != null){
            number++;
            aFilterObject.sum7dec3 = aFilterObject.sum7dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum7dec3);
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

        anObject = new ENFuelDistributionSheetShort();

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
        anObject.sum1 = set.getBigDecimal(5);
        if(anObject.sum1 != null)
            anObject.sum1 = anObject.sum1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum2 = set.getBigDecimal(6);
        if(anObject.sum2 != null)
            anObject.sum2 = anObject.sum2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum3 = set.getBigDecimal(7);
        if(anObject.sum3 != null)
            anObject.sum3 = anObject.sum3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum4 = set.getBigDecimal(8);
        if(anObject.sum4 != null)
            anObject.sum4 = anObject.sum4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum5 = set.getBigDecimal(9);
        if(anObject.sum5 != null)
            anObject.sum5 = anObject.sum5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum6 = set.getBigDecimal(10);
        if(anObject.sum6 != null)
            anObject.sum6 = anObject.sum6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum7 = set.getBigDecimal(11);
        if(anObject.sum7 != null)
            anObject.sum7 = anObject.sum7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum1dec1 = set.getBigDecimal(12);
        if(anObject.sum1dec1 != null)
            anObject.sum1dec1 = anObject.sum1dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum2dec1 = set.getBigDecimal(13);
        if(anObject.sum2dec1 != null)
            anObject.sum2dec1 = anObject.sum2dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum3dec1 = set.getBigDecimal(14);
        if(anObject.sum3dec1 != null)
            anObject.sum3dec1 = anObject.sum3dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum4dec1 = set.getBigDecimal(15);
        if(anObject.sum4dec1 != null)
            anObject.sum4dec1 = anObject.sum4dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum5dec1 = set.getBigDecimal(16);
        if(anObject.sum5dec1 != null)
            anObject.sum5dec1 = anObject.sum5dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum6dec1 = set.getBigDecimal(17);
        if(anObject.sum6dec1 != null)
            anObject.sum6dec1 = anObject.sum6dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum7dec1 = set.getBigDecimal(18);
        if(anObject.sum7dec1 != null)
            anObject.sum7dec1 = anObject.sum7dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum1dec2 = set.getBigDecimal(19);
        if(anObject.sum1dec2 != null)
            anObject.sum1dec2 = anObject.sum1dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum2dec2 = set.getBigDecimal(20);
        if(anObject.sum2dec2 != null)
            anObject.sum2dec2 = anObject.sum2dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum3dec2 = set.getBigDecimal(21);
        if(anObject.sum3dec2 != null)
            anObject.sum3dec2 = anObject.sum3dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum4dec2 = set.getBigDecimal(22);
        if(anObject.sum4dec2 != null)
            anObject.sum4dec2 = anObject.sum4dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum5dec2 = set.getBigDecimal(23);
        if(anObject.sum5dec2 != null)
            anObject.sum5dec2 = anObject.sum5dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum6dec2 = set.getBigDecimal(24);
        if(anObject.sum6dec2 != null)
            anObject.sum6dec2 = anObject.sum6dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum7dec2 = set.getBigDecimal(25);
        if(anObject.sum7dec2 != null)
            anObject.sum7dec2 = anObject.sum7dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum1dec3 = set.getBigDecimal(26);
        if(anObject.sum1dec3 != null)
            anObject.sum1dec3 = anObject.sum1dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum2dec3 = set.getBigDecimal(27);
        if(anObject.sum2dec3 != null)
            anObject.sum2dec3 = anObject.sum2dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum3dec3 = set.getBigDecimal(28);
        if(anObject.sum3dec3 != null)
            anObject.sum3dec3 = anObject.sum3dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum4dec3 = set.getBigDecimal(29);
        if(anObject.sum4dec3 != null)
            anObject.sum4dec3 = anObject.sum4dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum5dec3 = set.getBigDecimal(30);
        if(anObject.sum5dec3 != null)
            anObject.sum5dec3 = anObject.sum5dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum6dec3 = set.getBigDecimal(31);
        if(anObject.sum6dec3 != null)
            anObject.sum6dec3 = anObject.sum6dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum7dec3 = set.getBigDecimal(32);
        if(anObject.sum7dec3 != null)
            anObject.sum7dec3 = anObject.sum7dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(33);
        anObject.dateEdit = set.getTimestamp(34);

        anObject.fuelTypeRefCode = set.getInt(35);
    if(set.wasNull())
      anObject.fuelTypeRefCode = Integer.MIN_VALUE;
        anObject.fuelTypeRefName = set.getString(36);

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

  public int[] getFilteredCodeArrayOLD(ENFuelDistributionSheet aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENFUELDISTRIBUTIONSHET.CODE FROM ENFUELDISTRIBUTIONSHET";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENFUELDISTRIBUTIONSHET.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.CODE = ?";
        }
        if(aFilterObject.monthGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.MONTHGEN = ?";
        }
        if(aFilterObject.yearGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.YEARGEN = ?";
        }
        if(aFilterObject.totalSum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.TOTALSUM = ?";
        }
        if(aFilterObject.sum1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM1 = ?";
        }
        if(aFilterObject.sum2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM2 = ?";
        }
        if(aFilterObject.sum3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM3 = ?";
        }
        if(aFilterObject.sum4 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM4 = ?";
        }
        if(aFilterObject.sum5 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM5 = ?";
        }
        if(aFilterObject.sum6 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM6 = ?";
        }
        if(aFilterObject.sum7 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM7 = ?";
        }
        if(aFilterObject.sum1dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM1DEC1 = ?";
        }
        if(aFilterObject.sum2dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM2DEC1 = ?";
        }
        if(aFilterObject.sum3dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM3DEC1 = ?";
        }
        if(aFilterObject.sum4dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM4DEC1 = ?";
        }
        if(aFilterObject.sum5dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM5DEC1 = ?";
        }
        if(aFilterObject.sum6dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM6DEC1 = ?";
        }
        if(aFilterObject.sum7dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM7DEC1 = ?";
        }
        if(aFilterObject.sum1dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM1DEC2 = ?";
        }
        if(aFilterObject.sum2dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM2DEC2 = ?";
        }
        if(aFilterObject.sum3dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM3DEC2 = ?";
        }
        if(aFilterObject.sum4dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM4DEC2 = ?";
        }
        if(aFilterObject.sum5dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM5DEC2 = ?";
        }
        if(aFilterObject.sum6dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM6DEC2 = ?";
        }
        if(aFilterObject.sum7dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM7DEC2 = ?";
        }
        if(aFilterObject.sum1dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM1DEC3 = ?";
        }
        if(aFilterObject.sum2dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM2DEC3 = ?";
        }
        if(aFilterObject.sum3dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM3DEC3 = ?";
        }
        if(aFilterObject.sum4dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM4DEC3 = ?";
        }
        if(aFilterObject.sum5dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM5DEC3 = ?";
        }
        if(aFilterObject.sum6dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM6DEC3 = ?";
        }
        if(aFilterObject.sum7dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM7DEC3 = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.MODIFY_TIME = ?";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELDISTRIBUTIONSHET.FUELTYPEREFCODE = ? ";
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
        if(aFilterObject.sum1 != null){
            number++;
            aFilterObject.sum1 = aFilterObject.sum1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum1);
        }
        if(aFilterObject.sum2 != null){
            number++;
            aFilterObject.sum2 = aFilterObject.sum2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum2);
        }
        if(aFilterObject.sum3 != null){
            number++;
            aFilterObject.sum3 = aFilterObject.sum3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum3);
        }
        if(aFilterObject.sum4 != null){
            number++;
            aFilterObject.sum4 = aFilterObject.sum4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum4);
        }
        if(aFilterObject.sum5 != null){
            number++;
            aFilterObject.sum5 = aFilterObject.sum5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum5);
        }
        if(aFilterObject.sum6 != null){
            number++;
            aFilterObject.sum6 = aFilterObject.sum6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum6);
        }
        if(aFilterObject.sum7 != null){
            number++;
            aFilterObject.sum7 = aFilterObject.sum7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum7);
        }
        if(aFilterObject.sum1dec1 != null){
            number++;
            aFilterObject.sum1dec1 = aFilterObject.sum1dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum1dec1);
        }
        if(aFilterObject.sum2dec1 != null){
            number++;
            aFilterObject.sum2dec1 = aFilterObject.sum2dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum2dec1);
        }
        if(aFilterObject.sum3dec1 != null){
            number++;
            aFilterObject.sum3dec1 = aFilterObject.sum3dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum3dec1);
        }
        if(aFilterObject.sum4dec1 != null){
            number++;
            aFilterObject.sum4dec1 = aFilterObject.sum4dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum4dec1);
        }
        if(aFilterObject.sum5dec1 != null){
            number++;
            aFilterObject.sum5dec1 = aFilterObject.sum5dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum5dec1);
        }
        if(aFilterObject.sum6dec1 != null){
            number++;
            aFilterObject.sum6dec1 = aFilterObject.sum6dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum6dec1);
        }
        if(aFilterObject.sum7dec1 != null){
            number++;
            aFilterObject.sum7dec1 = aFilterObject.sum7dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum7dec1);
        }
        if(aFilterObject.sum1dec2 != null){
            number++;
            aFilterObject.sum1dec2 = aFilterObject.sum1dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum1dec2);
        }
        if(aFilterObject.sum2dec2 != null){
            number++;
            aFilterObject.sum2dec2 = aFilterObject.sum2dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum2dec2);
        }
        if(aFilterObject.sum3dec2 != null){
            number++;
            aFilterObject.sum3dec2 = aFilterObject.sum3dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum3dec2);
        }
        if(aFilterObject.sum4dec2 != null){
            number++;
            aFilterObject.sum4dec2 = aFilterObject.sum4dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum4dec2);
        }
        if(aFilterObject.sum5dec2 != null){
            number++;
            aFilterObject.sum5dec2 = aFilterObject.sum5dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum5dec2);
        }
        if(aFilterObject.sum6dec2 != null){
            number++;
            aFilterObject.sum6dec2 = aFilterObject.sum6dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum6dec2);
        }
        if(aFilterObject.sum7dec2 != null){
            number++;
            aFilterObject.sum7dec2 = aFilterObject.sum7dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum7dec2);
        }
        if(aFilterObject.sum1dec3 != null){
            number++;
            aFilterObject.sum1dec3 = aFilterObject.sum1dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum1dec3);
        }
        if(aFilterObject.sum2dec3 != null){
            number++;
            aFilterObject.sum2dec3 = aFilterObject.sum2dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum2dec3);
        }
        if(aFilterObject.sum3dec3 != null){
            number++;
            aFilterObject.sum3dec3 = aFilterObject.sum3dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum3dec3);
        }
        if(aFilterObject.sum4dec3 != null){
            number++;
            aFilterObject.sum4dec3 = aFilterObject.sum4dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum4dec3);
        }
        if(aFilterObject.sum5dec3 != null){
            number++;
            aFilterObject.sum5dec3 = aFilterObject.sum5dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum5dec3);
        }
        if(aFilterObject.sum6dec3 != null){
            number++;
            aFilterObject.sum6dec3 = aFilterObject.sum6dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum6dec3);
        }
        if(aFilterObject.sum7dec3 != null){
            number++;
            aFilterObject.sum7dec3 = aFilterObject.sum7dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum7dec3);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENFUELDISTRIBUTIONSHET.USERGEN = ?";
             else
                 whereStr = whereStr + " ENFUELDISTRIBUTIONSHET.USERGEN LIKE ?";

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

  public int[] getFilteredCodeArray(ENFuelDistributionSheetFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENFuelDistributionSheet aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENFUELDISTRIBUTIONSHET.CODE FROM ENFUELDISTRIBUTIONSHET";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENFUELDISTRIBUTIONSHET.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.CODE = ?";
        }
        if(aFilterObject.monthGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.MONTHGEN = ?";
        }
        if(aFilterObject.yearGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.YEARGEN = ?";
        }
        if(aFilterObject.totalSum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.TOTALSUM = ?";
        }
        if(aFilterObject.sum1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM1 = ?";
        }
        if(aFilterObject.sum2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM2 = ?";
        }
        if(aFilterObject.sum3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM3 = ?";
        }
        if(aFilterObject.sum4 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM4 = ?";
        }
        if(aFilterObject.sum5 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM5 = ?";
        }
        if(aFilterObject.sum6 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM6 = ?";
        }
        if(aFilterObject.sum7 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM7 = ?";
        }
        if(aFilterObject.sum1dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM1DEC1 = ?";
        }
        if(aFilterObject.sum2dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM2DEC1 = ?";
        }
        if(aFilterObject.sum3dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM3DEC1 = ?";
        }
        if(aFilterObject.sum4dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM4DEC1 = ?";
        }
        if(aFilterObject.sum5dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM5DEC1 = ?";
        }
        if(aFilterObject.sum6dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM6DEC1 = ?";
        }
        if(aFilterObject.sum7dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM7DEC1 = ?";
        }
        if(aFilterObject.sum1dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM1DEC2 = ?";
        }
        if(aFilterObject.sum2dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM2DEC2 = ?";
        }
        if(aFilterObject.sum3dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM3DEC2 = ?";
        }
        if(aFilterObject.sum4dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM4DEC2 = ?";
        }
        if(aFilterObject.sum5dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM5DEC2 = ?";
        }
        if(aFilterObject.sum6dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM6DEC2 = ?";
        }
        if(aFilterObject.sum7dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM7DEC2 = ?";
        }
        if(aFilterObject.sum1dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM1DEC3 = ?";
        }
        if(aFilterObject.sum2dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM2DEC3 = ?";
        }
        if(aFilterObject.sum3dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM3DEC3 = ?";
        }
        if(aFilterObject.sum4dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM4DEC3 = ?";
        }
        if(aFilterObject.sum5dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM5DEC3 = ?";
        }
        if(aFilterObject.sum6dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM6DEC3 = ?";
        }
        if(aFilterObject.sum7dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM7DEC3 = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.MODIFY_TIME = ?";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELDISTRIBUTIONSHET.FUELTYPEREFCODE = ? ";
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
        if(aFilterObject.sum1 != null){
            number++;
            aFilterObject.sum1 = aFilterObject.sum1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum1);
        }
        if(aFilterObject.sum2 != null){
            number++;
            aFilterObject.sum2 = aFilterObject.sum2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum2);
        }
        if(aFilterObject.sum3 != null){
            number++;
            aFilterObject.sum3 = aFilterObject.sum3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum3);
        }
        if(aFilterObject.sum4 != null){
            number++;
            aFilterObject.sum4 = aFilterObject.sum4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum4);
        }
        if(aFilterObject.sum5 != null){
            number++;
            aFilterObject.sum5 = aFilterObject.sum5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum5);
        }
        if(aFilterObject.sum6 != null){
            number++;
            aFilterObject.sum6 = aFilterObject.sum6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum6);
        }
        if(aFilterObject.sum7 != null){
            number++;
            aFilterObject.sum7 = aFilterObject.sum7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum7);
        }
        if(aFilterObject.sum1dec1 != null){
            number++;
            aFilterObject.sum1dec1 = aFilterObject.sum1dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum1dec1);
        }
        if(aFilterObject.sum2dec1 != null){
            number++;
            aFilterObject.sum2dec1 = aFilterObject.sum2dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum2dec1);
        }
        if(aFilterObject.sum3dec1 != null){
            number++;
            aFilterObject.sum3dec1 = aFilterObject.sum3dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum3dec1);
        }
        if(aFilterObject.sum4dec1 != null){
            number++;
            aFilterObject.sum4dec1 = aFilterObject.sum4dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum4dec1);
        }
        if(aFilterObject.sum5dec1 != null){
            number++;
            aFilterObject.sum5dec1 = aFilterObject.sum5dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum5dec1);
        }
        if(aFilterObject.sum6dec1 != null){
            number++;
            aFilterObject.sum6dec1 = aFilterObject.sum6dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum6dec1);
        }
        if(aFilterObject.sum7dec1 != null){
            number++;
            aFilterObject.sum7dec1 = aFilterObject.sum7dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum7dec1);
        }
        if(aFilterObject.sum1dec2 != null){
            number++;
            aFilterObject.sum1dec2 = aFilterObject.sum1dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum1dec2);
        }
        if(aFilterObject.sum2dec2 != null){
            number++;
            aFilterObject.sum2dec2 = aFilterObject.sum2dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum2dec2);
        }
        if(aFilterObject.sum3dec2 != null){
            number++;
            aFilterObject.sum3dec2 = aFilterObject.sum3dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum3dec2);
        }
        if(aFilterObject.sum4dec2 != null){
            number++;
            aFilterObject.sum4dec2 = aFilterObject.sum4dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum4dec2);
        }
        if(aFilterObject.sum5dec2 != null){
            number++;
            aFilterObject.sum5dec2 = aFilterObject.sum5dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum5dec2);
        }
        if(aFilterObject.sum6dec2 != null){
            number++;
            aFilterObject.sum6dec2 = aFilterObject.sum6dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum6dec2);
        }
        if(aFilterObject.sum7dec2 != null){
            number++;
            aFilterObject.sum7dec2 = aFilterObject.sum7dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum7dec2);
        }
        if(aFilterObject.sum1dec3 != null){
            number++;
            aFilterObject.sum1dec3 = aFilterObject.sum1dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum1dec3);
        }
        if(aFilterObject.sum2dec3 != null){
            number++;
            aFilterObject.sum2dec3 = aFilterObject.sum2dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum2dec3);
        }
        if(aFilterObject.sum3dec3 != null){
            number++;
            aFilterObject.sum3dec3 = aFilterObject.sum3dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum3dec3);
        }
        if(aFilterObject.sum4dec3 != null){
            number++;
            aFilterObject.sum4dec3 = aFilterObject.sum4dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum4dec3);
        }
        if(aFilterObject.sum5dec3 != null){
            number++;
            aFilterObject.sum5dec3 = aFilterObject.sum5dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum5dec3);
        }
        if(aFilterObject.sum6dec3 != null){
            number++;
            aFilterObject.sum6dec3 = aFilterObject.sum6dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum6dec3);
        }
        if(aFilterObject.sum7dec3 != null){
            number++;
            aFilterObject.sum7dec3 = aFilterObject.sum7dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum7dec3);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENFUELDISTRIBUTIONSHET.USERGEN = ?";
             else
                 whereStr = whereStr + " ENFUELDISTRIBUTIONSHET.USERGEN LIKE ?";

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


   public ENFuelDistributionSheet getObject(int uid) throws PersistenceException
   {
    ENFuelDistributionSheet result = new ENFuelDistributionSheet();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENFuelDistributionSheet anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENFUELDISTRIBUTIONSHET.CODE, ENFUELDISTRIBUTIONSHET.MONTHGEN, ENFUELDISTRIBUTIONSHET.YEARGEN, ENFUELDISTRIBUTIONSHET.TOTALSUM, ENFUELDISTRIBUTIONSHET.SUM1, ENFUELDISTRIBUTIONSHET.SUM2, ENFUELDISTRIBUTIONSHET.SUM3, ENFUELDISTRIBUTIONSHET.SUM4, ENFUELDISTRIBUTIONSHET.SUM5, ENFUELDISTRIBUTIONSHET.SUM6, ENFUELDISTRIBUTIONSHET.SUM7, ENFUELDISTRIBUTIONSHET.SUM1DEC1, ENFUELDISTRIBUTIONSHET.SUM2DEC1, ENFUELDISTRIBUTIONSHET.SUM3DEC1, ENFUELDISTRIBUTIONSHET.SUM4DEC1, ENFUELDISTRIBUTIONSHET.SUM5DEC1, ENFUELDISTRIBUTIONSHET.SUM6DEC1, ENFUELDISTRIBUTIONSHET.SUM7DEC1, ENFUELDISTRIBUTIONSHET.SUM1DEC2, ENFUELDISTRIBUTIONSHET.SUM2DEC2, ENFUELDISTRIBUTIONSHET.SUM3DEC2, ENFUELDISTRIBUTIONSHET.SUM4DEC2, ENFUELDISTRIBUTIONSHET.SUM5DEC2, ENFUELDISTRIBUTIONSHET.SUM6DEC2, ENFUELDISTRIBUTIONSHET.SUM7DEC2, ENFUELDISTRIBUTIONSHET.SUM1DEC3, ENFUELDISTRIBUTIONSHET.SUM2DEC3, ENFUELDISTRIBUTIONSHET.SUM3DEC3, ENFUELDISTRIBUTIONSHET.SUM4DEC3, ENFUELDISTRIBUTIONSHET.SUM5DEC3, ENFUELDISTRIBUTIONSHET.SUM6DEC3, ENFUELDISTRIBUTIONSHET.SUM7DEC3, ENFUELDISTRIBUTIONSHET.USERGEN, ENFUELDISTRIBUTIONSHET.DATEEDIT, ENFUELDISTRIBUTIONSHET.MODIFY_TIME, ENFUELDISTRIBUTIONSHET.FUELTYPEREFCODE "
    +" FROM ENFUELDISTRIBUTIONSHET WHERE ENFUELDISTRIBUTIONSHET.CODE = ?";

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
        anObject.sum1 = set.getBigDecimal(5);
        if(anObject.sum1 != null)
            anObject.sum1 = anObject.sum1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum2 = set.getBigDecimal(6);
        if(anObject.sum2 != null)
            anObject.sum2 = anObject.sum2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum3 = set.getBigDecimal(7);
        if(anObject.sum3 != null)
            anObject.sum3 = anObject.sum3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum4 = set.getBigDecimal(8);
        if(anObject.sum4 != null)
            anObject.sum4 = anObject.sum4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum5 = set.getBigDecimal(9);
        if(anObject.sum5 != null)
            anObject.sum5 = anObject.sum5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum6 = set.getBigDecimal(10);
        if(anObject.sum6 != null)
            anObject.sum6 = anObject.sum6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum7 = set.getBigDecimal(11);
        if(anObject.sum7 != null)
            anObject.sum7 = anObject.sum7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum1dec1 = set.getBigDecimal(12);
        if(anObject.sum1dec1 != null)
            anObject.sum1dec1 = anObject.sum1dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum2dec1 = set.getBigDecimal(13);
        if(anObject.sum2dec1 != null)
            anObject.sum2dec1 = anObject.sum2dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum3dec1 = set.getBigDecimal(14);
        if(anObject.sum3dec1 != null)
            anObject.sum3dec1 = anObject.sum3dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum4dec1 = set.getBigDecimal(15);
        if(anObject.sum4dec1 != null)
            anObject.sum4dec1 = anObject.sum4dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum5dec1 = set.getBigDecimal(16);
        if(anObject.sum5dec1 != null)
            anObject.sum5dec1 = anObject.sum5dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum6dec1 = set.getBigDecimal(17);
        if(anObject.sum6dec1 != null)
            anObject.sum6dec1 = anObject.sum6dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum7dec1 = set.getBigDecimal(18);
        if(anObject.sum7dec1 != null)
            anObject.sum7dec1 = anObject.sum7dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum1dec2 = set.getBigDecimal(19);
        if(anObject.sum1dec2 != null)
            anObject.sum1dec2 = anObject.sum1dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum2dec2 = set.getBigDecimal(20);
        if(anObject.sum2dec2 != null)
            anObject.sum2dec2 = anObject.sum2dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum3dec2 = set.getBigDecimal(21);
        if(anObject.sum3dec2 != null)
            anObject.sum3dec2 = anObject.sum3dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum4dec2 = set.getBigDecimal(22);
        if(anObject.sum4dec2 != null)
            anObject.sum4dec2 = anObject.sum4dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum5dec2 = set.getBigDecimal(23);
        if(anObject.sum5dec2 != null)
            anObject.sum5dec2 = anObject.sum5dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum6dec2 = set.getBigDecimal(24);
        if(anObject.sum6dec2 != null)
            anObject.sum6dec2 = anObject.sum6dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum7dec2 = set.getBigDecimal(25);
        if(anObject.sum7dec2 != null)
            anObject.sum7dec2 = anObject.sum7dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum1dec3 = set.getBigDecimal(26);
        if(anObject.sum1dec3 != null)
            anObject.sum1dec3 = anObject.sum1dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum2dec3 = set.getBigDecimal(27);
        if(anObject.sum2dec3 != null)
            anObject.sum2dec3 = anObject.sum2dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum3dec3 = set.getBigDecimal(28);
        if(anObject.sum3dec3 != null)
            anObject.sum3dec3 = anObject.sum3dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum4dec3 = set.getBigDecimal(29);
        if(anObject.sum4dec3 != null)
            anObject.sum4dec3 = anObject.sum4dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum5dec3 = set.getBigDecimal(30);
        if(anObject.sum5dec3 != null)
            anObject.sum5dec3 = anObject.sum5dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum6dec3 = set.getBigDecimal(31);
        if(anObject.sum6dec3 != null)
            anObject.sum6dec3 = anObject.sum6dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum7dec3 = set.getBigDecimal(32);
        if(anObject.sum7dec3 != null)
            anObject.sum7dec3 = anObject.sum7dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(33);
        anObject.dateEdit = set.getTimestamp(34);
        anObject.modify_time = set.getLong(35);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.fuelTypeRef.code = set.getInt(36);
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


  public com.ksoe.energynet.valueobject.references.ENFuelDistributionSheetRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENFuelDistributionSheetRef ref = new com.ksoe.energynet.valueobject.references.ENFuelDistributionSheetRef();
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

    selectStr = "DELETE FROM  ENFUELDISTRIBUTIONSHET WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENFuelDistributionSheet object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENFuelDistributionSheet.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENFuelDistributionSheet.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENFuelDistributionSheet.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENFuelDistributionSheet.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENFuelDistributionSheet.getObject%} access denied");

    selectStr =

    "SELECT  ENFUELDISTRIBUTIONSHET.CODE FROM  ENFUELDISTRIBUTIONSHET WHERE  ENFUELDISTRIBUTIONSHET.CODE = ?";
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
    _checkConditionToken(condition,"code","ENFUELDISTRIBUTIONSHET.CODE");
    _checkConditionToken(condition,"monthgen","ENFUELDISTRIBUTIONSHET.MONTHGEN");
    _checkConditionToken(condition,"yeargen","ENFUELDISTRIBUTIONSHET.YEARGEN");
    _checkConditionToken(condition,"totalsum","ENFUELDISTRIBUTIONSHET.TOTALSUM");
    _checkConditionToken(condition,"sum1","ENFUELDISTRIBUTIONSHET.SUM1");
    _checkConditionToken(condition,"sum2","ENFUELDISTRIBUTIONSHET.SUM2");
    _checkConditionToken(condition,"sum3","ENFUELDISTRIBUTIONSHET.SUM3");
    _checkConditionToken(condition,"sum4","ENFUELDISTRIBUTIONSHET.SUM4");
    _checkConditionToken(condition,"sum5","ENFUELDISTRIBUTIONSHET.SUM5");
    _checkConditionToken(condition,"sum6","ENFUELDISTRIBUTIONSHET.SUM6");
    _checkConditionToken(condition,"sum7","ENFUELDISTRIBUTIONSHET.SUM7");
    _checkConditionToken(condition,"sum1dec1","ENFUELDISTRIBUTIONSHET.SUM1DEC1");
    _checkConditionToken(condition,"sum2dec1","ENFUELDISTRIBUTIONSHET.SUM2DEC1");
    _checkConditionToken(condition,"sum3dec1","ENFUELDISTRIBUTIONSHET.SUM3DEC1");
    _checkConditionToken(condition,"sum4dec1","ENFUELDISTRIBUTIONSHET.SUM4DEC1");
    _checkConditionToken(condition,"sum5dec1","ENFUELDISTRIBUTIONSHET.SUM5DEC1");
    _checkConditionToken(condition,"sum6dec1","ENFUELDISTRIBUTIONSHET.SUM6DEC1");
    _checkConditionToken(condition,"sum7dec1","ENFUELDISTRIBUTIONSHET.SUM7DEC1");
    _checkConditionToken(condition,"sum1dec2","ENFUELDISTRIBUTIONSHET.SUM1DEC2");
    _checkConditionToken(condition,"sum2dec2","ENFUELDISTRIBUTIONSHET.SUM2DEC2");
    _checkConditionToken(condition,"sum3dec2","ENFUELDISTRIBUTIONSHET.SUM3DEC2");
    _checkConditionToken(condition,"sum4dec2","ENFUELDISTRIBUTIONSHET.SUM4DEC2");
    _checkConditionToken(condition,"sum5dec2","ENFUELDISTRIBUTIONSHET.SUM5DEC2");
    _checkConditionToken(condition,"sum6dec2","ENFUELDISTRIBUTIONSHET.SUM6DEC2");
    _checkConditionToken(condition,"sum7dec2","ENFUELDISTRIBUTIONSHET.SUM7DEC2");
    _checkConditionToken(condition,"sum1dec3","ENFUELDISTRIBUTIONSHET.SUM1DEC3");
    _checkConditionToken(condition,"sum2dec3","ENFUELDISTRIBUTIONSHET.SUM2DEC3");
    _checkConditionToken(condition,"sum3dec3","ENFUELDISTRIBUTIONSHET.SUM3DEC3");
    _checkConditionToken(condition,"sum4dec3","ENFUELDISTRIBUTIONSHET.SUM4DEC3");
    _checkConditionToken(condition,"sum5dec3","ENFUELDISTRIBUTIONSHET.SUM5DEC3");
    _checkConditionToken(condition,"sum6dec3","ENFUELDISTRIBUTIONSHET.SUM6DEC3");
    _checkConditionToken(condition,"sum7dec3","ENFUELDISTRIBUTIONSHET.SUM7DEC3");
    _checkConditionToken(condition,"usergen","ENFUELDISTRIBUTIONSHET.USERGEN");
    _checkConditionToken(condition,"dateedit","ENFUELDISTRIBUTIONSHET.DATEEDIT");
    _checkConditionToken(condition,"modify_time","ENFUELDISTRIBUTIONSHET.MODIFY_TIME");
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

  private void _collectAutoIncrementFields(ENFuelDistributionSheet anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENFUELDISTRIBUTIONSHET", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENFUELDISTRIBUTIONSHET", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENFUELDISTRIBUTIONSHET", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENFUELDISTRIBUTIONSHET");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENFuelDistributionSheetDAO
