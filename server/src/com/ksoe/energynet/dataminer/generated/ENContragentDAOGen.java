
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
import com.ksoe.energynet.valueobject.ENContragent;
import com.ksoe.energynet.valueobject.brief.ENContragentShort;
import com.ksoe.energynet.valueobject.filter.ENContragentFilter;
import com.ksoe.energynet.valueobject.lists.ENContragentShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENContragent;
 *
 */

public class ENContragentDAOGen extends GenericDataMiner {

  public ENContragentDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENContragentDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENContragent inObject) throws PersistenceException
   {
      ENContragent obj = new ENContragent();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.contragentName != obj.contragentName){
       return false;
     }

     if (inObject.contragentAddress != obj.contragentAddress){
       return false;
     }

     if (inObject.contragentAddressWork != obj.contragentAddressWork){
       return false;
     }

     if (inObject.contragentPosition != obj.contragentPosition){
       return false;
     }

     if (inObject.contragentOkpo != obj.contragentOkpo){
       return false;
     }

     if (inObject.contragentBankAccount != obj.contragentBankAccount){
       return false;
     }

     if (inObject.contragentBankName != obj.contragentBankName){
       return false;
     }

     if (inObject.contragentBankMfo != obj.contragentBankMfo){
       return false;
     }

     if (inObject.contragentBossName != obj.contragentBossName){
       return false;
     }

     if (inObject.contragentPassport != obj.contragentPassport){
       return false;
     }

     if ( ! inObject.warrantDate.equals(obj.warrantDate)){
       return false;
     }

     if (inObject.warrantNumber != obj.warrantNumber){
       return false;
     }

     if (inObject.warrantFIO != obj.warrantFIO){
       return false;
     }

     if (inObject.warrantPassport != obj.warrantPassport){
       return false;
     }

     if (inObject.warrantAddress != obj.warrantAddress){
       return false;
     }

     if (inObject.techConditionsItem != obj.techConditionsItem){
       return false;
     }
     if (inObject.techConObjects.code != obj.techConObjects.code){
        return false;
     }
     if (inObject.basisType.code != obj.basisType.code){
        return false;
     }
     if (inObject.techCondServicesRef.code != obj.techCondServicesRef.code){
        return false;
     }
     if (inObject.contragentType.code != obj.contragentType.code){
        return false;
     }
      return true;
   }

   public int add(ENContragent anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENContragent anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENCONTRAGENT (CODE,CONTRAGENTNAME,CONTRAGENTADDRESS,CONTRAGENTADDRESSWORK,CONTRAGENTPOSITION,CONTRAGENTOKPO,CONTRAGENTBANKACCOUNT,CONTRAGENTBANKNAME,CONTRAGENTBANKMFO,CONTRAGENTBOSSNAME,CONTRAGENTPASSPORT,WARRANTDATE,WARRANTNUMBER,WARRANTFIO,WARRANTPASSPORT,WARRANTADDRESS,TECHCONDITIONSITEM,TECHCONOBJECTSCODE,BASISTYPECODE,TECHCONDSERVICESREFCOD,CONTRAGENTTYPECODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.contragentName);
      statement.setString(3,anObject.contragentAddress);
      statement.setString(4,anObject.contragentAddressWork);
      statement.setString(5,anObject.contragentPosition);
      statement.setString(6,anObject.contragentOkpo);
      statement.setString(7,anObject.contragentBankAccount);
      statement.setString(8,anObject.contragentBankName);
      statement.setString(9,anObject.contragentBankMfo);
      statement.setString(10,anObject.contragentBossName);
      statement.setString(11,anObject.contragentPassport);
      if (anObject.warrantDate == null)
        statement.setDate(12,null);
      else
        statement.setDate(12,new java.sql.Date(anObject.warrantDate.getTime()));
      statement.setString(13,anObject.warrantNumber);
      statement.setString(14,anObject.warrantFIO);
      statement.setString(15,anObject.warrantPassport);
      statement.setString(16,anObject.warrantAddress);
      statement.setString(17,anObject.techConditionsItem);
      if (anObject.techConObjects.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTechConditionsObjectsDAOGen(connection,getUserProfile()).exists(anObject.techConObjects.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENContragent.techConObjects.code%} = {%"+anObject.techConObjects.code+"%}");
        statement.setInt(18,anObject.techConObjects.code);
      }
      else
        statement.setNull(18,java.sql.Types.INTEGER);
      if (anObject.basisType.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENBasisTypeDAOGen(connection,getUserProfile()).exists(anObject.basisType.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENContragent.basisType.code%} = {%"+anObject.basisType.code+"%}");
        statement.setInt(19,anObject.basisType.code);
      }
      else
        statement.setNull(19,java.sql.Types.INTEGER);
      if (anObject.techCondServicesRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesDAOGen(connection,getUserProfile()).exists(anObject.techCondServicesRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENContragent.techCondServicesRef.code%} = {%"+anObject.techCondServicesRef.code+"%}");
        statement.setInt(20,anObject.techCondServicesRef.code);
      }
      else
        statement.setNull(20,java.sql.Types.INTEGER);
      if (anObject.contragentType.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENServicesContragentTypeDAOGen(connection,getUserProfile()).exists(anObject.contragentType.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENContragent.contragentType.code%} = {%"+anObject.contragentType.code+"%}");
        statement.setInt(21,anObject.contragentType.code);
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
      throw new PersistenceException("Error in method {%ENContragentDAOGen.add%}",e);
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

   public void save(ENContragent anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENContragent anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("CONTRAGENTADDRESSWORK") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRAGENTPOSITION") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRAGENTOKPO") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRAGENTBANKACCOUNT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRAGENTBANKNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRAGENTBANKMFO") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRAGENTBOSSNAME") == 0)
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
          if(fieldNameStr.compareTo("WARRANTDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("WARRANTNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("WARRANTFIO") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("WARRANTPASSPORT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("WARRANTADDRESS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TECHCONDITIONSITEM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TECHCONOBJECTS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("BASISTYPE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TECHCONDSERVICESREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRAGENTTYPE") == 0)
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
        "UPDATE ENCONTRAGENT SET  CONTRAGENTNAME = ? , CONTRAGENTADDRESS = ? , CONTRAGENTADDRESSWORK = ? , CONTRAGENTPOSITION = ? , CONTRAGENTOKPO = ? , CONTRAGENTBANKACCOUNT = ? , CONTRAGENTBANKNAME = ? , CONTRAGENTBANKMFO = ? , CONTRAGENTBOSSNAME = ? , CONTRAGENTPASSPORT = ? , WARRANTDATE = ? , WARRANTNUMBER = ? , WARRANTFIO = ? , WARRANTPASSPORT = ? , WARRANTADDRESS = ? , TECHCONDITIONSITEM = ? , TECHCONOBJECTSCODE = ? , BASISTYPECODE = ? , TECHCONDSERVICESREFCOD = ? , CONTRAGENTTYPECODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENCONTRAGENT SET ";
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
      statement.setString(1,anObject.contragentName);
      statement.setString(2,anObject.contragentAddress);
      statement.setString(3,anObject.contragentAddressWork);
      statement.setString(4,anObject.contragentPosition);
      statement.setString(5,anObject.contragentOkpo);
      statement.setString(6,anObject.contragentBankAccount);
      statement.setString(7,anObject.contragentBankName);
      statement.setString(8,anObject.contragentBankMfo);
      statement.setString(9,anObject.contragentBossName);
      statement.setString(10,anObject.contragentPassport);
      if (anObject.warrantDate == null)
        statement.setDate(11,null);
      else
        statement.setDate(11,new java.sql.Date(anObject.warrantDate.getTime()));
      statement.setString(12,anObject.warrantNumber);
      statement.setString(13,anObject.warrantFIO);
      statement.setString(14,anObject.warrantPassport);
      statement.setString(15,anObject.warrantAddress);
      statement.setString(16,anObject.techConditionsItem);
      if (anObject.techConObjects.code != Integer.MIN_VALUE)
        statement.setInt(17,anObject.techConObjects.code);
      else
        statement.setNull(17,java.sql.Types.INTEGER);
      if (anObject.basisType.code != Integer.MIN_VALUE)
        statement.setInt(18,anObject.basisType.code);
      else
        statement.setNull(18,java.sql.Types.INTEGER);
      if (anObject.techCondServicesRef.code != Integer.MIN_VALUE)
        statement.setInt(19,anObject.techCondServicesRef.code);
      else
        statement.setNull(19,java.sql.Types.INTEGER);
      if (anObject.contragentType.code != Integer.MIN_VALUE)
        statement.setInt(20,anObject.contragentType.code);
      else
        statement.setNull(20,java.sql.Types.INTEGER);
          statement.setInt(21,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
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
            if("CONTRAGENTADDRESSWORK".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.contragentAddressWork);
                continue;
             }
            if("CONTRAGENTPOSITION".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.contragentPosition);
                continue;
             }
            if("CONTRAGENTOKPO".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.contragentOkpo);
                continue;
             }
            if("CONTRAGENTBANKACCOUNT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.contragentBankAccount);
                continue;
             }
            if("CONTRAGENTBANKNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.contragentBankName);
                continue;
             }
            if("CONTRAGENTBANKMFO".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.contragentBankMfo);
                continue;
             }
            if("CONTRAGENTBOSSNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.contragentBossName);
                continue;
             }
            if("CONTRAGENTPASSPORT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.contragentPassport);
                continue;
             }
            if("WARRANTDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.warrantDate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.warrantDate.getTime()));
                continue;
             }
            if("WARRANTNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.warrantNumber);
                continue;
             }
            if("WARRANTFIO".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.warrantFIO);
                continue;
             }
            if("WARRANTPASSPORT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.warrantPassport);
                continue;
             }
            if("WARRANTADDRESS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.warrantAddress);
                continue;
             }
            if("TECHCONDITIONSITEM".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.techConditionsItem);
                continue;
             }
            if("TECHCONOBJECTS".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.techConObjects.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.techConObjects.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("BASISTYPE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.basisType.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.basisType.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TECHCONDSERVICESREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.techCondServicesRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.techCondServicesRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("CONTRAGENTTYPE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.contragentType.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.contragentType.code);
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

   } // end of save(ENContragent anObject,String[] anAttributes)


 public ENContragentShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENContragent filterObject = new ENContragent();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENContragentShort)list.get(0);
   return null;
  }

  public ENContragentShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENContragentShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENContragentShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENContragentShortList getFilteredList(ENContragent filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENContragentShortList getScrollableFilteredList(ENContragent aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENContragentShortList getScrollableFilteredList(ENContragent aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENContragentShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENContragentShortList getScrollableFilteredList(ENContragentFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENContragentShortList getScrollableFilteredList(ENContragentFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENContragentShortList getScrollableFilteredList(ENContragent aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENContragentShortList getScrollableFilteredList(ENContragent aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENContragentShortList result = new ENContragentShortList();
    ENContragentShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCONTRAGENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENCONTRAGENT.CODE"+
     ",ENCONTRAGENT.CONTRAGENTNAME"+
     ",ENCONTRAGENT.CONTRAGENTADDRESS"+
     ",ENCONTRAGENT.CONTRAGENTADDRESSWORK"+
     ",ENCONTRAGENT.CONTRAGENTPOSITION"+
     ",ENCONTRAGENT.CONTRAGENTOKPO"+
     ",ENCONTRAGENT.CONTRAGENTBANKACCOUNT"+
     ",ENCONTRAGENT.CONTRAGENTBANKNAME"+
     ",ENCONTRAGENT.CONTRAGENTBANKMFO"+
     ",ENCONTRAGENT.CONTRAGENTBOSSNAME"+
     ",ENCONTRAGENT.CONTRAGENTPASSPORT"+
     ",ENCONTRAGENT.WARRANTDATE"+
     ",ENCONTRAGENT.WARRANTNUMBER"+
     ",ENCONTRAGENT.WARRANTFIO"+
     ",ENCONTRAGENT.WARRANTPASSPORT"+
     ",ENCONTRAGENT.WARRANTADDRESS"+
     ",ENCONTRAGENT.TECHCONDITIONSITEM"+

      ", ENTECHCONDITIONSOBJCTS.CODE " +
      ", ENTECHCONDITIONSOBJCTS.NUMBERGEN " +
      ", ENTECHCONDITIONSOBJCTS.DATEGEN " +
      ", ENTECHCONDITIONSOBJCTS.CUSTOMER " +
      ", ENTECHCONDITIONSOBJCTS.BUILDING " +
      ", ENTECHCONDITIONSOBJCTS.ADDRESS " +
      ", ENTECHCONDITIONSOBJCTS.TYCURRENTPOWER " +
      ", ENTECHCONDITIONSOBJCTS.TYSERVICESPOWER " +
      ", ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACES " +
      ", ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINT " +
      ", ENTECHCONDITIONSOBJCTS.USERGEN " +
      ", ENTECHCONDITIONSOBJCTS.DATEEDIT " +
      ", ENBASISTYPE.CODE " +
      ", ENBASISTYPE.NAME " +
      ", ENTECHCONDITIONSSERVCS.CODE " +
      ", ENTECHCONDITIONSSERVCS.CONTRACTNUMBER " +
      ", ENTECHCONDITIONSSERVCS.CONTRACTDATE " +
      ", ENTECHCONDITIONSSERVCS.FINCONTRACTNUMBER " +
      ", ENTECHCONDITIONSSERVCS.FINCONTRACTDATE " +
      ", ENTECHCONDITIONSSERVCS.PARTNERNAME " +
      ", ENTECHCONDITIONSSERVCS.PARTNERCODE " +
      ", ENTECHCONDITIONSSERVCS.FINDOCCODE " +
      ", ENTECHCONDITIONSSERVCS.FINDOCID " +
      ", ENTECHCONDITIONSSERVCS.FINCOMMENTGEN " +
      ", ENTECHCONDITIONSSERVCS.TYSUMMAGEN " +
      ", ENTECHCONDITIONSSERVCS.TYSUMMAVAT " +
      ", ENTECHCONDITIONSSERVCS.TYSERVICESSUMMA " +
      ", ENTECHCONDITIONSSERVCS.TYSERVICESPOWER " +
      ", ENTECHCONDITIONSSERVCS.COMMENTSERVICESGEN " +
      ", ENTECHCONDITIONSSERVCS.USERGEN " +
      ", ENTECHCONDITIONSSERVCS.DATEEDIT " +
      ", ENTECHCONDITIONSSERVCS.CNPACKCODE " +
      ", ENTECHCONDITIONSSERVCS.EXECUTIONTERM " +
      ", ENTECHCONDITIONSSERVCS.BUILDERSAREA " +
      ", ENTECHCONDITIONSSERVCS.BASESTATION " +
      ", ENTECHCONDITIONSSERVCS.SMALLARCHFRM " +
      ", ENTECHCONDITIONSSERVCS.CONTRACTDATEFINAL " +
      ", ENTECHCONDITIONSSERVCS.ISSEA " +
      ", ENTECHCONDITIONSSERVCS.ISDISCONNECTIONNEEDED " +
      ", ENSERVICESCONTRAGENTTP.CODE " +
      ", ENSERVICESCONTRAGENTTP.NAME " +
     " FROM ENCONTRAGENT " +
     ", ENTECHCONDITIONSOBJCTS " +
     ", ENBASISTYPE " +
     ", ENTECHCONDITIONSSERVCS " +
     ", ENSERVICESCONTRAGENTTP " +
     //" WHERE "
    "";
     whereStr = " ENTECHCONDITIONSOBJCTS.CODE = ENCONTRAGENT.TECHCONOBJECTSCODE" ; //+
      whereStr = whereStr +" AND ENBASISTYPE.CODE = ENCONTRAGENT.BASISTYPECODE" ; //+
      whereStr = whereStr +" AND ENTECHCONDITIONSSERVCS.CODE = ENCONTRAGENT.TECHCONDSERVICESREFCOD" ; //+
      whereStr = whereStr +" AND ENSERVICESCONTRAGENTTP.CODE = ENCONTRAGENT.CONTRAGENTTYPECODE" ; //+
        //selectStr = selectStr + " ${s} ENCONTRAGENT.CODE IN ( SELECT ENCONTRAGENT.CODE FROM ENCONTRAGENT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRAGENT.CODE = ?";
        }
         if (aFilterObject.contragentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentAddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTADDRESS) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTADDRESS) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentAddressWork != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentAddressWork.indexOf('*',0) < 0 && aFilterObject.contragentAddressWork.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTADDRESSWORK) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTADDRESSWORK) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentPosition != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentPosition.indexOf('*',0) < 0 && aFilterObject.contragentPosition.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTPOSITION) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTPOSITION) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentOkpo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentOkpo.indexOf('*',0) < 0 && aFilterObject.contragentOkpo.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTOKPO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTOKPO) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentBankAccount != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBankAccount.indexOf('*',0) < 0 && aFilterObject.contragentBankAccount.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTBANKACCOUNT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTBANKACCOUNT) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentBankName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBankName.indexOf('*',0) < 0 && aFilterObject.contragentBankName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTBANKNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTBANKNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentBankMfo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBankMfo.indexOf('*',0) < 0 && aFilterObject.contragentBankMfo.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTBANKMFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTBANKMFO) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentBossName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBossName.indexOf('*',0) < 0 && aFilterObject.contragentBossName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTBOSSNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTBOSSNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentPassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.CONTRAGENTPASSPORT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.CONTRAGENTPASSPORT) LIKE UPPER(?)";
         }
        if(aFilterObject.warrantDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRAGENT.WARRANTDATE = ?";
        }
         if (aFilterObject.warrantNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.warrantNumber.indexOf('*',0) < 0 && aFilterObject.warrantNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.WARRANTNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.WARRANTNUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.warrantFIO != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.warrantFIO.indexOf('*',0) < 0 && aFilterObject.warrantFIO.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.WARRANTFIO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.WARRANTFIO) LIKE UPPER(?)";
         }
         if (aFilterObject.warrantPassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.warrantPassport.indexOf('*',0) < 0 && aFilterObject.warrantPassport.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.WARRANTPASSPORT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.WARRANTPASSPORT) LIKE UPPER(?)";
         }
         if (aFilterObject.warrantAddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.warrantAddress.indexOf('*',0) < 0 && aFilterObject.warrantAddress.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.WARRANTADDRESS) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.WARRANTADDRESS) LIKE UPPER(?)";
         }
         if (aFilterObject.techConditionsItem != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.techConditionsItem.indexOf('*',0) < 0 && aFilterObject.techConditionsItem.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCONTRAGENT.TECHCONDITIONSITEM) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCONTRAGENT.TECHCONDITIONSITEM) LIKE UPPER(?)";
         }
        if(aFilterObject.techConObjects.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCONTRAGENT.TECHCONOBJECTSCODE = ? ";
        }
        if(aFilterObject.basisType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCONTRAGENT.BASISTYPECODE = ? ";
        }
        if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCONTRAGENT.TECHCONDSERVICESREFCOD = ? ";
        }
        if(aFilterObject.contragentType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCONTRAGENT.CONTRAGENTTYPECODE = ? ";
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

           if(aFilterObject.contragentAddressWork != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentAddressWork);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentPosition != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentPosition);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentOkpo != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentOkpo);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentBankAccount != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBankAccount);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentBankName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBankName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentBankMfo != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBankMfo);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentBossName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBossName);
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
        if(aFilterObject.warrantDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.warrantDate.getTime()));
        }

           if(aFilterObject.warrantNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.warrantNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.warrantFIO != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.warrantFIO);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.warrantPassport != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.warrantPassport);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.warrantAddress != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.warrantAddress);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.techConditionsItem != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.techConditionsItem);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
       if(aFilterObject.techConObjects.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techConObjects.code);
       }
       if(aFilterObject.basisType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.basisType.code);
       }
       if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServicesRef.code);
       }
       if(aFilterObject.contragentType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.contragentType.code);
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

        anObject = new ENContragentShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.contragentName = set.getString(2);
        anObject.contragentAddress = set.getString(3);
        anObject.contragentAddressWork = set.getString(4);
        anObject.contragentPosition = set.getString(5);
        anObject.contragentOkpo = set.getString(6);
        anObject.contragentBankAccount = set.getString(7);
        anObject.contragentBankName = set.getString(8);
        anObject.contragentBankMfo = set.getString(9);
        anObject.contragentBossName = set.getString(10);
        anObject.contragentPassport = set.getString(11);
        anObject.warrantDate = set.getDate(12);
        anObject.warrantNumber = set.getString(13);
        anObject.warrantFIO = set.getString(14);
        anObject.warrantPassport = set.getString(15);
        anObject.warrantAddress = set.getString(16);
        anObject.techConditionsItem = set.getString(17);

        anObject.techConObjectsCode = set.getInt(18);
        if(set.wasNull())
        anObject.techConObjectsCode = Integer.MIN_VALUE;
        anObject.techConObjectsNumberGen = set.getString(19);
        anObject.techConObjectsDateGen = set.getDate(20);
        anObject.techConObjectsCustomer = set.getString(21);
        anObject.techConObjectsBuilding = set.getString(22);
        anObject.techConObjectsAddress = set.getString(23);
        anObject.techConObjectsTyCurrentPower = set.getBigDecimal(24);
        if(anObject.techConObjectsTyCurrentPower != null)
          anObject.techConObjectsTyCurrentPower = anObject.techConObjectsTyCurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techConObjectsTyServicesPower = set.getBigDecimal(25);
        if(anObject.techConObjectsTyServicesPower != null)
          anObject.techConObjectsTyServicesPower = anObject.techConObjectsTyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.basisTypeCode = set.getInt(30);
        if(set.wasNull())
        anObject.basisTypeCode = Integer.MIN_VALUE;
        anObject.basisTypeName = set.getString(31);
        anObject.techCondServicesRefCode = set.getInt(32);
        if(set.wasNull())
        anObject.techCondServicesRefCode = Integer.MIN_VALUE;
        anObject.techCondServicesRefContractNumber = set.getString(33);
        anObject.techCondServicesRefContractDate = set.getDate(34);
        anObject.techCondServicesRefFinContractNumber = set.getString(35);
        anObject.techCondServicesRefFinContractDate = set.getDate(36);
        anObject.techCondServicesRefPartnerName = set.getString(37);
        anObject.techCondServicesRefPartnerCode = set.getString(38);
        anObject.techCondServicesRefFinDocCode = set.getString(39);
        anObject.techCondServicesRefFinDocID = set.getInt(40);
        if(set.wasNull())
        anObject.techCondServicesRefFinDocID = Integer.MIN_VALUE;
        anObject.techCondServicesRefFinCommentGen = set.getString(41);
        anObject.techCondServicesRefTySummaGen = set.getBigDecimal(42);
        if(anObject.techCondServicesRefTySummaGen != null)
          anObject.techCondServicesRefTySummaGen = anObject.techCondServicesRefTySummaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServicesRefTySummaVat = set.getBigDecimal(43);
        if(anObject.techCondServicesRefTySummaVat != null)
          anObject.techCondServicesRefTySummaVat = anObject.techCondServicesRefTySummaVat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServicesRefTyServicesSumma = set.getBigDecimal(44);
        if(anObject.techCondServicesRefTyServicesSumma != null)
          anObject.techCondServicesRefTyServicesSumma = anObject.techCondServicesRefTyServicesSumma.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServicesRefTyServicesPower = set.getBigDecimal(45);
        if(anObject.techCondServicesRefTyServicesPower != null)
          anObject.techCondServicesRefTyServicesPower = anObject.techCondServicesRefTyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServicesRefCommentServicesGen = set.getString(46);
        anObject.techCondServicesRefUserGen = set.getString(47);
        anObject.techCondServicesRefDateEdit = set.getDate(48);
        anObject.techCondServicesRefCnPackCode = set.getInt(49);
        if(set.wasNull())
        anObject.techCondServicesRefCnPackCode = Integer.MIN_VALUE;

        anObject.contragentTypeCode = set.getInt(57);
        if(set.wasNull())
        anObject.contragentTypeCode = Integer.MIN_VALUE;
        anObject.contragentTypeName = set.getString(58);

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

  public int[] getFilteredCodeArrayOLD(ENContragent aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCONTRAGENT.CODE FROM ENCONTRAGENT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCONTRAGENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRAGENT.CODE = ?";
        }
         if (aFilterObject.contragentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTNAME = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTNAME LIKE ?";
         }
         if (aFilterObject.contragentAddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTADDRESS = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTADDRESS LIKE ?";
         }
         if (aFilterObject.contragentAddressWork != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentAddressWork.indexOf('*',0) < 0 && aFilterObject.contragentAddressWork.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTADDRESSWORK = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTADDRESSWORK LIKE ?";
         }
         if (aFilterObject.contragentPosition != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentPosition.indexOf('*',0) < 0 && aFilterObject.contragentPosition.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTPOSITION = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTPOSITION LIKE ?";
         }
         if (aFilterObject.contragentOkpo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentOkpo.indexOf('*',0) < 0 && aFilterObject.contragentOkpo.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTOKPO = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTOKPO LIKE ?";
         }
         if (aFilterObject.contragentBankAccount != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBankAccount.indexOf('*',0) < 0 && aFilterObject.contragentBankAccount.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTBANKACCOUNT = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTBANKACCOUNT LIKE ?";
         }
         if (aFilterObject.contragentBankName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBankName.indexOf('*',0) < 0 && aFilterObject.contragentBankName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTBANKNAME = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTBANKNAME LIKE ?";
         }
         if (aFilterObject.contragentBankMfo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBankMfo.indexOf('*',0) < 0 && aFilterObject.contragentBankMfo.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTBANKMFO = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTBANKMFO LIKE ?";
         }
         if (aFilterObject.contragentBossName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBossName.indexOf('*',0) < 0 && aFilterObject.contragentBossName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTBOSSNAME = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTBOSSNAME LIKE ?";
         }
         if (aFilterObject.contragentPassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTPASSPORT = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTPASSPORT LIKE ?";
         }
        if(aFilterObject.warrantDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRAGENT.WARRANTDATE = ?";
        }
         if (aFilterObject.warrantNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.warrantNumber.indexOf('*',0) < 0 && aFilterObject.warrantNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.WARRANTNUMBER = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.WARRANTNUMBER LIKE ?";
         }
         if (aFilterObject.warrantFIO != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.warrantFIO.indexOf('*',0) < 0 && aFilterObject.warrantFIO.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.WARRANTFIO = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.WARRANTFIO LIKE ?";
         }
         if (aFilterObject.warrantPassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.warrantPassport.indexOf('*',0) < 0 && aFilterObject.warrantPassport.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.WARRANTPASSPORT = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.WARRANTPASSPORT LIKE ?";
         }
         if (aFilterObject.warrantAddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.warrantAddress.indexOf('*',0) < 0 && aFilterObject.warrantAddress.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.WARRANTADDRESS = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.WARRANTADDRESS LIKE ?";
         }
         if (aFilterObject.techConditionsItem != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.techConditionsItem.indexOf('*',0) < 0 && aFilterObject.techConditionsItem.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.TECHCONDITIONSITEM = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.TECHCONDITIONSITEM LIKE ?";
         }
        if(aFilterObject.techConObjects.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCONTRAGENT.TECHCONOBJECTSCODE = ? ";
        }
        if(aFilterObject.basisType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCONTRAGENT.BASISTYPECODE = ? ";
        }
        if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCONTRAGENT.TECHCONDSERVICESREFCOD = ? ";
        }
        if(aFilterObject.contragentType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTTYPECODE = ? ";
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
         if (aFilterObject.contragentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTNAME = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTNAME LIKE ?";

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
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTADDRESS = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTADDRESS LIKE ?";

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
         if (aFilterObject.contragentAddressWork != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentAddressWork.indexOf('*',0) < 0 && aFilterObject.contragentAddressWork.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTADDRESSWORK = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTADDRESSWORK LIKE ?";

           if(aFilterObject.contragentAddressWork != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentAddressWork);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentPosition != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentPosition.indexOf('*',0) < 0 && aFilterObject.contragentPosition.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTPOSITION = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTPOSITION LIKE ?";

           if(aFilterObject.contragentPosition != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentPosition);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentOkpo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentOkpo.indexOf('*',0) < 0 && aFilterObject.contragentOkpo.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTOKPO = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTOKPO LIKE ?";

           if(aFilterObject.contragentOkpo != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentOkpo);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentBankAccount != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentBankAccount.indexOf('*',0) < 0 && aFilterObject.contragentBankAccount.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTBANKACCOUNT = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTBANKACCOUNT LIKE ?";

           if(aFilterObject.contragentBankAccount != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBankAccount);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentBankName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentBankName.indexOf('*',0) < 0 && aFilterObject.contragentBankName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTBANKNAME = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTBANKNAME LIKE ?";

           if(aFilterObject.contragentBankName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBankName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentBankMfo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentBankMfo.indexOf('*',0) < 0 && aFilterObject.contragentBankMfo.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTBANKMFO = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTBANKMFO LIKE ?";

           if(aFilterObject.contragentBankMfo != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBankMfo);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentBossName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentBossName.indexOf('*',0) < 0 && aFilterObject.contragentBossName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTBOSSNAME = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTBOSSNAME LIKE ?";

           if(aFilterObject.contragentBossName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBossName);
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
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTPASSPORT = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTPASSPORT LIKE ?";

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
        if(aFilterObject.warrantDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.warrantDate.getTime()));
        }
         if (aFilterObject.warrantNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.warrantNumber.indexOf('*',0) < 0 && aFilterObject.warrantNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.WARRANTNUMBER = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.WARRANTNUMBER LIKE ?";

           if(aFilterObject.warrantNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.warrantNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.warrantFIO != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.warrantFIO.indexOf('*',0) < 0 && aFilterObject.warrantFIO.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.WARRANTFIO = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.WARRANTFIO LIKE ?";

           if(aFilterObject.warrantFIO != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.warrantFIO);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.warrantPassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.warrantPassport.indexOf('*',0) < 0 && aFilterObject.warrantPassport.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.WARRANTPASSPORT = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.WARRANTPASSPORT LIKE ?";

           if(aFilterObject.warrantPassport != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.warrantPassport);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.warrantAddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.warrantAddress.indexOf('*',0) < 0 && aFilterObject.warrantAddress.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.WARRANTADDRESS = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.WARRANTADDRESS LIKE ?";

           if(aFilterObject.warrantAddress != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.warrantAddress);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.techConditionsItem != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.techConditionsItem.indexOf('*',0) < 0 && aFilterObject.techConditionsItem.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.TECHCONDITIONSITEM = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.TECHCONDITIONSITEM LIKE ?";

           if(aFilterObject.techConditionsItem != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.techConditionsItem);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
       if(aFilterObject.techConObjects.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techConObjects.code);
       }
       if(aFilterObject.basisType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.basisType.code);
       }
       if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServicesRef.code);
       }
       if(aFilterObject.contragentType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.contragentType.code);
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

  public int[] getFilteredCodeArray(ENContragentFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENContragent aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCONTRAGENT.CODE FROM ENCONTRAGENT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCONTRAGENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRAGENT.CODE = ?";
        }
         if (aFilterObject.contragentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTNAME = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTNAME LIKE ?";
         }
         if (aFilterObject.contragentAddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTADDRESS = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTADDRESS LIKE ?";
         }
         if (aFilterObject.contragentAddressWork != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentAddressWork.indexOf('*',0) < 0 && aFilterObject.contragentAddressWork.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTADDRESSWORK = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTADDRESSWORK LIKE ?";
         }
         if (aFilterObject.contragentPosition != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentPosition.indexOf('*',0) < 0 && aFilterObject.contragentPosition.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTPOSITION = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTPOSITION LIKE ?";
         }
         if (aFilterObject.contragentOkpo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentOkpo.indexOf('*',0) < 0 && aFilterObject.contragentOkpo.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTOKPO = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTOKPO LIKE ?";
         }
         if (aFilterObject.contragentBankAccount != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBankAccount.indexOf('*',0) < 0 && aFilterObject.contragentBankAccount.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTBANKACCOUNT = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTBANKACCOUNT LIKE ?";
         }
         if (aFilterObject.contragentBankName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBankName.indexOf('*',0) < 0 && aFilterObject.contragentBankName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTBANKNAME = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTBANKNAME LIKE ?";
         }
         if (aFilterObject.contragentBankMfo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBankMfo.indexOf('*',0) < 0 && aFilterObject.contragentBankMfo.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTBANKMFO = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTBANKMFO LIKE ?";
         }
         if (aFilterObject.contragentBossName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentBossName.indexOf('*',0) < 0 && aFilterObject.contragentBossName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTBOSSNAME = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTBOSSNAME LIKE ?";
         }
         if (aFilterObject.contragentPassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTPASSPORT = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.CONTRAGENTPASSPORT LIKE ?";
         }
        if(aFilterObject.warrantDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCONTRAGENT.WARRANTDATE = ?";
        }
         if (aFilterObject.warrantNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.warrantNumber.indexOf('*',0) < 0 && aFilterObject.warrantNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.WARRANTNUMBER = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.WARRANTNUMBER LIKE ?";
         }
         if (aFilterObject.warrantFIO != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.warrantFIO.indexOf('*',0) < 0 && aFilterObject.warrantFIO.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.WARRANTFIO = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.WARRANTFIO LIKE ?";
         }
         if (aFilterObject.warrantPassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.warrantPassport.indexOf('*',0) < 0 && aFilterObject.warrantPassport.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.WARRANTPASSPORT = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.WARRANTPASSPORT LIKE ?";
         }
         if (aFilterObject.warrantAddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.warrantAddress.indexOf('*',0) < 0 && aFilterObject.warrantAddress.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.WARRANTADDRESS = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.WARRANTADDRESS LIKE ?";
         }
         if (aFilterObject.techConditionsItem != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.techConditionsItem.indexOf('*',0) < 0 && aFilterObject.techConditionsItem.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCONTRAGENT.TECHCONDITIONSITEM = ?";
             else
                 whereStr = whereStr + "  ENCONTRAGENT.TECHCONDITIONSITEM LIKE ?";
         }
        if(aFilterObject.techConObjects.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCONTRAGENT.TECHCONOBJECTSCODE = ? ";
        }
        if(aFilterObject.basisType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCONTRAGENT.BASISTYPECODE = ? ";
        }
        if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCONTRAGENT.TECHCONDSERVICESREFCOD = ? ";
        }
        if(aFilterObject.contragentType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTTYPECODE = ? ";
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
         if (aFilterObject.contragentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTNAME = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTNAME LIKE ?";

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
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTADDRESS = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTADDRESS LIKE ?";

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
         if (aFilterObject.contragentAddressWork != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentAddressWork.indexOf('*',0) < 0 && aFilterObject.contragentAddressWork.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTADDRESSWORK = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTADDRESSWORK LIKE ?";

           if(aFilterObject.contragentAddressWork != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentAddressWork);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentPosition != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentPosition.indexOf('*',0) < 0 && aFilterObject.contragentPosition.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTPOSITION = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTPOSITION LIKE ?";

           if(aFilterObject.contragentPosition != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentPosition);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentOkpo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentOkpo.indexOf('*',0) < 0 && aFilterObject.contragentOkpo.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTOKPO = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTOKPO LIKE ?";

           if(aFilterObject.contragentOkpo != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentOkpo);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentBankAccount != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentBankAccount.indexOf('*',0) < 0 && aFilterObject.contragentBankAccount.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTBANKACCOUNT = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTBANKACCOUNT LIKE ?";

           if(aFilterObject.contragentBankAccount != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBankAccount);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentBankName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentBankName.indexOf('*',0) < 0 && aFilterObject.contragentBankName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTBANKNAME = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTBANKNAME LIKE ?";

           if(aFilterObject.contragentBankName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBankName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentBankMfo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentBankMfo.indexOf('*',0) < 0 && aFilterObject.contragentBankMfo.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTBANKMFO = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTBANKMFO LIKE ?";

           if(aFilterObject.contragentBankMfo != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBankMfo);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentBossName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentBossName.indexOf('*',0) < 0 && aFilterObject.contragentBossName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTBOSSNAME = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTBOSSNAME LIKE ?";

           if(aFilterObject.contragentBossName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentBossName);
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
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTPASSPORT = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.CONTRAGENTPASSPORT LIKE ?";

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
        if(aFilterObject.warrantDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.warrantDate.getTime()));
        }
         if (aFilterObject.warrantNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.warrantNumber.indexOf('*',0) < 0 && aFilterObject.warrantNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.WARRANTNUMBER = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.WARRANTNUMBER LIKE ?";

           if(aFilterObject.warrantNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.warrantNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.warrantFIO != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.warrantFIO.indexOf('*',0) < 0 && aFilterObject.warrantFIO.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.WARRANTFIO = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.WARRANTFIO LIKE ?";

           if(aFilterObject.warrantFIO != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.warrantFIO);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.warrantPassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.warrantPassport.indexOf('*',0) < 0 && aFilterObject.warrantPassport.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.WARRANTPASSPORT = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.WARRANTPASSPORT LIKE ?";

           if(aFilterObject.warrantPassport != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.warrantPassport);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.warrantAddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.warrantAddress.indexOf('*',0) < 0 && aFilterObject.warrantAddress.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.WARRANTADDRESS = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.WARRANTADDRESS LIKE ?";

           if(aFilterObject.warrantAddress != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.warrantAddress);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.techConditionsItem != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.techConditionsItem.indexOf('*',0) < 0 && aFilterObject.techConditionsItem.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCONTRAGENT.TECHCONDITIONSITEM = ?";
             else
                 whereStr = whereStr + " ENCONTRAGENT.TECHCONDITIONSITEM LIKE ?";

           if(aFilterObject.techConditionsItem != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.techConditionsItem);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
       if(aFilterObject.techConObjects.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techConObjects.code);
       }
       if(aFilterObject.basisType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.basisType.code);
       }
       if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServicesRef.code);
       }
       if(aFilterObject.contragentType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.contragentType.code);
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


   public ENContragent getObject(int uid) throws PersistenceException
   {
    ENContragent result = new ENContragent();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENContragent anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENCONTRAGENT.CODE, ENCONTRAGENT.CONTRAGENTNAME, ENCONTRAGENT.CONTRAGENTADDRESS, ENCONTRAGENT.CONTRAGENTADDRESSWORK, ENCONTRAGENT.CONTRAGENTPOSITION, ENCONTRAGENT.CONTRAGENTOKPO, ENCONTRAGENT.CONTRAGENTBANKACCOUNT, ENCONTRAGENT.CONTRAGENTBANKNAME, ENCONTRAGENT.CONTRAGENTBANKMFO, ENCONTRAGENT.CONTRAGENTBOSSNAME, ENCONTRAGENT.CONTRAGENTPASSPORT, ENCONTRAGENT.WARRANTDATE, ENCONTRAGENT.WARRANTNUMBER, ENCONTRAGENT.WARRANTFIO, ENCONTRAGENT.WARRANTPASSPORT, ENCONTRAGENT.WARRANTADDRESS, ENCONTRAGENT.TECHCONDITIONSITEM, ENCONTRAGENT.TECHCONOBJECTSCODE, ENCONTRAGENT.BASISTYPECODE, ENCONTRAGENT.TECHCONDSERVICESREFCOD, ENCONTRAGENT.CONTRAGENTTYPECODE "
    +" FROM ENCONTRAGENT WHERE ENCONTRAGENT.CODE = ?";

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
        anObject.contragentName = set.getString(2);
        anObject.contragentAddress = set.getString(3);
        anObject.contragentAddressWork = set.getString(4);
        anObject.contragentPosition = set.getString(5);
        anObject.contragentOkpo = set.getString(6);
        anObject.contragentBankAccount = set.getString(7);
        anObject.contragentBankName = set.getString(8);
        anObject.contragentBankMfo = set.getString(9);
        anObject.contragentBossName = set.getString(10);
        anObject.contragentPassport = set.getString(11);
        anObject.warrantDate = set.getDate(12);
        anObject.warrantNumber = set.getString(13);
        anObject.warrantFIO = set.getString(14);
        anObject.warrantPassport = set.getString(15);
        anObject.warrantAddress = set.getString(16);
        anObject.techConditionsItem = set.getString(17);
        anObject.techConObjects.code = set.getInt(18);
        if ( set.wasNull() )
            anObject.techConObjects.code = Integer.MIN_VALUE;
        anObject.basisType.code = set.getInt(19);
        if ( set.wasNull() )
            anObject.basisType.code = Integer.MIN_VALUE;
        anObject.techCondServicesRef.code = set.getInt(20);
        if ( set.wasNull() )
            anObject.techCondServicesRef.code = Integer.MIN_VALUE;
        anObject.contragentType.code = set.getInt(21);
        if ( set.wasNull() )
            anObject.contragentType.code = Integer.MIN_VALUE;
        if(anObject.techConObjects.code != Integer.MIN_VALUE)
        {
           anObject.setTechConObjects(
        new com.ksoe.energynet.dataminer.generated.ENTechConditionsObjectsDAOGen(connection,getUserProfile()).getObject(anObject.techConObjects.code));
    }
        if(anObject.basisType.code != Integer.MIN_VALUE)
        {
           anObject.setBasisType(
        new com.ksoe.energynet.dataminer.generated.ENBasisTypeDAOGen(connection,getUserProfile()).getObject(anObject.basisType.code));
    }
        if(anObject.techCondServicesRef.code != Integer.MIN_VALUE)
        {
           anObject.setTechCondServicesRef(
        new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesDAOGen(connection,getUserProfile()).getRef(anObject.techCondServicesRef.code));
    }
        if(anObject.contragentType.code != Integer.MIN_VALUE)
        {
           anObject.setContragentType(
        new com.ksoe.energynet.dataminer.generated.ENServicesContragentTypeDAOGen(connection,getUserProfile()).getObject(anObject.contragentType.code));
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


  public com.ksoe.energynet.valueobject.references.ENContragentRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENContragentRef ref = new com.ksoe.energynet.valueobject.references.ENContragentRef();
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

    selectStr = "DELETE FROM  ENCONTRAGENT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENContragent object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENContragent.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENContragent.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENContragent.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENContragent.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENContragent.getObject%} access denied");

    selectStr =

    "SELECT  ENCONTRAGENT.CODE FROM  ENCONTRAGENT WHERE  ENCONTRAGENT.CODE = ?";
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
    _checkConditionToken(condition,"code","ENCONTRAGENT.CODE");
    _checkConditionToken(condition,"contragentname","ENCONTRAGENT.CONTRAGENTNAME");
    _checkConditionToken(condition,"contragentaddress","ENCONTRAGENT.CONTRAGENTADDRESS");
    _checkConditionToken(condition,"contragentaddresswork","ENCONTRAGENT.CONTRAGENTADDRESSWORK");
    _checkConditionToken(condition,"contragentposition","ENCONTRAGENT.CONTRAGENTPOSITION");
    _checkConditionToken(condition,"contragentokpo","ENCONTRAGENT.CONTRAGENTOKPO");
    _checkConditionToken(condition,"contragentbankaccount","ENCONTRAGENT.CONTRAGENTBANKACCOUNT");
    _checkConditionToken(condition,"contragentbankname","ENCONTRAGENT.CONTRAGENTBANKNAME");
    _checkConditionToken(condition,"contragentbankmfo","ENCONTRAGENT.CONTRAGENTBANKMFO");
    _checkConditionToken(condition,"contragentbossname","ENCONTRAGENT.CONTRAGENTBOSSNAME");
    _checkConditionToken(condition,"contragentpassport","ENCONTRAGENT.CONTRAGENTPASSPORT");
    _checkConditionToken(condition,"warrantdate","ENCONTRAGENT.WARRANTDATE");
    _checkConditionToken(condition,"warrantnumber","ENCONTRAGENT.WARRANTNUMBER");
    _checkConditionToken(condition,"warrantfio","ENCONTRAGENT.WARRANTFIO");
    _checkConditionToken(condition,"warrantpassport","ENCONTRAGENT.WARRANTPASSPORT");
    _checkConditionToken(condition,"warrantaddress","ENCONTRAGENT.WARRANTADDRESS");
    _checkConditionToken(condition,"techconditionsitem","ENCONTRAGENT.TECHCONDITIONSITEM");
      // relationship conditions
    _checkConditionToken(condition,"techconobjects","TECHCONOBJECTSCODE");
    _checkConditionToken(condition,"techconobjects.code","TECHCONOBJECTSCODE");
    _checkConditionToken(condition,"basistype","BASISTYPECODE");
    _checkConditionToken(condition,"basistype.code","BASISTYPECODE");
    _checkConditionToken(condition,"techcondservicesref","TECHCONDSERVICESREFCOD");
    _checkConditionToken(condition,"techcondservicesref.code","TECHCONDSERVICESREFCOD");
    _checkConditionToken(condition,"contragenttype","CONTRAGENTTYPECODE");
    _checkConditionToken(condition,"contragenttype.code","CONTRAGENTTYPECODE");
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

    private void _collectAutoIncrementFields(ENContragent anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENCONTRAGENT", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENCONTRAGENT", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENCONTRAGENT", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENCONTRAGENT");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENContragentDAO
