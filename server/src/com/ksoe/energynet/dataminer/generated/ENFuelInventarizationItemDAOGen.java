
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

import com.ksoe.energynet.valueobject.ENFuelInventarizationItem;
import com.ksoe.energynet.valueobject.filter.ENFuelInventarizationItemFilter;
import com.ksoe.energynet.valueobject.brief.ENFuelInventarizationItemShort;
import com.ksoe.energynet.valueobject.lists.ENFuelInventarizationItemShortList;

import com.ksoe.techcard.dataminer.TKFuelTypeDAO;
import com.ksoe.techcard.dataminer.TKTransportRealDAO;

/**
 * DAO Object for ENFuelInventarizationItem;
 *
 */

public class ENFuelInventarizationItemDAOGen extends GenericDataMiner {

   public ENFuelInventarizationItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENFuelInventarizationItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   protected boolean isEqual(ENFuelInventarizationItem inObject) throws PersistenceException
   {
      ENFuelInventarizationItem obj = new ENFuelInventarizationItem();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.countGen == null && obj.countGen == null){}
	else
		if(inObject.countGen == null || obj.countGen == null) return false;
		else
			if ( ! inObject.countGen.equals(obj.countGen)){
				return false;
			}

	if(inObject.countFact == null && obj.countFact == null){}
	else
		if(inObject.countFact == null || obj.countFact == null) return false;
		else
			if ( ! inObject.countFact.equals(obj.countFact)){
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
			if ( ! inObject.dateAdd.equals(obj.dateAdd)){
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
     if (inObject.transportRealRef.code != obj.transportRealRef.code){
        return false;
     }
     if (inObject.travelSheetRef.code != obj.travelSheetRef.code){
        return false;
     }
     if (inObject.travelFuelTypeRef.code != obj.travelFuelTypeRef.code){
        return false;
     }
      return true;
   }

   public int add(ENFuelInventarizationItem anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENFuelInventarizationItem anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENFUELINVENTARIZATINTM (CODE,COUNTGEN,COUNTFACT,USERADD,DATEADD,USERGEN,DATEEDIT,MODIFY_TIME,INVENTARIZATIONREFCODE,FUELTYPEREFCODE,TRANSPORTREALREFCODE,TRAVELSHEETREFCODE,TRAVELFUELTYPEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.countGen);
      if (anObject.countFact != null)
        anObject.countFact = anObject.countFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.countFact);
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
      if (anObject.inventarizationRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENFuelInventarizationDAOGen(connection,getUserProfile()).exists(anObject.inventarizationRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENFuelInventarizationItem.inventarizationRef.code%} = {%"+anObject.inventarizationRef.code+"%}");
        statement.setInt(9,anObject.inventarizationRef.code);
      }
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.fuelTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKFuelTypeDAOGen(connection,getUserProfile()).exists(anObject.fuelTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENFuelInventarizationItem.fuelTypeRef.code%} = {%"+anObject.fuelTypeRef.code+"%}");
        statement.setInt(10,anObject.fuelTypeRef.code);
      }
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.transportRealRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).exists(anObject.transportRealRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENFuelInventarizationItem.transportRealRef.code%} = {%"+anObject.transportRealRef.code+"%}");
        statement.setInt(11,anObject.transportRealRef.code);
      }
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.travelSheetRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTravelSheetDAOGen(connection,getUserProfile()).exists(anObject.travelSheetRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENFuelInventarizationItem.travelSheetRef.code%} = {%"+anObject.travelSheetRef.code+"%}");
        statement.setInt(12,anObject.travelSheetRef.code);
      }
      else
        statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.travelFuelTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTravelSheetFuelTypeDAOGen(connection,getUserProfile()).exists(anObject.travelFuelTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENFuelInventarizationItem.travelFuelTypeRef.code%} = {%"+anObject.travelFuelTypeRef.code+"%}");
        statement.setInt(13,anObject.travelFuelTypeRef.code);
      }
      else
        statement.setNull(13,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENFuelInventarizationItemDAOGen.add%}",e);
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

   public void save(ENFuelInventarizationItem anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENFuelInventarizationItem anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENFuelInventarizationItem oldObject = new ENFuelInventarizationItem();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENFuelInventarizationItem.modify_time_Field+" FROM  ENFUELINVENTARIZATINTM WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("COUNTGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNTFACT") == 0)
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
          if(fieldNameStr.compareTo("TRANSPORTREALREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRAVELSHEETREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRAVELFUELTYPEREF") == 0)
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
        "UPDATE ENFUELINVENTARIZATINTM SET  COUNTGEN = ? , COUNTFACT = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , INVENTARIZATIONREFCODE = ? , FUELTYPEREFCODE = ? , TRANSPORTREALREFCODE = ? , TRAVELSHEETREFCODE = ? , TRAVELFUELTYPEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENFUELINVENTARIZATIONITEM SET ";
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
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.countGen);
      if (anObject.countFact != null)
        anObject.countFact = anObject.countFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.countFact);
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
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(7,null);
      else
        statement.setBigDecimal(7,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.inventarizationRef.code != Integer.MIN_VALUE)
        statement.setInt(8,anObject.inventarizationRef.code);
      else
        statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.fuelTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(9,anObject.fuelTypeRef.code);
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.transportRealRef.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.transportRealRef.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.travelSheetRef.code != Integer.MIN_VALUE)
        statement.setInt(11,anObject.travelSheetRef.code);
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.travelFuelTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(12,anObject.travelFuelTypeRef.code);
      else
        statement.setNull(12,java.sql.Types.INTEGER);
          statement.setInt(13,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("COUNTGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countGen != null)
                    anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countGen);
                continue;
             }
            if("COUNTFACT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countFact != null)
                    anObject.countFact = anObject.countFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countFact);
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
            if("TRANSPORTREALREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportRealRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportRealRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRAVELSHEETREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.travelSheetRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.travelSheetRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRAVELFUELTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.travelFuelTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.travelFuelTypeRef.code);
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

   } // end of save(ENFuelInventarizationItem anObject,String[] anAttributes)


 public ENFuelInventarizationItemShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENFuelInventarizationItem filterObject = new ENFuelInventarizationItem();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENFuelInventarizationItemShort)list.get(0);
   return null;
  }

  public ENFuelInventarizationItemShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENFuelInventarizationItemShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENFuelInventarizationItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENFuelInventarizationItemShortList getFilteredList(ENFuelInventarizationItem filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENFuelInventarizationItemShortList getScrollableFilteredList(ENFuelInventarizationItem aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENFuelInventarizationItemShortList getScrollableFilteredList(ENFuelInventarizationItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENFuelInventarizationItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENFuelInventarizationItemShortList getScrollableFilteredList(ENFuelInventarizationItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENFuelInventarizationItemShortList getScrollableFilteredList(ENFuelInventarizationItemFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENFuelInventarizationItemShortList getScrollableFilteredList(ENFuelInventarizationItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENFuelInventarizationItemShortList getScrollableFilteredList(ENFuelInventarizationItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENFuelInventarizationItemShortList result = new ENFuelInventarizationItemShortList();
    ENFuelInventarizationItemShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENFUELINVENTARIZATINTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENFUELINVENTARIZATINTM.CODE"+
     ",ENFUELINVENTARIZATINTM.COUNTGEN"+
     ",ENFUELINVENTARIZATINTM.COUNTFACT"+
     ",ENFUELINVENTARIZATINTM.USERADD"+
     ",ENFUELINVENTARIZATINTM.DATEADD"+
     ",ENFUELINVENTARIZATINTM.USERGEN"+
     ",ENFUELINVENTARIZATINTM.DATEEDIT"+

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
      ", TKTRANSPORTREAL.CODE " +
      ", TKTRANSPORTREAL.NAME " +
      ", TKTRANSPORTREAL.INVNUMBER " +
      ", TKTRANSPORTREAL.GOSNUMBER " +
      ", ENTRAVELSHEET.CODE " +
      ", ENTRAVELSHEET.NUMBERGEN " +
      ", ENTRAVELSHEET.DATESTART " +
      ", ENTRAVELSHEET.DATEFINAL " +
      ", ENTRAVELSHEET.SPEEDOMETERSTART " +
      ", ENTRAVELSHEET.SPEEDOMETERFINAL " +
      ", ENTRAVELSHEET.FUELCOUNTERSTART " +
      ", ENTRAVELSHEET.FUELCOUNTERFINAL " +
      ", ENTRAVELSHEET.TIMESTART " +
      ", ENTRAVELSHEET.TIMEFINAL " +
      ", ENTRAVELSHEET.DATEEDIT " +
      ", ENTRAVELSHEET.USERGEN " +
      ", ENTRAVELSHEETFUELTYPE.CODE " +
      ", ENTRAVELSHEETFUELTYPE.NAME " +
     " FROM ENFUELINVENTARIZATINTM " +
     ", ENFUELINVENTARIZATION " +
     ", TKFUELTYPE " +
     ", TKTRANSPORTREAL " +
     ", ENTRAVELSHEET " +
     ", ENTRAVELSHEETFUELTYPE " +
     //" WHERE "
  "";
     whereStr = " ENFUELINVENTARIZATION.CODE = ENFUELINVENTARIZATINTM.INVENTARIZATIONREFCODE" ; //+
      whereStr = whereStr +" AND TKFUELTYPE.CODE = ENFUELINVENTARIZATINTM.FUELTYPEREFCODE" ; //+
      whereStr = whereStr +" AND TKTRANSPORTREAL.CODE = ENFUELINVENTARIZATINTM.TRANSPORTREALREFCODE" ; //+
      whereStr = whereStr +" AND ENTRAVELSHEET.CODE = ENFUELINVENTARIZATINTM.TRAVELSHEETREFCODE" ; //+
      whereStr = whereStr +" AND ENTRAVELSHEETFUELTYPE.CODE = ENFUELINVENTARIZATINTM.TRAVELFUELTYPEREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENFUELINVENTARIZATINTM.CODE IN ( SELECT ENFUELINVENTARIZATINTM.CODE FROM ENFUELINVENTARIZATINTM ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.COUNTGEN = ?";
        }
        if(aFilterObject.countFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.COUNTFACT = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENFUELINVENTARIZATINTM.USERADD) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENFUELINVENTARIZATINTM.USERADD) LIKE UPPER(?)";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENFUELINVENTARIZATINTM.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENFUELINVENTARIZATINTM.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.MODIFY_TIME = ?";
        }
        if(aFilterObject.inventarizationRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENFUELINVENTARIZATINTM.INVENTARIZATIONREFCODE = ? ";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENFUELINVENTARIZATINTM.FUELTYPEREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENFUELINVENTARIZATINTM.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENFUELINVENTARIZATINTM.TRAVELSHEETREFCODE = ? ";
        }
        if(aFilterObject.travelFuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENFUELINVENTARIZATINTM.TRAVELFUELTYPEREFCODE = ? ";
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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.countFact != null){
            number++;
            aFilterObject.countFact = aFilterObject.countFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFact);
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
       if(aFilterObject.inventarizationRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.inventarizationRef.code);
       }
       if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fuelTypeRef.code);
       }
       if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRealRef.code);
       }
       if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetRef.code);
       }
       if(aFilterObject.travelFuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelFuelTypeRef.code);
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

        anObject = new ENFuelInventarizationItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.countGen = set.getBigDecimal(2);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countFact = set.getBigDecimal(3);
        if(anObject.countFact != null)
            anObject.countFact = anObject.countFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userAdd = set.getString(4);
        anObject.dateAdd = set.getTimestamp(5);
        anObject.userGen = set.getString(6);
        anObject.dateEdit = set.getTimestamp(7);

        anObject.inventarizationRefCode = set.getInt(8);
    if(set.wasNull())
      anObject.inventarizationRefCode = Integer.MIN_VALUE;
        anObject.inventarizationRefNumberGen = set.getString(9);
        anObject.inventarizationRefDateGen = set.getTimestamp(10);
        anObject.inventarizationRefMolCode = set.getString(11);
        anObject.inventarizationRefMolName = set.getString(12);
        anObject.inventarizationRefCommentGen = set.getString(13);
        anObject.inventarizationRefUserAdd = set.getString(14);
        anObject.inventarizationRefDateAdd = set.getTimestamp(15);
        anObject.inventarizationRefUserGen = set.getString(16);
        anObject.inventarizationRefDateEdit = set.getTimestamp(17);
        anObject.fuelTypeRefCode = set.getInt(18);
    if(set.wasNull())
      anObject.fuelTypeRefCode = Integer.MIN_VALUE;
        anObject.fuelTypeRefName = set.getString(19);
        anObject.transportRealRefCode = set.getInt(20);
    if(set.wasNull())
      anObject.transportRealRefCode = Integer.MIN_VALUE;
        anObject.transportRealRefName = set.getString(21);
        anObject.transportRealRefInvNumber = set.getString(22);
        anObject.transportRealRefGosNumber = set.getString(23);
        anObject.travelSheetRefCode = set.getInt(24);
    if(set.wasNull())
      anObject.travelSheetRefCode = Integer.MIN_VALUE;
        anObject.travelSheetRefNumberGen = set.getString(25);
        anObject.travelSheetRefDateStart = set.getDate(26);
        anObject.travelSheetRefDateFinal = set.getDate(27);
        anObject.travelSheetRefSpeedometerStart = set.getBigDecimal(28);
        if(anObject.travelSheetRefSpeedometerStart != null)
          anObject.travelSheetRefSpeedometerStart = anObject.travelSheetRefSpeedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetRefSpeedometerFinal = set.getBigDecimal(29);
        if(anObject.travelSheetRefSpeedometerFinal != null)
          anObject.travelSheetRefSpeedometerFinal = anObject.travelSheetRefSpeedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetRefFuelCounterStart = set.getBigDecimal(30);
        if(anObject.travelSheetRefFuelCounterStart != null)
          anObject.travelSheetRefFuelCounterStart = anObject.travelSheetRefFuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetRefFuelCounterFinal = set.getBigDecimal(31);
        if(anObject.travelSheetRefFuelCounterFinal != null)
          anObject.travelSheetRefFuelCounterFinal = anObject.travelSheetRefFuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetRefTimeStart = set.getTimestamp(32);
        anObject.travelSheetRefTimeFinal = set.getTimestamp(33);
        anObject.travelSheetRefDateEdit = set.getTimestamp(34);
        anObject.travelSheetRefUserGen = set.getString(35);
        anObject.travelFuelTypeRefCode = set.getInt(36);
    if(set.wasNull())
      anObject.travelFuelTypeRefCode = Integer.MIN_VALUE;
        anObject.travelFuelTypeRefName = set.getString(37);

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

  public int[] getFilteredCodeArrayOLD(ENFuelInventarizationItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENFUELINVENTARIZATINTM.CODE FROM ENFUELINVENTARIZATINTM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENFUELINVENTARIZATINTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.COUNTGEN = ?";
        }
        if(aFilterObject.countFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.COUNTFACT = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENFUELINVENTARIZATINTM.USERADD = ?";
             else
                 whereStr = whereStr + "  ENFUELINVENTARIZATINTM.USERADD LIKE ?";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENFUELINVENTARIZATINTM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENFUELINVENTARIZATINTM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.MODIFY_TIME = ?";
        }
        if(aFilterObject.inventarizationRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVENTARIZATINTM.INVENTARIZATIONREFCODE = ? ";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVENTARIZATINTM.FUELTYPEREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVENTARIZATINTM.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVENTARIZATINTM.TRAVELSHEETREFCODE = ? ";
        }
        if(aFilterObject.travelFuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVENTARIZATINTM.TRAVELFUELTYPEREFCODE = ? ";
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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.countFact != null){
            number++;
            aFilterObject.countFact = aFilterObject.countFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFact);
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENFUELINVENTARIZATINTM.USERADD = ?";
             else
                 whereStr = whereStr + " ENFUELINVENTARIZATINTM.USERADD LIKE ?";

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
                 whereStr = whereStr + " ENFUELINVENTARIZATINTM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENFUELINVENTARIZATINTM.USERGEN LIKE ?";

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
       if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRealRef.code);
       }
       if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetRef.code);
       }
       if(aFilterObject.travelFuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelFuelTypeRef.code);
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

  public int[] getFilteredCodeArray(ENFuelInventarizationItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENFuelInventarizationItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENFUELINVENTARIZATINTM.CODE FROM ENFUELINVENTARIZATINTM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENFUELINVENTARIZATINTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.COUNTGEN = ?";
        }
        if(aFilterObject.countFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.COUNTFACT = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENFUELINVENTARIZATINTM.USERADD = ?";
             else
                 whereStr = whereStr + "  ENFUELINVENTARIZATINTM.USERADD LIKE ?";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENFUELINVENTARIZATINTM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENFUELINVENTARIZATINTM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELINVENTARIZATINTM.MODIFY_TIME = ?";
        }
        if(aFilterObject.inventarizationRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVENTARIZATINTM.INVENTARIZATIONREFCODE = ? ";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVENTARIZATINTM.FUELTYPEREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVENTARIZATINTM.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVENTARIZATINTM.TRAVELSHEETREFCODE = ? ";
        }
        if(aFilterObject.travelFuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENFUELINVENTARIZATINTM.TRAVELFUELTYPEREFCODE = ? ";
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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.countFact != null){
            number++;
            aFilterObject.countFact = aFilterObject.countFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countFact);
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENFUELINVENTARIZATINTM.USERADD = ?";
             else
                 whereStr = whereStr + " ENFUELINVENTARIZATINTM.USERADD LIKE ?";

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
                 whereStr = whereStr + " ENFUELINVENTARIZATINTM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENFUELINVENTARIZATINTM.USERGEN LIKE ?";

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
       if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRealRef.code);
       }
       if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetRef.code);
       }
       if(aFilterObject.travelFuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelFuelTypeRef.code);
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


   public ENFuelInventarizationItem getObject(int uid) throws PersistenceException
   {
    ENFuelInventarizationItem result = new ENFuelInventarizationItem();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENFuelInventarizationItem anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENFUELINVENTARIZATINTM.CODE, ENFUELINVENTARIZATINTM.COUNTGEN, ENFUELINVENTARIZATINTM.COUNTFACT, ENFUELINVENTARIZATINTM.USERADD, ENFUELINVENTARIZATINTM.DATEADD, ENFUELINVENTARIZATINTM.USERGEN, ENFUELINVENTARIZATINTM.DATEEDIT, ENFUELINVENTARIZATINTM.MODIFY_TIME, ENFUELINVENTARIZATINTM.INVENTARIZATIONREFCODE, ENFUELINVENTARIZATINTM.FUELTYPEREFCODE, ENFUELINVENTARIZATINTM.TRANSPORTREALREFCODE, ENFUELINVENTARIZATINTM.TRAVELSHEETREFCODE, ENFUELINVENTARIZATINTM.TRAVELFUELTYPEREFCODE "
    +" FROM ENFUELINVENTARIZATINTM WHERE ENFUELINVENTARIZATINTM.CODE = ?";

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
        anObject.countGen = set.getBigDecimal(2);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countFact = set.getBigDecimal(3);
        if(anObject.countFact != null)
            anObject.countFact = anObject.countFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userAdd = set.getString(4);
        anObject.dateAdd = set.getTimestamp(5);
        anObject.userGen = set.getString(6);
        anObject.dateEdit = set.getTimestamp(7);
        anObject.modify_time = set.getLong(8);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.inventarizationRef.code = set.getInt(9);
        if ( set.wasNull() )
            anObject.inventarizationRef.code = Integer.MIN_VALUE;
        anObject.fuelTypeRef.code = set.getInt(10);
        if ( set.wasNull() )
            anObject.fuelTypeRef.code = Integer.MIN_VALUE;
        anObject.transportRealRef.code = set.getInt(11);
        if ( set.wasNull() )
            anObject.transportRealRef.code = Integer.MIN_VALUE;
        anObject.travelSheetRef.code = set.getInt(12);
        if ( set.wasNull() )
            anObject.travelSheetRef.code = Integer.MIN_VALUE;
        anObject.travelFuelTypeRef.code = set.getInt(13);
        if ( set.wasNull() )
            anObject.travelFuelTypeRef.code = Integer.MIN_VALUE;
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
        if(anObject.transportRealRef.code != Integer.MIN_VALUE)
        {
           anObject.setTransportRealRef(
      new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getRef(anObject.transportRealRef.code));
    }
        if(anObject.travelSheetRef.code != Integer.MIN_VALUE)
        {
           anObject.setTravelSheetRef(
      new com.ksoe.energynet.dataminer.generated.ENTravelSheetDAOGen(connection,getUserProfile()).getRef(anObject.travelSheetRef.code));
    }
        if(anObject.travelFuelTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setTravelFuelTypeRef(
      new com.ksoe.energynet.dataminer.generated.ENTravelSheetFuelTypeDAOGen(connection,getUserProfile()).getRef(anObject.travelFuelTypeRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENFuelInventarizationItemRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENFuelInventarizationItemRef ref = new com.ksoe.energynet.valueobject.references.ENFuelInventarizationItemRef();
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

    selectStr = "DELETE FROM  ENFUELINVENTARIZATINTM WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENFuelInventarizationItem object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENFuelInventarizationItem.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENFuelInventarizationItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENFuelInventarizationItem.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENFuelInventarizationItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENFuelInventarizationItem.getObject%} access denied");

    selectStr =

    "SELECT  ENFUELINVENTARIZATINTM.CODE FROM  ENFUELINVENTARIZATINTM WHERE  ENFUELINVENTARIZATINTM.CODE = ?";
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
    _checkConditionToken(condition,"code","ENFUELINVENTARIZATINTM.CODE");
    _checkConditionToken(condition,"countgen","ENFUELINVENTARIZATINTM.COUNTGEN");
    _checkConditionToken(condition,"countfact","ENFUELINVENTARIZATINTM.COUNTFACT");
    _checkConditionToken(condition,"useradd","ENFUELINVENTARIZATINTM.USERADD");
    _checkConditionToken(condition,"dateadd","ENFUELINVENTARIZATINTM.DATEADD");
    _checkConditionToken(condition,"usergen","ENFUELINVENTARIZATINTM.USERGEN");
    _checkConditionToken(condition,"dateedit","ENFUELINVENTARIZATINTM.DATEEDIT");
    _checkConditionToken(condition,"modify_time","ENFUELINVENTARIZATINTM.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"inventarizationref","INVENTARIZATIONREFCODE");
    _checkConditionToken(condition,"inventarizationref.code","INVENTARIZATIONREFCODE");
    _checkConditionToken(condition,"fueltyperef","FUELTYPEREFCODE");
    _checkConditionToken(condition,"fueltyperef.code","FUELTYPEREFCODE");
    _checkConditionToken(condition,"transportrealref","TRANSPORTREALREFCODE");
    _checkConditionToken(condition,"transportrealref.code","TRANSPORTREALREFCODE");
    _checkConditionToken(condition,"travelsheetref","TRAVELSHEETREFCODE");
    _checkConditionToken(condition,"travelsheetref.code","TRAVELSHEETREFCODE");
    _checkConditionToken(condition,"travelfueltyperef","TRAVELFUELTYPEREFCODE");
    _checkConditionToken(condition,"travelfueltyperef.code","TRAVELFUELTYPEREFCODE");
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

  private void _collectAutoIncrementFields(ENFuelInventarizationItem anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENFUELINVENTARIZATINTM", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENFUELINVENTARIZATINTM", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENFUELINVENTARIZATINTM", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENFUELINVENTARIZATINTM");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENFuelInventarizationItemDAO
