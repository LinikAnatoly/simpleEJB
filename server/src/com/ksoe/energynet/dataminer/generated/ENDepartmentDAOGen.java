
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

import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.filter.ENDepartmentFilter;
import com.ksoe.energynet.valueobject.brief.ENDepartmentShort;
import com.ksoe.energynet.valueobject.lists.ENDepartmentShortList;


/**
 * DAO Object for ENDepartment;
 *
 */

public class ENDepartmentDAOGen extends GenericDataMiner {

   public ENDepartmentDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENDepartmentDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(ENDepartment inObject) throws PersistenceException
   {
      ENDepartment obj = new ENDepartment();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.name == null && obj.name == null){}
	else
		if(inObject.name == null || obj.name == null) return false;
		else
			if ( ! inObject.name.equals(obj.name)){
				return false;
			}

	if(inObject.shortName == null && obj.shortName == null){}
	else
		if(inObject.shortName == null || obj.shortName == null) return false;
		else
			if ( ! inObject.shortName.equals(obj.shortName)){
				return false;
			}

     if (inObject.isVirtual != obj.isVirtual){
				return false;
			}

	if(inObject.dateStart == null && obj.dateStart == null){}
	else
		if(inObject.dateStart == null || obj.dateStart == null) return false;
		else
			if (inObject.dateStart.compareTo(obj.dateStart) != 0){
				return false;
			}

	if(inObject.dateFinal == null && obj.dateFinal == null){}
	else
		if(inObject.dateFinal == null || obj.dateFinal == null) return false;
		else
			if (inObject.dateFinal.compareTo(obj.dateFinal) != 0){
				return false;
			}

     if (inObject.renCode != obj.renCode){
				return false;
			}

	if(inObject.shpzBalans == null && obj.shpzBalans == null){}
	else
		if(inObject.shpzBalans == null || obj.shpzBalans == null) return false;
		else
			if ( ! inObject.shpzBalans.equals(obj.shpzBalans)){
				return false;
			}

     if (inObject.shpzFinId != obj.shpzFinId){
				return false;
			}

     if (inObject.kau_table_id_1884 != obj.kau_table_id_1884){
				return false;
			}

	if(inObject.kau_1884 == null && obj.kau_1884 == null){}
	else
		if(inObject.kau_1884 == null || obj.kau_1884 == null) return false;
		else
			if ( ! inObject.kau_1884.equals(obj.kau_1884)){
				return false;
			}

	if(inObject.name_1884 == null && obj.name_1884 == null){}
	else
		if(inObject.name_1884 == null || obj.name_1884 == null) return false;
		else
			if ( ! inObject.name_1884.equals(obj.name_1884)){
				return false;
			}

	if(inObject.hrmorganizationid == null && obj.hrmorganizationid == null){}
	else
		if(inObject.hrmorganizationid == null || obj.hrmorganizationid == null) return false;
		else
			if ( ! inObject.hrmorganizationid.equals(obj.hrmorganizationid)){
				return false;
			}
     if (inObject.parentRef.code != obj.parentRef.code){
        return false;
     }
     if (inObject.typeRef.code != obj.typeRef.code){
        return false;
     }
     if (inObject.managementRef.code != obj.managementRef.code){
        return false;
     }
      return true;
   }

   public int add(ENDepartment anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENDepartment anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();
  if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENDEPARTMENT (CODE,NAME,SHORTNAME,ISVIRTUAL,DATESTART,DATEFINAL,RENCODE,SHPZBALANS,SHPZFINID,KAU_TABLE_ID_1884,KAU_1884,NAME_1884,HRMORGANIZATIONID,DOMAIN_INFO,MODIFY_TIME,PARENTREFCODE,TYPEREFCODE,MANAGEMENTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.name);
      statement.setString(3,anObject.shortName);
      if (anObject.isVirtual != Integer.MIN_VALUE )
         statement.setInt(4,anObject.isVirtual);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.dateStart == null)
        statement.setDate(5,null);
      else
        statement.setDate(5,new java.sql.Date(anObject.dateStart.getTime()));
      if (anObject.dateFinal == null)
        statement.setDate(6,null);
      else
        statement.setDate(6,new java.sql.Date(anObject.dateFinal.getTime()));
      if (anObject.renCode != Integer.MIN_VALUE )
         statement.setInt(7,anObject.renCode);
      else
         statement.setNull(7,java.sql.Types.INTEGER);
      statement.setString(8,anObject.shpzBalans);
      if (anObject.shpzFinId != Integer.MIN_VALUE )
         statement.setInt(9,anObject.shpzFinId);
      else
         statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.kau_table_id_1884 != Integer.MIN_VALUE )
         statement.setInt(10,anObject.kau_table_id_1884);
      else
         statement.setNull(10,java.sql.Types.INTEGER);
      statement.setString(11,anObject.kau_1884);
      statement.setString(12,anObject.name_1884);
      statement.setString(13,anObject.hrmorganizationid);
      statement.setString(14,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(15,null);
      else
        statement.setBigDecimal(15,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.parentRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.parentRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDepartment.parentRef.code%} = {%"+anObject.parentRef.code+"%}");
        statement.setInt(16,anObject.parentRef.code);
      }
      else
        statement.setNull(16,java.sql.Types.INTEGER);
      if (anObject.typeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentTypeDAOGen(connection,getUserProfile()).exists(anObject.typeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDepartment.typeRef.code%} = {%"+anObject.typeRef.code+"%}");
        statement.setInt(17,anObject.typeRef.code);
      }
      else
        statement.setNull(17,java.sql.Types.INTEGER);
      if (anObject.managementRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENManagementDAOGen(connection,getUserProfile()).exists(anObject.managementRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDepartment.managementRef.code%} = {%"+anObject.managementRef.code+"%}");
        statement.setInt(18,anObject.managementRef.code);
      }
      else
        statement.setNull(18,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENDepartmentDAOGen.add%}",e);
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

   public void save(ENDepartment anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENDepartment anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENDepartment oldObject = new ENDepartment();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENDepartment.modify_time_Field + "," + ENDepartment.domain_info_Field+" FROM  ENDEPARTMENT WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("SHORTNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ISVIRTUAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATESTART") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEFINAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RENCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SHPZBALANS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SHPZFINID") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("KAU_TABLE_ID_1884") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("KAU_1884") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NAME_1884") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("HRMORGANIZATIONID") == 0)
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
          if(fieldNameStr.compareTo("MODIFY_TIME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PARENTREF") == 0)
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
          if(fieldNameStr.compareTo("MANAGEMENTREF") == 0)
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
        "UPDATE ENDEPARTMENT SET  NAME = ? , SHORTNAME = ? , ISVIRTUAL = ? , DATESTART = ? , DATEFINAL = ? , RENCODE = ? , SHPZBALANS = ? , SHPZFINID = ? , KAU_TABLE_ID_1884 = ? , KAU_1884 = ? , NAME_1884 = ? , HRMORGANIZATIONID = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , PARENTREFCODE = ? , TYPEREFCODE = ? , MANAGEMENTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENDEPARTMENT SET ";
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
      statement.setString(2,anObject.shortName);
      if (anObject.isVirtual != Integer.MIN_VALUE )
         statement.setInt(3,anObject.isVirtual);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.dateStart == null)
        statement.setDate(4,null);
      else
        statement.setDate(4,new java.sql.Date(anObject.dateStart.getTime()));
      if (anObject.dateFinal == null)
        statement.setDate(5,null);
      else
        statement.setDate(5,new java.sql.Date(anObject.dateFinal.getTime()));
      if (anObject.renCode != Integer.MIN_VALUE )
         statement.setInt(6,anObject.renCode);
      else
         statement.setNull(6,java.sql.Types.INTEGER);
      statement.setString(7,anObject.shpzBalans);
      if (anObject.shpzFinId != Integer.MIN_VALUE )
         statement.setInt(8,anObject.shpzFinId);
      else
         statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.kau_table_id_1884 != Integer.MIN_VALUE )
         statement.setInt(9,anObject.kau_table_id_1884);
      else
         statement.setNull(9,java.sql.Types.INTEGER);
      statement.setString(10,anObject.kau_1884);
      statement.setString(11,anObject.name_1884);
      statement.setString(12,anObject.hrmorganizationid);
      statement.setString(13,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(14,null);
      else
        statement.setBigDecimal(14,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.parentRef.code != Integer.MIN_VALUE)
        statement.setInt(15,anObject.parentRef.code);
      else
        statement.setNull(15,java.sql.Types.INTEGER);
      if (anObject.typeRef.code != Integer.MIN_VALUE)
        statement.setInt(16,anObject.typeRef.code);
      else
        statement.setNull(16,java.sql.Types.INTEGER);
      if (anObject.managementRef.code != Integer.MIN_VALUE)
        statement.setInt(17,anObject.managementRef.code);
      else
        statement.setNull(17,java.sql.Types.INTEGER);
          statement.setInt(18,anObject.code);
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
            if("SHORTNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.shortName);
                continue;
             }
            if("ISVIRTUAL".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.isVirtual);
                continue;
             }
            if("DATESTART".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateStart == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.dateStart.getTime()));
                continue;
             }
            if("DATEFINAL".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateFinal == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.dateFinal.getTime()));
                continue;
             }
            if("RENCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.renCode);
                continue;
             }
            if("SHPZBALANS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.shpzBalans);
                continue;
             }
            if("SHPZFINID".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.shpzFinId);
                continue;
             }
            if("KAU_TABLE_ID_1884".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.kau_table_id_1884);
                continue;
             }
            if("KAU_1884".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.kau_1884);
                continue;
             }
            if("NAME_1884".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.name_1884);
                continue;
             }
            if("HRMORGANIZATIONID".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.hrmorganizationid);
                continue;
             }
            if("DOMAIN_INFO".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.domain_info);
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
            if("PARENTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.parentRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.parentRef.code);
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
            if("MANAGEMENTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.managementRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.managementRef.code);
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

   } // end of save(ENDepartment anObject,String[] anAttributes)


 public ENDepartmentShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENDepartment filterObject = new ENDepartment();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENDepartmentShort)list.get(0);
   return null;
  }

  public ENDepartmentShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENDepartmentShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENDepartmentShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENDepartmentShortList getFilteredList(ENDepartment filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENDepartmentShortList getScrollableFilteredList(ENDepartment aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENDepartmentShortList getScrollableFilteredList(ENDepartment aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENDepartmentShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENDepartmentShortList getScrollableFilteredList(ENDepartmentFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENDepartmentShortList getScrollableFilteredList(ENDepartmentFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENDepartmentShortList getScrollableFilteredList(ENDepartment aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENDepartmentShortList getScrollableFilteredList(ENDepartment aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENDepartmentShortList result = new ENDepartmentShortList();
    ENDepartmentShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDEPARTMENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENDEPARTMENT.CODE"+
     ",ENDEPARTMENT.SHORTNAME"+
     ",ENDEPARTMENT.DATESTART"+
     ",ENDEPARTMENT.DATEFINAL"+
     ",ENDEPARTMENT.RENCODE"+
     ",ENDEPARTMENT.SHPZBALANS"+
     ",ENDEPARTMENT.KAU_TABLE_ID_1884"+
     ",ENDEPARTMENT.KAU_1884"+
     ",ENDEPARTMENT.NAME_1884"+
     ",ENDEPARTMENT.HRMORGANIZATIONID"+

      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
      ", ENDEPARTMENT.HRMORGANIZATIONID " +
      ", ENDEPARTMENTTYPE.CODE " +
      ", ENDEPARTMENTTYPE.NAME " +
      ", ENMANAGEMENT.CODE " +
      ", ENMANAGEMENT.NAME " +
     " FROM ENDEPARTMENT " +
     ", ENDEPARTMENT " +
     ", ENDEPARTMENTTYPE " +
     ", ENMANAGEMENT " +
     //" WHERE "
  "";
     whereStr = " ENDEPARTMENT.CODE = ENDEPARTMENT.PARENTREFCODE" ; //+
      whereStr = whereStr +" AND ENDEPARTMENTTYPE.CODE = ENDEPARTMENT.TYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENMANAGEMENT.CODE = ENDEPARTMENT.MANAGEMENTREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENDEPARTMENT.CODE IN ( SELECT ENDEPARTMENT.CODE FROM ENDEPARTMENT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDEPARTMENT.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDEPARTMENT.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.shortName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.shortName.indexOf('*',0) < 0 && aFilterObject.shortName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDEPARTMENT.SHORTNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDEPARTMENT.SHORTNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.isVirtual != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.ISVIRTUAL = ?";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.DATEFINAL = ?";
        }
        if(aFilterObject.renCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.RENCODE = ?";
        }
         if (aFilterObject.shpzBalans != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.shpzBalans.indexOf('*',0) < 0 && aFilterObject.shpzBalans.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDEPARTMENT.SHPZBALANS) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDEPARTMENT.SHPZBALANS) LIKE UPPER(?)";
         }
        if(aFilterObject.shpzFinId != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.SHPZFINID = ?";
        }
        if(aFilterObject.kau_table_id_1884 != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.KAU_TABLE_ID_1884 = ?";
        }
         if (aFilterObject.kau_1884 != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kau_1884.indexOf('*',0) < 0 && aFilterObject.kau_1884.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDEPARTMENT.KAU_1884) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDEPARTMENT.KAU_1884) LIKE UPPER(?)";
         }
         if (aFilterObject.name_1884 != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name_1884.indexOf('*',0) < 0 && aFilterObject.name_1884.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDEPARTMENT.NAME_1884) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDEPARTMENT.NAME_1884) LIKE UPPER(?)";
         }
         if (aFilterObject.hrmorganizationid != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.hrmorganizationid.indexOf('*',0) < 0 && aFilterObject.hrmorganizationid.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDEPARTMENT.HRMORGANIZATIONID) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDEPARTMENT.HRMORGANIZATIONID) LIKE UPPER(?)";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDEPARTMENT.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDEPARTMENT.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.MODIFY_TIME = ?";
        }
        if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDEPARTMENT.PARENTREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDEPARTMENT.TYPEREFCODE = ? ";
        }
        if(aFilterObject.managementRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDEPARTMENT.MANAGEMENTREFCODE = ? ";
        }

      }

    
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDepartment.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENDepartment.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENDEPARTMENT",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENDEPARTMENT.DOMAIN_INFO IS NOT NULL";
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

           if(aFilterObject.shortName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.shortName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.isVirtual != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isVirtual);
         }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
         if(aFilterObject.renCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.renCode);
         }

           if(aFilterObject.shpzBalans != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.shpzBalans);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.shpzFinId != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.shpzFinId);
         }
         if(aFilterObject.kau_table_id_1884 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.kau_table_id_1884);
         }

           if(aFilterObject.kau_1884 != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kau_1884);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.name_1884 != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name_1884);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.hrmorganizationid != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.hrmorganizationid);
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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.parentRef.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.managementRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.managementRef.code);
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

        anObject = new ENDepartmentShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.shortName = set.getString(2);
        anObject.dateStart = set.getDate(3);
        anObject.dateFinal = set.getDate(4);
        anObject.renCode = set.getInt(5);
        if ( set.wasNull() )
            anObject.renCode = Integer.MIN_VALUE;
        anObject.shpzBalans = set.getString(6);
        anObject.kau_table_id_1884 = set.getInt(7);
        if ( set.wasNull() )
            anObject.kau_table_id_1884 = Integer.MIN_VALUE;
        anObject.kau_1884 = set.getString(8);
        anObject.name_1884 = set.getString(9);
        anObject.hrmorganizationid = set.getString(10);

        anObject.parentRefCode = set.getInt(11);
    if(set.wasNull())
      anObject.parentRefCode = Integer.MIN_VALUE;
        anObject.parentRefShortName = set.getString(12);
        anObject.parentRefDateStart = set.getDate(13);
        anObject.parentRefDateFinal = set.getDate(14);
        anObject.parentRefRenCode = set.getInt(15);
    if(set.wasNull())
      anObject.parentRefRenCode = Integer.MIN_VALUE;
        anObject.parentRefShpzBalans = set.getString(16);
        anObject.parentRefKau_table_id_1884 = set.getInt(17);
    if(set.wasNull())
      anObject.parentRefKau_table_id_1884 = Integer.MIN_VALUE;
        anObject.parentRefKau_1884 = set.getString(18);
        anObject.parentRefName_1884 = set.getString(19);
        anObject.parentRefHrmorganizationid = set.getString(20);
        anObject.typeRefCode = set.getInt(21);
    if(set.wasNull())
      anObject.typeRefCode = Integer.MIN_VALUE;
        anObject.typeRefName = set.getString(22);
        anObject.managementRefCode = set.getInt(23);
    if(set.wasNull())
      anObject.managementRefCode = Integer.MIN_VALUE;
        anObject.managementRefName = set.getString(24);

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

  public int[] getFilteredCodeArrayOLD(ENDepartment aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDEPARTMENT.CODE FROM ENDEPARTMENT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDEPARTMENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDepartment.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENDepartment.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENDEPARTMENT",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENDEPARTMENT.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDEPARTMENT.NAME = ?";
             else
                 whereStr = whereStr + "  ENDEPARTMENT.NAME LIKE ?";
         }
         if (aFilterObject.shortName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.shortName.indexOf('*',0) < 0 && aFilterObject.shortName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDEPARTMENT.SHORTNAME = ?";
             else
                 whereStr = whereStr + "  ENDEPARTMENT.SHORTNAME LIKE ?";
         }
        if(aFilterObject.isVirtual != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.ISVIRTUAL = ?";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.DATEFINAL = ?";
        }
        if(aFilterObject.renCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.RENCODE = ?";
        }
         if (aFilterObject.shpzBalans != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.shpzBalans.indexOf('*',0) < 0 && aFilterObject.shpzBalans.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDEPARTMENT.SHPZBALANS = ?";
             else
                 whereStr = whereStr + "  ENDEPARTMENT.SHPZBALANS LIKE ?";
         }
        if(aFilterObject.shpzFinId != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.SHPZFINID = ?";
        }
        if(aFilterObject.kau_table_id_1884 != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.KAU_TABLE_ID_1884 = ?";
        }
         if (aFilterObject.kau_1884 != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kau_1884.indexOf('*',0) < 0 && aFilterObject.kau_1884.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDEPARTMENT.KAU_1884 = ?";
             else
                 whereStr = whereStr + "  ENDEPARTMENT.KAU_1884 LIKE ?";
         }
         if (aFilterObject.name_1884 != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name_1884.indexOf('*',0) < 0 && aFilterObject.name_1884.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDEPARTMENT.NAME_1884 = ?";
             else
                 whereStr = whereStr + "  ENDEPARTMENT.NAME_1884 LIKE ?";
         }
         if (aFilterObject.hrmorganizationid != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.hrmorganizationid.indexOf('*',0) < 0 && aFilterObject.hrmorganizationid.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDEPARTMENT.HRMORGANIZATIONID = ?";
             else
                 whereStr = whereStr + "  ENDEPARTMENT.HRMORGANIZATIONID LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDEPARTMENT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENDEPARTMENT.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.MODIFY_TIME = ?";
        }
        if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDEPARTMENT.PARENTREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDEPARTMENT.TYPEREFCODE = ? ";
        }
        if(aFilterObject.managementRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDEPARTMENT.MANAGEMENTREFCODE = ? ";
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
                 whereStr = whereStr + " ENDEPARTMENT.NAME = ?";
             else
                 whereStr = whereStr + " ENDEPARTMENT.NAME LIKE ?";

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
         if (aFilterObject.shortName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.shortName.indexOf('*',0) < 0 && aFilterObject.shortName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDEPARTMENT.SHORTNAME = ?";
             else
                 whereStr = whereStr + " ENDEPARTMENT.SHORTNAME LIKE ?";

           if(aFilterObject.shortName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.shortName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.isVirtual != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isVirtual);
         }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
         if(aFilterObject.renCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.renCode);
         }
         if (aFilterObject.shpzBalans != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.shpzBalans.indexOf('*',0) < 0 && aFilterObject.shpzBalans.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDEPARTMENT.SHPZBALANS = ?";
             else
                 whereStr = whereStr + " ENDEPARTMENT.SHPZBALANS LIKE ?";

           if(aFilterObject.shpzBalans != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.shpzBalans);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.shpzFinId != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.shpzFinId);
         }
         if(aFilterObject.kau_table_id_1884 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.kau_table_id_1884);
         }
         if (aFilterObject.kau_1884 != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.kau_1884.indexOf('*',0) < 0 && aFilterObject.kau_1884.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDEPARTMENT.KAU_1884 = ?";
             else
                 whereStr = whereStr + " ENDEPARTMENT.KAU_1884 LIKE ?";

           if(aFilterObject.kau_1884 != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kau_1884);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.name_1884 != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name_1884.indexOf('*',0) < 0 && aFilterObject.name_1884.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDEPARTMENT.NAME_1884 = ?";
             else
                 whereStr = whereStr + " ENDEPARTMENT.NAME_1884 LIKE ?";

           if(aFilterObject.name_1884 != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name_1884);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.hrmorganizationid != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.hrmorganizationid.indexOf('*',0) < 0 && aFilterObject.hrmorganizationid.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDEPARTMENT.HRMORGANIZATIONID = ?";
             else
                 whereStr = whereStr + " ENDEPARTMENT.HRMORGANIZATIONID LIKE ?";

           if(aFilterObject.hrmorganizationid != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.hrmorganizationid);
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
                 whereStr = whereStr + " ENDEPARTMENT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENDEPARTMENT.DOMAIN_INFO LIKE ?";

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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.parentRef.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.managementRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.managementRef.code);
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

  public int[] getFilteredCodeArray(ENDepartmentFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENDepartment aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector<? extends Object> aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDEPARTMENT.CODE FROM ENDEPARTMENT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDEPARTMENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDepartment.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENDepartment.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENDEPARTMENT",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENDEPARTMENT.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDEPARTMENT.NAME = ?";
             else
                 whereStr = whereStr + "  ENDEPARTMENT.NAME LIKE ?";
         }
         if (aFilterObject.shortName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.shortName.indexOf('*',0) < 0 && aFilterObject.shortName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDEPARTMENT.SHORTNAME = ?";
             else
                 whereStr = whereStr + "  ENDEPARTMENT.SHORTNAME LIKE ?";
         }
        if(aFilterObject.isVirtual != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.ISVIRTUAL = ?";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.DATEFINAL = ?";
        }
        if(aFilterObject.renCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.RENCODE = ?";
        }
         if (aFilterObject.shpzBalans != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.shpzBalans.indexOf('*',0) < 0 && aFilterObject.shpzBalans.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDEPARTMENT.SHPZBALANS = ?";
             else
                 whereStr = whereStr + "  ENDEPARTMENT.SHPZBALANS LIKE ?";
         }
        if(aFilterObject.shpzFinId != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.SHPZFINID = ?";
        }
        if(aFilterObject.kau_table_id_1884 != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.KAU_TABLE_ID_1884 = ?";
        }
         if (aFilterObject.kau_1884 != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kau_1884.indexOf('*',0) < 0 && aFilterObject.kau_1884.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDEPARTMENT.KAU_1884 = ?";
             else
                 whereStr = whereStr + "  ENDEPARTMENT.KAU_1884 LIKE ?";
         }
         if (aFilterObject.name_1884 != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name_1884.indexOf('*',0) < 0 && aFilterObject.name_1884.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDEPARTMENT.NAME_1884 = ?";
             else
                 whereStr = whereStr + "  ENDEPARTMENT.NAME_1884 LIKE ?";
         }
         if (aFilterObject.hrmorganizationid != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.hrmorganizationid.indexOf('*',0) < 0 && aFilterObject.hrmorganizationid.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDEPARTMENT.HRMORGANIZATIONID = ?";
             else
                 whereStr = whereStr + "  ENDEPARTMENT.HRMORGANIZATIONID LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDEPARTMENT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENDEPARTMENT.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT.MODIFY_TIME = ?";
        }
        if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDEPARTMENT.PARENTREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDEPARTMENT.TYPEREFCODE = ? ";
        }
        if(aFilterObject.managementRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDEPARTMENT.MANAGEMENTREFCODE = ? ";
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
                 whereStr = whereStr + " ENDEPARTMENT.NAME = ?";
             else
                 whereStr = whereStr + " ENDEPARTMENT.NAME LIKE ?";

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
         if (aFilterObject.shortName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.shortName.indexOf('*',0) < 0 && aFilterObject.shortName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDEPARTMENT.SHORTNAME = ?";
             else
                 whereStr = whereStr + " ENDEPARTMENT.SHORTNAME LIKE ?";

           if(aFilterObject.shortName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.shortName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.isVirtual != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isVirtual);
         }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
         if(aFilterObject.renCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.renCode);
         }
         if (aFilterObject.shpzBalans != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.shpzBalans.indexOf('*',0) < 0 && aFilterObject.shpzBalans.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDEPARTMENT.SHPZBALANS = ?";
             else
                 whereStr = whereStr + " ENDEPARTMENT.SHPZBALANS LIKE ?";

           if(aFilterObject.shpzBalans != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.shpzBalans);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.shpzFinId != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.shpzFinId);
         }
         if(aFilterObject.kau_table_id_1884 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.kau_table_id_1884);
         }
         if (aFilterObject.kau_1884 != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.kau_1884.indexOf('*',0) < 0 && aFilterObject.kau_1884.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDEPARTMENT.KAU_1884 = ?";
             else
                 whereStr = whereStr + " ENDEPARTMENT.KAU_1884 LIKE ?";

           if(aFilterObject.kau_1884 != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kau_1884);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.name_1884 != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name_1884.indexOf('*',0) < 0 && aFilterObject.name_1884.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDEPARTMENT.NAME_1884 = ?";
             else
                 whereStr = whereStr + " ENDEPARTMENT.NAME_1884 LIKE ?";

           if(aFilterObject.name_1884 != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name_1884);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.hrmorganizationid != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.hrmorganizationid.indexOf('*',0) < 0 && aFilterObject.hrmorganizationid.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDEPARTMENT.HRMORGANIZATIONID = ?";
             else
                 whereStr = whereStr + " ENDEPARTMENT.HRMORGANIZATIONID LIKE ?";

           if(aFilterObject.hrmorganizationid != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.hrmorganizationid);
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
                 whereStr = whereStr + " ENDEPARTMENT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENDEPARTMENT.DOMAIN_INFO LIKE ?";

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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.parentRef.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.managementRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.managementRef.code);
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


   public ENDepartment getObject(int uid) throws PersistenceException
   {
    ENDepartment result = new ENDepartment();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENDepartment anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDepartment.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENDepartment.getObject%} access denied");



    selectStr =
    "SELECT  ENDEPARTMENT.CODE, ENDEPARTMENT.NAME, ENDEPARTMENT.SHORTNAME, ENDEPARTMENT.ISVIRTUAL, ENDEPARTMENT.DATESTART, ENDEPARTMENT.DATEFINAL, ENDEPARTMENT.RENCODE, ENDEPARTMENT.SHPZBALANS, ENDEPARTMENT.SHPZFINID, ENDEPARTMENT.KAU_TABLE_ID_1884, ENDEPARTMENT.KAU_1884, ENDEPARTMENT.NAME_1884, ENDEPARTMENT.HRMORGANIZATIONID, ENDEPARTMENT.DOMAIN_INFO, ENDEPARTMENT.MODIFY_TIME, ENDEPARTMENT.PARENTREFCODE, ENDEPARTMENT.TYPEREFCODE, ENDEPARTMENT.MANAGEMENTREFCODE "
    +" FROM ENDEPARTMENT WHERE ENDEPARTMENT.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENDEPARTMENT",segregationInfo,getUserProfile().getDomainInfo());
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
        anObject.shortName = set.getString(3);
        anObject.isVirtual = set.getInt(4);
        if ( set.wasNull() )
           anObject.isVirtual = Integer.MIN_VALUE;
        anObject.dateStart = set.getDate(5);
        anObject.dateFinal = set.getDate(6);
        anObject.renCode = set.getInt(7);
        if ( set.wasNull() )
           anObject.renCode = Integer.MIN_VALUE;
        anObject.shpzBalans = set.getString(8);
        anObject.shpzFinId = set.getInt(9);
        if ( set.wasNull() )
           anObject.shpzFinId = Integer.MIN_VALUE;
        anObject.kau_table_id_1884 = set.getInt(10);
        if ( set.wasNull() )
           anObject.kau_table_id_1884 = Integer.MIN_VALUE;
        anObject.kau_1884 = set.getString(11);
        anObject.name_1884 = set.getString(12);
        anObject.hrmorganizationid = set.getString(13);
        anObject.domain_info = set.getString(14);
        anObject.modify_time = set.getLong(15);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.parentRef.code = set.getInt(16);
        if ( set.wasNull() )
            anObject.parentRef.code = Integer.MIN_VALUE;
        anObject.typeRef.code = set.getInt(17);
        if ( set.wasNull() )
            anObject.typeRef.code = Integer.MIN_VALUE;
        anObject.managementRef.code = set.getInt(18);
        if ( set.wasNull() )
            anObject.managementRef.code = Integer.MIN_VALUE;
        if(anObject.parentRef.code != Integer.MIN_VALUE)
        {
           anObject.setParentRef(
      new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.parentRef.code));
    }
        if(anObject.typeRef.code != Integer.MIN_VALUE)
        {
           anObject.setTypeRef(
      new com.ksoe.energynet.dataminer.generated.ENDepartmentTypeDAOGen(connection,getUserProfile()).getRef(anObject.typeRef.code));
    }
        if(anObject.managementRef.code != Integer.MIN_VALUE)
        {
           anObject.setManagementRef(
      new com.ksoe.energynet.dataminer.generated.ENManagementDAOGen(connection,getUserProfile()).getRef(anObject.managementRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENDepartmentRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENDepartmentRef ref = new com.ksoe.energynet.valueobject.references.ENDepartmentRef();
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

    selectStr = "DELETE FROM  ENDEPARTMENT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENDepartment object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENDepartment.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENDepartment.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENDepartment.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDepartment.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENDepartment.getObject%} access denied");

    selectStr =

    "SELECT  ENDEPARTMENT.CODE FROM  ENDEPARTMENT WHERE  ENDEPARTMENT.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENDEPARTMENT",segregationInfo,getUserProfile().getDomainInfo());
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
    _checkConditionToken(condition,"code","ENDEPARTMENT.CODE");
    _checkConditionToken(condition,"name","ENDEPARTMENT.NAME");
    _checkConditionToken(condition,"shortname","ENDEPARTMENT.SHORTNAME");
    _checkConditionToken(condition,"isvirtual","ENDEPARTMENT.ISVIRTUAL");
    _checkConditionToken(condition,"datestart","ENDEPARTMENT.DATESTART");
    _checkConditionToken(condition,"datefinal","ENDEPARTMENT.DATEFINAL");
    _checkConditionToken(condition,"rencode","ENDEPARTMENT.RENCODE");
    _checkConditionToken(condition,"shpzbalans","ENDEPARTMENT.SHPZBALANS");
    _checkConditionToken(condition,"shpzfinid","ENDEPARTMENT.SHPZFINID");
    _checkConditionToken(condition,"kau_table_id_1884","ENDEPARTMENT.KAU_TABLE_ID_1884");
    _checkConditionToken(condition,"kau_1884","ENDEPARTMENT.KAU_1884");
    _checkConditionToken(condition,"name_1884","ENDEPARTMENT.NAME_1884");
    _checkConditionToken(condition,"hrmorganizationid","ENDEPARTMENT.HRMORGANIZATIONID");
    _checkConditionToken(condition,"domain_info","ENDEPARTMENT.DOMAIN_INFO");
    _checkConditionToken(condition,"modify_time","ENDEPARTMENT.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"parentref","PARENTREFCODE");
    _checkConditionToken(condition,"parentref.code","PARENTREFCODE");
    _checkConditionToken(condition,"typeref","TYPEREFCODE");
    _checkConditionToken(condition,"typeref.code","TYPEREFCODE");
    _checkConditionToken(condition,"managementref","MANAGEMENTREFCODE");
    _checkConditionToken(condition,"managementref.code","MANAGEMENTREFCODE");
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

  private void _collectAutoIncrementFields(ENDepartment anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENDEPARTMENT", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENDEPARTMENT", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENDEPARTMENT", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENDEPARTMENT");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENDepartmentDAO
