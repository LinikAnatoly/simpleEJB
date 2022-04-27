
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
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
import com.ksoe.energynet.valueobject.FINDoc2ENServicesObject;
import com.ksoe.energynet.valueobject.brief.FINDoc2ENServicesObjectShort;
import com.ksoe.energynet.valueobject.filter.FINDoc2ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.lists.FINDoc2ENServicesObjectShortList;
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
  *  DAO Generated for FINDoc2ENServicesObject;
  *
  */

public class FINDoc2ENServicesObjectDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public FINDoc2ENServicesObjectDAOGen() {super();}
  //public FINDoc2ENServicesObjectDAOGen(Connection aConnection) {super(aConnection);}
  //public FINDoc2ENServicesObjectDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public FINDoc2ENServicesObjectDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public FINDoc2ENServicesObjectDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(FINDoc2ENServicesObject inObject) throws PersistenceException
   {
      FINDoc2ENServicesObject obj = new FINDoc2ENServicesObject();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.finDocCode != obj.finDocCode){
       return false;
     }
     if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
        return false;
     }
     if (inObject.finDocTypeRef.code != obj.finDocTypeRef.code){
        return false;
     }
      return true;
   }

   public int add(FINDoc2ENServicesObject anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(FINDoc2ENServicesObject anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO FINDOC2ENSERVICESOBJCT (CODE,FINDOCCODE,MODIFY_TIME,SERVICESOBJECTREFCODE,FINDOCTYPEREFCODE) VALUES (?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.finDocCode != Integer.MIN_VALUE )
         statement.setInt(2,anObject.finDocCode);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(3,null);
      else
        statement.setBigDecimal(3,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINDoc2ENServicesObject.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
        statement.setInt(4,anObject.servicesObjectRef.code);
      }
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.finDocTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINDocTypeDAOGen(connection,getUserProfile()).exists(anObject.finDocTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINDoc2ENServicesObject.finDocTypeRef.code%} = {%"+anObject.finDocTypeRef.code+"%}");
        statement.setInt(5,anObject.finDocTypeRef.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%FINDoc2ENServicesObjectDAOGen.add%}",e);
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

   public void save(FINDoc2ENServicesObject anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(FINDoc2ENServicesObject anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      FINDoc2ENServicesObject oldObject = new FINDoc2ENServicesObject();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+FINDoc2ENServicesObject.modify_time_Field+" FROM  FINDOC2ENSERVICESOBJCT WHERE CODE = ?";

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
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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
          if(fieldNameStr.compareTo("FINDOCCODE") == 0)
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
          if(fieldNameStr.compareTo("SERVICESOBJECTREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINDOCTYPEREF") == 0)
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
        "UPDATE FINDOC2ENSERVICESOBJCT SET  FINDOCCODE = ? , MODIFY_TIME = ? , SERVICESOBJECTREFCODE = ? , FINDOCTYPEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE FINDOC2ENSERVICESOBJECT SET ";
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
      if (anObject.finDocCode != Integer.MIN_VALUE )
         statement.setInt(1,anObject.finDocCode);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(2,null);
      else
        statement.setBigDecimal(2,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.servicesObjectRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.servicesObjectRef.code);
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.finDocTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.finDocTypeRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
          statement.setInt(5,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("FINDOCCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.finDocCode);
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
            if("SERVICESOBJECTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.servicesObjectRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.servicesObjectRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("FINDOCTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.finDocTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.finDocTypeRef.code);
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

   } // end of save(FINDoc2ENServicesObject anObject,String[] anAttributes)


 public FINDoc2ENServicesObjectShort getShortObject(int anObjectCode) throws PersistenceException
  {
   FINDoc2ENServicesObject filterObject = new FINDoc2ENServicesObject();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (FINDoc2ENServicesObjectShort)list.get(0);
   return null;
  }

  public FINDoc2ENServicesObjectShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public FINDoc2ENServicesObjectShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public FINDoc2ENServicesObjectShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public FINDoc2ENServicesObjectShortList getFilteredList(FINDoc2ENServicesObject filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public FINDoc2ENServicesObjectShortList getScrollableFilteredList(FINDoc2ENServicesObject aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public FINDoc2ENServicesObjectShortList getScrollableFilteredList(FINDoc2ENServicesObject aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public FINDoc2ENServicesObjectShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public FINDoc2ENServicesObjectShortList getScrollableFilteredList(FINDoc2ENServicesObjectFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public FINDoc2ENServicesObjectShortList getScrollableFilteredList(FINDoc2ENServicesObjectFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public FINDoc2ENServicesObjectShortList getScrollableFilteredList(FINDoc2ENServicesObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public FINDoc2ENServicesObjectShortList getScrollableFilteredList(FINDoc2ENServicesObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    FINDoc2ENServicesObjectShortList result = new FINDoc2ENServicesObjectShortList();
    FINDoc2ENServicesObjectShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINDOC2ENSERVICESOBJCT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "FINDOC2ENSERVICESOBJCT.CODE"+
     ",FINDOC2ENSERVICESOBJCT.FINDOCCODE"+

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
      ", FINDOCTYPE.CODE " +
      ", FINDOCTYPE.NAME " +
     " FROM FINDOC2ENSERVICESOBJCT " +
     ", ENSERVICESOBJECT " +
     ", FINDOCTYPE " +
     //" WHERE "
    "";
     whereStr = " ENSERVICESOBJECT.CODE = FINDOC2ENSERVICESOBJCT.SERVICESOBJECTREFCODE" ; //+
      whereStr = whereStr +" AND FINDOCTYPE.CODE = FINDOC2ENSERVICESOBJCT.FINDOCTYPEREFCODE" ; //+
        //selectStr = selectStr + " ${s} FINDOC2ENSERVICESOBJCT.CODE IN ( SELECT FINDOC2ENSERVICESOBJCT.CODE FROM FINDOC2ENSERVICESOBJCT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2ENSERVICESOBJCT.CODE = ?";
        }
        if(aFilterObject.finDocCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2ENSERVICESOBJCT.FINDOCCODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2ENSERVICESOBJCT.MODIFY_TIME = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "FINDOC2ENSERVICESOBJCT.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.finDocTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "FINDOC2ENSERVICESOBJCT.FINDOCTYPEREFCODE = ? ";
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
         if(aFilterObject.finDocCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finDocCode);
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.finDocTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finDocTypeRef.code);
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

        anObject = new FINDoc2ENServicesObjectShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.finDocCode = set.getInt(2);
        if ( set.wasNull() )
            anObject.finDocCode = Integer.MIN_VALUE;

        anObject.servicesObjectRefCode = set.getInt(3);
        if(set.wasNull())
        anObject.servicesObjectRefCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefContractNumber = set.getString(4);
        anObject.servicesObjectRefContractDate = set.getDate(5);
        anObject.servicesObjectRefName = set.getString(6);
        anObject.servicesObjectRefPartnerCode = set.getString(7);
        anObject.servicesObjectRefFinDocCode = set.getString(8);
        anObject.servicesObjectRefFinDocID = set.getInt(9);
        if(set.wasNull())
        anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
        anObject.servicesObjectRefCommentGen = set.getString(10);
        anObject.servicesObjectRefContractNumberServices = set.getString(11);
        anObject.servicesObjectRefContractDateServices = set.getDate(12);
        anObject.servicesObjectRefContragentName = set.getString(13);
        anObject.servicesObjectRefContragentAddress = set.getString(14);
        anObject.servicesObjectRefContragentAddressWork = set.getString(15);
        anObject.servicesObjectRefContragentOkpo = set.getString(16);
        anObject.servicesObjectRefContragentBankAccount = set.getString(17);
        anObject.servicesObjectRefContragentBankName = set.getString(18);
        anObject.servicesObjectRefContragentBankMfo = set.getString(19);
        anObject.servicesObjectRefContragentBossName = set.getString(20);
        anObject.servicesObjectRefContragentPassport = set.getString(21);
        anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(22);
        if(anObject.servicesObjectRefContractServicesSumma != null)
          anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(23);
        if(anObject.servicesObjectRefContractServicesPower != null)
          anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefCommentServicesGen = set.getString(24);
        anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(25);
        if(anObject.servicesObjectRefContractServicesDistance != null)
          anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(26);
        if(anObject.servicesObjectRefContractServicesDay != null)
          anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefUserGen = set.getString(27);
        anObject.servicesObjectRefDateEdit = set.getDate(28);
        anObject.servicesObjectRefWarrantDate = set.getDate(29);
        anObject.servicesObjectRefWarrantNumber = set.getString(30);
        anObject.servicesObjectRefWarrantFIO = set.getString(31);
        anObject.servicesObjectRefRegionalType = set.getInt(32);
        if(set.wasNull())
        anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
        anObject.servicesObjectRefBasisType = set.getBigDecimal(33);
        if(anObject.servicesObjectRefBasisType != null)
          anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContragentPosition = set.getString(34);
        anObject.servicesObjectRefExecuteWorkDate = set.getDate(35);
        anObject.servicesObjectRefTimeStart = set.getTimestamp(36);
        anObject.servicesObjectRefTimeFinal = set.getTimestamp(37);
        anObject.servicesObjectRefContragentPhoneNumber = set.getString(38);
        anObject.servicesObjectRefExecutorPhoneNumber = set.getString(39);
        anObject.servicesObjectRefContragentObjectWork = set.getString(40);
        anObject.servicesObjectRefIsNoPay = set.getInt(41);
        if(set.wasNull())
        anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
        anObject.servicesObjectRefIsCustomerMaterials = set.getInt(42);
        if(set.wasNull())
        anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
        anObject.servicesObjectRefPayDate = set.getDate(43);
        anObject.servicesObjectRefFinPayFormCode = set.getInt(44);
        if(set.wasNull())
        anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefFinPayFormName = set.getString(45);
        anObject.servicesObjectRefPartnerId = set.getInt(46);
        if(set.wasNull())
        anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
        anObject.servicesObjectRefPayDetail = set.getString(47);
        anObject.servicesObjectRefActTransferNumber = set.getString(48);
        anObject.servicesObjectRefActTransferDate = set.getDate(49);
        anObject.finDocTypeRefCode = set.getInt(50);
        if(set.wasNull())
        anObject.finDocTypeRefCode = Integer.MIN_VALUE;
        anObject.finDocTypeRefName = set.getString(51);

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

  public int[] getFilteredCodeArrayOLD(FINDoc2ENServicesObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINDOC2ENSERVICESOBJCT.CODE FROM FINDOC2ENSERVICESOBJCT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINDOC2ENSERVICESOBJCT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2ENSERVICESOBJCT.CODE = ?";
        }
        if(aFilterObject.finDocCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2ENSERVICESOBJCT.FINDOCCODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2ENSERVICESOBJCT.MODIFY_TIME = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINDOC2ENSERVICESOBJCT.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.finDocTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINDOC2ENSERVICESOBJCT.FINDOCTYPEREFCODE = ? ";
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
         if(aFilterObject.finDocCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finDocCode);
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.finDocTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finDocTypeRef.code);
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

  public int[] getFilteredCodeArray(FINDoc2ENServicesObjectFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(FINDoc2ENServicesObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINDOC2ENSERVICESOBJCT.CODE FROM FINDOC2ENSERVICESOBJCT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINDOC2ENSERVICESOBJCT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2ENSERVICESOBJCT.CODE = ?";
        }
        if(aFilterObject.finDocCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2ENSERVICESOBJCT.FINDOCCODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2ENSERVICESOBJCT.MODIFY_TIME = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINDOC2ENSERVICESOBJCT.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.finDocTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINDOC2ENSERVICESOBJCT.FINDOCTYPEREFCODE = ? ";
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
         if(aFilterObject.finDocCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finDocCode);
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.finDocTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finDocTypeRef.code);
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


   public FINDoc2ENServicesObject getObject(int uid) throws PersistenceException
   {
    FINDoc2ENServicesObject result = new FINDoc2ENServicesObject();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(FINDoc2ENServicesObject anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  FINDOC2ENSERVICESOBJCT.CODE, FINDOC2ENSERVICESOBJCT.FINDOCCODE, FINDOC2ENSERVICESOBJCT.MODIFY_TIME, FINDOC2ENSERVICESOBJCT.SERVICESOBJECTREFCODE, FINDOC2ENSERVICESOBJCT.FINDOCTYPEREFCODE "
    +" FROM FINDOC2ENSERVICESOBJCT WHERE FINDOC2ENSERVICESOBJCT.CODE = ?";

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
        anObject.finDocCode = set.getInt(2);
        if ( set.wasNull() )
           anObject.finDocCode = Integer.MIN_VALUE;
        anObject.modify_time = set.getLong(3);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.servicesObjectRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.servicesObjectRef.code = Integer.MIN_VALUE;
        anObject.finDocTypeRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.finDocTypeRef.code = Integer.MIN_VALUE;
        if(anObject.servicesObjectRef.code != Integer.MIN_VALUE)
        {
           anObject.setServicesObjectRef(
        new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.servicesObjectRef.code));
    }
        if(anObject.finDocTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setFinDocTypeRef(
        new com.ksoe.energynet.dataminer.generated.FINDocTypeDAOGen(connection,getUserProfile()).getRef(anObject.finDocTypeRef.code));
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


  public com.ksoe.energynet.valueobject.references.FINDoc2ENServicesObjectRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.FINDoc2ENServicesObjectRef ref = new com.ksoe.energynet.valueobject.references.FINDoc2ENServicesObjectRef();
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

    selectStr = "DELETE FROM  FINDOC2ENSERVICESOBJCT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    FINDoc2ENServicesObject object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%FINDoc2ENServicesObject.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(FINDoc2ENServicesObject.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%FINDoc2ENServicesObject.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINDoc2ENServicesObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FINDoc2ENServicesObject.getObject%} access denied");

    selectStr =

    "SELECT  FINDOC2ENSERVICESOBJCT.CODE FROM  FINDOC2ENSERVICESOBJCT WHERE  FINDOC2ENSERVICESOBJCT.CODE = ?";
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
    _checkConditionToken(condition,"code","FINDOC2ENSERVICESOBJCT.CODE");
    _checkConditionToken(condition,"findoccode","FINDOC2ENSERVICESOBJCT.FINDOCCODE");
    _checkConditionToken(condition,"modify_time","FINDOC2ENSERVICESOBJCT.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
    _checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
    _checkConditionToken(condition,"findoctyperef","FINDOCTYPEREFCODE");
    _checkConditionToken(condition,"findoctyperef.code","FINDOCTYPEREFCODE");
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

   private void _collectAutoIncrementFields(FINDoc2ENServicesObject anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("FINDOC2ENSERVICESOBJCT", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("FINDOC2ENSERVICESOBJCT", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("FINDOC2ENSERVICESOBJCT", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: FINDOC2ENSERVICESOBJCT");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of FINDoc2ENServicesObjectDAO

