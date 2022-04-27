
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

import com.ksoe.energynet.valueobject.ENSOPayBillProv;
import com.ksoe.energynet.valueobject.filter.ENSOPayBillProvFilter;
import com.ksoe.energynet.valueobject.brief.ENSOPayBillProvShort;
import com.ksoe.energynet.valueobject.lists.ENSOPayBillProvShortList;


/**
 * DAO Object for ENSOPayBillProv;
 *
 */

public class ENSOPayBillProvDAOGen extends GenericDataMiner {

   public ENSOPayBillProvDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENSOPayBillProvDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(ENSOPayBillProv inObject) throws PersistenceException
   {
      ENSOPayBillProv obj = new ENSOPayBillProv();
      obj.code = inObject.code;
      loadObject(obj);

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
     if (inObject.soRef.code != obj.soRef.code){
        return false;
     }
     if (inObject.payment2soRef.code != obj.payment2soRef.code){
        return false;
     }
     if (inObject.soBillRef.code != obj.soBillRef.code){
        return false;
     }
     if (inObject.so2ProvRef.code != obj.so2ProvRef.code){
        return false;
     }
      return true;
   }

   public int add(ENSOPayBillProv anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENSOPayBillProv anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENSOPAYBILLPROV (CODE,USERGEN,DATEEDIT,SOREFCODE,PAYMENT2SOREFCODE,SOBILLREFCODE,SO2PROVREFCODE) VALUES (?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(3,null);
      else
        statement.setTimestamp(3,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.soRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.soRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSOPayBillProv.soRef.code%} = {%"+anObject.soRef.code+"%}");
        statement.setInt(4,anObject.soRef.code);
      }
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.payment2soRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPayment2SODAOGen(connection,getUserProfile()).exists(anObject.payment2soRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSOPayBillProv.payment2soRef.code%} = {%"+anObject.payment2soRef.code+"%}");
        statement.setInt(5,anObject.payment2soRef.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.soBillRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENSOBillDAOGen(connection,getUserProfile()).exists(anObject.soBillRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSOPayBillProv.soBillRef.code%} = {%"+anObject.soBillRef.code+"%}");
        statement.setInt(6,anObject.soBillRef.code);
      }
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.so2ProvRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObject2ProvDAOGen(connection,getUserProfile()).exists(anObject.so2ProvRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSOPayBillProv.so2ProvRef.code%} = {%"+anObject.so2ProvRef.code+"%}");
        statement.setInt(7,anObject.so2ProvRef.code);
      }
      else
        statement.setNull(7,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENSOPayBillProvDAOGen.add%}",e);
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

   public void save(ENSOPayBillProv anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENSOPayBillProv anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("SOREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PAYMENT2SOREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SOBILLREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SO2PROVREF") == 0)
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
        "UPDATE ENSOPAYBILLPROV SET  USERGEN = ? , DATEEDIT = ? , SOREFCODE = ? , PAYMENT2SOREFCODE = ? , SOBILLREFCODE = ? , SO2PROVREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENSOPAYBILLPROV SET ";
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
      statement.setString(1,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(2,null);
      else
        statement.setTimestamp(2,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.soRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.soRef.code);
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.payment2soRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.payment2soRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.soBillRef.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.soBillRef.code);
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.so2ProvRef.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.so2ProvRef.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);
          statement.setInt(7,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
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
            if("SOREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.soRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.soRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("PAYMENT2SOREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.payment2soRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.payment2soRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("SOBILLREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.soBillRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.soBillRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("SO2PROVREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.so2ProvRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.so2ProvRef.code);
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

   } // end of save(ENSOPayBillProv anObject,String[] anAttributes)


 public ENSOPayBillProvShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENSOPayBillProv filterObject = new ENSOPayBillProv();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENSOPayBillProvShort)list.get(0);
   return null;
  }

  public ENSOPayBillProvShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENSOPayBillProvShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENSOPayBillProvShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENSOPayBillProvShortList getFilteredList(ENSOPayBillProv filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENSOPayBillProvShortList getScrollableFilteredList(ENSOPayBillProv aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENSOPayBillProvShortList getScrollableFilteredList(ENSOPayBillProv aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENSOPayBillProvShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENSOPayBillProvShortList getScrollableFilteredList(ENSOPayBillProvFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENSOPayBillProvShortList getScrollableFilteredList(ENSOPayBillProvFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENSOPayBillProvShortList getScrollableFilteredList(ENSOPayBillProv aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENSOPayBillProvShortList getScrollableFilteredList(ENSOPayBillProv aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENSOPayBillProvShortList result = new ENSOPayBillProvShortList();
    ENSOPayBillProvShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSOPAYBILLPROV.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENSOPAYBILLPROV.CODE"+
     ",ENSOPAYBILLPROV.USERGEN"+
     ",ENSOPAYBILLPROV.DATEEDIT"+

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
      ", ENPAYMENT2SO.CODE " +
      ", ENPAYMENT2SO.DATEGEN " +
      ", ENPAYMENT2SO.SUMTOTAL " +
      ", ENPAYMENT2SO.SUMGEN " +
      ", ENPAYMENT2SO.SUMVAT " +
      ", ENPAYMENT2SO.USERGEN " +
      ", ENPAYMENT2SO.DATEEDIT " +
      ", ENSOBILL.CODE " +
      ", ENSOBILL.DATEGEN " +
      ", ENSOBILL.SUMTOTAL " +
      ", ENSOBILL.SUMGEN " +
      ", ENSOBILL.SUMVAT " +
      ", ENSOBILL.USERGEN " +
      ", ENSOBILL.DATEEDIT " +
      ", ENSERVICESOBJECT2PROV.CODE " +
      ", ENSERVICESOBJECT2PROV.PARTID " +
      ", ENSERVICESOBJECT2PROV.USERGEN " +
      ", ENSERVICESOBJECT2PROV.DATEPOSTING " +
      ", ENSERVICESOBJECT2PROV.DATEEDIT " +
     " FROM ENSOPAYBILLPROV " +
     ", ENSERVICESOBJECT " +
     ", ENPAYMENT2SO " +
     ", ENSOBILL " +
     ", ENSERVICESOBJECT2PROV " +
     //" WHERE "
  "";
     whereStr = " ENSERVICESOBJECT.CODE = ENSOPAYBILLPROV.SOREFCODE" ; //+
      whereStr = whereStr +" AND ENPAYMENT2SO.CODE = ENSOPAYBILLPROV.PAYMENT2SOREFCODE" ; //+
      whereStr = whereStr +" AND ENSOBILL.CODE = ENSOPAYBILLPROV.SOBILLREFCODE" ; //+
      whereStr = whereStr +" AND ENSERVICESOBJECT2PROV.CODE = ENSOPAYBILLPROV.SO2PROVREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENSOPAYBILLPROV.CODE IN ( SELECT ENSOPAYBILLPROV.CODE FROM ENSOPAYBILLPROV ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSOPAYBILLPROV.CODE = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSOPAYBILLPROV.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSOPAYBILLPROV.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSOPAYBILLPROV.DATEEDIT = ?";
        }
        if(aFilterObject.soRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSOPAYBILLPROV.SOREFCODE = ? ";
        }
        if(aFilterObject.payment2soRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSOPAYBILLPROV.PAYMENT2SOREFCODE = ? ";
        }
        if(aFilterObject.soBillRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSOPAYBILLPROV.SOBILLREFCODE = ? ";
        }
        if(aFilterObject.so2ProvRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSOPAYBILLPROV.SO2PROVREFCODE = ? ";
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
       if(aFilterObject.soRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.soRef.code);
       }
       if(aFilterObject.payment2soRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.payment2soRef.code);
       }
       if(aFilterObject.soBillRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.soBillRef.code);
       }
       if(aFilterObject.so2ProvRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.so2ProvRef.code);
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

        anObject = new ENSOPayBillProvShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.userGen = set.getString(2);
        anObject.dateEdit = set.getTimestamp(3);

        anObject.soRefCode = set.getInt(4);
    if(set.wasNull())
      anObject.soRefCode = Integer.MIN_VALUE;
        anObject.soRefContractNumber = set.getString(5);
        anObject.soRefContractDate = set.getDate(6);
        anObject.soRefName = set.getString(7);
        anObject.soRefPartnerCode = set.getString(8);
        anObject.soRefFinDocCode = set.getString(9);
        anObject.soRefFinDocID = set.getInt(10);
    if(set.wasNull())
      anObject.soRefFinDocID = Integer.MIN_VALUE;
        anObject.soRefCommentGen = set.getString(11);
        anObject.soRefContractNumberServices = set.getString(12);
        anObject.soRefContractDateServices = set.getDate(13);
        anObject.soRefContragentName = set.getString(14);
        anObject.soRefContragentAddress = set.getString(15);
        anObject.soRefContragentAddressWork = set.getString(16);
        anObject.soRefContragentOkpo = set.getString(17);
        anObject.soRefContragentBankAccount = set.getString(18);
        anObject.soRefContragentBankName = set.getString(19);
        anObject.soRefContragentBankMfo = set.getString(20);
        anObject.soRefContragentBossName = set.getString(21);
        anObject.soRefContragentPassport = set.getString(22);
        anObject.soRefContractServicesSumma = set.getBigDecimal(23);
        if(anObject.soRefContractServicesSumma != null)
          anObject.soRefContractServicesSumma = anObject.soRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.soRefContractServicesPower = set.getBigDecimal(24);
        if(anObject.soRefContractServicesPower != null)
          anObject.soRefContractServicesPower = anObject.soRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.soRefCommentServicesGen = set.getString(25);
        anObject.soRefContractServicesDistance = set.getBigDecimal(26);
        if(anObject.soRefContractServicesDistance != null)
          anObject.soRefContractServicesDistance = anObject.soRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.soRefContractServicesDay = set.getBigDecimal(27);
        if(anObject.soRefContractServicesDay != null)
          anObject.soRefContractServicesDay = anObject.soRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.soRefUserGen = set.getString(28);
        anObject.soRefDateEdit = set.getDate(29);
        anObject.soRefWarrantDate = set.getDate(30);
        anObject.soRefWarrantNumber = set.getString(31);
        anObject.soRefWarrantFIO = set.getString(32);
        anObject.soRefRegionalType = set.getInt(33);
    if(set.wasNull())
      anObject.soRefRegionalType = Integer.MIN_VALUE;
        anObject.soRefBasisType = set.getBigDecimal(34);
        if(anObject.soRefBasisType != null)
          anObject.soRefBasisType = anObject.soRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.soRefContragentPosition = set.getString(35);
        anObject.soRefExecuteWorkDate = set.getDate(36);
        anObject.soRefTimeStart = set.getTimestamp(37);
        anObject.soRefTimeFinal = set.getTimestamp(38);
        anObject.soRefContragentPhoneNumber = set.getString(39);
        anObject.soRefExecutorPhoneNumber = set.getString(40);
        anObject.soRefContragentObjectWork = set.getString(41);
        anObject.soRefIsNoPay = set.getInt(42);
    if(set.wasNull())
      anObject.soRefIsNoPay = Integer.MIN_VALUE;
        anObject.soRefIsCustomerMaterials = set.getInt(43);
    if(set.wasNull())
      anObject.soRefIsCustomerMaterials = Integer.MIN_VALUE;
        anObject.soRefPayDate = set.getDate(44);
        anObject.soRefFinPayFormCode = set.getInt(45);
    if(set.wasNull())
      anObject.soRefFinPayFormCode = Integer.MIN_VALUE;
        anObject.soRefFinPayFormName = set.getString(46);
        anObject.soRefPartnerId = set.getInt(47);
    if(set.wasNull())
      anObject.soRefPartnerId = Integer.MIN_VALUE;
        anObject.soRefPayDetail = set.getString(48);
        anObject.soRefActTransferNumber = set.getString(49);
        anObject.soRefActTransferDate = set.getDate(50);
        anObject.soRefResposible = set.getString(51);
        anObject.soRefResposiblePosition = set.getString(52);
        anObject.soRefResposibleTabNumber = set.getString(53);
        anObject.soRefPrevContractStatus = set.getInt(54);
    if(set.wasNull())
      anObject.soRefPrevContractStatus = Integer.MIN_VALUE;
        anObject.soRefReconnectionTU = set.getInt(55);
    if(set.wasNull())
      anObject.soRefReconnectionTU = Integer.MIN_VALUE;
        anObject.soRefPersonalAccountCode = set.getInt(56);
    if(set.wasNull())
      anObject.soRefPersonalAccountCode = Integer.MIN_VALUE;
        anObject.soRefPersonalAccountNumber = set.getString(57);
        anObject.soRefTabNumber = set.getString(58);
        anObject.soRefCnPackCode = set.getInt(59);
    if(set.wasNull())
      anObject.soRefCnPackCode = Integer.MIN_VALUE;
        anObject.soRefDfPackCode = set.getInt(60);
    if(set.wasNull())
      anObject.soRefDfPackCode = Integer.MIN_VALUE;
        anObject.soRefCountersZoneType = set.getInt(61);
    if(set.wasNull())
      anObject.soRefCountersZoneType = Integer.MIN_VALUE;
        anObject.payment2soRefCode = set.getInt(62);
    if(set.wasNull())
      anObject.payment2soRefCode = Integer.MIN_VALUE;
        anObject.payment2soRefDateGen = set.getDate(63);
        anObject.payment2soRefSumTotal = set.getBigDecimal(64);
        if(anObject.payment2soRefSumTotal != null)
          anObject.payment2soRefSumTotal = anObject.payment2soRefSumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.payment2soRefSumGen = set.getBigDecimal(65);
        if(anObject.payment2soRefSumGen != null)
          anObject.payment2soRefSumGen = anObject.payment2soRefSumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.payment2soRefSumVat = set.getBigDecimal(66);
        if(anObject.payment2soRefSumVat != null)
          anObject.payment2soRefSumVat = anObject.payment2soRefSumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.payment2soRefUserGen = set.getString(67);
        anObject.payment2soRefDateEdit = set.getTimestamp(68);
        anObject.soBillRefCode = set.getInt(69);
    if(set.wasNull())
      anObject.soBillRefCode = Integer.MIN_VALUE;
        anObject.soBillRefDateGen = set.getDate(70);
        anObject.soBillRefSumTotal = set.getBigDecimal(71);
        if(anObject.soBillRefSumTotal != null)
          anObject.soBillRefSumTotal = anObject.soBillRefSumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.soBillRefSumGen = set.getBigDecimal(72);
        if(anObject.soBillRefSumGen != null)
          anObject.soBillRefSumGen = anObject.soBillRefSumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.soBillRefSumVat = set.getBigDecimal(73);
        if(anObject.soBillRefSumVat != null)
          anObject.soBillRefSumVat = anObject.soBillRefSumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.soBillRefUserGen = set.getString(74);
        anObject.soBillRefDateEdit = set.getTimestamp(75);
        anObject.so2ProvRefCode = set.getInt(76);
    if(set.wasNull())
      anObject.so2ProvRefCode = Integer.MIN_VALUE;
        anObject.so2ProvRefPartId = set.getInt(77);
    if(set.wasNull())
      anObject.so2ProvRefPartId = Integer.MIN_VALUE;
        anObject.so2ProvRefUserGen = set.getString(78);
        anObject.so2ProvRefDatePosting = set.getDate(79);
        anObject.so2ProvRefDateEdit = set.getDate(80);

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

  public int[] getFilteredCodeArrayOLD(ENSOPayBillProv aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENSOPAYBILLPROV.CODE FROM ENSOPAYBILLPROV";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSOPAYBILLPROV.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSOPAYBILLPROV.CODE = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSOPAYBILLPROV.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENSOPAYBILLPROV.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSOPAYBILLPROV.DATEEDIT = ?";
        }
        if(aFilterObject.soRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSOPAYBILLPROV.SOREFCODE = ? ";
        }
        if(aFilterObject.payment2soRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSOPAYBILLPROV.PAYMENT2SOREFCODE = ? ";
        }
        if(aFilterObject.soBillRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSOPAYBILLPROV.SOBILLREFCODE = ? ";
        }
        if(aFilterObject.so2ProvRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSOPAYBILLPROV.SO2PROVREFCODE = ? ";
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
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSOPAYBILLPROV.USERGEN = ?";
             else
                 whereStr = whereStr + " ENSOPAYBILLPROV.USERGEN LIKE ?";

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
       if(aFilterObject.soRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.soRef.code);
       }
       if(aFilterObject.payment2soRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.payment2soRef.code);
       }
       if(aFilterObject.soBillRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.soBillRef.code);
       }
       if(aFilterObject.so2ProvRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.so2ProvRef.code);
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

  public int[] getFilteredCodeArray(ENSOPayBillProvFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENSOPayBillProv aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENSOPAYBILLPROV.CODE FROM ENSOPAYBILLPROV";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSOPAYBILLPROV.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSOPAYBILLPROV.CODE = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSOPAYBILLPROV.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENSOPAYBILLPROV.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSOPAYBILLPROV.DATEEDIT = ?";
        }
        if(aFilterObject.soRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSOPAYBILLPROV.SOREFCODE = ? ";
        }
        if(aFilterObject.payment2soRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSOPAYBILLPROV.PAYMENT2SOREFCODE = ? ";
        }
        if(aFilterObject.soBillRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSOPAYBILLPROV.SOBILLREFCODE = ? ";
        }
        if(aFilterObject.so2ProvRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSOPAYBILLPROV.SO2PROVREFCODE = ? ";
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
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSOPAYBILLPROV.USERGEN = ?";
             else
                 whereStr = whereStr + " ENSOPAYBILLPROV.USERGEN LIKE ?";

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
       if(aFilterObject.soRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.soRef.code);
       }
       if(aFilterObject.payment2soRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.payment2soRef.code);
       }
       if(aFilterObject.soBillRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.soBillRef.code);
       }
       if(aFilterObject.so2ProvRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.so2ProvRef.code);
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


   public ENSOPayBillProv getObject(int uid) throws PersistenceException
   {
    ENSOPayBillProv result = new ENSOPayBillProv();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENSOPayBillProv anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENSOPAYBILLPROV.CODE, ENSOPAYBILLPROV.USERGEN, ENSOPAYBILLPROV.DATEEDIT, ENSOPAYBILLPROV.SOREFCODE, ENSOPAYBILLPROV.PAYMENT2SOREFCODE, ENSOPAYBILLPROV.SOBILLREFCODE, ENSOPAYBILLPROV.SO2PROVREFCODE "
    +" FROM ENSOPAYBILLPROV WHERE ENSOPAYBILLPROV.CODE = ?";

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
        anObject.userGen = set.getString(2);
        anObject.dateEdit = set.getTimestamp(3);
        anObject.soRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.soRef.code = Integer.MIN_VALUE;
        anObject.payment2soRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.payment2soRef.code = Integer.MIN_VALUE;
        anObject.soBillRef.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.soBillRef.code = Integer.MIN_VALUE;
        anObject.so2ProvRef.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.so2ProvRef.code = Integer.MIN_VALUE;
        if(anObject.soRef.code != Integer.MIN_VALUE)
        {
           anObject.setSoRef(
      new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.soRef.code));
    }
        if(anObject.payment2soRef.code != Integer.MIN_VALUE)
        {
           anObject.setPayment2soRef(
      new com.ksoe.energynet.dataminer.generated.ENPayment2SODAOGen(connection,getUserProfile()).getRef(anObject.payment2soRef.code));
    }
        if(anObject.soBillRef.code != Integer.MIN_VALUE)
        {
           anObject.setSoBillRef(
      new com.ksoe.energynet.dataminer.generated.ENSOBillDAOGen(connection,getUserProfile()).getRef(anObject.soBillRef.code));
    }
        if(anObject.so2ProvRef.code != Integer.MIN_VALUE)
        {
           anObject.setSo2ProvRef(
      new com.ksoe.energynet.dataminer.generated.ENServicesObject2ProvDAOGen(connection,getUserProfile()).getRef(anObject.so2ProvRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENSOPayBillProvRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENSOPayBillProvRef ref = new com.ksoe.energynet.valueobject.references.ENSOPayBillProvRef();
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

    selectStr = "DELETE FROM  ENSOPAYBILLPROV WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENSOPayBillProv object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENSOPayBillProv.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENSOPayBillProv.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENSOPayBillProv.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENSOPayBillProv.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENSOPayBillProv.getObject%} access denied");

    selectStr =

    "SELECT  ENSOPAYBILLPROV.CODE FROM  ENSOPAYBILLPROV WHERE  ENSOPAYBILLPROV.CODE = ?";
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
    _checkConditionToken(condition,"code","ENSOPAYBILLPROV.CODE");
    _checkConditionToken(condition,"usergen","ENSOPAYBILLPROV.USERGEN");
    _checkConditionToken(condition,"dateedit","ENSOPAYBILLPROV.DATEEDIT");
      // relationship conditions
    _checkConditionToken(condition,"soref","SOREFCODE");
    _checkConditionToken(condition,"soref.code","SOREFCODE");
    _checkConditionToken(condition,"payment2soref","PAYMENT2SOREFCODE");
    _checkConditionToken(condition,"payment2soref.code","PAYMENT2SOREFCODE");
    _checkConditionToken(condition,"sobillref","SOBILLREFCODE");
    _checkConditionToken(condition,"sobillref.code","SOBILLREFCODE");
    _checkConditionToken(condition,"so2provref","SO2PROVREFCODE");
    _checkConditionToken(condition,"so2provref.code","SO2PROVREFCODE");
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

  private void _collectAutoIncrementFields(ENSOPayBillProv anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENSOPAYBILLPROV", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENSOPAYBILLPROV", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENSOPAYBILLPROV", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENSOPAYBILLPROV");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENSOPayBillProvDAO
