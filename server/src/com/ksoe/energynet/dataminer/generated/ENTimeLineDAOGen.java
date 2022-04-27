
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
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
import com.ksoe.energynet.valueobject.ENTimeLine;
import com.ksoe.energynet.valueobject.brief.ENTimeLineShort;
import com.ksoe.energynet.valueobject.filter.ENTimeLineFilter;
import com.ksoe.energynet.valueobject.lists.ENTimeLineShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENTimeLine;
 *
 */

public class ENTimeLineDAOGen extends GenericDataMiner {

  public ENTimeLineDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTimeLineDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTimeLine inObject) throws PersistenceException
   {
      ENTimeLine obj = new ENTimeLine();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.dateGen.equals(obj.dateGen)){
       return false;
     }

     if ( ! inObject.timeStart.equals(obj.timeStart)){
       return false;
     }

     if ( ! inObject.timeFinal.equals(obj.timeFinal)){
       return false;
     }

     if ( ! inObject.timeMoveToObject.equals(obj.timeMoveToObject)){
       return false;
     }

     if ( ! inObject.timeMoveOfObject.equals(obj.timeMoveOfObject)){
       return false;
     }
     if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
        return false;
     }
     if (inObject.virtualBrigadeRef.code != obj.virtualBrigadeRef.code){
        return false;
     }
      return true;
   }

   public int add(ENTimeLine anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTimeLine anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTIMELINE (CODE,DATEGEN,TIMESTART,TIMEFINAL,TIMEMOVETOOBJECT,TIMEMOVEOFOBJECT,SERVICESOBJECTREFCODE,VIRTUALBRIGADEREFCODE) VALUES (?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.dateGen == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.dateGen.getTime()));
      if (anObject.timeStart == null)
        statement.setTimestamp(3,null);
      else
        statement.setTimestamp(3,new java.sql.Timestamp(anObject.timeStart.getTime()));
      if (anObject.timeFinal == null)
        statement.setTimestamp(4,null);
      else
        statement.setTimestamp(4,new java.sql.Timestamp(anObject.timeFinal.getTime()));
      if (anObject.timeMoveToObject == null)
        statement.setTimestamp(5,null);
      else
        statement.setTimestamp(5,new java.sql.Timestamp(anObject.timeMoveToObject.getTime()));
      if (anObject.timeMoveOfObject == null)
        statement.setTimestamp(6,null);
      else
        statement.setTimestamp(6,new java.sql.Timestamp(anObject.timeMoveOfObject.getTime()));
      if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTimeLine.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
        statement.setInt(7,anObject.servicesObjectRef.code);
      }
      else
        statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.virtualBrigadeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKVirtualBrigadeDAOGen(connection,getUserProfile()).exists(anObject.virtualBrigadeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTimeLine.virtualBrigadeRef.code%} = {%"+anObject.virtualBrigadeRef.code+"%}");
        statement.setInt(8,anObject.virtualBrigadeRef.code);
      }
      else
        statement.setNull(8,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTimeLineDAOGen.add%}",e);
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

   public void save(ENTimeLine anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTimeLine anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("DATEGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TIMESTART") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TIMEFINAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TIMEMOVETOOBJECT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TIMEMOVEOFOBJECT") == 0)
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
          if(fieldNameStr.compareTo("VIRTUALBRIGADEREF") == 0)
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
        "UPDATE ENTIMELINE SET  DATEGEN = ? , TIMESTART = ? , TIMEFINAL = ? , TIMEMOVETOOBJECT = ? , TIMEMOVEOFOBJECT = ? , SERVICESOBJECTREFCODE = ? , VIRTUALBRIGADEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTIMELINE SET ";
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
      if (anObject.dateGen == null)
        statement.setDate(1,null);
      else
        statement.setDate(1,new java.sql.Date(anObject.dateGen.getTime()));
      if (anObject.timeStart == null)
        statement.setTimestamp(2,null);
      else
        statement.setTimestamp(2,new java.sql.Timestamp(anObject.timeStart.getTime()));
      if (anObject.timeFinal == null)
        statement.setTimestamp(3,null);
      else
        statement.setTimestamp(3,new java.sql.Timestamp(anObject.timeFinal.getTime()));
      if (anObject.timeMoveToObject == null)
        statement.setTimestamp(4,null);
      else
        statement.setTimestamp(4,new java.sql.Timestamp(anObject.timeMoveToObject.getTime()));
      if (anObject.timeMoveOfObject == null)
        statement.setTimestamp(5,null);
      else
        statement.setTimestamp(5,new java.sql.Timestamp(anObject.timeMoveOfObject.getTime()));
      if (anObject.servicesObjectRef.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.servicesObjectRef.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.virtualBrigadeRef.code != Integer.MIN_VALUE)
        statement.setInt(7,anObject.virtualBrigadeRef.code);
      else
        statement.setNull(7,java.sql.Types.INTEGER);
          statement.setInt(8,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("DATEGEN".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateGen == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.dateGen.getTime()));
                continue;
             }
            if("TIMESTART".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.timeStart == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.timeStart.getTime()));
                continue;
             }
            if("TIMEFINAL".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.timeFinal == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.timeFinal.getTime()));
                continue;
             }
            if("TIMEMOVETOOBJECT".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.timeMoveToObject == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.timeMoveToObject.getTime()));
                continue;
             }
            if("TIMEMOVEOFOBJECT".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.timeMoveOfObject == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.timeMoveOfObject.getTime()));
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
            if("VIRTUALBRIGADEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.virtualBrigadeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.virtualBrigadeRef.code);
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

   } // end of save(ENTimeLine anObject,String[] anAttributes)


 public ENTimeLineShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTimeLine filterObject = new ENTimeLine();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTimeLineShort)list.get(0);
   return null;
  }

  public ENTimeLineShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTimeLineShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTimeLineShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTimeLineShortList getFilteredList(ENTimeLine filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTimeLineShortList getScrollableFilteredList(ENTimeLine aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTimeLineShortList getScrollableFilteredList(ENTimeLine aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTimeLineShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTimeLineShortList getScrollableFilteredList(ENTimeLineFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTimeLineShortList getScrollableFilteredList(ENTimeLineFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTimeLineShortList getScrollableFilteredList(ENTimeLine aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTimeLineShortList getScrollableFilteredList(ENTimeLine aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTimeLineShortList result = new ENTimeLineShortList();
    ENTimeLineShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTIMELINE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTIMELINE.CODE"+
     ",ENTIMELINE.DATEGEN"+
     ",ENTIMELINE.TIMESTART"+
     ",ENTIMELINE.TIMEFINAL"+
     ",ENTIMELINE.TIMEMOVETOOBJECT"+
     ",ENTIMELINE.TIMEMOVEOFOBJECT"+

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
      ", ENSERVICESOBJECT.CNPACKCODE " +
      ", ENSERVICESOBJECT.DFPACKCODE " +
     ", ENTIMELINE.VIRTUALBRIGADEREFCODE" +
     " FROM ENTIMELINE " +
     ", ENSERVICESOBJECT " +
     //" WHERE "
    "";
     whereStr = " ENSERVICESOBJECT.CODE = ENTIMELINE.SERVICESOBJECTREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENTIMELINE.CODE IN ( SELECT ENTIMELINE.CODE FROM ENTIMELINE ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.CODE = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.DATEGEN = ?";
        }
        if(aFilterObject.timeStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.TIMESTART = ?";
        }
        if(aFilterObject.timeFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.TIMEFINAL = ?";
        }
        if(aFilterObject.timeMoveToObject != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.TIMEMOVETOOBJECT = ?";
        }
        if(aFilterObject.timeMoveOfObject != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.TIMEMOVEOFOBJECT = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTIMELINE.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.virtualBrigadeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTIMELINE.VIRTUALBRIGADEREFCODE = ? ";
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
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
        if(aFilterObject.timeStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
        }
        if(aFilterObject.timeFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
        }
        if(aFilterObject.timeMoveToObject != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeMoveToObject.getTime()));
        }
        if(aFilterObject.timeMoveOfObject != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeMoveOfObject.getTime()));
        }
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.virtualBrigadeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.virtualBrigadeRef.code);
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

        anObject = new ENTimeLineShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.dateGen = set.getDate(2);
        anObject.timeStart = set.getTimestamp(3);
        anObject.timeFinal = set.getTimestamp(4);
        anObject.timeMoveToObject = set.getTimestamp(5);
        anObject.timeMoveOfObject = set.getTimestamp(6);

        anObject.servicesObjectRefCode = set.getInt(7);
        if(set.wasNull())
        anObject.servicesObjectRefCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefContractNumber = set.getString(8);
        anObject.servicesObjectRefContractDate = set.getDate(9);
        anObject.servicesObjectRefName = set.getString(10);
        anObject.servicesObjectRefPartnerCode = set.getString(11);
        anObject.servicesObjectRefFinDocCode = set.getString(12);
        anObject.servicesObjectRefFinDocID = set.getInt(13);
        if(set.wasNull())
        anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
        anObject.servicesObjectRefCommentGen = set.getString(14);
        anObject.servicesObjectRefContractNumberServices = set.getString(15);
        anObject.servicesObjectRefContractDateServices = set.getDate(16);
        anObject.servicesObjectRefContragentName = set.getString(17);
        anObject.servicesObjectRefContragentAddress = set.getString(18);
        anObject.servicesObjectRefContragentAddressWork = set.getString(19);
        anObject.servicesObjectRefContragentOkpo = set.getString(20);
        anObject.servicesObjectRefContragentBankAccount = set.getString(21);
        anObject.servicesObjectRefContragentBankName = set.getString(22);
        anObject.servicesObjectRefContragentBankMfo = set.getString(23);
        anObject.servicesObjectRefContragentBossName = set.getString(24);
        anObject.servicesObjectRefContragentPassport = set.getString(25);
        anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(26);
        if(anObject.servicesObjectRefContractServicesSumma != null)
          anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(27);
        if(anObject.servicesObjectRefContractServicesPower != null)
          anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefCommentServicesGen = set.getString(28);
        anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(29);
        if(anObject.servicesObjectRefContractServicesDistance != null)
          anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(30);
        if(anObject.servicesObjectRefContractServicesDay != null)
          anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefUserGen = set.getString(31);
        anObject.servicesObjectRefDateEdit = set.getDate(32);
        anObject.servicesObjectRefWarrantDate = set.getDate(33);
        anObject.servicesObjectRefWarrantNumber = set.getString(34);
        anObject.servicesObjectRefWarrantFIO = set.getString(35);
        anObject.servicesObjectRefRegionalType = set.getInt(36);
        if(set.wasNull())
        anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
        anObject.servicesObjectRefBasisType = set.getBigDecimal(37);
        if(anObject.servicesObjectRefBasisType != null)
          anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContragentPosition = set.getString(38);
        anObject.servicesObjectRefExecuteWorkDate = set.getDate(39);
        anObject.servicesObjectRefTimeStart = set.getTimestamp(40);
        anObject.servicesObjectRefTimeFinal = set.getTimestamp(41);
        anObject.servicesObjectRefContragentPhoneNumber = set.getString(42);
        anObject.servicesObjectRefExecutorPhoneNumber = set.getString(43);

        anObject.virtualBrigadeRefCode = set.getInt(63);
        if(set.wasNull())
        anObject.virtualBrigadeRefCode = Integer.MIN_VALUE;

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

  public int[] getFilteredCodeArrayOLD(ENTimeLine aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTIMELINE.CODE FROM ENTIMELINE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTIMELINE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.CODE = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.DATEGEN = ?";
        }
        if(aFilterObject.timeStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.TIMESTART = ?";
        }
        if(aFilterObject.timeFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.TIMEFINAL = ?";
        }
        if(aFilterObject.timeMoveToObject != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.TIMEMOVETOOBJECT = ?";
        }
        if(aFilterObject.timeMoveOfObject != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.TIMEMOVEOFOBJECT = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTIMELINE.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.virtualBrigadeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTIMELINE.VIRTUALBRIGADEREFCODE = ? ";
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
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
        if(aFilterObject.timeStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
        }
        if(aFilterObject.timeFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
        }
        if(aFilterObject.timeMoveToObject != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeMoveToObject.getTime()));
        }
        if(aFilterObject.timeMoveOfObject != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeMoveOfObject.getTime()));
        }
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.virtualBrigadeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.virtualBrigadeRef.code);
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

  public int[] getFilteredCodeArray(ENTimeLineFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTimeLine aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTIMELINE.CODE FROM ENTIMELINE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTIMELINE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.CODE = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.DATEGEN = ?";
        }
        if(aFilterObject.timeStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.TIMESTART = ?";
        }
        if(aFilterObject.timeFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.TIMEFINAL = ?";
        }
        if(aFilterObject.timeMoveToObject != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.TIMEMOVETOOBJECT = ?";
        }
        if(aFilterObject.timeMoveOfObject != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTIMELINE.TIMEMOVEOFOBJECT = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTIMELINE.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.virtualBrigadeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTIMELINE.VIRTUALBRIGADEREFCODE = ? ";
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
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
        if(aFilterObject.timeStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
        }
        if(aFilterObject.timeFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
        }
        if(aFilterObject.timeMoveToObject != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeMoveToObject.getTime()));
        }
        if(aFilterObject.timeMoveOfObject != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeMoveOfObject.getTime()));
        }
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.virtualBrigadeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.virtualBrigadeRef.code);
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


   public ENTimeLine getObject(int uid) throws PersistenceException
   {
    ENTimeLine result = new ENTimeLine();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTimeLine anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTIMELINE.CODE, ENTIMELINE.DATEGEN, ENTIMELINE.TIMESTART, ENTIMELINE.TIMEFINAL, ENTIMELINE.TIMEMOVETOOBJECT, ENTIMELINE.TIMEMOVEOFOBJECT, ENTIMELINE.SERVICESOBJECTREFCODE, ENTIMELINE.VIRTUALBRIGADEREFCODE "
    +" FROM ENTIMELINE WHERE ENTIMELINE.CODE = ?";

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
        anObject.dateGen = set.getDate(2);
        anObject.timeStart = set.getTimestamp(3);
        anObject.timeFinal = set.getTimestamp(4);
        anObject.timeMoveToObject = set.getTimestamp(5);
        anObject.timeMoveOfObject = set.getTimestamp(6);
        anObject.servicesObjectRef.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.servicesObjectRef.code = Integer.MIN_VALUE;
        anObject.virtualBrigadeRef.code = set.getInt(8);
        if ( set.wasNull() )
            anObject.virtualBrigadeRef.code = Integer.MIN_VALUE;
        if(anObject.servicesObjectRef.code != Integer.MIN_VALUE)
        {
           anObject.setServicesObjectRef(
        new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getObject(anObject.servicesObjectRef.code));
    }
        if(anObject.virtualBrigadeRef.code != Integer.MIN_VALUE)
        {
           anObject.setVirtualBrigadeRef(
        new com.ksoe.techcard.dataminer.generated.TKVirtualBrigadeDAOGen(connection,getUserProfile()).getObject(anObject.virtualBrigadeRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENTimeLineRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTimeLineRef ref = new com.ksoe.energynet.valueobject.references.ENTimeLineRef();
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

    selectStr = "DELETE FROM  ENTIMELINE WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTimeLine object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTimeLine.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTimeLine.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTimeLine.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTimeLine.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTimeLine.getObject%} access denied");

    selectStr =

    "SELECT  ENTIMELINE.CODE FROM  ENTIMELINE WHERE  ENTIMELINE.CODE = ?";
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
    _checkConditionToken(condition,"code","ENTIMELINE.CODE");
    _checkConditionToken(condition,"dategen","ENTIMELINE.DATEGEN");
    _checkConditionToken(condition,"timestart","ENTIMELINE.TIMESTART");
    _checkConditionToken(condition,"timefinal","ENTIMELINE.TIMEFINAL");
    _checkConditionToken(condition,"timemovetoobject","ENTIMELINE.TIMEMOVETOOBJECT");
    _checkConditionToken(condition,"timemoveofobject","ENTIMELINE.TIMEMOVEOFOBJECT");
      // relationship conditions
    _checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
    _checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
    _checkConditionToken(condition,"virtualbrigaderef","VIRTUALBRIGADEREFCODE");
    _checkConditionToken(condition,"virtualbrigaderef.code","VIRTUALBRIGADEREFCODE");
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

    private void _collectAutoIncrementFields(ENTimeLine anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENTIMELINE", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENTIMELINE", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENTIMELINE", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENTIMELINE");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENTimeLineDAO
