
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
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
import com.ksoe.energynet.valueobject.ENDocAttachment2ENServicesObject;
import com.ksoe.energynet.valueobject.brief.ENDocAttachment2ENServicesObjectShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttachment2ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENDocAttachment2ENServicesObjectShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENDocAttachment2ENServicesObject;
 *
 */

public class ENDocAttachment2ENServicesObjectDAOGen extends GenericDataMiner {

   public ENDocAttachment2ENServicesObjectDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENDocAttachment2ENServicesObjectDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(ENDocAttachment2ENServicesObject inObject) throws PersistenceException
   {
      ENDocAttachment2ENServicesObject obj = new ENDocAttachment2ENServicesObject();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.docAttachmentRef.code != obj.docAttachmentRef.code){
        return false;
     }
     if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
        return false;
     }
     if (inObject.kindRef.code != obj.kindRef.code){
        return false;
     }
      return true;
   }

   public int add(ENDocAttachment2ENServicesObject anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENDocAttachment2ENServicesObject anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENDCTTCHMNT2NSRVCSBJCT (CODE,DOCATTACHMENTREFCODE,SERVICESOBJECTREFCODE,KINDREFCODE) VALUES (?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.docAttachmentRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDocAttachmentDAOGen(connection,getUserProfile()).exists(anObject.docAttachmentRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDocAttachment2ENServicesObject.docAttachmentRef.code%} = {%"+anObject.docAttachmentRef.code+"%}");
        statement.setInt(2,anObject.docAttachmentRef.code);
      }
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDocAttachment2ENServicesObject.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
        statement.setInt(3,anObject.servicesObjectRef.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.kindRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENAttachment2ServicesKindDAOGen(connection,getUserProfile()).exists(anObject.kindRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDocAttachment2ENServicesObject.kindRef.code%} = {%"+anObject.kindRef.code+"%}");
        statement.setInt(4,anObject.kindRef.code);
      }
      else
        statement.setNull(4,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENDocAttachment2ENServicesObjectDAOGen.add%}",e);
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

   public void save(ENDocAttachment2ENServicesObject anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENDocAttachment2ENServicesObject anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("DOCATTACHMENTREF") == 0)
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
          if(fieldNameStr.compareTo("KINDREF") == 0)
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
        "UPDATE ENDCTTCHMNT2NSRVCSBJCT SET DOCATTACHMENTREFCODE = ? , SERVICESOBJECTREFCODE = ? , KINDREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENDOCATTACHMENT2ENSERVICESOBJECT SET ";
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
      if (anObject.docAttachmentRef.code != Integer.MIN_VALUE)
        statement.setInt(1,anObject.docAttachmentRef.code);
      else
        statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.servicesObjectRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.servicesObjectRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.kindRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.kindRef.code);
      else
        statement.setNull(3,java.sql.Types.INTEGER);
          statement.setInt(4,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("DOCATTACHMENTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.docAttachmentRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.docAttachmentRef.code);
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
            if("KINDREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.kindRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.kindRef.code);
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

   } // end of save(ENDocAttachment2ENServicesObject anObject,String[] anAttributes)


 public ENDocAttachment2ENServicesObjectShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENDocAttachment2ENServicesObject filterObject = new ENDocAttachment2ENServicesObject();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENDocAttachment2ENServicesObjectShort)list.get(0);
   return null;
  }

  public ENDocAttachment2ENServicesObjectShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENDocAttachment2ENServicesObjectShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENDocAttachment2ENServicesObjectShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENDocAttachment2ENServicesObjectShortList getFilteredList(ENDocAttachment2ENServicesObject filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENDocAttachment2ENServicesObjectShortList getScrollableFilteredList(ENDocAttachment2ENServicesObject aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENDocAttachment2ENServicesObjectShortList getScrollableFilteredList(ENDocAttachment2ENServicesObject aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENDocAttachment2ENServicesObjectShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENDocAttachment2ENServicesObjectShortList getScrollableFilteredList(ENDocAttachment2ENServicesObjectFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENDocAttachment2ENServicesObjectShortList getScrollableFilteredList(ENDocAttachment2ENServicesObjectFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENDocAttachment2ENServicesObjectShortList getScrollableFilteredList(ENDocAttachment2ENServicesObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENDocAttachment2ENServicesObjectShortList getScrollableFilteredList(ENDocAttachment2ENServicesObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENDocAttachment2ENServicesObjectShortList result = new ENDocAttachment2ENServicesObjectShortList();
    ENDocAttachment2ENServicesObjectShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDCTTCHMNT2NSRVCSBJCT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENDCTTCHMNT2NSRVCSBJCT.CODE"+

      ", ENDOCATTACHMENT.CODE " +
      ", ENDOCATTACHMENT.COMMENTGEN " +
      ", ENDOCATTACHMENT.FILELINK " +
      ", ENDOCATTACHMENT.USERADD " +
      ", ENDOCATTACHMENT.DATEADD " +
      ", ENDOCATTACHMENT.USERGEN " +
      ", ENDOCATTACHMENT.DATEEDIT " +
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
      ", ENSERVICESOBJECT.CITIESLIST " +
      ", ENSERVICESOBJECT.LINELENGTH " +
      ", ENSERVICESOBJECT.PROJECTCODE " +
      ", ENSERVICESOBJECT.CNPACKCODE " +
      ", ENSERVICESOBJECT.DFPACKCODE " +
      ", ENSERVICESOBJECT.COUNTERSZONETYPE " +
      ", ENATTACHMENT2SERVCSKND.CODE " +
      ", ENATTACHMENT2SERVCSKND.NAME " +
     " FROM ENDCTTCHMNT2NSRVCSBJCT " +
     ", ENDOCATTACHMENT " +
     ", ENSERVICESOBJECT " +
     ", ENATTACHMENT2SERVCSKND " +
     //" WHERE "
  "";
     whereStr = " ENDOCATTACHMENT.CODE = ENDCTTCHMNT2NSRVCSBJCT.DOCATTACHMENTREFCODE" ; //+
      whereStr = whereStr +" AND ENSERVICESOBJECT.CODE = ENDCTTCHMNT2NSRVCSBJCT.SERVICESOBJECTREFCODE" ; //+
      whereStr = whereStr +" AND ENATTACHMENT2SERVCSKND.CODE = ENDCTTCHMNT2NSRVCSBJCT.KINDREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENDCTTCHMNT2NSRVCSBJCT.CODE IN ( SELECT ENDCTTCHMNT2NSRVCSBJCT.CODE FROM ENDCTTCHMNT2NSRVCSBJCT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDCTTCHMNT2NSRVCSBJCT.CODE = ?";
        }
        if(aFilterObject.docAttachmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDCTTCHMNT2NSRVCSBJCT.DOCATTACHMENTREFCODE = ? ";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDCTTCHMNT2NSRVCSBJCT.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDCTTCHMNT2NSRVCSBJCT.KINDREFCODE = ? ";
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
       if(aFilterObject.docAttachmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.docAttachmentRef.code);
       }
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
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

        anObject = new ENDocAttachment2ENServicesObjectShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.docAttachmentRefCode = set.getInt(2);
    if(set.wasNull())
      anObject.docAttachmentRefCode = Integer.MIN_VALUE;
        anObject.docAttachmentRefCommentGen = set.getString(3);
        anObject.docAttachmentRefFileLink = set.getString(4);
        anObject.docAttachmentRefUserAdd = set.getString(5);
        anObject.docAttachmentRefDateAdd = set.getTimestamp(6);
        anObject.docAttachmentRefUserGen = set.getString(7);
        anObject.docAttachmentRefDateEdit = set.getTimestamp(8);
        anObject.servicesObjectRefCode = set.getInt(9);
    if(set.wasNull())
      anObject.servicesObjectRefCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefContractNumber = set.getString(10);
        anObject.servicesObjectRefContractDate = set.getDate(11);
        anObject.servicesObjectRefName = set.getString(12);
        anObject.servicesObjectRefPartnerCode = set.getString(13);
        anObject.servicesObjectRefFinDocCode = set.getString(14);
        anObject.servicesObjectRefFinDocID = set.getInt(15);
    if(set.wasNull())
      anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
        anObject.servicesObjectRefCommentGen = set.getString(16);
        anObject.servicesObjectRefContractNumberServices = set.getString(17);
        anObject.servicesObjectRefContractDateServices = set.getDate(18);
        anObject.servicesObjectRefContragentName = set.getString(19);
        anObject.servicesObjectRefContragentAddress = set.getString(20);
        anObject.servicesObjectRefContragentAddressWork = set.getString(21);
        anObject.servicesObjectRefContragentOkpo = set.getString(22);
        anObject.servicesObjectRefContragentBankAccount = set.getString(23);
        anObject.servicesObjectRefContragentBankName = set.getString(24);
        anObject.servicesObjectRefContragentBankMfo = set.getString(25);
        anObject.servicesObjectRefContragentBossName = set.getString(26);
        anObject.servicesObjectRefContragentPassport = set.getString(27);
        anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(28);
        if(anObject.servicesObjectRefContractServicesSumma != null)
          anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(29);
        if(anObject.servicesObjectRefContractServicesPower != null)
          anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefCommentServicesGen = set.getString(30);
        anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(31);
        if(anObject.servicesObjectRefContractServicesDistance != null)
          anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(32);
        if(anObject.servicesObjectRefContractServicesDay != null)
          anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefUserGen = set.getString(33);
        anObject.servicesObjectRefDateEdit = set.getDate(34);
        anObject.servicesObjectRefWarrantDate = set.getDate(35);
        anObject.servicesObjectRefWarrantNumber = set.getString(36);
        anObject.servicesObjectRefWarrantFIO = set.getString(37);
        anObject.servicesObjectRefRegionalType = set.getInt(38);
    if(set.wasNull())
      anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
        anObject.servicesObjectRefBasisType = set.getBigDecimal(39);
        if(anObject.servicesObjectRefBasisType != null)
          anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContragentPosition = set.getString(40);
        anObject.servicesObjectRefExecuteWorkDate = set.getDate(41);
        anObject.servicesObjectRefTimeStart = set.getTimestamp(42);
        anObject.servicesObjectRefTimeFinal = set.getTimestamp(43);
        anObject.servicesObjectRefContragentPhoneNumber = set.getString(44);
        anObject.servicesObjectRefExecutorPhoneNumber = set.getString(45);
        anObject.servicesObjectRefContragentObjectWork = set.getString(46);
        anObject.servicesObjectRefIsNoPay = set.getInt(47);
    if(set.wasNull())
      anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
        anObject.servicesObjectRefIsCustomerMaterials = set.getInt(48);
    if(set.wasNull())
      anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
        anObject.servicesObjectRefPayDate = set.getDate(49);
        anObject.servicesObjectRefFinPayFormCode = set.getInt(50);
    if(set.wasNull())
      anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefFinPayFormName = set.getString(51);
        anObject.servicesObjectRefPartnerId = set.getInt(52);
    if(set.wasNull())
      anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
        anObject.servicesObjectRefPayDetail = set.getString(53);
        anObject.servicesObjectRefActTransferNumber = set.getString(54);
        anObject.servicesObjectRefActTransferDate = set.getDate(55);
        anObject.servicesObjectRefResposible = set.getString(56);
        anObject.servicesObjectRefResposiblePosition = set.getString(57);
        anObject.servicesObjectRefResposibleTabNumber = set.getString(58);
        anObject.servicesObjectRefPrevContractStatus = set.getInt(59);
    if(set.wasNull())
      anObject.servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
        anObject.servicesObjectRefReconnectionTU = set.getInt(60);
    if(set.wasNull())
      anObject.servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
        anObject.servicesObjectRefPersonalAccountCode = set.getInt(61);
    if(set.wasNull())
      anObject.servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefPersonalAccountNumber = set.getString(62);
        anObject.servicesObjectRefTabNumber = set.getString(63);
        anObject.servicesObjectRefCitiesList = set.getString(64);
        anObject.servicesObjectRefLineLength = set.getBigDecimal(65);
        if(anObject.servicesObjectRefLineLength != null)
          anObject.servicesObjectRefLineLength = anObject.servicesObjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefProjectCode = set.getString(66);
        anObject.servicesObjectRefCnPackCode = set.getInt(67);
    if(set.wasNull())
      anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefDfPackCode = set.getInt(68);
    if(set.wasNull())
      anObject.servicesObjectRefDfPackCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefCountersZoneType = set.getInt(69);
    if(set.wasNull())
      anObject.servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
        anObject.kindRefCode = set.getInt(70);
    if(set.wasNull())
      anObject.kindRefCode = Integer.MIN_VALUE;
        anObject.kindRefName = set.getString(71);

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

  public int[] getFilteredCodeArrayOLD(ENDocAttachment2ENServicesObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDCTTCHMNT2NSRVCSBJCT.CODE FROM ENDCTTCHMNT2NSRVCSBJCT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDCTTCHMNT2NSRVCSBJCT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDCTTCHMNT2NSRVCSBJCT.CODE = ?";
        }
        if(aFilterObject.docAttachmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDCTTCHMNT2NSRVCSBJCT.DOCATTACHMENTREFCODE = ? ";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDCTTCHMNT2NSRVCSBJCT.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDCTTCHMNT2NSRVCSBJCT.KINDREFCODE = ? ";
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
       if(aFilterObject.docAttachmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.docAttachmentRef.code);
       }
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
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

  public int[] getFilteredCodeArray(ENDocAttachment2ENServicesObjectFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENDocAttachment2ENServicesObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDCTTCHMNT2NSRVCSBJCT.CODE FROM ENDCTTCHMNT2NSRVCSBJCT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDCTTCHMNT2NSRVCSBJCT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDCTTCHMNT2NSRVCSBJCT.CODE = ?";
        }
        if(aFilterObject.docAttachmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDCTTCHMNT2NSRVCSBJCT.DOCATTACHMENTREFCODE = ? ";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDCTTCHMNT2NSRVCSBJCT.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDCTTCHMNT2NSRVCSBJCT.KINDREFCODE = ? ";
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
       if(aFilterObject.docAttachmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.docAttachmentRef.code);
       }
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
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


   public ENDocAttachment2ENServicesObject getObject(int uid) throws PersistenceException
   {
    ENDocAttachment2ENServicesObject result = new ENDocAttachment2ENServicesObject();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENDocAttachment2ENServicesObject anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENDCTTCHMNT2NSRVCSBJCT.CODE, ENDCTTCHMNT2NSRVCSBJCT.DOCATTACHMENTREFCODE, ENDCTTCHMNT2NSRVCSBJCT.SERVICESOBJECTREFCODE, ENDCTTCHMNT2NSRVCSBJCT.KINDREFCODE "
    +" FROM ENDCTTCHMNT2NSRVCSBJCT WHERE ENDCTTCHMNT2NSRVCSBJCT.CODE = ?";

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
        anObject.docAttachmentRef.code = set.getInt(2);
        if ( set.wasNull() )
            anObject.docAttachmentRef.code = Integer.MIN_VALUE;
        anObject.servicesObjectRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.servicesObjectRef.code = Integer.MIN_VALUE;
        anObject.kindRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.kindRef.code = Integer.MIN_VALUE;
        if(anObject.docAttachmentRef.code != Integer.MIN_VALUE)
        {
           anObject.setDocAttachmentRef(
      new com.ksoe.energynet.dataminer.generated.ENDocAttachmentDAOGen(connection,getUserProfile()).getRef(anObject.docAttachmentRef.code));
    }
        if(anObject.servicesObjectRef.code != Integer.MIN_VALUE)
        {
           anObject.setServicesObjectRef(
      new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.servicesObjectRef.code));
    }
        if(anObject.kindRef.code != Integer.MIN_VALUE)
        {
           anObject.setKindRef(
      new com.ksoe.energynet.dataminer.generated.ENAttachment2ServicesKindDAOGen(connection,getUserProfile()).getRef(anObject.kindRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENDocAttachment2ENServicesObjectRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENDocAttachment2ENServicesObjectRef ref = new com.ksoe.energynet.valueobject.references.ENDocAttachment2ENServicesObjectRef();
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

    selectStr = "DELETE FROM  ENDCTTCHMNT2NSRVCSBJCT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENDocAttachment2ENServicesObject object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENDocAttachment2ENServicesObject.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENDocAttachment2ENServicesObject.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENDocAttachment2ENServicesObject.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDocAttachment2ENServicesObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENDocAttachment2ENServicesObject.getObject%} access denied");

    selectStr =

    "SELECT  ENDCTTCHMNT2NSRVCSBJCT.CODE FROM  ENDCTTCHMNT2NSRVCSBJCT WHERE  ENDCTTCHMNT2NSRVCSBJCT.CODE = ?";
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
    _checkConditionToken(condition,"code","ENDCTTCHMNT2NSRVCSBJCT.CODE");
      // relationship conditions
    _checkConditionToken(condition,"docattachmentref","DOCATTACHMENTREFCODE");
    _checkConditionToken(condition,"docattachmentref.code","DOCATTACHMENTREFCODE");
    _checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
    _checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
    _checkConditionToken(condition,"kindref","KINDREFCODE");
    _checkConditionToken(condition,"kindref.code","KINDREFCODE");
    return condition.toString();
   }

   @Override
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

  private void _collectAutoIncrementFields(ENDocAttachment2ENServicesObject anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENDCTTCHMNT2NSRVCSBJCT", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENDCTTCHMNT2NSRVCSBJCT", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENDCTTCHMNT2NSRVCSBJCT", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENDCTTCHMNT2NSRVCSBJCT");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENDocAttachment2ENServicesObjectDAO
