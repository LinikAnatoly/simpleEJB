
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.valueobject.ENServicesObject2TechCondtnsServices;
import com.ksoe.energynet.valueobject.brief.ENServicesObject2TechCondtnsServicesShort;
import com.ksoe.energynet.valueobject.filter.ENServicesObject2TechCondtnsServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesObject2TechCondtnsServicesShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


  /**
  *  DAO Generated for ENServicesObject2TechCondtnsServices;
  *
  */

public class ENServicesObject2TechCondtnsServicesDAOGen extends GenericDataMiner {

  public ENServicesObject2TechCondtnsServicesDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENServicesObject2TechCondtnsServicesDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENServicesObject2TechCondtnsServices inObject) throws PersistenceException
   {
      ENServicesObject2TechCondtnsServices obj = new ENServicesObject2TechCondtnsServices();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.techCondServRef.code != obj.techCondServRef.code){
        return false;
     }
     if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
        return false;
     }
      return true;
   }

   public int add(ENServicesObject2TechCondtnsServices anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENServicesObject2TechCondtnsServices anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENSERVICESOBJECT2TECHCONDTNSSERVICES (CODE,TECHCONDSERVREFCODE,SERVICESOBJECTREFCODE) VALUES (?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.techCondServRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesDAOGen(connection,getUserProfile()).exists(anObject.techCondServRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENServicesObject2TechCondtnsServices.techCondServRef.code%} = {%"+anObject.techCondServRef.code+"%}");
        statement.setInt(2,anObject.techCondServRef.code);
      }
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENServicesObject2TechCondtnsServices.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
        statement.setInt(3,anObject.servicesObjectRef.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);

      statement.execute();
      return anObject.code;
     }
    catch(SQLException e)
     {
           _sequenceTable.clear();
           EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
      return Integer.MIN_VALUE;
     }
        catch(Exception e)
     {
      _sequenceTable.clear();
      throw new PersistenceException("Error in method {%ENServicesObject2TechCondtnsServicesDAOGen.add%}",e);
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

   public void save(ENServicesObject2TechCondtnsServices anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENServicesObject2TechCondtnsServices anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("TECHCONDSERVREF") == 0)
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
         }
       if(fields.size() == 0)
         return;
       }
      if(fields == null)
       {
        selectStr =
        "UPDATE ENSERVICESOBJECT2TECHCONDTNSSERVICES SET TECHCONDSERVREFCODE = ? , SERVICESOBJECTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENSERVICESOBJECT2TECHCONDTNSSERVICES SET ";
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
      if (anObject.techCondServRef.code != Integer.MIN_VALUE)
        statement.setInt(1,anObject.techCondServRef.code);
      else
        statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.servicesObjectRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.servicesObjectRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
          statement.setInt(3,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("TECHCONDSERVREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.techCondServRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.techCondServRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
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
            }
         statement.setInt(fields.size(),anObject.code);
         }

        statement.execute();
       }
      catch(SQLException e)
       {
        System.out.println(e.getMessage()+"\nstatement - "+selectStr);
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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

   } // end of save(ENServicesObject2TechCondtnsServices anObject,String[] anAttributes)


 public ENServicesObject2TechCondtnsServicesShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENServicesObject2TechCondtnsServices filterObject = new ENServicesObject2TechCondtnsServices();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENServicesObject2TechCondtnsServicesShort)list.get(0);
   return null;
  }

  public ENServicesObject2TechCondtnsServicesShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENServicesObject2TechCondtnsServicesShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENServicesObject2TechCondtnsServicesShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENServicesObject2TechCondtnsServicesShortList getFilteredList(ENServicesObject2TechCondtnsServices filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENServicesObject2TechCondtnsServicesShortList getScrollableFilteredList(ENServicesObject2TechCondtnsServices aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENServicesObject2TechCondtnsServicesShortList getScrollableFilteredList(ENServicesObject2TechCondtnsServices aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENServicesObject2TechCondtnsServicesShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENServicesObject2TechCondtnsServicesShortList getScrollableFilteredList(ENServicesObject2TechCondtnsServicesFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENServicesObject2TechCondtnsServicesShortList getScrollableFilteredList(ENServicesObject2TechCondtnsServicesFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENServicesObject2TechCondtnsServicesShortList getScrollableFilteredList(ENServicesObject2TechCondtnsServices aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENServicesObject2TechCondtnsServicesShortList getScrollableFilteredList(ENServicesObject2TechCondtnsServices aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENServicesObject2TechCondtnsServicesShortList result = new ENServicesObject2TechCondtnsServicesShortList();
    ENServicesObject2TechCondtnsServicesShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE"+

      ", ENTECHCONDITIONSSERVICES.CODE " +
      ", ENTECHCONDITIONSSERVICES.CONTRACTNUMBER " +
      ", ENTECHCONDITIONSSERVICES.CONTRACTDATE " +
      ", ENTECHCONDITIONSSERVICES.FINCONTRACTNUMBER " +
      ", ENTECHCONDITIONSSERVICES.FINCONTRACTDATE " +
      ", ENTECHCONDITIONSSERVICES.PARTNERNAME " +
      ", ENTECHCONDITIONSSERVICES.PARTNERCODE " +
      ", ENTECHCONDITIONSSERVICES.FINDOCCODE " +
      ", ENTECHCONDITIONSSERVICES.FINDOCID " +
      ", ENTECHCONDITIONSSERVICES.FINCOMMENTGEN " +
      ", ENTECHCONDITIONSSERVICES.TYSUMMAGEN " +
      ", ENTECHCONDITIONSSERVICES.TYSUMMAVAT " +
      ", ENTECHCONDITIONSSERVICES.TYSERVICESSUMMA " +
      ", ENTECHCONDITIONSSERVICES.TYSERVICESPOWER " +
      ", ENTECHCONDITIONSSERVICES.COMMENTSERVICESGEN " +
      ", ENTECHCONDITIONSSERVICES.USERGEN " +
      ", ENTECHCONDITIONSSERVICES.DATEEDIT " +
      ", ENTECHCONDITIONSSERVICES.CNPACKCODE " +
      ", ENTECHCONDITIONSSERVICES.EXECUTIONTERM " +
      ", ENTECHCONDITIONSSERVICES.BUILDERSAREA " +
      ", ENTECHCONDITIONSSERVICES.CONTRACTDATEFINAL " +
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
      ", ENSERVICESOBJECT.CONTRACTSERVICESDISTANCE " +
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
      ", ENSERVICESOBJECT.CNPACKCODE " +
     " FROM ENSERVICESOBJECT2TECHCONDTNSSERVICES " +
     ", ENTECHCONDITIONSSERVICES " +
     ", ENSERVICESOBJECT " +
     //" WHERE "
  "";
     whereStr = " ENTECHCONDITIONSSERVICES.CODE = ENSERVICESOBJECT2TECHCONDTNSSERVICES.TECHCONDSERVREFCODE" ; //+
      whereStr = whereStr +" AND ENSERVICESOBJECT.CODE = ENSERVICESOBJECT2TECHCONDTNSSERVICES.SERVICESOBJECTREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE IN ( SELECT ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE FROM ENSERVICESOBJECT2TECHCONDTNSSERVICES ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE = ?";
        }
        if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSERVICESOBJECT2TECHCONDTNSSERVICES.TECHCONDSERVREFCODE = ? ";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSERVICESOBJECT2TECHCONDTNSSERVICES.SERVICESOBJECTREFCODE = ? ";
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

    try
     {
      statement = connection.prepareStatement(selectStr);
      int number = 0;
      if(aFilterObject != null){
         if(aFilterObject.code != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.code);
         }
       if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServRef.code);
       }
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
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

        anObject = new ENServicesObject2TechCondtnsServicesShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.techCondServRefCode = set.getInt(2);
    if(set.wasNull())
      anObject.techCondServRefCode = Integer.MIN_VALUE;
        anObject.techCondServRefContractNumber = set.getString(3);
        anObject.techCondServRefContractDate = set.getDate(4);
        anObject.techCondServRefFinContractNumber = set.getString(5);
        anObject.techCondServRefFinContractDate = set.getDate(6);
        anObject.techCondServRefPartnerName = set.getString(7);
        anObject.techCondServRefPartnerCode = set.getString(8);
        anObject.techCondServRefFinDocCode = set.getString(9);
        anObject.techCondServRefFinDocID = set.getInt(10);
    if(set.wasNull())
      anObject.techCondServRefFinDocID = Integer.MIN_VALUE;
        anObject.techCondServRefFinCommentGen = set.getString(11);
        anObject.techCondServRefTySummaGen = set.getBigDecimal(12);
        if(anObject.techCondServRefTySummaGen != null)
          anObject.techCondServRefTySummaGen = anObject.techCondServRefTySummaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServRefTySummaVat = set.getBigDecimal(13);
        if(anObject.techCondServRefTySummaVat != null)
          anObject.techCondServRefTySummaVat = anObject.techCondServRefTySummaVat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServRefTyServicesSumma = set.getBigDecimal(14);
        if(anObject.techCondServRefTyServicesSumma != null)
          anObject.techCondServRefTyServicesSumma = anObject.techCondServRefTyServicesSumma.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServRefTyServicesPower = set.getBigDecimal(15);
        if(anObject.techCondServRefTyServicesPower != null)
          anObject.techCondServRefTyServicesPower = anObject.techCondServRefTyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServRefCommentServicesGen = set.getString(16);
        anObject.techCondServRefUserGen = set.getString(17);
        anObject.techCondServRefDateEdit = set.getDate(18);
        anObject.techCondServRefCnPackCode = set.getInt(19);
    if(set.wasNull())
      anObject.techCondServRefCnPackCode = Integer.MIN_VALUE;
        anObject.techCondServRefExecutionTerm = set.getString(20);
        anObject.techCondServRefBuildersArea = set.getInt(21);
    if(set.wasNull())
      anObject.techCondServRefBuildersArea = Integer.MIN_VALUE;
        anObject.techCondServRefContractDateFinal = set.getDate(22);
        anObject.servicesObjectRefCode = set.getInt(23);
    if(set.wasNull())
      anObject.servicesObjectRefCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefContractNumber = set.getString(24);
        anObject.servicesObjectRefContractDate = set.getDate(25);
        anObject.servicesObjectRefName = set.getString(26);
        anObject.servicesObjectRefPartnerCode = set.getString(27);
        anObject.servicesObjectRefFinDocCode = set.getString(28);
        anObject.servicesObjectRefFinDocID = set.getInt(29);
    if(set.wasNull())
      anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
        anObject.servicesObjectRefCommentGen = set.getString(30);
        anObject.servicesObjectRefContractNumberServices = set.getString(31);
        anObject.servicesObjectRefContractDateServices = set.getDate(32);
        anObject.servicesObjectRefContragentName = set.getString(33);
        anObject.servicesObjectRefContragentAddress = set.getString(34);
        anObject.servicesObjectRefContragentAddressWork = set.getString(35);
        anObject.servicesObjectRefContragentOkpo = set.getString(36);
        anObject.servicesObjectRefContragentBankAccount = set.getString(37);
        anObject.servicesObjectRefContragentBankName = set.getString(38);
        anObject.servicesObjectRefContragentBankMfo = set.getString(39);
        anObject.servicesObjectRefContragentBossName = set.getString(40);
        anObject.servicesObjectRefContragentPassport = set.getString(41);
        anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(42);
        if(anObject.servicesObjectRefContractServicesSumma != null)
          anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(43);
        if(anObject.servicesObjectRefContractServicesPower != null)
          anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefCommentServicesGen = set.getString(44);
        anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(45);
        if(anObject.servicesObjectRefContractServicesDistance != null)
          anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(46);
        if(anObject.servicesObjectRefContractServicesDay != null)
          anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefUserGen = set.getString(47);
        anObject.servicesObjectRefDateEdit = set.getDate(48);
        anObject.servicesObjectRefWarrantDate = set.getDate(49);
        anObject.servicesObjectRefWarrantNumber = set.getString(50);
        anObject.servicesObjectRefWarrantFIO = set.getString(51);
        anObject.servicesObjectRefRegionalType = set.getInt(52);
    if(set.wasNull())
      anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
        anObject.servicesObjectRefBasisType = set.getBigDecimal(53);
        if(anObject.servicesObjectRefBasisType != null)
          anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContragentPosition = set.getString(54);
        anObject.servicesObjectRefExecuteWorkDate = set.getDate(55);
        anObject.servicesObjectRefTimeStart = set.getTimestamp(56);
        anObject.servicesObjectRefTimeFinal = set.getTimestamp(57);
        anObject.servicesObjectRefContragentPhoneNumber = set.getString(58);
        anObject.servicesObjectRefExecutorPhoneNumber = set.getString(59);
        anObject.servicesObjectRefContragentObjectWork = set.getString(60);
        anObject.servicesObjectRefIsNoPay = set.getInt(61);
    if(set.wasNull())
      anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
        anObject.servicesObjectRefIsCustomerMaterials = set.getInt(62);
    if(set.wasNull())
      anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
        anObject.servicesObjectRefPayDate = set.getDate(63);
        anObject.servicesObjectRefFinPayFormCode = set.getInt(64);
    if(set.wasNull())
      anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefFinPayFormName = set.getString(65);
        anObject.servicesObjectRefPartnerId = set.getInt(66);
    if(set.wasNull())
      anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
        anObject.servicesObjectRefPayDetail = set.getString(67);
        anObject.servicesObjectRefActTransferNumber = set.getString(68);
        anObject.servicesObjectRefActTransferDate = set.getDate(69);
        anObject.servicesObjectRefResposible = set.getString(70);
        anObject.servicesObjectRefResposiblePosition = set.getString(71);
        anObject.servicesObjectRefResposibleTabNumber = set.getString(72);
        anObject.servicesObjectRefCnPackCode = set.getInt(73);
    if(set.wasNull())
      anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;

         result.list.add(anObject);
       }

      result.setTotalCount(i);
      return result;
     }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
      return null;
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

  public int[] getFilteredCodeArrayOLD(ENServicesObject2TechCondtnsServices aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE FROM ENSERVICESOBJECT2TECHCONDTNSSERVICES";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE = ?";
        }
        if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSERVICESOBJECT2TECHCONDTNSSERVICES.TECHCONDSERVREFCODE = ? ";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSERVICESOBJECT2TECHCONDTNSSERVICES.SERVICESOBJECTREFCODE = ? ";
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
       if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServRef.code);
       }
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
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
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
      return null;
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

  public int[] getFilteredCodeArray(ENServicesObject2TechCondtnsServicesFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENServicesObject2TechCondtnsServices aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE FROM ENSERVICESOBJECT2TECHCONDTNSSERVICES";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE = ?";
        }
        if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSERVICESOBJECT2TECHCONDTNSSERVICES.TECHCONDSERVREFCODE = ? ";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSERVICESOBJECT2TECHCONDTNSSERVICES.SERVICESOBJECTREFCODE = ? ";
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
       if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServRef.code);
       }
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
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
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
      return null;
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


   public ENServicesObject2TechCondtnsServices getObject(int uid) throws PersistenceException
   {
    ENServicesObject2TechCondtnsServices result = new ENServicesObject2TechCondtnsServices();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENServicesObject2TechCondtnsServices anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE, ENSERVICESOBJECT2TECHCONDTNSSERVICES.TECHCONDSERVREFCODE, ENSERVICESOBJECT2TECHCONDTNSSERVICES.SERVICESOBJECTREFCODE "
    +" FROM ENSERVICESOBJECT2TECHCONDTNSSERVICES WHERE ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE = ?";

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
        anObject.techCondServRef.code = set.getInt(2);
        if ( set.wasNull() )
            anObject.techCondServRef.code = Integer.MIN_VALUE;
        anObject.servicesObjectRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.servicesObjectRef.code = Integer.MIN_VALUE;
        if(anObject.techCondServRef.code != Integer.MIN_VALUE)
        {
           anObject.setTechCondServRef(
      new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesDAOGen(connection,getUserProfile()).getRef(anObject.techCondServRef.code));
    }
        if(anObject.servicesObjectRef.code != Integer.MIN_VALUE)
        {
           anObject.setServicesObjectRef(
      new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.servicesObjectRef.code));
    }
      }
    }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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


  public com.ksoe.energynet.valueobject.references.ENServicesObject2TechCondtnsServicesRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENServicesObject2TechCondtnsServicesRef ref = new com.ksoe.energynet.valueobject.references.ENServicesObject2TechCondtnsServicesRef();
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

    selectStr = "DELETE FROM  ENSERVICESOBJECT2TECHCONDTNSSERVICES WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENServicesObject2TechCondtnsServices object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENServicesObject2TechCondtnsServices.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesObject2TechCondtnsServices.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENServicesObject2TechCondtnsServices.remove%} access denied");

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
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesObject2TechCondtnsServices.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENServicesObject2TechCondtnsServices.getObject%} access denied");

    selectStr =

    "SELECT  ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE FROM  ENSERVICESOBJECT2TECHCONDTNSSERVICES WHERE  ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE = ?";
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
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
      return false;
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
    _checkConditionToken(condition,"code","ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE");
      // relationship conditions
    _checkConditionToken(condition,"techcondservref","TECHCONDSERVREFCODE");
    _checkConditionToken(condition,"techcondservref.code","TECHCONDSERVREFCODE");
    _checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
    _checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
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
    catch (NamingException e) {throw new EnergyproSystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
    catch (SQLException e)    {throw new EnergyproSystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
   }


   ///////////// PRIVATE SECTION ///////////////
   protected static Hashtable _sequenceTable = new Hashtable();

   private void _collectAutoIncrementFields(ENServicesObject2TechCondtnsServices anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENSERVICESOBJECT2TECHCONDTNSSERVICES", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENSERVICESOBJECT2TECHCONDTNSSERVICES", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENSERVICESOBJECT2TECHCONDTNSSERVICES", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENSERVICESOBJECT2TECHCONDTNSSERVICES");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENServicesObject2TechCondtnsServicesDAO

