
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

import com.ksoe.energynet.valueobject.ENDamageRecovery;
import com.ksoe.energynet.valueobject.filter.ENDamageRecoveryFilter;
import com.ksoe.energynet.valueobject.brief.ENDamageRecoveryShort;
import com.ksoe.energynet.valueobject.lists.ENDamageRecoveryShortList;


/**
 * DAO Object for ENDamageRecovery;
 *
 */

public class ENDamageRecoveryDAOGen extends GenericDataMiner {

   public ENDamageRecoveryDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENDamageRecoveryDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(ENDamageRecovery inObject) throws PersistenceException
   {
      ENDamageRecovery obj = new ENDamageRecovery();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.numberGen == null && obj.numberGen == null){}
	else
		if(inObject.numberGen == null || obj.numberGen == null) return false;
		else
			if ( ! inObject.numberGen.equals(obj.numberGen)){
				return false;
			}

	if(inObject.dateGen == null && obj.dateGen == null){}
	else
		if(inObject.dateGen == null || obj.dateGen == null) return false;
		else
			if (inObject.dateGen.compareTo(obj.dateGen) != 0){
				return false;
			}

	if(inObject.FKcontractCode == null && obj.FKcontractCode == null){}
	else
		if(inObject.FKcontractCode == null || obj.FKcontractCode == null) return false;
		else
			if ( ! inObject.FKcontractCode.equals(obj.FKcontractCode)){
				return false;
			}

	if(inObject.FKpartnerCode == null && obj.FKpartnerCode == null){}
	else
		if(inObject.FKpartnerCode == null || obj.FKpartnerCode == null) return false;
		else
			if ( ! inObject.FKpartnerCode.equals(obj.FKpartnerCode)){
				return false;
			}

	if(inObject.FKdocCode == null && obj.FKdocCode == null){}
	else
		if(inObject.FKdocCode == null || obj.FKdocCode == null) return false;
		else
			if ( ! inObject.FKdocCode.equals(obj.FKdocCode)){
				return false;
			}

     if (inObject.FKdocID != obj.FKdocID){
				return false;
			}

	if(inObject.commentGen == null && obj.commentGen == null){}
	else
		if(inObject.commentGen == null || obj.commentGen == null) return false;
		else
			if ( ! inObject.commentGen.equals(obj.commentGen)){
				return false;
			}

	if(inObject.contragentName == null && obj.contragentName == null){}
	else
		if(inObject.contragentName == null || obj.contragentName == null) return false;
		else
			if ( ! inObject.contragentName.equals(obj.contragentName)){
				return false;
			}

	if(inObject.contragentAddress == null && obj.contragentAddress == null){}
	else
		if(inObject.contragentAddress == null || obj.contragentAddress == null) return false;
		else
			if ( ! inObject.contragentAddress.equals(obj.contragentAddress)){
				return false;
			}

	if(inObject.contragentPassport == null && obj.contragentPassport == null){}
	else
		if(inObject.contragentPassport == null || obj.contragentPassport == null) return false;
		else
			if ( ! inObject.contragentPassport.equals(obj.contragentPassport)){
				return false;
			}

	if(inObject.damageAmmount == null && obj.damageAmmount == null){}
	else
		if(inObject.damageAmmount == null || obj.damageAmmount == null) return false;
		else
			if ( ! inObject.damageAmmount.equals(obj.damageAmmount)){
				return false;
			}

     if (inObject.partId != obj.partId){
				return false;
			}

	if(inObject.datePosting == null && obj.datePosting == null){}
	else
		if(inObject.datePosting == null || obj.datePosting == null) return false;
		else
			if (inObject.datePosting.compareTo(obj.datePosting) != 0){
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
     if (inObject.department.code != obj.department.code){
        return false;
     }
     if (inObject.statusRef.code != obj.statusRef.code){
        return false;
     }
     if (inObject.warrantRef.code != obj.warrantRef.code){
        return false;
     }
      return true;
   }

   public int add(ENDamageRecovery anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENDamageRecovery anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();
  if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENDAMAGERECOVERY (CODE,NUMBERGEN,DATEGEN,FKCONTRACTCODE,FKPARTNERCODE,FKDOCCODE,FKDOCID,COMMENTGEN,CONTRAGENTNAME,CONTRAGENTADDRESS,CONTRAGENTPASSPORT,DAMAGEAMMOUNT,PARTID,DATEPOSTING,USERGEN,DATEEDIT,DOMAIN_INFO,MODIFY_TIME,DEPARTMENTCODE,STATUSREFCODE,WARRANTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.numberGen);
      if (anObject.dateGen == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.dateGen.getTime()));
      statement.setString(4,anObject.FKcontractCode);
      statement.setString(5,anObject.FKpartnerCode);
      statement.setString(6,anObject.FKdocCode);
      if (anObject.FKdocID != Integer.MIN_VALUE )
         statement.setInt(7,anObject.FKdocID);
      else
         statement.setNull(7,java.sql.Types.INTEGER);
      statement.setString(8,anObject.commentGen);
      statement.setString(9,anObject.contragentName);
      statement.setString(10,anObject.contragentAddress);
      statement.setString(11,anObject.contragentPassport);
      if (anObject.damageAmmount != null)
        anObject.damageAmmount = anObject.damageAmmount.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.damageAmmount);
      if (anObject.partId != Integer.MIN_VALUE )
         statement.setInt(13,anObject.partId);
      else
         statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.datePosting == null)
        statement.setDate(14,null);
      else
        statement.setDate(14,new java.sql.Date(anObject.datePosting.getTime()));
      statement.setString(15,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(16,null);
      else
        statement.setDate(16,new java.sql.Date(anObject.dateEdit.getTime()));
      statement.setString(17,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(18,null);
      else
        statement.setBigDecimal(18,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.department.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.department.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDamageRecovery.department.code%} = {%"+anObject.department.code+"%}");
        statement.setInt(19,anObject.department.code);
      }
      else
        statement.setNull(19,java.sql.Types.INTEGER);
      if (anObject.statusRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDamageRecoveryStatusDAOGen(connection,getUserProfile()).exists(anObject.statusRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDamageRecovery.statusRef.code%} = {%"+anObject.statusRef.code+"%}");
        statement.setInt(20,anObject.statusRef.code);
      }
      else
        statement.setNull(20,java.sql.Types.INTEGER);
      if (anObject.warrantRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).exists(anObject.warrantRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDamageRecovery.warrantRef.code%} = {%"+anObject.warrantRef.code+"%}");
        statement.setInt(21,anObject.warrantRef.code);
      }
      else
        statement.setNull(21,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENDamageRecoveryDAOGen.add%}",e);
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

   public void save(ENDamageRecovery anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENDamageRecovery anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENDamageRecovery oldObject = new ENDamageRecovery();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENDamageRecovery.modify_time_Field + "," + ENDamageRecovery.domain_info_Field+" FROM  ENDAMAGERECOVERY WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("NUMBERGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FKCONTRACTCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FKPARTNERCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FKDOCCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FKDOCID") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COMMENTGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRAGENTNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRAGENTADDRESS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRAGENTPASSPORT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DAMAGEAMMOUNT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PARTID") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEPOSTING") == 0)
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
          if(fieldNameStr.compareTo("DEPARTMENT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("STATUSREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("WARRANTREF") == 0)
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
        "UPDATE ENDAMAGERECOVERY SET  NUMBERGEN = ? , DATEGEN = ? , FKCONTRACTCODE = ? , FKPARTNERCODE = ? , FKDOCCODE = ? , FKDOCID = ? , COMMENTGEN = ? , CONTRAGENTNAME = ? , CONTRAGENTADDRESS = ? , CONTRAGENTPASSPORT = ? , DAMAGEAMMOUNT = ? , PARTID = ? , DATEPOSTING = ? , USERGEN = ? , DATEEDIT = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , DEPARTMENTCODE = ? , STATUSREFCODE = ? , WARRANTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENDAMAGERECOVERY SET ";
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
      statement.setString(1,anObject.numberGen);
      if (anObject.dateGen == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.dateGen.getTime()));
      statement.setString(3,anObject.FKcontractCode);
      statement.setString(4,anObject.FKpartnerCode);
      statement.setString(5,anObject.FKdocCode);
      if (anObject.FKdocID != Integer.MIN_VALUE )
         statement.setInt(6,anObject.FKdocID);
      else
         statement.setNull(6,java.sql.Types.INTEGER);
      statement.setString(7,anObject.commentGen);
      statement.setString(8,anObject.contragentName);
      statement.setString(9,anObject.contragentAddress);
      statement.setString(10,anObject.contragentPassport);
      if (anObject.damageAmmount != null)
        anObject.damageAmmount = anObject.damageAmmount.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.damageAmmount);
      if (anObject.partId != Integer.MIN_VALUE )
         statement.setInt(12,anObject.partId);
      else
         statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.datePosting == null)
        statement.setDate(13,null);
      else
        statement.setDate(13,new java.sql.Date(anObject.datePosting.getTime()));
      statement.setString(14,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(15,null);
      else
        statement.setDate(15,new java.sql.Date(anObject.dateEdit.getTime()));
      statement.setString(16,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(17,null);
      else
        statement.setBigDecimal(17,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.department.code != Integer.MIN_VALUE)
        statement.setInt(18,anObject.department.code);
      else
        statement.setNull(18,java.sql.Types.INTEGER);
      if (anObject.statusRef.code != Integer.MIN_VALUE)
        statement.setInt(19,anObject.statusRef.code);
      else
        statement.setNull(19,java.sql.Types.INTEGER);
      if (anObject.warrantRef.code != Integer.MIN_VALUE)
        statement.setInt(20,anObject.warrantRef.code);
      else
        statement.setNull(20,java.sql.Types.INTEGER);
          statement.setInt(21,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("NUMBERGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.numberGen);
                continue;
             }
            if("DATEGEN".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateGen == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.dateGen.getTime()));
                continue;
             }
            if("FKCONTRACTCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.FKcontractCode);
                continue;
             }
            if("FKPARTNERCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.FKpartnerCode);
                continue;
             }
            if("FKDOCCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.FKdocCode);
                continue;
             }
            if("FKDOCID".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.FKdocID);
                continue;
             }
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
                continue;
             }
            if("CONTRAGENTNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.contragentName);
                continue;
             }
            if("CONTRAGENTADDRESS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.contragentAddress);
                continue;
             }
            if("CONTRAGENTPASSPORT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.contragentPassport);
                continue;
             }
            if("DAMAGEAMMOUNT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.damageAmmount != null)
                    anObject.damageAmmount = anObject.damageAmmount.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.damageAmmount);
                continue;
             }
            if("PARTID".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.partId);
                continue;
             }
            if("DATEPOSTING".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.datePosting == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.datePosting.getTime()));
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
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.dateEdit.getTime()));
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
            if("DEPARTMENT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.department.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.department.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("STATUSREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.statusRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.statusRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("WARRANTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.warrantRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.warrantRef.code);
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

   } // end of save(ENDamageRecovery anObject,String[] anAttributes)


 public ENDamageRecoveryShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENDamageRecovery filterObject = new ENDamageRecovery();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENDamageRecoveryShort)list.get(0);
   return null;
  }

  public ENDamageRecoveryShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENDamageRecoveryShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENDamageRecoveryShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENDamageRecoveryShortList getFilteredList(ENDamageRecovery filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENDamageRecoveryShortList getScrollableFilteredList(ENDamageRecovery aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENDamageRecoveryShortList getScrollableFilteredList(ENDamageRecovery aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENDamageRecoveryShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENDamageRecoveryShortList getScrollableFilteredList(ENDamageRecoveryFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENDamageRecoveryShortList getScrollableFilteredList(ENDamageRecoveryFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENDamageRecoveryShortList getScrollableFilteredList(ENDamageRecovery aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENDamageRecoveryShortList getScrollableFilteredList(ENDamageRecovery aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENDamageRecoveryShortList result = new ENDamageRecoveryShortList();
    ENDamageRecoveryShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDAMAGERECOVERY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENDAMAGERECOVERY.CODE"+
     ",ENDAMAGERECOVERY.NUMBERGEN"+
     ",ENDAMAGERECOVERY.DATEGEN"+
     ",ENDAMAGERECOVERY.FKCONTRACTCODE"+
     ",ENDAMAGERECOVERY.FKPARTNERCODE"+
     ",ENDAMAGERECOVERY.FKDOCCODE"+
     ",ENDAMAGERECOVERY.FKDOCID"+
     ",ENDAMAGERECOVERY.COMMENTGEN"+
     ",ENDAMAGERECOVERY.CONTRAGENTNAME"+
     ",ENDAMAGERECOVERY.CONTRAGENTADDRESS"+
     ",ENDAMAGERECOVERY.CONTRAGENTPASSPORT"+
     ",ENDAMAGERECOVERY.DAMAGEAMMOUNT"+
     ",ENDAMAGERECOVERY.PARTID"+
     ",ENDAMAGERECOVERY.DATEPOSTING"+
     ",ENDAMAGERECOVERY.USERGEN"+
     ",ENDAMAGERECOVERY.DATEEDIT"+

      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
      ", ENDAMAGERECOVERYSTATUS.CODE " +
      ", ENDAMAGERECOVERYSTATUS.NAME " +
      ", ENWARRANT.CODE " +
      ", ENWARRANT.NUMBERGEN " +
      ", ENWARRANT.NAME " +
      ", ENWARRANT.WARRANTFIO " +
      ", ENWARRANT.WARRANTSHORTFIO " +
      ", ENWARRANT.WARRANTPOSITION " +
      ", ENWARRANT.GENITIVEFIO " +
      ", ENWARRANT.GENITIVEPOSITION " +
      ", ENWARRANT.PASSPORT " +
      ", ENWARRANT.ADDRESS " +
      ", ENWARRANT.POWER " +
      ", ENWARRANT.MAXSUM " +
     " FROM ENDAMAGERECOVERY " +
     ", ENDEPARTMENT " +
     ", ENDAMAGERECOVERYSTATUS " +
     ", ENWARRANT " +
     //" WHERE "
  "";
     whereStr = " ENDEPARTMENT.CODE = ENDAMAGERECOVERY.DEPARTMENTCODE" ; //+
      whereStr = whereStr +" AND ENDAMAGERECOVERYSTATUS.CODE = ENDAMAGERECOVERY.STATUSREFCODE" ; //+
      whereStr = whereStr +" AND ENWARRANT.CODE = ENDAMAGERECOVERY.WARRANTREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENDAMAGERECOVERY.CODE IN ( SELECT ENDAMAGERECOVERY.CODE FROM ENDAMAGERECOVERY ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.CODE = ?";
        }
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.NUMBERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.NUMBERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.DATEGEN = ?";
        }
         if (aFilterObject.FKcontractCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.FKcontractCode.indexOf('*',0) < 0 && aFilterObject.FKcontractCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.FKCONTRACTCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.FKCONTRACTCODE) LIKE UPPER(?)";
         }
         if (aFilterObject.FKpartnerCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.FKpartnerCode.indexOf('*',0) < 0 && aFilterObject.FKpartnerCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.FKPARTNERCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.FKPARTNERCODE) LIKE UPPER(?)";
         }
         if (aFilterObject.FKdocCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.FKdocCode.indexOf('*',0) < 0 && aFilterObject.FKdocCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.FKDOCCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.FKDOCCODE) LIKE UPPER(?)";
         }
        if(aFilterObject.FKdocID != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.FKDOCID = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.COMMENTGEN) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.CONTRAGENTNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.CONTRAGENTNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentAddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.CONTRAGENTADDRESS) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.CONTRAGENTADDRESS) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentPassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.CONTRAGENTPASSPORT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.CONTRAGENTPASSPORT) LIKE UPPER(?)";
         }
        if(aFilterObject.damageAmmount != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.DAMAGEAMMOUNT = ?";
        }
        if(aFilterObject.partId != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.PARTID = ?";
        }
        if(aFilterObject.datePosting != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.DATEPOSTING = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.DATEEDIT = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.MODIFY_TIME = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDAMAGERECOVERY.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDAMAGERECOVERY.STATUSREFCODE = ? ";
        }
        if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDAMAGERECOVERY.WARRANTREFCODE = ? ";
        }

      }

    
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDamageRecovery.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENDamageRecovery.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENDAMAGERECOVERY",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENDAMAGERECOVERY.DOMAIN_INFO IS NOT NULL";
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

           if(aFilterObject.numberGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numberGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }

           if(aFilterObject.FKcontractCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.FKcontractCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.FKpartnerCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.FKpartnerCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.FKdocCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.FKdocCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.FKdocID != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.FKdocID);
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

           if(aFilterObject.contragentName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentAddress != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentAddress);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentPassport != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentPassport);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.damageAmmount != null){
            number++;
            aFilterObject.damageAmmount = aFilterObject.damageAmmount.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.damageAmmount);
        }
         if(aFilterObject.partId != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.partId);
         }
        if(aFilterObject.datePosting != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.datePosting.getTime()));
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
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
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
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
       }
       if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.warrantRef.code);
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

        anObject = new ENDamageRecoveryShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.numberGen = set.getString(2);
        anObject.dateGen = set.getDate(3);
        anObject.FKcontractCode = set.getString(4);
        anObject.FKpartnerCode = set.getString(5);
        anObject.FKdocCode = set.getString(6);
        anObject.FKdocID = set.getInt(7);
        if ( set.wasNull() )
            anObject.FKdocID = Integer.MIN_VALUE;
        anObject.commentGen = set.getString(8);
        anObject.contragentName = set.getString(9);
        anObject.contragentAddress = set.getString(10);
        anObject.contragentPassport = set.getString(11);
        anObject.damageAmmount = set.getBigDecimal(12);
        if(anObject.damageAmmount != null)
            anObject.damageAmmount = anObject.damageAmmount.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.partId = set.getInt(13);
        if ( set.wasNull() )
            anObject.partId = Integer.MIN_VALUE;
        anObject.datePosting = set.getDate(14);
        anObject.userGen = set.getString(15);
        anObject.dateEdit = set.getDate(16);

        anObject.departmentCode = set.getInt(17);
    if(set.wasNull())
      anObject.departmentCode = Integer.MIN_VALUE;
        anObject.departmentShortName = set.getString(18);
        anObject.departmentDateStart = set.getDate(19);
        anObject.departmentDateFinal = set.getDate(20);
        anObject.departmentRenCode = set.getInt(21);
    if(set.wasNull())
      anObject.departmentRenCode = Integer.MIN_VALUE;
        anObject.departmentShpzBalans = set.getString(22);
        anObject.departmentKau_table_id_1884 = set.getInt(23);
    if(set.wasNull())
      anObject.departmentKau_table_id_1884 = Integer.MIN_VALUE;
        anObject.departmentKau_1884 = set.getString(24);
        anObject.departmentName_1884 = set.getString(25);
        anObject.statusRefCode = set.getInt(26);
    if(set.wasNull())
      anObject.statusRefCode = Integer.MIN_VALUE;
        anObject.statusRefName = set.getString(27);
        anObject.warrantRefCode = set.getInt(28);
    if(set.wasNull())
      anObject.warrantRefCode = Integer.MIN_VALUE;
        anObject.warrantRefNumbergen = set.getString(29);
        anObject.warrantRefName = set.getString(30);
        anObject.warrantRefWarrantFIO = set.getString(31);
        anObject.warrantRefWarrantShortFIO = set.getString(32);
        anObject.warrantRefWarrantPosition = set.getString(33);
        anObject.warrantRefGenitiveFIO = set.getString(34);
        anObject.warrantRefGenitivePosition = set.getString(35);
        anObject.warrantRefPassport = set.getString(36);
        anObject.warrantRefAddress = set.getString(37);
        anObject.warrantRefPower = set.getInt(38);
    if(set.wasNull())
      anObject.warrantRefPower = Integer.MIN_VALUE;
        anObject.warrantRefMaxSum = set.getBigDecimal(39);
        if(anObject.warrantRefMaxSum != null)
          anObject.warrantRefMaxSum = anObject.warrantRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

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

  public int[] getFilteredCodeArrayOLD(ENDamageRecovery aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDAMAGERECOVERY.CODE FROM ENDAMAGERECOVERY";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDAMAGERECOVERY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDamageRecovery.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENDamageRecovery.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENDAMAGERECOVERY",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENDAMAGERECOVERY.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.CODE = ?";
        }
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.DATEGEN = ?";
        }
         if (aFilterObject.FKcontractCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.FKcontractCode.indexOf('*',0) < 0 && aFilterObject.FKcontractCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.FKCONTRACTCODE = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.FKCONTRACTCODE LIKE ?";
         }
         if (aFilterObject.FKpartnerCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.FKpartnerCode.indexOf('*',0) < 0 && aFilterObject.FKpartnerCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.FKPARTNERCODE = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.FKPARTNERCODE LIKE ?";
         }
         if (aFilterObject.FKdocCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.FKdocCode.indexOf('*',0) < 0 && aFilterObject.FKdocCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.FKDOCCODE = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.FKDOCCODE LIKE ?";
         }
        if(aFilterObject.FKdocID != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.FKDOCID = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.contragentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTNAME = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTNAME LIKE ?";
         }
         if (aFilterObject.contragentAddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTADDRESS = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTADDRESS LIKE ?";
         }
         if (aFilterObject.contragentPassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTPASSPORT = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTPASSPORT LIKE ?";
         }
        if(aFilterObject.damageAmmount != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.DAMAGEAMMOUNT = ?";
        }
        if(aFilterObject.partId != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.PARTID = ?";
        }
        if(aFilterObject.datePosting != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.DATEPOSTING = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.DATEEDIT = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.MODIFY_TIME = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDAMAGERECOVERY.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDAMAGERECOVERY.STATUSREFCODE = ? ";
        }
        if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDAMAGERECOVERY.WARRANTREFCODE = ? ";
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
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.NUMBERGEN LIKE ?";

           if(aFilterObject.numberGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numberGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
         if (aFilterObject.FKcontractCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.FKcontractCode.indexOf('*',0) < 0 && aFilterObject.FKcontractCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.FKCONTRACTCODE = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.FKCONTRACTCODE LIKE ?";

           if(aFilterObject.FKcontractCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.FKcontractCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.FKpartnerCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.FKpartnerCode.indexOf('*',0) < 0 && aFilterObject.FKpartnerCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.FKPARTNERCODE = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.FKPARTNERCODE LIKE ?";

           if(aFilterObject.FKpartnerCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.FKpartnerCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.FKdocCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.FKdocCode.indexOf('*',0) < 0 && aFilterObject.FKdocCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.FKDOCCODE = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.FKDOCCODE LIKE ?";

           if(aFilterObject.FKdocCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.FKdocCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.FKdocID != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.FKdocID);
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.COMMENTGEN LIKE ?";

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
         if (aFilterObject.contragentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTNAME = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTNAME LIKE ?";

           if(aFilterObject.contragentName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentAddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTADDRESS = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTADDRESS LIKE ?";

           if(aFilterObject.contragentAddress != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentAddress);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentPassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTPASSPORT = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTPASSPORT LIKE ?";

           if(aFilterObject.contragentPassport != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentPassport);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.damageAmmount != null){
            number++;
            aFilterObject.damageAmmount = aFilterObject.damageAmmount.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.damageAmmount);
        }
         if(aFilterObject.partId != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.partId);
         }
        if(aFilterObject.datePosting != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.datePosting.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.USERGEN = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.USERGEN LIKE ?";

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
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
       }
       if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.warrantRef.code);
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

  public int[] getFilteredCodeArray(ENDamageRecoveryFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENDamageRecovery aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDAMAGERECOVERY.CODE FROM ENDAMAGERECOVERY";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDAMAGERECOVERY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDamageRecovery.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENDamageRecovery.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENDAMAGERECOVERY",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENDAMAGERECOVERY.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.CODE = ?";
        }
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.DATEGEN = ?";
        }
         if (aFilterObject.FKcontractCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.FKcontractCode.indexOf('*',0) < 0 && aFilterObject.FKcontractCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.FKCONTRACTCODE = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.FKCONTRACTCODE LIKE ?";
         }
         if (aFilterObject.FKpartnerCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.FKpartnerCode.indexOf('*',0) < 0 && aFilterObject.FKpartnerCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.FKPARTNERCODE = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.FKPARTNERCODE LIKE ?";
         }
         if (aFilterObject.FKdocCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.FKdocCode.indexOf('*',0) < 0 && aFilterObject.FKdocCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.FKDOCCODE = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.FKDOCCODE LIKE ?";
         }
        if(aFilterObject.FKdocID != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.FKDOCID = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.contragentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTNAME = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTNAME LIKE ?";
         }
         if (aFilterObject.contragentAddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTADDRESS = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTADDRESS LIKE ?";
         }
         if (aFilterObject.contragentPassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTPASSPORT = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTPASSPORT LIKE ?";
         }
        if(aFilterObject.damageAmmount != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.DAMAGEAMMOUNT = ?";
        }
        if(aFilterObject.partId != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.PARTID = ?";
        }
        if(aFilterObject.datePosting != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.DATEPOSTING = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.DATEEDIT = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDAMAGERECOVERY.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENDAMAGERECOVERY.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDAMAGERECOVERY.MODIFY_TIME = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDAMAGERECOVERY.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDAMAGERECOVERY.STATUSREFCODE = ? ";
        }
        if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDAMAGERECOVERY.WARRANTREFCODE = ? ";
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
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.NUMBERGEN LIKE ?";

           if(aFilterObject.numberGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numberGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
         if (aFilterObject.FKcontractCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.FKcontractCode.indexOf('*',0) < 0 && aFilterObject.FKcontractCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.FKCONTRACTCODE = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.FKCONTRACTCODE LIKE ?";

           if(aFilterObject.FKcontractCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.FKcontractCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.FKpartnerCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.FKpartnerCode.indexOf('*',0) < 0 && aFilterObject.FKpartnerCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.FKPARTNERCODE = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.FKPARTNERCODE LIKE ?";

           if(aFilterObject.FKpartnerCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.FKpartnerCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.FKdocCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.FKdocCode.indexOf('*',0) < 0 && aFilterObject.FKdocCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.FKDOCCODE = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.FKDOCCODE LIKE ?";

           if(aFilterObject.FKdocCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.FKdocCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.FKdocID != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.FKdocID);
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.COMMENTGEN LIKE ?";

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
         if (aFilterObject.contragentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTNAME = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTNAME LIKE ?";

           if(aFilterObject.contragentName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentAddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTADDRESS = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTADDRESS LIKE ?";

           if(aFilterObject.contragentAddress != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentAddress);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentPassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTPASSPORT = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTPASSPORT LIKE ?";

           if(aFilterObject.contragentPassport != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentPassport);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.damageAmmount != null){
            number++;
            aFilterObject.damageAmmount = aFilterObject.damageAmmount.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.damageAmmount);
        }
         if(aFilterObject.partId != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.partId);
         }
        if(aFilterObject.datePosting != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.datePosting.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.USERGEN = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.USERGEN LIKE ?";

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
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDAMAGERECOVERY.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENDAMAGERECOVERY.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
       }
       if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.warrantRef.code);
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


   public ENDamageRecovery getObject(int uid) throws PersistenceException
   {
    ENDamageRecovery result = new ENDamageRecovery();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENDamageRecovery anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDamageRecovery.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENDamageRecovery.getObject%} access denied");



    selectStr =
    "SELECT  ENDAMAGERECOVERY.CODE, ENDAMAGERECOVERY.NUMBERGEN, ENDAMAGERECOVERY.DATEGEN, ENDAMAGERECOVERY.FKCONTRACTCODE, ENDAMAGERECOVERY.FKPARTNERCODE, ENDAMAGERECOVERY.FKDOCCODE, ENDAMAGERECOVERY.FKDOCID, ENDAMAGERECOVERY.COMMENTGEN, ENDAMAGERECOVERY.CONTRAGENTNAME, ENDAMAGERECOVERY.CONTRAGENTADDRESS, ENDAMAGERECOVERY.CONTRAGENTPASSPORT, ENDAMAGERECOVERY.DAMAGEAMMOUNT, ENDAMAGERECOVERY.PARTID, ENDAMAGERECOVERY.DATEPOSTING, ENDAMAGERECOVERY.USERGEN, ENDAMAGERECOVERY.DATEEDIT, ENDAMAGERECOVERY.DOMAIN_INFO, ENDAMAGERECOVERY.MODIFY_TIME, ENDAMAGERECOVERY.DEPARTMENTCODE, ENDAMAGERECOVERY.STATUSREFCODE, ENDAMAGERECOVERY.WARRANTREFCODE "
    +" FROM ENDAMAGERECOVERY WHERE ENDAMAGERECOVERY.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENDAMAGERECOVERY",segregationInfo,getUserProfile().getDomainInfo());
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
        anObject.numberGen = set.getString(2);
        anObject.dateGen = set.getDate(3);
        anObject.FKcontractCode = set.getString(4);
        anObject.FKpartnerCode = set.getString(5);
        anObject.FKdocCode = set.getString(6);
        anObject.FKdocID = set.getInt(7);
        if ( set.wasNull() )
           anObject.FKdocID = Integer.MIN_VALUE;
        anObject.commentGen = set.getString(8);
        anObject.contragentName = set.getString(9);
        anObject.contragentAddress = set.getString(10);
        anObject.contragentPassport = set.getString(11);
        anObject.damageAmmount = set.getBigDecimal(12);
        if(anObject.damageAmmount != null)
            anObject.damageAmmount = anObject.damageAmmount.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.partId = set.getInt(13);
        if ( set.wasNull() )
           anObject.partId = Integer.MIN_VALUE;
        anObject.datePosting = set.getDate(14);
        anObject.userGen = set.getString(15);
        anObject.dateEdit = set.getDate(16);
        anObject.domain_info = set.getString(17);
        anObject.modify_time = set.getLong(18);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.department.code = set.getInt(19);
        if ( set.wasNull() )
            anObject.department.code = Integer.MIN_VALUE;
        anObject.statusRef.code = set.getInt(20);
        if ( set.wasNull() )
            anObject.statusRef.code = Integer.MIN_VALUE;
        anObject.warrantRef.code = set.getInt(21);
        if ( set.wasNull() )
            anObject.warrantRef.code = Integer.MIN_VALUE;
        if(anObject.department.code != Integer.MIN_VALUE)
        {
           anObject.setDepartment(
      new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.department.code));
    }
        if(anObject.statusRef.code != Integer.MIN_VALUE)
        {
           anObject.setStatusRef(
      new com.ksoe.energynet.dataminer.generated.ENDamageRecoveryStatusDAOGen(connection,getUserProfile()).getRef(anObject.statusRef.code));
    }
        if(anObject.warrantRef.code != Integer.MIN_VALUE)
        {
           anObject.setWarrantRef(
      new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).getRef(anObject.warrantRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENDamageRecoveryRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENDamageRecoveryRef ref = new com.ksoe.energynet.valueobject.references.ENDamageRecoveryRef();
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

    selectStr = "DELETE FROM  ENDAMAGERECOVERY WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENDamageRecovery object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENDamageRecovery.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENDamageRecovery.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENDamageRecovery.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDamageRecovery.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENDamageRecovery.getObject%} access denied");

    selectStr =

    "SELECT  ENDAMAGERECOVERY.CODE FROM  ENDAMAGERECOVERY WHERE  ENDAMAGERECOVERY.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENDAMAGERECOVERY",segregationInfo,getUserProfile().getDomainInfo());
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
    _checkConditionToken(condition,"code","ENDAMAGERECOVERY.CODE");
    _checkConditionToken(condition,"numbergen","ENDAMAGERECOVERY.NUMBERGEN");
    _checkConditionToken(condition,"dategen","ENDAMAGERECOVERY.DATEGEN");
    _checkConditionToken(condition,"fkcontractcode","ENDAMAGERECOVERY.FKCONTRACTCODE");
    _checkConditionToken(condition,"fkpartnercode","ENDAMAGERECOVERY.FKPARTNERCODE");
    _checkConditionToken(condition,"fkdoccode","ENDAMAGERECOVERY.FKDOCCODE");
    _checkConditionToken(condition,"fkdocid","ENDAMAGERECOVERY.FKDOCID");
    _checkConditionToken(condition,"commentgen","ENDAMAGERECOVERY.COMMENTGEN");
    _checkConditionToken(condition,"contragentname","ENDAMAGERECOVERY.CONTRAGENTNAME");
    _checkConditionToken(condition,"contragentaddress","ENDAMAGERECOVERY.CONTRAGENTADDRESS");
    _checkConditionToken(condition,"contragentpassport","ENDAMAGERECOVERY.CONTRAGENTPASSPORT");
    _checkConditionToken(condition,"damageammount","ENDAMAGERECOVERY.DAMAGEAMMOUNT");
    _checkConditionToken(condition,"partid","ENDAMAGERECOVERY.PARTID");
    _checkConditionToken(condition,"dateposting","ENDAMAGERECOVERY.DATEPOSTING");
    _checkConditionToken(condition,"usergen","ENDAMAGERECOVERY.USERGEN");
    _checkConditionToken(condition,"dateedit","ENDAMAGERECOVERY.DATEEDIT");
    _checkConditionToken(condition,"domain_info","ENDAMAGERECOVERY.DOMAIN_INFO");
    _checkConditionToken(condition,"modify_time","ENDAMAGERECOVERY.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"department","DEPARTMENTCODE");
    _checkConditionToken(condition,"department.code","DEPARTMENTCODE");
    _checkConditionToken(condition,"statusref","STATUSREFCODE");
    _checkConditionToken(condition,"statusref.code","STATUSREFCODE");
    _checkConditionToken(condition,"warrantref","WARRANTREFCODE");
    _checkConditionToken(condition,"warrantref.code","WARRANTREFCODE");
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

  private void _collectAutoIncrementFields(ENDamageRecovery anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENDAMAGERECOVERY", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENDAMAGERECOVERY", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENDAMAGERECOVERY", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENDAMAGERECOVERY");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENDamageRecoveryDAO
