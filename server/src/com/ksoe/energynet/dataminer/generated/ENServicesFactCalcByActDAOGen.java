
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
import com.ksoe.energynet.valueobject.ENServicesFactCalcByAct;
import com.ksoe.energynet.valueobject.brief.ENServicesFactCalcByActShort;
import com.ksoe.energynet.valueobject.filter.ENServicesFactCalcByActFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesFactCalcByActShortList;
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
  *  DAO Generated for ENServicesFactCalcByAct;
  *
  */

public class ENServicesFactCalcByActDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENServicesFactCalcByActDAOGen() {super();}
  //public ENServicesFactCalcByActDAOGen(Connection aConnection) {super(aConnection);}
  //public ENServicesFactCalcByActDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENServicesFactCalcByActDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENServicesFactCalcByActDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENServicesFactCalcByAct inObject) throws PersistenceException
   {
      ENServicesFactCalcByAct obj = new ENServicesFactCalcByAct();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.materialsCost.equals(obj.materialsCost)){
       return false;
     }

     if ( ! inObject.transportCost.equals(obj.transportCost)){
       return false;
     }

     if ( ! inObject.deliveryCost.equals(obj.deliveryCost)){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }
     if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
        return false;
     }
     if (inObject.actRef.code != obj.actRef.code){
        return false;
     }
      return true;
   }

   public int add(ENServicesFactCalcByAct anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENServicesFactCalcByAct anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENSERVICESFACTCALCBYCT (CODE,MATERIALSCOST,TRANSPORTCOST,DELIVERYCOST,COMMENTGEN,USERGEN,DATEEDIT,MODIFY_TIME,SERVICESOBJECTREFCODE,ACTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.materialsCost != null)
        anObject.materialsCost = anObject.materialsCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.materialsCost);
      if (anObject.transportCost != null)
        anObject.transportCost = anObject.transportCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.transportCost);
      if (anObject.deliveryCost != null)
        anObject.deliveryCost = anObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.deliveryCost);
      statement.setString(5,anObject.commentGen);
      statement.setString(6,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(7,null);
      else
        statement.setTimestamp(7,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(8,null);
      else
        statement.setBigDecimal(8,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENServicesFactCalcByAct.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
        statement.setInt(9,anObject.servicesObjectRef.code);
      }
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.actRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).exists(anObject.actRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENServicesFactCalcByAct.actRef.code%} = {%"+anObject.actRef.code+"%}");
        statement.setInt(10,anObject.actRef.code);
      }
      else
        statement.setNull(10,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENServicesFactCalcByActDAOGen.add%}",e);
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

   public void save(ENServicesFactCalcByAct anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENServicesFactCalcByAct anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENServicesFactCalcByAct oldObject = new ENServicesFactCalcByAct();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENServicesFactCalcByAct.modify_time_Field+" FROM  ENSERVICESFACTCALCBYCT WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("MATERIALSCOST") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRANSPORTCOST") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DELIVERYCOST") == 0)
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
          if(fieldNameStr.compareTo("SERVICESOBJECTREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ACTREF") == 0)
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
        "UPDATE ENSERVICESFACTCALCBYCT SET  MATERIALSCOST = ? , TRANSPORTCOST = ? , DELIVERYCOST = ? , COMMENTGEN = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , SERVICESOBJECTREFCODE = ? , ACTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENSERVICESFACTCALCBYACT SET ";
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
      if (anObject.materialsCost != null)
        anObject.materialsCost = anObject.materialsCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.materialsCost);

      if (anObject.transportCost != null)
        anObject.transportCost = anObject.transportCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.transportCost);

      if (anObject.deliveryCost != null)
        anObject.deliveryCost = anObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.deliveryCost);

      statement.setString(4,anObject.commentGen);
      statement.setString(5,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(6,null);
      else
        statement.setTimestamp(6,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(7,null);
      else
        statement.setBigDecimal(7,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.servicesObjectRef.code != Integer.MIN_VALUE)
        statement.setInt(8,anObject.servicesObjectRef.code);
      else
        statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.actRef.code != Integer.MIN_VALUE)
        statement.setInt(9,anObject.actRef.code);
      else
        statement.setNull(9,java.sql.Types.INTEGER);
          statement.setInt(10,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("MATERIALSCOST".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.materialsCost != null)
                    anObject.materialsCost = anObject.materialsCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.materialsCost);
                continue;
             }
            if("TRANSPORTCOST".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportCost != null)
                    anObject.transportCost = anObject.transportCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.transportCost);
                continue;
             }
            if("DELIVERYCOST".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.deliveryCost != null)
                    anObject.deliveryCost = anObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.deliveryCost);
                continue;
             }
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
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
            if("SERVICESOBJECTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.servicesObjectRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.servicesObjectRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("ACTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.actRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.actRef.code);
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

   } // end of save(ENServicesFactCalcByAct anObject,String[] anAttributes)


 public ENServicesFactCalcByActShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENServicesFactCalcByAct filterObject = new ENServicesFactCalcByAct();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENServicesFactCalcByActShort)list.get(0);
   return null;
  }

  public ENServicesFactCalcByActShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENServicesFactCalcByActShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENServicesFactCalcByActShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENServicesFactCalcByActShortList getFilteredList(ENServicesFactCalcByAct filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENServicesFactCalcByActShortList getScrollableFilteredList(ENServicesFactCalcByAct aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENServicesFactCalcByActShortList getScrollableFilteredList(ENServicesFactCalcByAct aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENServicesFactCalcByActShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENServicesFactCalcByActShortList getScrollableFilteredList(ENServicesFactCalcByActFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENServicesFactCalcByActShortList getScrollableFilteredList(ENServicesFactCalcByActFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENServicesFactCalcByActShortList getScrollableFilteredList(ENServicesFactCalcByAct aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENServicesFactCalcByActShortList getScrollableFilteredList(ENServicesFactCalcByAct aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENServicesFactCalcByActShortList result = new ENServicesFactCalcByActShortList();
    ENServicesFactCalcByActShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSERVICESFACTCALCBYCT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENSERVICESFACTCALCBYCT.CODE"+
     ",ENSERVICESFACTCALCBYCT.MATERIALSCOST"+
     ",ENSERVICESFACTCALCBYCT.TRANSPORTCOST"+
     ",ENSERVICESFACTCALCBYCT.DELIVERYCOST"+
     ",ENSERVICESFACTCALCBYCT.USERGEN"+
     ",ENSERVICESFACTCALCBYCT.DATEEDIT"+

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
      ", ENSERVICESOBJECT.CNPACKCODE " +
      ", ENACT.CODE " +
      ", ENACT.NUMBERGEN " +
      ", ENACT.DATEGEN " +
      ", ENACT.FINDOCCODE " +
      ", ENACT.FINDOCMECHANICCODE " +
      ", ENACT.FINMOLNAME " +
      ", ENACT.FINMECHANICNAME " +
      ", ENACT.INVNUMBER " +
      ", ENACT.USERGEN " +
      ", ENACT.DATEEDIT " +
      ", ENACT.DATEACT " +
     " FROM ENSERVICESFACTCALCBYCT " +
     ", ENSERVICESOBJECT " +
     ", ENACT " +
     //" WHERE "
    "";
     whereStr = " ENSERVICESOBJECT.CODE = ENSERVICESFACTCALCBYCT.SERVICESOBJECTREFCODE" ; //+
      whereStr = whereStr +" AND ENACT.CODE = ENSERVICESFACTCALCBYCT.ACTREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENSERVICESFACTCALCBYCT.CODE IN ( SELECT ENSERVICESFACTCALCBYCT.CODE FROM ENSERVICESFACTCALCBYCT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.CODE = ?";
        }
        if(aFilterObject.materialsCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.MATERIALSCOST = ?";
        }
        if(aFilterObject.transportCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.TRANSPORTCOST = ?";
        }
        if(aFilterObject.deliveryCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.DELIVERYCOST = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESFACTCALCBYCT.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESFACTCALCBYCT.COMMENTGEN) LIKE UPPER(?)";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESFACTCALCBYCT.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESFACTCALCBYCT.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.MODIFY_TIME = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSERVICESFACTCALCBYCT.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSERVICESFACTCALCBYCT.ACTREFCODE = ? ";
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
        if(aFilterObject.materialsCost != null){
            number++;
            aFilterObject.materialsCost = aFilterObject.materialsCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.materialsCost);
        }
        if(aFilterObject.transportCost != null){
            number++;
            aFilterObject.transportCost = aFilterObject.transportCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.transportCost);
        }
        if(aFilterObject.deliveryCost != null){
            number++;
            aFilterObject.deliveryCost = aFilterObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryCost);
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
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actRef.code);
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

        anObject = new ENServicesFactCalcByActShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.materialsCost = set.getBigDecimal(2);
        if(anObject.materialsCost != null)
            anObject.materialsCost = anObject.materialsCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportCost = set.getBigDecimal(3);
        if(anObject.transportCost != null)
            anObject.transportCost = anObject.transportCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.deliveryCost = set.getBigDecimal(4);
        if(anObject.deliveryCost != null)
            anObject.deliveryCost = anObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(5);
        anObject.dateEdit = set.getTimestamp(6);

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
        anObject.servicesObjectRefContragentObjectWork = set.getString(44);
        anObject.servicesObjectRefIsNoPay = set.getInt(45);
        if(set.wasNull())
        anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
        anObject.servicesObjectRefIsCustomerMaterials = set.getInt(46);
        if(set.wasNull())
        anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
        anObject.servicesObjectRefPayDate = set.getDate(47);
        anObject.servicesObjectRefFinPayFormCode = set.getInt(48);
        if(set.wasNull())
        anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefFinPayFormName = set.getString(49);
        anObject.servicesObjectRefPartnerId = set.getInt(50);
        if(set.wasNull())
        anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
        anObject.servicesObjectRefPayDetail = set.getString(51);
        anObject.servicesObjectRefActTransferNumber = set.getString(52);
        anObject.servicesObjectRefActTransferDate = set.getDate(53);
        anObject.servicesObjectRefResposible = set.getString(54);
        anObject.servicesObjectRefResposiblePosition = set.getString(55);
        anObject.servicesObjectRefResposibleTabNumber = set.getString(56);
        anObject.servicesObjectRefCnPackCode = set.getInt(57);
        if(set.wasNull())
        anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
        anObject.actRefCode = set.getInt(58);
        if(set.wasNull())
        anObject.actRefCode = Integer.MIN_VALUE;
        anObject.actRefNumberGen = set.getString(59);
        anObject.actRefDateGen = set.getDate(60);
        anObject.actRefFinDocCode = set.getInt(61);
        if(set.wasNull())
        anObject.actRefFinDocCode = Integer.MIN_VALUE;
        anObject.actRefFinDocMechanicCode = set.getInt(62);
        if(set.wasNull())
        anObject.actRefFinDocMechanicCode = Integer.MIN_VALUE;
        anObject.actRefFinMolName = set.getString(63);
        anObject.actRefFinMechanicName = set.getString(64);
        anObject.actRefInvNumber = set.getString(65);
        anObject.actRefUserGen = set.getString(66);
        anObject.actRefDateEdit = set.getDate(67);
        anObject.actRefDateAct = set.getDate(68);

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

  public int[] getFilteredCodeArrayOLD(ENServicesFactCalcByAct aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENSERVICESFACTCALCBYCT.CODE FROM ENSERVICESFACTCALCBYCT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSERVICESFACTCALCBYCT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.CODE = ?";
        }
        if(aFilterObject.materialsCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.MATERIALSCOST = ?";
        }
        if(aFilterObject.transportCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.TRANSPORTCOST = ?";
        }
        if(aFilterObject.deliveryCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.DELIVERYCOST = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.MODIFY_TIME = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSERVICESFACTCALCBYCT.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSERVICESFACTCALCBYCT.ACTREFCODE = ? ";
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
        if(aFilterObject.materialsCost != null){
            number++;
            aFilterObject.materialsCost = aFilterObject.materialsCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.materialsCost);
        }
        if(aFilterObject.transportCost != null){
            number++;
            aFilterObject.transportCost = aFilterObject.transportCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.transportCost);
        }
        if(aFilterObject.deliveryCost != null){
            number++;
            aFilterObject.deliveryCost = aFilterObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryCost);
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSERVICESFACTCALCBYCT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENSERVICESFACTCALCBYCT.COMMENTGEN LIKE ?";

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
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSERVICESFACTCALCBYCT.USERGEN = ?";
             else
                 whereStr = whereStr + " ENSERVICESFACTCALCBYCT.USERGEN LIKE ?";

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
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actRef.code);
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

  public int[] getFilteredCodeArray(ENServicesFactCalcByActFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENServicesFactCalcByAct aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENSERVICESFACTCALCBYCT.CODE FROM ENSERVICESFACTCALCBYCT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSERVICESFACTCALCBYCT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.CODE = ?";
        }
        if(aFilterObject.materialsCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.MATERIALSCOST = ?";
        }
        if(aFilterObject.transportCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.TRANSPORTCOST = ?";
        }
        if(aFilterObject.deliveryCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.DELIVERYCOST = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALCBYCT.MODIFY_TIME = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSERVICESFACTCALCBYCT.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSERVICESFACTCALCBYCT.ACTREFCODE = ? ";
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
        if(aFilterObject.materialsCost != null){
            number++;
            aFilterObject.materialsCost = aFilterObject.materialsCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.materialsCost);
        }
        if(aFilterObject.transportCost != null){
            number++;
            aFilterObject.transportCost = aFilterObject.transportCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.transportCost);
        }
        if(aFilterObject.deliveryCost != null){
            number++;
            aFilterObject.deliveryCost = aFilterObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryCost);
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSERVICESFACTCALCBYCT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENSERVICESFACTCALCBYCT.COMMENTGEN LIKE ?";

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
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSERVICESFACTCALCBYCT.USERGEN = ?";
             else
                 whereStr = whereStr + " ENSERVICESFACTCALCBYCT.USERGEN LIKE ?";

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
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actRef.code);
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


   public ENServicesFactCalcByAct getObject(int uid) throws PersistenceException
   {
    ENServicesFactCalcByAct result = new ENServicesFactCalcByAct();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENServicesFactCalcByAct anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENSERVICESFACTCALCBYCT.CODE, ENSERVICESFACTCALCBYCT.MATERIALSCOST, ENSERVICESFACTCALCBYCT.TRANSPORTCOST, ENSERVICESFACTCALCBYCT.DELIVERYCOST, ENSERVICESFACTCALCBYCT.COMMENTGEN, ENSERVICESFACTCALCBYCT.USERGEN, ENSERVICESFACTCALCBYCT.DATEEDIT, ENSERVICESFACTCALCBYCT.MODIFY_TIME, ENSERVICESFACTCALCBYCT.SERVICESOBJECTREFCODE, ENSERVICESFACTCALCBYCT.ACTREFCODE "
    +" FROM ENSERVICESFACTCALCBYCT WHERE ENSERVICESFACTCALCBYCT.CODE = ?";

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
        anObject.materialsCost = set.getBigDecimal(2);
        if(anObject.materialsCost != null)
            anObject.materialsCost = anObject.materialsCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportCost = set.getBigDecimal(3);
        if(anObject.transportCost != null)
            anObject.transportCost = anObject.transportCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.deliveryCost = set.getBigDecimal(4);
        if(anObject.deliveryCost != null)
            anObject.deliveryCost = anObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.commentGen = set.getString(5);
        anObject.userGen = set.getString(6);
        anObject.dateEdit = set.getTimestamp(7);
        anObject.modify_time = set.getLong(8);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.servicesObjectRef.code = set.getInt(9);
        if ( set.wasNull() )
            anObject.servicesObjectRef.code = Integer.MIN_VALUE;
        anObject.actRef.code = set.getInt(10);
        if ( set.wasNull() )
            anObject.actRef.code = Integer.MIN_VALUE;
        if(anObject.servicesObjectRef.code != Integer.MIN_VALUE)
        {
           anObject.setServicesObjectRef(
        new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.servicesObjectRef.code));
    }
        if(anObject.actRef.code != Integer.MIN_VALUE)
        {
           anObject.setActRef(
        new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).getRef(anObject.actRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENServicesFactCalcByActRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENServicesFactCalcByActRef ref = new com.ksoe.energynet.valueobject.references.ENServicesFactCalcByActRef();
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

    selectStr = "DELETE FROM  ENSERVICESFACTCALCBYCT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENServicesFactCalcByAct object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENServicesFactCalcByAct.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesFactCalcByAct.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENServicesFactCalcByAct.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesFactCalcByAct.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENServicesFactCalcByAct.getObject%} access denied");

    selectStr =

    "SELECT  ENSERVICESFACTCALCBYCT.CODE FROM  ENSERVICESFACTCALCBYCT WHERE  ENSERVICESFACTCALCBYCT.CODE = ?";
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
    _checkConditionToken(condition,"code","ENSERVICESFACTCALCBYCT.CODE");
    _checkConditionToken(condition,"materialscost","ENSERVICESFACTCALCBYCT.MATERIALSCOST");
    _checkConditionToken(condition,"transportcost","ENSERVICESFACTCALCBYCT.TRANSPORTCOST");
    _checkConditionToken(condition,"deliverycost","ENSERVICESFACTCALCBYCT.DELIVERYCOST");
    _checkConditionToken(condition,"commentgen","ENSERVICESFACTCALCBYCT.COMMENTGEN");
    _checkConditionToken(condition,"usergen","ENSERVICESFACTCALCBYCT.USERGEN");
    _checkConditionToken(condition,"dateedit","ENSERVICESFACTCALCBYCT.DATEEDIT");
    _checkConditionToken(condition,"modify_time","ENSERVICESFACTCALCBYCT.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
    _checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
    _checkConditionToken(condition,"actref","ACTREFCODE");
    _checkConditionToken(condition,"actref.code","ACTREFCODE");
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

   private void _collectAutoIncrementFields(ENServicesFactCalcByAct anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENSERVICESFACTCALCBYCT", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENSERVICESFACTCALCBYCT", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENSERVICESFACTCALCBYCT", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENSERVICESFACTCALCBYCT");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENServicesFactCalcByActDAO

