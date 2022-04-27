
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

import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.brief.FINWorkerShort;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;


/**
 * DAO Object for FINWorker;
 *
 */

public class FINWorkerDAOGen extends GenericDataMiner {

   public FINWorkerDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public FINWorkerDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(FINWorker inObject) throws PersistenceException
   {
      FINWorker obj = new FINWorker();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.name == null && obj.name == null){}
	else
		if(inObject.name == null || obj.name == null) return false;
		else
			if ( ! inObject.name.equals(obj.name)){
				return false;
			}

	if(inObject.tabNumber == null && obj.tabNumber == null){}
	else
		if(inObject.tabNumber == null || obj.tabNumber == null) return false;
		else
			if ( ! inObject.tabNumber.equals(obj.tabNumber)){
				return false;
			}

	if(inObject.positionName == null && obj.positionName == null){}
	else
		if(inObject.positionName == null || obj.positionName == null) return false;
		else
			if ( ! inObject.positionName.equals(obj.positionName)){
				return false;
			}

     if (inObject.positionCode != obj.positionCode){
				return false;
			}

	if(inObject.departmentName == null && obj.departmentName == null){}
	else
		if(inObject.departmentName == null || obj.departmentName == null) return false;
		else
			if ( ! inObject.departmentName.equals(obj.departmentName)){
				return false;
			}

	if(inObject.departmentCode == null && obj.departmentCode == null){}
	else
		if(inObject.departmentCode == null || obj.departmentCode == null) return false;
		else
			if ( ! inObject.departmentCode.equals(obj.departmentCode)){
				return false;
			}

	if(inObject.priceGen == null && obj.priceGen == null){}
	else
		if(inObject.priceGen == null || obj.priceGen == null) return false;
		else
			if ( ! inObject.priceGen.equals(obj.priceGen)){
				return false;
			}

     if (inObject.categor != obj.categor){
				return false;
			}

     if (inObject.finCode != obj.finCode){
				return false;
			}

     if (inObject.isSentAssignment != obj.isSentAssignment){
				return false;
			}

	if(inObject.chargePercent == null && obj.chargePercent == null){}
	else
		if(inObject.chargePercent == null || obj.chargePercent == null) return false;
		else
			if ( ! inObject.chargePercent.equals(obj.chargePercent)){
				return false;
			}

     if (inObject.categorId != obj.categorId){
				return false;
			}

	if(inObject.categorName == null && obj.categorName == null){}
	else
		if(inObject.categorName == null || obj.categorName == null) return false;
		else
			if ( ! inObject.categorName.equals(obj.categorName)){
				return false;
			}

	if(inObject.workTimeId == null && obj.workTimeId == null){}
	else
		if(inObject.workTimeId == null || obj.workTimeId == null) return false;
		else
			if ( ! inObject.workTimeId.equals(obj.workTimeId)){
				return false;
			}

	if(inObject.positionId == null && obj.positionId == null){}
	else
		if(inObject.positionId == null || obj.positionId == null) return false;
		else
			if ( ! inObject.positionId.equals(obj.positionId)){
				return false;
			}
     if (inObject.kindRef.code != obj.kindRef.code){
        return false;
     }
     if (inObject.chargeRef.code != obj.chargeRef.code){
        return false;
     }
      return true;
   }

   public int add(FINWorker anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(FINWorker anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();
  if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO FINWORKER (CODE,NAME,TABNUMBER,POSITIONNAME,POSITIONCODE,DEPARTMENTNAME,DEPARTMENTCODE,PRICEGEN,CATEGOR,FINCODE,ISSENTASSIGNMENT,CHARGEPERCENT,CATEGORID,CATEGORNAME,WORKTIMEID,DOMAIN_INFO,POSITIONID,MODIFY_TIME,KINDREFCODE,CHARGEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.name);
      statement.setString(3,anObject.tabNumber);
      statement.setString(4,anObject.positionName);
      if (anObject.positionCode != Integer.MIN_VALUE )
         statement.setInt(5,anObject.positionCode);
      else
         statement.setNull(5,java.sql.Types.INTEGER);
      statement.setString(6,anObject.departmentName);
      statement.setString(7,anObject.departmentCode);
      if (anObject.priceGen != null)
        anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.priceGen);
      if (anObject.categor != Integer.MIN_VALUE )
         statement.setInt(9,anObject.categor);
      else
         statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.finCode != Integer.MIN_VALUE )
         statement.setInt(10,anObject.finCode);
      else
         statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.isSentAssignment != Integer.MIN_VALUE )
         statement.setInt(11,anObject.isSentAssignment);
      else
         statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.chargePercent != null)
        anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.chargePercent);
      if (anObject.categorId != Integer.MIN_VALUE )
         statement.setInt(13,anObject.categorId);
      else
         statement.setNull(13,java.sql.Types.INTEGER);
      statement.setString(14,anObject.categorName);
      statement.setString(15,anObject.workTimeId);
      statement.setString(16,anObject.domain_info);
      statement.setString(17,anObject.positionId);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(18,null);
      else
        statement.setBigDecimal(18,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.kindRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINWorkerKindDAOGen(connection,getUserProfile()).exists(anObject.kindRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINWorker.kindRef.code%} = {%"+anObject.kindRef.code+"%}");
        statement.setInt(19,anObject.kindRef.code);
      }
      else
        statement.setNull(19,java.sql.Types.INTEGER);
      if (anObject.chargeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINChargeTypeDAOGen(connection,getUserProfile()).exists(anObject.chargeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINWorker.chargeRef.code%} = {%"+anObject.chargeRef.code+"%}");
        statement.setInt(20,anObject.chargeRef.code);
      }
      else
        statement.setNull(20,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%FINWorkerDAOGen.add%}",e);
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

   public void save(FINWorker anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(FINWorker anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      FINWorker oldObject = new FINWorker();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+FINWorker.modify_time_Field + "," + FINWorker.domain_info_Field+" FROM  FINWORKER WHERE CODE = ?";

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
        oldObject.domain_info = set.getString(2);
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

      if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());
      String selectStr;

      Vector fields = null;
      if(anAttributes != null)
       {
        String fieldNameStr;
        fields = new Vector();
        for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++)
         {
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TABNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POSITIONNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POSITIONCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DEPARTMENTNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DEPARTMENTCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PRICEGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CATEGOR") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ISSENTASSIGNMENT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CHARGEPERCENT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CATEGORID") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CATEGORNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("WORKTIMEID") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DOMAIN_INFO") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POSITIONID") == 0)
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
          if(fieldNameStr.compareTo("KINDREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CHARGEREF") == 0)
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
        "UPDATE FINWORKER SET  NAME = ? , TABNUMBER = ? , POSITIONNAME = ? , POSITIONCODE = ? , DEPARTMENTNAME = ? , DEPARTMENTCODE = ? , PRICEGEN = ? , CATEGOR = ? , FINCODE = ? , ISSENTASSIGNMENT = ? , CHARGEPERCENT = ? , CATEGORID = ? , CATEGORNAME = ? , WORKTIMEID = ? , DOMAIN_INFO = ? , POSITIONID = ? , MODIFY_TIME = ? , KINDREFCODE = ? , CHARGEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE FINWORKER SET ";
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
      statement.setString(1,anObject.name);
      statement.setString(2,anObject.tabNumber);
      statement.setString(3,anObject.positionName);
      if (anObject.positionCode != Integer.MIN_VALUE )
         statement.setInt(4,anObject.positionCode);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      statement.setString(5,anObject.departmentName);
      statement.setString(6,anObject.departmentCode);
      if (anObject.priceGen != null)
        anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.priceGen);
      if (anObject.categor != Integer.MIN_VALUE )
         statement.setInt(8,anObject.categor);
      else
         statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.finCode != Integer.MIN_VALUE )
         statement.setInt(9,anObject.finCode);
      else
         statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.isSentAssignment != Integer.MIN_VALUE )
         statement.setInt(10,anObject.isSentAssignment);
      else
         statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.chargePercent != null)
        anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.chargePercent);
      if (anObject.categorId != Integer.MIN_VALUE )
         statement.setInt(12,anObject.categorId);
      else
         statement.setNull(12,java.sql.Types.INTEGER);
      statement.setString(13,anObject.categorName);
      statement.setString(14,anObject.workTimeId);
      statement.setString(15,anObject.domain_info);
      statement.setString(16,anObject.positionId);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(17,null);
      else
        statement.setBigDecimal(17,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.kindRef.code != Integer.MIN_VALUE)
        statement.setInt(18,anObject.kindRef.code);
      else
        statement.setNull(18,java.sql.Types.INTEGER);
      if (anObject.chargeRef.code != Integer.MIN_VALUE)
        statement.setInt(19,anObject.chargeRef.code);
      else
        statement.setNull(19,java.sql.Types.INTEGER);
          statement.setInt(20,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("NAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.name);
                continue;
             }
            if("TABNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.tabNumber);
                continue;
             }
            if("POSITIONNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.positionName);
                continue;
             }
            if("POSITIONCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.positionCode);
                continue;
             }
            if("DEPARTMENTNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.departmentName);
                continue;
             }
            if("DEPARTMENTCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.departmentCode);
                continue;
             }
            if("PRICEGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.priceGen != null)
                    anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.priceGen);
                continue;
             }
            if("CATEGOR".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.categor);
                continue;
             }
            if("FINCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.finCode);
                continue;
             }
            if("ISSENTASSIGNMENT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.isSentAssignment);
                continue;
             }
            if("CHARGEPERCENT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.chargePercent != null)
                    anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.chargePercent);
                continue;
             }
            if("CATEGORID".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.categorId);
                continue;
             }
            if("CATEGORNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.categorName);
                continue;
             }
            if("WORKTIMEID".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.workTimeId);
                continue;
             }
            if("DOMAIN_INFO".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.domain_info);
                continue;
             }
            if("POSITIONID".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.positionId);
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
            if("KINDREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.kindRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.kindRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("CHARGEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.chargeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.chargeRef.code);
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

   } // end of save(FINWorker anObject,String[] anAttributes)


 public FINWorkerShort getShortObject(int anObjectCode) throws PersistenceException
  {
   FINWorker filterObject = new FINWorker();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (FINWorkerShort)list.get(0);
   return null;
  }

  public FINWorkerShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public FINWorkerShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public FINWorkerShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public FINWorkerShortList getFilteredList(FINWorker filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public FINWorkerShortList getScrollableFilteredList(FINWorker aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public FINWorkerShortList getScrollableFilteredList(FINWorker aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public FINWorkerShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public FINWorkerShortList getScrollableFilteredList(FINWorkerFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public FINWorkerShortList getScrollableFilteredList(FINWorkerFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public FINWorkerShortList getScrollableFilteredList(FINWorker aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public FINWorkerShortList getScrollableFilteredList(FINWorker aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    FINWorkerShortList result = new FINWorkerShortList();
    FINWorkerShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINWORKER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "FINWORKER.CODE"+
     ",FINWORKER.NAME"+
     ",FINWORKER.TABNUMBER"+
     ",FINWORKER.POSITIONNAME"+
     ",FINWORKER.POSITIONCODE"+
     ",FINWORKER.DEPARTMENTNAME"+
     ",FINWORKER.DEPARTMENTCODE"+
     ",FINWORKER.PRICEGEN"+
     ",FINWORKER.CATEGOR"+
     ",FINWORKER.FINCODE"+
     ",FINWORKER.ISSENTASSIGNMENT"+
     ",FINWORKER.CHARGEPERCENT"+
     ",FINWORKER.CATEGORID"+
     ",FINWORKER.CATEGORNAME"+
     ",FINWORKER.WORKTIMEID"+
     ",FINWORKER.POSITIONID"+

      ", FINWORKERKIND.CODE " +
      ", FINWORKERKIND.NAME " +
      ", FINCHARGETYPE.CODE " +
      ", FINCHARGETYPE.NAME " +
     " FROM FINWORKER " +
     ", FINWORKERKIND " +
     ", FINCHARGETYPE " +
     //" WHERE "
  "";
     whereStr = " FINWORKERKIND.CODE = FINWORKER.KINDREFCODE" ; //+
      whereStr = whereStr +" AND FINCHARGETYPE.CODE = FINWORKER.CHARGEREFCODE" ; //+
    //selectStr = selectStr + " ${s} FINWORKER.CODE IN ( SELECT FINWORKER.CODE FROM FINWORKER ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINWORKER.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINWORKER.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.tabNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINWORKER.TABNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINWORKER.TABNUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.positionName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.positionName.indexOf('*',0) < 0 && aFilterObject.positionName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINWORKER.POSITIONNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINWORKER.POSITIONNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.positionCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.POSITIONCODE = ?";
        }
         if (aFilterObject.departmentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.departmentName.indexOf('*',0) < 0 && aFilterObject.departmentName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINWORKER.DEPARTMENTNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINWORKER.DEPARTMENTNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.departmentCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.departmentCode.indexOf('*',0) < 0 && aFilterObject.departmentCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINWORKER.DEPARTMENTCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINWORKER.DEPARTMENTCODE) LIKE UPPER(?)";
         }
        if(aFilterObject.priceGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.PRICEGEN = ?";
        }
        if(aFilterObject.categor != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.CATEGOR = ?";
        }
        if(aFilterObject.finCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.FINCODE = ?";
        }
        if(aFilterObject.isSentAssignment != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.ISSENTASSIGNMENT = ?";
        }
        if(aFilterObject.chargePercent != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.CHARGEPERCENT = ?";
        }
        if(aFilterObject.categorId != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.CATEGORID = ?";
        }
         if (aFilterObject.categorName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.categorName.indexOf('*',0) < 0 && aFilterObject.categorName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINWORKER.CATEGORNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINWORKER.CATEGORNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.workTimeId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.workTimeId.indexOf('*',0) < 0 && aFilterObject.workTimeId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINWORKER.WORKTIMEID) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINWORKER.WORKTIMEID) LIKE UPPER(?)";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINWORKER.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINWORKER.DOMAIN_INFO) LIKE UPPER(?)";
         }
         if (aFilterObject.positionId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.positionId.indexOf('*',0) < 0 && aFilterObject.positionId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINWORKER.POSITIONID) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINWORKER.POSITIONID) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.MODIFY_TIME = ?";
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "FINWORKER.KINDREFCODE = ? ";
        }
        if(aFilterObject.chargeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "FINWORKER.CHARGEREFCODE = ? ";
        }

      }

    
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINWorker.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FINWorker.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("FINWORKER",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND FINWORKER.DOMAIN_INFO IS NOT NULL";
    //else
    if (whereStr.length() == 0)
      whereStr = domainWhereStr;
    else
      whereStr = " "+whereStr + " AND " +domainWhereStr;
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

           if(aFilterObject.tabNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.tabNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.positionName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.positionName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.positionCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.positionCode);
         }

           if(aFilterObject.departmentName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.departmentName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.departmentCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.departmentCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.priceGen != null){
            number++;
            aFilterObject.priceGen = aFilterObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGen);
        }
         if(aFilterObject.categor != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.categor);
         }
         if(aFilterObject.finCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finCode);
         }
         if(aFilterObject.isSentAssignment != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isSentAssignment);
         }
        if(aFilterObject.chargePercent != null){
            number++;
            aFilterObject.chargePercent = aFilterObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.chargePercent);
        }
         if(aFilterObject.categorId != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.categorId);
         }

           if(aFilterObject.categorName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.categorName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.workTimeId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.workTimeId);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.positionId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.positionId);
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
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
       }
       if(aFilterObject.chargeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.chargeRef.code);
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

        anObject = new FINWorkerShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.tabNumber = set.getString(3);
        anObject.positionName = set.getString(4);
        anObject.positionCode = set.getInt(5);
        if ( set.wasNull() )
            anObject.positionCode = Integer.MIN_VALUE;
        anObject.departmentName = set.getString(6);
        anObject.departmentCode = set.getString(7);
        anObject.priceGen = set.getBigDecimal(8);
        if(anObject.priceGen != null)
            anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.categor = set.getInt(9);
        if ( set.wasNull() )
            anObject.categor = Integer.MIN_VALUE;
        anObject.finCode = set.getInt(10);
        if ( set.wasNull() )
            anObject.finCode = Integer.MIN_VALUE;
        anObject.isSentAssignment = set.getInt(11);
        if ( set.wasNull() )
            anObject.isSentAssignment = Integer.MIN_VALUE;
        anObject.chargePercent = set.getBigDecimal(12);
        if(anObject.chargePercent != null)
            anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.categorId = set.getInt(13);
        if ( set.wasNull() )
            anObject.categorId = Integer.MIN_VALUE;
        anObject.categorName = set.getString(14);
        anObject.workTimeId = set.getString(15);
        anObject.positionId = set.getString(16);

        anObject.kindRefCode = set.getInt(17);
    if(set.wasNull())
      anObject.kindRefCode = Integer.MIN_VALUE;
        anObject.kindRefName = set.getString(18);
        anObject.chargeRefCode = set.getInt(19);
    if(set.wasNull())
      anObject.chargeRefCode = Integer.MIN_VALUE;
        anObject.chargeRefName = set.getString(20);

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

  public int[] getFilteredCodeArrayOLD(FINWorker aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINWORKER.CODE FROM FINWORKER";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINWORKER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINWorker.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FINWorker.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("FINWORKER",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (FINWORKER.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.NAME = ?";
             else
                 whereStr = whereStr + "  FINWORKER.NAME LIKE ?";
         }
         if (aFilterObject.tabNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.TABNUMBER = ?";
             else
                 whereStr = whereStr + "  FINWORKER.TABNUMBER LIKE ?";
         }
         if (aFilterObject.positionName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.positionName.indexOf('*',0) < 0 && aFilterObject.positionName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.POSITIONNAME = ?";
             else
                 whereStr = whereStr + "  FINWORKER.POSITIONNAME LIKE ?";
         }
        if(aFilterObject.positionCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.POSITIONCODE = ?";
        }
         if (aFilterObject.departmentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.departmentName.indexOf('*',0) < 0 && aFilterObject.departmentName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.DEPARTMENTNAME = ?";
             else
                 whereStr = whereStr + "  FINWORKER.DEPARTMENTNAME LIKE ?";
         }
         if (aFilterObject.departmentCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.departmentCode.indexOf('*',0) < 0 && aFilterObject.departmentCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.DEPARTMENTCODE = ?";
             else
                 whereStr = whereStr + "  FINWORKER.DEPARTMENTCODE LIKE ?";
         }
        if(aFilterObject.priceGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.PRICEGEN = ?";
        }
        if(aFilterObject.categor != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.CATEGOR = ?";
        }
        if(aFilterObject.finCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.FINCODE = ?";
        }
        if(aFilterObject.isSentAssignment != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.ISSENTASSIGNMENT = ?";
        }
        if(aFilterObject.chargePercent != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.CHARGEPERCENT = ?";
        }
        if(aFilterObject.categorId != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.CATEGORID = ?";
        }
         if (aFilterObject.categorName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.categorName.indexOf('*',0) < 0 && aFilterObject.categorName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.CATEGORNAME = ?";
             else
                 whereStr = whereStr + "  FINWORKER.CATEGORNAME LIKE ?";
         }
         if (aFilterObject.workTimeId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.workTimeId.indexOf('*',0) < 0 && aFilterObject.workTimeId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.WORKTIMEID = ?";
             else
                 whereStr = whereStr + "  FINWORKER.WORKTIMEID LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  FINWORKER.DOMAIN_INFO LIKE ?";
         }
         if (aFilterObject.positionId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.positionId.indexOf('*',0) < 0 && aFilterObject.positionId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.POSITIONID = ?";
             else
                 whereStr = whereStr + "  FINWORKER.POSITIONID LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.MODIFY_TIME = ?";
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINWORKER.KINDREFCODE = ? ";
        }
        if(aFilterObject.chargeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINWORKER.CHARGEREFCODE = ? ";
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
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.NAME = ?";
             else
                 whereStr = whereStr + " FINWORKER.NAME LIKE ?";

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
         if (aFilterObject.tabNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.TABNUMBER = ?";
             else
                 whereStr = whereStr + " FINWORKER.TABNUMBER LIKE ?";

           if(aFilterObject.tabNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.tabNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.positionName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.positionName.indexOf('*',0) < 0 && aFilterObject.positionName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.POSITIONNAME = ?";
             else
                 whereStr = whereStr + " FINWORKER.POSITIONNAME LIKE ?";

           if(aFilterObject.positionName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.positionName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.positionCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.positionCode);
         }
         if (aFilterObject.departmentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.departmentName.indexOf('*',0) < 0 && aFilterObject.departmentName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.DEPARTMENTNAME = ?";
             else
                 whereStr = whereStr + " FINWORKER.DEPARTMENTNAME LIKE ?";

           if(aFilterObject.departmentName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.departmentName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.departmentCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.departmentCode.indexOf('*',0) < 0 && aFilterObject.departmentCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.DEPARTMENTCODE = ?";
             else
                 whereStr = whereStr + " FINWORKER.DEPARTMENTCODE LIKE ?";

           if(aFilterObject.departmentCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.departmentCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.priceGen != null){
            number++;
            aFilterObject.priceGen = aFilterObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGen);
        }
         if(aFilterObject.categor != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.categor);
         }
         if(aFilterObject.finCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finCode);
         }
         if(aFilterObject.isSentAssignment != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isSentAssignment);
         }
        if(aFilterObject.chargePercent != null){
            number++;
            aFilterObject.chargePercent = aFilterObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.chargePercent);
        }
         if(aFilterObject.categorId != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.categorId);
         }
         if (aFilterObject.categorName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.categorName.indexOf('*',0) < 0 && aFilterObject.categorName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.CATEGORNAME = ?";
             else
                 whereStr = whereStr + " FINWORKER.CATEGORNAME LIKE ?";

           if(aFilterObject.categorName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.categorName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.workTimeId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.workTimeId.indexOf('*',0) < 0 && aFilterObject.workTimeId.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.WORKTIMEID = ?";
             else
                 whereStr = whereStr + " FINWORKER.WORKTIMEID LIKE ?";

           if(aFilterObject.workTimeId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.workTimeId);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " FINWORKER.DOMAIN_INFO LIKE ?";

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.positionId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.positionId.indexOf('*',0) < 0 && aFilterObject.positionId.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.POSITIONID = ?";
             else
                 whereStr = whereStr + " FINWORKER.POSITIONID LIKE ?";

           if(aFilterObject.positionId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.positionId);
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
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
       }
       if(aFilterObject.chargeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.chargeRef.code);
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

  public int[] getFilteredCodeArray(FINWorkerFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(FINWorker aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINWORKER.CODE FROM FINWORKER";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINWORKER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINWorker.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FINWorker.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("FINWORKER",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (FINWORKER.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.NAME = ?";
             else
                 whereStr = whereStr + "  FINWORKER.NAME LIKE ?";
         }
         if (aFilterObject.tabNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.TABNUMBER = ?";
             else
                 whereStr = whereStr + "  FINWORKER.TABNUMBER LIKE ?";
         }
         if (aFilterObject.positionName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.positionName.indexOf('*',0) < 0 && aFilterObject.positionName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.POSITIONNAME = ?";
             else
                 whereStr = whereStr + "  FINWORKER.POSITIONNAME LIKE ?";
         }
        if(aFilterObject.positionCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.POSITIONCODE = ?";
        }
         if (aFilterObject.departmentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.departmentName.indexOf('*',0) < 0 && aFilterObject.departmentName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.DEPARTMENTNAME = ?";
             else
                 whereStr = whereStr + "  FINWORKER.DEPARTMENTNAME LIKE ?";
         }
         if (aFilterObject.departmentCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.departmentCode.indexOf('*',0) < 0 && aFilterObject.departmentCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.DEPARTMENTCODE = ?";
             else
                 whereStr = whereStr + "  FINWORKER.DEPARTMENTCODE LIKE ?";
         }
        if(aFilterObject.priceGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.PRICEGEN = ?";
        }
        if(aFilterObject.categor != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.CATEGOR = ?";
        }
        if(aFilterObject.finCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.FINCODE = ?";
        }
        if(aFilterObject.isSentAssignment != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.ISSENTASSIGNMENT = ?";
        }
        if(aFilterObject.chargePercent != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.CHARGEPERCENT = ?";
        }
        if(aFilterObject.categorId != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.CATEGORID = ?";
        }
         if (aFilterObject.categorName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.categorName.indexOf('*',0) < 0 && aFilterObject.categorName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.CATEGORNAME = ?";
             else
                 whereStr = whereStr + "  FINWORKER.CATEGORNAME LIKE ?";
         }
         if (aFilterObject.workTimeId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.workTimeId.indexOf('*',0) < 0 && aFilterObject.workTimeId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.WORKTIMEID = ?";
             else
                 whereStr = whereStr + "  FINWORKER.WORKTIMEID LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  FINWORKER.DOMAIN_INFO LIKE ?";
         }
         if (aFilterObject.positionId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.positionId.indexOf('*',0) < 0 && aFilterObject.positionId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINWORKER.POSITIONID = ?";
             else
                 whereStr = whereStr + "  FINWORKER.POSITIONID LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINWORKER.MODIFY_TIME = ?";
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINWORKER.KINDREFCODE = ? ";
        }
        if(aFilterObject.chargeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINWORKER.CHARGEREFCODE = ? ";
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
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.NAME = ?";
             else
                 whereStr = whereStr + " FINWORKER.NAME LIKE ?";

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
         if (aFilterObject.tabNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.TABNUMBER = ?";
             else
                 whereStr = whereStr + " FINWORKER.TABNUMBER LIKE ?";

           if(aFilterObject.tabNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.tabNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.positionName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.positionName.indexOf('*',0) < 0 && aFilterObject.positionName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.POSITIONNAME = ?";
             else
                 whereStr = whereStr + " FINWORKER.POSITIONNAME LIKE ?";

           if(aFilterObject.positionName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.positionName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.positionCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.positionCode);
         }
         if (aFilterObject.departmentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.departmentName.indexOf('*',0) < 0 && aFilterObject.departmentName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.DEPARTMENTNAME = ?";
             else
                 whereStr = whereStr + " FINWORKER.DEPARTMENTNAME LIKE ?";

           if(aFilterObject.departmentName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.departmentName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.departmentCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.departmentCode.indexOf('*',0) < 0 && aFilterObject.departmentCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.DEPARTMENTCODE = ?";
             else
                 whereStr = whereStr + " FINWORKER.DEPARTMENTCODE LIKE ?";

           if(aFilterObject.departmentCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.departmentCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.priceGen != null){
            number++;
            aFilterObject.priceGen = aFilterObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGen);
        }
         if(aFilterObject.categor != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.categor);
         }
         if(aFilterObject.finCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finCode);
         }
         if(aFilterObject.isSentAssignment != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isSentAssignment);
         }
        if(aFilterObject.chargePercent != null){
            number++;
            aFilterObject.chargePercent = aFilterObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.chargePercent);
        }
         if(aFilterObject.categorId != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.categorId);
         }
         if (aFilterObject.categorName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.categorName.indexOf('*',0) < 0 && aFilterObject.categorName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.CATEGORNAME = ?";
             else
                 whereStr = whereStr + " FINWORKER.CATEGORNAME LIKE ?";

           if(aFilterObject.categorName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.categorName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.workTimeId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.workTimeId.indexOf('*',0) < 0 && aFilterObject.workTimeId.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.WORKTIMEID = ?";
             else
                 whereStr = whereStr + " FINWORKER.WORKTIMEID LIKE ?";

           if(aFilterObject.workTimeId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.workTimeId);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " FINWORKER.DOMAIN_INFO LIKE ?";

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.positionId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.positionId.indexOf('*',0) < 0 && aFilterObject.positionId.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINWORKER.POSITIONID = ?";
             else
                 whereStr = whereStr + " FINWORKER.POSITIONID LIKE ?";

           if(aFilterObject.positionId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.positionId);
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
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
       }
       if(aFilterObject.chargeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.chargeRef.code);
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


   public FINWorker getObject(int uid) throws PersistenceException
   {
    FINWorker result = new FINWorker();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(FINWorker anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINWorker.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FINWorker.getObject%} access denied");



    selectStr =
    "SELECT  FINWORKER.CODE, FINWORKER.NAME, FINWORKER.TABNUMBER, FINWORKER.POSITIONNAME, FINWORKER.POSITIONCODE, FINWORKER.DEPARTMENTNAME, FINWORKER.DEPARTMENTCODE, FINWORKER.PRICEGEN, FINWORKER.CATEGOR, FINWORKER.FINCODE, FINWORKER.ISSENTASSIGNMENT, FINWORKER.CHARGEPERCENT, FINWORKER.CATEGORID, FINWORKER.CATEGORNAME, FINWORKER.WORKTIMEID, FINWORKER.DOMAIN_INFO, FINWORKER.POSITIONID, FINWORKER.MODIFY_TIME, FINWORKER.KINDREFCODE, FINWORKER.CHARGEREFCODE "
    +" FROM FINWORKER WHERE FINWORKER.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("FINWORKER",segregationInfo,getUserProfile().getDomainInfo());
    if(segregationWhereStr.length() > 0)
     selectStr = selectStr + " AND " + segregationWhereStr;

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
        anObject.name = set.getString(2);
        anObject.tabNumber = set.getString(3);
        anObject.positionName = set.getString(4);
        anObject.positionCode = set.getInt(5);
        if ( set.wasNull() )
           anObject.positionCode = Integer.MIN_VALUE;
        anObject.departmentName = set.getString(6);
        anObject.departmentCode = set.getString(7);
        anObject.priceGen = set.getBigDecimal(8);
        if(anObject.priceGen != null)
            anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.categor = set.getInt(9);
        if ( set.wasNull() )
           anObject.categor = Integer.MIN_VALUE;
        anObject.finCode = set.getInt(10);
        if ( set.wasNull() )
           anObject.finCode = Integer.MIN_VALUE;
        anObject.isSentAssignment = set.getInt(11);
        if ( set.wasNull() )
           anObject.isSentAssignment = Integer.MIN_VALUE;
        anObject.chargePercent = set.getBigDecimal(12);
        if(anObject.chargePercent != null)
            anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.categorId = set.getInt(13);
        if ( set.wasNull() )
           anObject.categorId = Integer.MIN_VALUE;
        anObject.categorName = set.getString(14);
        anObject.workTimeId = set.getString(15);
        anObject.domain_info = set.getString(16);
        anObject.positionId = set.getString(17);
        anObject.modify_time = set.getLong(18);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.kindRef.code = set.getInt(19);
        if ( set.wasNull() )
            anObject.kindRef.code = Integer.MIN_VALUE;
        anObject.chargeRef.code = set.getInt(20);
        if ( set.wasNull() )
            anObject.chargeRef.code = Integer.MIN_VALUE;
        if(anObject.kindRef.code != Integer.MIN_VALUE)
        {
           anObject.setKindRef(
      new com.ksoe.energynet.dataminer.generated.FINWorkerKindDAOGen(connection,getUserProfile()).getRef(anObject.kindRef.code));
    }
        if(anObject.chargeRef.code != Integer.MIN_VALUE)
        {
           anObject.setChargeRef(
      new com.ksoe.energynet.dataminer.generated.FINChargeTypeDAOGen(connection,getUserProfile()).getRef(anObject.chargeRef.code));
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


  public com.ksoe.energynet.valueobject.references.FINWorkerRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.FINWorkerRef ref = new com.ksoe.energynet.valueobject.references.FINWorkerRef();
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

    selectStr = "DELETE FROM  FINWORKER WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    FINWorker object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%FINWorker.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(FINWorker.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%FINWorker.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINWorker.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FINWorker.getObject%} access denied");

    selectStr =

    "SELECT  FINWORKER.CODE FROM  FINWORKER WHERE  FINWORKER.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("FINWORKER",segregationInfo,getUserProfile().getDomainInfo());
    if(segregationWhereStr.length() > 0)
     selectStr = selectStr +
      " AND " + segregationWhereStr;
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
    _checkConditionToken(condition,"code","FINWORKER.CODE");
    _checkConditionToken(condition,"name","FINWORKER.NAME");
    _checkConditionToken(condition,"tabnumber","FINWORKER.TABNUMBER");
    _checkConditionToken(condition,"positionname","FINWORKER.POSITIONNAME");
    _checkConditionToken(condition,"positioncode","FINWORKER.POSITIONCODE");
    _checkConditionToken(condition,"departmentname","FINWORKER.DEPARTMENTNAME");
    _checkConditionToken(condition,"departmentcode","FINWORKER.DEPARTMENTCODE");
    _checkConditionToken(condition,"pricegen","FINWORKER.PRICEGEN");
    _checkConditionToken(condition,"categor","FINWORKER.CATEGOR");
    _checkConditionToken(condition,"fincode","FINWORKER.FINCODE");
    _checkConditionToken(condition,"issentassignment","FINWORKER.ISSENTASSIGNMENT");
    _checkConditionToken(condition,"chargepercent","FINWORKER.CHARGEPERCENT");
    _checkConditionToken(condition,"categorid","FINWORKER.CATEGORID");
    _checkConditionToken(condition,"categorname","FINWORKER.CATEGORNAME");
    _checkConditionToken(condition,"worktimeid","FINWORKER.WORKTIMEID");
    _checkConditionToken(condition,"domain_info","FINWORKER.DOMAIN_INFO");
    _checkConditionToken(condition,"positionid","FINWORKER.POSITIONID");
    _checkConditionToken(condition,"modify_time","FINWORKER.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"kindref","KINDREFCODE");
    _checkConditionToken(condition,"kindref.code","KINDREFCODE");
    _checkConditionToken(condition,"chargeref","CHARGEREFCODE");
    _checkConditionToken(condition,"chargeref.code","CHARGEREFCODE");
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

  private void _collectAutoIncrementFields(FINWorker anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("FINWORKER", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("FINWORKER", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("FINWORKER", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: FINWORKER");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of FINWorkerDAO
