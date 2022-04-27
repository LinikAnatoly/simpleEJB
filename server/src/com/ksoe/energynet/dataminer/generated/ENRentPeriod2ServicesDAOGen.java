
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

import com.ksoe.energynet.valueobject.ENRentPeriod2Services;
import com.ksoe.energynet.valueobject.filter.ENRentPeriod2ServicesFilter;
import com.ksoe.energynet.valueobject.brief.ENRentPeriod2ServicesShort;
import com.ksoe.energynet.valueobject.lists.ENRentPeriod2ServicesShortList;


/**
 * DAO Object for ENRentPeriod2Services;
 *
 */

public class ENRentPeriod2ServicesDAOGen extends GenericDataMiner {

   public ENRentPeriod2ServicesDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENRentPeriod2ServicesDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   protected boolean isEqual(ENRentPeriod2Services inObject) throws PersistenceException
   {
      ENRentPeriod2Services obj = new ENRentPeriod2Services();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.startDate == null && obj.startDate == null){}
	else
		if(inObject.startDate == null || obj.startDate == null) return false;
		else
			if ( ! inObject.startDate.equals(obj.startDate)){
				return false;
			}

	if(inObject.endDate == null && obj.endDate == null){}
	else
		if(inObject.endDate == null || obj.endDate == null) return false;
		else
			if ( ! inObject.endDate.equals(obj.endDate)){
				return false;
			}
     if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
        return false;
     }
     if (inObject.cottageRef.code != obj.cottageRef.code){
        return false;
     }
     if (inObject.statusRef.code != obj.statusRef.code){
        return false;
     }
      return true;
   }

   public int add(ENRentPeriod2Services anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENRentPeriod2Services anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENRENTPERIOD2SERVICES (CODE,STARTDATE,ENDDATE,SERVICESOBJECTREFCODE,COTTAGEREFCODE,STATUSREFCODE) VALUES (?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.startDate == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.startDate.getTime()));
      if (anObject.endDate == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.endDate.getTime()));
      if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENRentPeriod2Services.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
        statement.setInt(4,anObject.servicesObjectRef.code);
      }
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.cottageRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENCottageDAOGen(connection,getUserProfile()).exists(anObject.cottageRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENRentPeriod2Services.cottageRef.code%} = {%"+anObject.cottageRef.code+"%}");
        statement.setInt(5,anObject.cottageRef.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.statusRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENRentPeriodStatusDAOGen(connection,getUserProfile()).exists(anObject.statusRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENRentPeriod2Services.statusRef.code%} = {%"+anObject.statusRef.code+"%}");
        statement.setInt(6,anObject.statusRef.code);
      }
      else
        statement.setNull(6,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENRentPeriod2ServicesDAOGen.add%}",e);
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

   public void save(ENRentPeriod2Services anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENRentPeriod2Services anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;


      String selectStr;

      Vector fields = null;
      if(anAttributes != null)
       {
        String fieldNameStr;
        fields = new Vector();
        for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++)
         {
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("STARTDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ENDDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SERVICESOBJECTREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COTTAGEREF") == 0)
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
         }
       if(fields.size() == 0)
         return;
       }
      if(fields == null)
       {
        selectStr =
        "UPDATE ENRENTPERIOD2SERVICES SET  STARTDATE = ? , ENDDATE = ? , SERVICESOBJECTREFCODE = ? , COTTAGEREFCODE = ? , STATUSREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENRENTPERIOD2SERVICES SET ";
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
      if (anObject.startDate == null)
        statement.setDate(1,null);
      else
        statement.setDate(1,new java.sql.Date(anObject.startDate.getTime()));
      if (anObject.endDate == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.endDate.getTime()));
      if (anObject.servicesObjectRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.servicesObjectRef.code);
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.cottageRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.cottageRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.statusRef.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.statusRef.code);
      else
        statement.setNull(5,java.sql.Types.INTEGER);
          statement.setInt(6,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("STARTDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.startDate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.startDate.getTime()));
                continue;
             }
            if("ENDDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.endDate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.endDate.getTime()));
                continue;
             }
            if("SERVICESOBJECTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.servicesObjectRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.servicesObjectRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("COTTAGEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.cottageRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.cottageRef.code);
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

   } // end of save(ENRentPeriod2Services anObject,String[] anAttributes)


 public ENRentPeriod2ServicesShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENRentPeriod2Services filterObject = new ENRentPeriod2Services();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENRentPeriod2ServicesShort)list.get(0);
   return null;
  }

  public ENRentPeriod2ServicesShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENRentPeriod2ServicesShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENRentPeriod2ServicesShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENRentPeriod2ServicesShortList getFilteredList(ENRentPeriod2Services filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENRentPeriod2ServicesShortList getScrollableFilteredList(ENRentPeriod2Services aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENRentPeriod2ServicesShortList getScrollableFilteredList(ENRentPeriod2Services aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENRentPeriod2ServicesShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENRentPeriod2ServicesShortList getScrollableFilteredList(ENRentPeriod2ServicesFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENRentPeriod2ServicesShortList getScrollableFilteredList(ENRentPeriod2ServicesFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENRentPeriod2ServicesShortList getScrollableFilteredList(ENRentPeriod2Services aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENRentPeriod2ServicesShortList getScrollableFilteredList(ENRentPeriod2Services aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENRentPeriod2ServicesShortList result = new ENRentPeriod2ServicesShortList();
    ENRentPeriod2ServicesShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENRENTPERIOD2SERVICES.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENRENTPERIOD2SERVICES.CODE"+
     ",ENRENTPERIOD2SERVICES.STARTDATE"+
     ",ENRENTPERIOD2SERVICES.ENDDATE"+

      ", ENSERVICESOBJECT.CODE " +
      ", ENSERVICESOBJECT.CONTRACTNUMBER " +
      ", ENSERVICESOBJECT.CONTRACTDATE " +
      ", ENSERVICESOBJECT.NAME " +
      ", ENSERVICESOBJECT.PARTNERCODE " +
      ", ENSERVICESOBJECT.FINDOCCODE " +
      ", ENSERVICESOBJECT.FINDOCID " +
      ", ENSERVICESOBJECT.COMMENTGEN " +
      ", ENSERVICESOBJECT.CONTRACTNUMBERSERVICES " +
      ", ENSERVICESOBJECT.CONTRACTDATESERVICES " +
      ", ENSERVICESOBJECT.CONTRAGENTNAME " +
      ", ENSERVICESOBJECT.CONTRAGENTADDRESS " +
      ", ENSERVICESOBJECT.CONTRAGENTADDRESSWORK " +
      ", ENSERVICESOBJECT.CONTRAGENTOKPO " +
      ", ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT " +
      ", ENSERVICESOBJECT.CONTRAGENTBANKNAME " +
      ", ENSERVICESOBJECT.CONTRAGENTBANKMFO " +
      ", ENSERVICESOBJECT.CONTRAGENTBOSSNAME " +
      ", ENSERVICESOBJECT.CONTRAGENTPASSPORT " +
      ", ENSERVICESOBJECT.CONTRACTSERVICESSUMMA " +
      ", ENSERVICESOBJECT.CONTRACTSERVICESPOWER " +
      ", ENSERVICESOBJECT.COMMENTSERVICESGEN " +
      ", ENSERVICESOBJECT.CONTRACTSERVICESDISTNC " +
      ", ENSERVICESOBJECT.CONTRACTSERVICESDAY " +
      ", ENSERVICESOBJECT.USERGEN " +
      ", ENSERVICESOBJECT.DATEEDIT " +
      ", ENSERVICESOBJECT.WARRANTDATE " +
      ", ENSERVICESOBJECT.WARRANTNUMBER " +
      ", ENSERVICESOBJECT.WARRANTFIO " +
      ", ENSERVICESOBJECT.REGIONALTYPE " +
      ", ENSERVICESOBJECT.BASISTYPE " +
      ", ENSERVICESOBJECT.CONTRAGENTPOSITION " +
      ", ENSERVICESOBJECT.EXECUTEWORKDATE " +
      ", ENSERVICESOBJECT.TIMESTART " +
      ", ENSERVICESOBJECT.TIMEFINAL " +
      ", ENSERVICESOBJECT.CONTRAGENTPHONENUMBER " +
      ", ENSERVICESOBJECT.EXECUTORPHONENUMBER " +
      ", ENSERVICESOBJECT.CONTRAGENTOBJECTWORK " +
      ", ENSERVICESOBJECT.ISNOPAY " +
      ", ENSERVICESOBJECT.ISCUSTOMERMATERIALS " +
      ", ENSERVICESOBJECT.PAYDATE " +
      ", ENSERVICESOBJECT.FINPAYFORMCODE " +
      ", ENSERVICESOBJECT.FINPAYFORMNAME " +
      ", ENSERVICESOBJECT.PARTNERID " +
      ", ENSERVICESOBJECT.PAYDETAIL " +
      ", ENSERVICESOBJECT.ACTTRANSFERNUMBER " +
      ", ENSERVICESOBJECT.ACTTRANSFERDATE " +
      ", ENSERVICESOBJECT.RESPOSIBLE " +
      ", ENSERVICESOBJECT.RESPOSIBLEPOSITION " +
      ", ENSERVICESOBJECT.RESPOSIBLETABNUMBER " +
      ", ENSERVICESOBJECT.PREVCONTRACTSTATUS " +
      ", ENSERVICESOBJECT.RECONNECTIONTU " +
      ", ENSERVICESOBJECT.PERSONALACCOUNTCODE " +
      ", ENSERVICESOBJECT.PERSONALACCOUNTNUMBER " +
      ", ENSERVICESOBJECT.TABNUMBER " +
      ", ENSERVICESOBJECT.CNPACKCODE " +
      ", ENSERVICESOBJECT.DFPACKCODE " +
      ", ENSERVICESOBJECT.COUNTERSZONETYPE " +
      ", ENCOTTAGE.CODE " +
      ", ENCOTTAGE.NUMBERGEN " +
      ", ENCOTTAGE.NUMBERBEDS " +
      ", ENCOTTAGE.DESCRIPTION " +
      ", ENCOTTAGE.COMMENTGEN " +
      ", ENCOTTAGE.USERGEN " +
      ", ENCOTTAGE.DATEEDIT " +
      ", ENRENTPERIODSTATUS.CODE " +
      ", ENRENTPERIODSTATUS.NAME " +
     " FROM ENRENTPERIOD2SERVICES " +
     ", ENSERVICESOBJECT " +
     ", ENCOTTAGE " +
     ", ENRENTPERIODSTATUS " +
     //" WHERE "
  "";
     whereStr = " ENSERVICESOBJECT.CODE = ENRENTPERIOD2SERVICES.SERVICESOBJECTREFCODE" ; //+
      whereStr = whereStr +" AND ENCOTTAGE.CODE = ENRENTPERIOD2SERVICES.COTTAGEREFCODE" ; //+
      whereStr = whereStr +" AND ENRENTPERIODSTATUS.CODE = ENRENTPERIOD2SERVICES.STATUSREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENRENTPERIOD2SERVICES.CODE IN ( SELECT ENRENTPERIOD2SERVICES.CODE FROM ENRENTPERIOD2SERVICES ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRENTPERIOD2SERVICES.CODE = ?";
        }
        if(aFilterObject.startDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRENTPERIOD2SERVICES.STARTDATE = ?";
        }
        if(aFilterObject.endDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRENTPERIOD2SERVICES.ENDDATE = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENRENTPERIOD2SERVICES.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.cottageRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENRENTPERIOD2SERVICES.COTTAGEREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENRENTPERIOD2SERVICES.STATUSREFCODE = ? ";
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
        if(aFilterObject.startDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.startDate.getTime()));
        }
        if(aFilterObject.endDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.endDate.getTime()));
        }
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.cottageRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cottageRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
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

        anObject = new ENRentPeriod2ServicesShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.startDate = set.getDate(2);
        anObject.endDate = set.getDate(3);

        anObject.servicesObjectRefCode = set.getInt(4);
    if(set.wasNull())
      anObject.servicesObjectRefCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefContractNumber = set.getString(5);
        anObject.servicesObjectRefContractDate = set.getDate(6);
        anObject.servicesObjectRefName = set.getString(7);
        anObject.servicesObjectRefPartnerCode = set.getString(8);
        anObject.servicesObjectRefFinDocCode = set.getString(9);
        anObject.servicesObjectRefFinDocID = set.getInt(10);
    if(set.wasNull())
      anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
        anObject.servicesObjectRefCommentGen = set.getString(11);
        anObject.servicesObjectRefContractNumberServices = set.getString(12);
        anObject.servicesObjectRefContractDateServices = set.getDate(13);
        anObject.servicesObjectRefContragentName = set.getString(14);
        anObject.servicesObjectRefContragentAddress = set.getString(15);
        anObject.servicesObjectRefContragentAddressWork = set.getString(16);
        anObject.servicesObjectRefContragentOkpo = set.getString(17);
        anObject.servicesObjectRefContragentBankAccount = set.getString(18);
        anObject.servicesObjectRefContragentBankName = set.getString(19);
        anObject.servicesObjectRefContragentBankMfo = set.getString(20);
        anObject.servicesObjectRefContragentBossName = set.getString(21);
        anObject.servicesObjectRefContragentPassport = set.getString(22);
        anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(23);
        if(anObject.servicesObjectRefContractServicesSumma != null)
          anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(24);
        if(anObject.servicesObjectRefContractServicesPower != null)
          anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefCommentServicesGen = set.getString(25);
        anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(26);
        if(anObject.servicesObjectRefContractServicesDistance != null)
          anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(27);
        if(anObject.servicesObjectRefContractServicesDay != null)
          anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefUserGen = set.getString(28);
        anObject.servicesObjectRefDateEdit = set.getDate(29);
        anObject.servicesObjectRefWarrantDate = set.getDate(30);
        anObject.servicesObjectRefWarrantNumber = set.getString(31);
        anObject.servicesObjectRefWarrantFIO = set.getString(32);
        anObject.servicesObjectRefRegionalType = set.getInt(33);
    if(set.wasNull())
      anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
        anObject.servicesObjectRefBasisType = set.getBigDecimal(34);
        if(anObject.servicesObjectRefBasisType != null)
          anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContragentPosition = set.getString(35);
        anObject.servicesObjectRefExecuteWorkDate = set.getDate(36);
        anObject.servicesObjectRefTimeStart = set.getTimestamp(37);
        anObject.servicesObjectRefTimeFinal = set.getTimestamp(38);
        anObject.servicesObjectRefContragentPhoneNumber = set.getString(39);
        anObject.servicesObjectRefExecutorPhoneNumber = set.getString(40);
        anObject.servicesObjectRefContragentObjectWork = set.getString(41);
        anObject.servicesObjectRefIsNoPay = set.getInt(42);
    if(set.wasNull())
      anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
        anObject.servicesObjectRefIsCustomerMaterials = set.getInt(43);
    if(set.wasNull())
      anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
        anObject.servicesObjectRefPayDate = set.getDate(44);
        anObject.servicesObjectRefFinPayFormCode = set.getInt(45);
    if(set.wasNull())
      anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefFinPayFormName = set.getString(46);
        anObject.servicesObjectRefPartnerId = set.getInt(47);
    if(set.wasNull())
      anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
        anObject.servicesObjectRefPayDetail = set.getString(48);
        anObject.servicesObjectRefActTransferNumber = set.getString(49);
        anObject.servicesObjectRefActTransferDate = set.getDate(50);
        anObject.servicesObjectRefResposible = set.getString(51);
        anObject.servicesObjectRefResposiblePosition = set.getString(52);
        anObject.servicesObjectRefResposibleTabNumber = set.getString(53);
        anObject.servicesObjectRefPrevContractStatus = set.getInt(54);
    if(set.wasNull())
      anObject.servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
        anObject.servicesObjectRefReconnectionTU = set.getInt(55);
    if(set.wasNull())
      anObject.servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
        anObject.servicesObjectRefPersonalAccountCode = set.getInt(56);
    if(set.wasNull())
      anObject.servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefPersonalAccountNumber = set.getString(57);
        anObject.servicesObjectRefTabNumber = set.getString(58);
        anObject.servicesObjectRefCnPackCode = set.getInt(59);
    if(set.wasNull())
      anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefDfPackCode = set.getInt(60);
    if(set.wasNull())
      anObject.servicesObjectRefDfPackCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefCountersZoneType = set.getInt(61);
    if(set.wasNull())
      anObject.servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
        anObject.cottageRefCode = set.getInt(62);
    if(set.wasNull())
      anObject.cottageRefCode = Integer.MIN_VALUE;
        anObject.cottageRefNumberGen = set.getString(63);
        anObject.cottageRefNumberBeds = set.getInt(64);
    if(set.wasNull())
      anObject.cottageRefNumberBeds = Integer.MIN_VALUE;
        anObject.cottageRefDescription = set.getString(65);
        anObject.cottageRefCommentgen = set.getString(66);
        anObject.cottageRefUserGen = set.getString(67);
        anObject.cottageRefDateEdit = set.getTimestamp(68);
        anObject.statusRefCode = set.getInt(69);
    if(set.wasNull())
      anObject.statusRefCode = Integer.MIN_VALUE;
        anObject.statusRefName = set.getString(70);

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

  public int[] getFilteredCodeArrayOLD(ENRentPeriod2Services aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENRENTPERIOD2SERVICES.CODE FROM ENRENTPERIOD2SERVICES";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENRENTPERIOD2SERVICES.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRENTPERIOD2SERVICES.CODE = ?";
        }
        if(aFilterObject.startDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRENTPERIOD2SERVICES.STARTDATE = ?";
        }
        if(aFilterObject.endDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRENTPERIOD2SERVICES.ENDDATE = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRENTPERIOD2SERVICES.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.cottageRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRENTPERIOD2SERVICES.COTTAGEREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRENTPERIOD2SERVICES.STATUSREFCODE = ? ";
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
        if(aFilterObject.startDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.startDate.getTime()));
        }
        if(aFilterObject.endDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.endDate.getTime()));
        }
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.cottageRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cottageRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
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

  public int[] getFilteredCodeArray(ENRentPeriod2ServicesFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENRentPeriod2Services aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENRENTPERIOD2SERVICES.CODE FROM ENRENTPERIOD2SERVICES";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENRENTPERIOD2SERVICES.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRENTPERIOD2SERVICES.CODE = ?";
        }
        if(aFilterObject.startDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRENTPERIOD2SERVICES.STARTDATE = ?";
        }
        if(aFilterObject.endDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRENTPERIOD2SERVICES.ENDDATE = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRENTPERIOD2SERVICES.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.cottageRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRENTPERIOD2SERVICES.COTTAGEREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRENTPERIOD2SERVICES.STATUSREFCODE = ? ";
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
        if(aFilterObject.startDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.startDate.getTime()));
        }
        if(aFilterObject.endDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.endDate.getTime()));
        }
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.cottageRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cottageRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
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


   public ENRentPeriod2Services getObject(int uid) throws PersistenceException
   {
    ENRentPeriod2Services result = new ENRentPeriod2Services();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENRentPeriod2Services anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENRENTPERIOD2SERVICES.CODE, ENRENTPERIOD2SERVICES.STARTDATE, ENRENTPERIOD2SERVICES.ENDDATE, ENRENTPERIOD2SERVICES.SERVICESOBJECTREFCODE, ENRENTPERIOD2SERVICES.COTTAGEREFCODE, ENRENTPERIOD2SERVICES.STATUSREFCODE "
    +" FROM ENRENTPERIOD2SERVICES WHERE ENRENTPERIOD2SERVICES.CODE = ?";

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
        anObject.startDate = set.getDate(2);
        anObject.endDate = set.getDate(3);
        anObject.servicesObjectRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.servicesObjectRef.code = Integer.MIN_VALUE;
        anObject.cottageRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.cottageRef.code = Integer.MIN_VALUE;
        anObject.statusRef.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.statusRef.code = Integer.MIN_VALUE;
        if(anObject.servicesObjectRef.code != Integer.MIN_VALUE)
        {
           anObject.setServicesObjectRef(
      new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.servicesObjectRef.code));
    }
        if(anObject.cottageRef.code != Integer.MIN_VALUE)
        {
           anObject.setCottageRef(
      new com.ksoe.energynet.dataminer.generated.ENCottageDAOGen(connection,getUserProfile()).getRef(anObject.cottageRef.code));
    }
        if(anObject.statusRef.code != Integer.MIN_VALUE)
        {
           anObject.setStatusRef(
      new com.ksoe.energynet.dataminer.generated.ENRentPeriodStatusDAOGen(connection,getUserProfile()).getRef(anObject.statusRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENRentPeriod2ServicesRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENRentPeriod2ServicesRef ref = new com.ksoe.energynet.valueobject.references.ENRentPeriod2ServicesRef();
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

    selectStr = "DELETE FROM  ENRENTPERIOD2SERVICES WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENRentPeriod2Services object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENRentPeriod2Services.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENRentPeriod2Services.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENRentPeriod2Services.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRentPeriod2Services.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENRentPeriod2Services.getObject%} access denied");

    selectStr =

    "SELECT  ENRENTPERIOD2SERVICES.CODE FROM  ENRENTPERIOD2SERVICES WHERE  ENRENTPERIOD2SERVICES.CODE = ?";
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
    _checkConditionToken(condition,"code","ENRENTPERIOD2SERVICES.CODE");
    _checkConditionToken(condition,"startdate","ENRENTPERIOD2SERVICES.STARTDATE");
    _checkConditionToken(condition,"enddate","ENRENTPERIOD2SERVICES.ENDDATE");
      // relationship conditions
    _checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
    _checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
    _checkConditionToken(condition,"cottageref","COTTAGEREFCODE");
    _checkConditionToken(condition,"cottageref.code","COTTAGEREFCODE");
    _checkConditionToken(condition,"statusref","STATUSREFCODE");
    _checkConditionToken(condition,"statusref.code","STATUSREFCODE");
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

  private void _collectAutoIncrementFields(ENRentPeriod2Services anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENRENTPERIOD2SERVICES", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENRENTPERIOD2SERVICES", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENRENTPERIOD2SERVICES", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENRENTPERIOD2SERVICES");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENRentPeriod2ServicesDAO
