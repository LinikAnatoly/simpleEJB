
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

import com.ksoe.energynet.valueobject.ENPayment2SO;
import com.ksoe.energynet.valueobject.filter.ENPayment2SOFilter;
import com.ksoe.energynet.valueobject.brief.ENPayment2SOShort;
import com.ksoe.energynet.valueobject.lists.ENPayment2SOShortList;


/**
 * DAO Object for ENPayment2SO;
 *
 */

public class ENPayment2SODAOGen extends GenericDataMiner {

   public ENPayment2SODAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENPayment2SODAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(ENPayment2SO inObject) throws PersistenceException
   {
      ENPayment2SO obj = new ENPayment2SO();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.dateGen == null && obj.dateGen == null){}
	else
		if(inObject.dateGen == null || obj.dateGen == null) return false;
		else
			if (inObject.dateGen.compareTo(obj.dateGen) != 0){
				return false;
			}

	if(inObject.sumTotal == null && obj.sumTotal == null){}
	else
		if(inObject.sumTotal == null || obj.sumTotal == null) return false;
		else
			if ( ! inObject.sumTotal.equals(obj.sumTotal)){
				return false;
			}

	if(inObject.sumGen == null && obj.sumGen == null){}
	else
		if(inObject.sumGen == null || obj.sumGen == null) return false;
		else
			if ( ! inObject.sumGen.equals(obj.sumGen)){
				return false;
			}

	if(inObject.sumVat == null && obj.sumVat == null){}
	else
		if(inObject.sumVat == null || obj.sumVat == null) return false;
		else
			if ( ! inObject.sumVat.equals(obj.sumVat)){
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
     if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
        return false;
     }
     if (inObject.paymentTypeRef.code != obj.paymentTypeRef.code){
        return false;
     }
     if (inObject.soBillRef.code != obj.soBillRef.code){
        return false;
     }
     if (inObject.orderRef.code != obj.orderRef.code){
        return false;
     }
      return true;
   }

   public int add(ENPayment2SO anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENPayment2SO anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENPAYMENT2SO (CODE,DATEGEN,SUMTOTAL,SUMGEN,SUMVAT,USERGEN,DATEEDIT,SERVICESOBJECTREFCODE,PAYMENTTYPEREFCODE,SOBILLREFCODE,ORDERREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

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
      if (anObject.sumTotal != null)
        anObject.sumTotal = anObject.sumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.sumTotal);
      if (anObject.sumGen != null)
        anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.sumGen);
      if (anObject.sumVat != null)
        anObject.sumVat = anObject.sumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.sumVat);
      statement.setString(6,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(7,null);
      else
        statement.setTimestamp(7,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPayment2SO.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
        statement.setInt(8,anObject.servicesObjectRef.code);
      }
      else
        statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.paymentTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPayment2SOTypeDAOGen(connection,getUserProfile()).exists(anObject.paymentTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPayment2SO.paymentTypeRef.code%} = {%"+anObject.paymentTypeRef.code+"%}");
        statement.setInt(9,anObject.paymentTypeRef.code);
      }
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.soBillRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENSOBillDAOGen(connection,getUserProfile()).exists(anObject.soBillRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPayment2SO.soBillRef.code%} = {%"+anObject.soBillRef.code+"%}");
        statement.setInt(10,anObject.soBillRef.code);
      }
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.orderRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.rqorder.dataminer.generated.RQOrderDAOGen(connection,getUserProfile()).exists(anObject.orderRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPayment2SO.orderRef.code%} = {%"+anObject.orderRef.code+"%}");
        statement.setInt(11,anObject.orderRef.code);
      }
      else
        statement.setNull(11,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENPayment2SODAOGen.add%}",e);
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

   public void save(ENPayment2SO anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENPayment2SO anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("SUMTOTAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMVAT") == 0)
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
          if(fieldNameStr.compareTo("SERVICESOBJECTREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PAYMENTTYPEREF") == 0)
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
          if(fieldNameStr.compareTo("ORDERREF") == 0)
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
        "UPDATE ENPAYMENT2SO SET  DATEGEN = ? , SUMTOTAL = ? , SUMGEN = ? , SUMVAT = ? , USERGEN = ? , DATEEDIT = ? , SERVICESOBJECTREFCODE = ? , PAYMENTTYPEREFCODE = ? , SOBILLREFCODE = ? , ORDERREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENPAYMENT2SO SET ";
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
      if (anObject.sumTotal != null)
        anObject.sumTotal = anObject.sumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.sumTotal);
      if (anObject.sumGen != null)
        anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.sumGen);
      if (anObject.sumVat != null)
        anObject.sumVat = anObject.sumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.sumVat);
      statement.setString(5,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(6,null);
      else
        statement.setTimestamp(6,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.servicesObjectRef.code != Integer.MIN_VALUE)
        statement.setInt(7,anObject.servicesObjectRef.code);
      else
        statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.paymentTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(8,anObject.paymentTypeRef.code);
      else
        statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.soBillRef.code != Integer.MIN_VALUE)
        statement.setInt(9,anObject.soBillRef.code);
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.orderRef.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.orderRef.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
          statement.setInt(11,anObject.code);
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
            if("SUMTOTAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumTotal != null)
                    anObject.sumTotal = anObject.sumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumTotal);
                continue;
             }
            if("SUMGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumGen != null)
                    anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumGen);
                continue;
             }
            if("SUMVAT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumVat != null)
                    anObject.sumVat = anObject.sumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumVat);
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
            if("SERVICESOBJECTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.servicesObjectRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.servicesObjectRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("PAYMENTTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.paymentTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.paymentTypeRef.code);
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
            if("ORDERREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.orderRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.orderRef.code);
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

   } // end of save(ENPayment2SO anObject,String[] anAttributes)


 public ENPayment2SOShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENPayment2SO filterObject = new ENPayment2SO();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENPayment2SOShort)list.get(0);
   return null;
  }

  public ENPayment2SOShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENPayment2SOShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENPayment2SOShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENPayment2SOShortList getFilteredList(ENPayment2SO filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENPayment2SOShortList getScrollableFilteredList(ENPayment2SO aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENPayment2SOShortList getScrollableFilteredList(ENPayment2SO aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENPayment2SOShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENPayment2SOShortList getScrollableFilteredList(ENPayment2SOFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENPayment2SOShortList getScrollableFilteredList(ENPayment2SOFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENPayment2SOShortList getScrollableFilteredList(ENPayment2SO aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENPayment2SOShortList getScrollableFilteredList(ENPayment2SO aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENPayment2SOShortList result = new ENPayment2SOShortList();
    ENPayment2SOShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPAYMENT2SO.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENPAYMENT2SO.CODE"+
     ",ENPAYMENT2SO.DATEGEN"+
     ",ENPAYMENT2SO.SUMTOTAL"+
     ",ENPAYMENT2SO.SUMGEN"+
     ",ENPAYMENT2SO.SUMVAT"+
     ",ENPAYMENT2SO.USERGEN"+
     ",ENPAYMENT2SO.DATEEDIT"+

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
      ", ENPAYMENT2SOTYPE.CODE " +
      ", ENPAYMENT2SOTYPE.NAME " +
      ", ENSOBILL.CODE " +
      ", ENSOBILL.DATEGEN " +
      ", ENSOBILL.SUMTOTAL " +
      ", ENSOBILL.SUMGEN " +
      ", ENSOBILL.SUMVAT " +
      ", ENSOBILL.USERGEN " +
      ", ENSOBILL.DATEEDIT " +
     ", ENPAYMENT2SO.ORDERREFCODE" +
     " FROM ENPAYMENT2SO " +
     ", ENSERVICESOBJECT " +
     ", ENPAYMENT2SOTYPE " +
     ", ENSOBILL " +
     //" WHERE "
  "";
     whereStr = " ENSERVICESOBJECT.CODE = ENPAYMENT2SO.SERVICESOBJECTREFCODE" ; //+
      whereStr = whereStr +" AND ENPAYMENT2SOTYPE.CODE = ENPAYMENT2SO.PAYMENTTYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENSOBILL.CODE = ENPAYMENT2SO.SOBILLREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENPAYMENT2SO.CODE IN ( SELECT ENPAYMENT2SO.CODE FROM ENPAYMENT2SO ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.CODE = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.DATEGEN = ?";
        }
        if(aFilterObject.sumTotal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.SUMTOTAL = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.SUMGEN = ?";
        }
        if(aFilterObject.sumVat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.SUMVAT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENPAYMENT2SO.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENPAYMENT2SO.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.DATEEDIT = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPAYMENT2SO.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.paymentTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPAYMENT2SO.PAYMENTTYPEREFCODE = ? ";
        }
        if(aFilterObject.soBillRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPAYMENT2SO.SOBILLREFCODE = ? ";
        }
        if(aFilterObject.orderRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPAYMENT2SO.ORDERREFCODE = ? ";
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
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
        if(aFilterObject.sumTotal != null){
            number++;
            aFilterObject.sumTotal = aFilterObject.sumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumTotal);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.sumVat != null){
            number++;
            aFilterObject.sumVat = aFilterObject.sumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumVat);
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
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.paymentTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.paymentTypeRef.code);
       }
       if(aFilterObject.soBillRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.soBillRef.code);
       }
       if(aFilterObject.orderRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.orderRef.code);
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

        anObject = new ENPayment2SOShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.dateGen = set.getDate(2);
        anObject.sumTotal = set.getBigDecimal(3);
        if(anObject.sumTotal != null)
            anObject.sumTotal = anObject.sumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGen = set.getBigDecimal(4);
        if(anObject.sumGen != null)
            anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumVat = set.getBigDecimal(5);
        if(anObject.sumVat != null)
            anObject.sumVat = anObject.sumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(6);
        anObject.dateEdit = set.getTimestamp(7);

        anObject.servicesObjectRefCode = set.getInt(8);
    if(set.wasNull())
      anObject.servicesObjectRefCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefContractNumber = set.getString(9);
        anObject.servicesObjectRefContractDate = set.getDate(10);
        anObject.servicesObjectRefName = set.getString(11);
        anObject.servicesObjectRefPartnerCode = set.getString(12);
        anObject.servicesObjectRefFinDocCode = set.getString(13);
        anObject.servicesObjectRefFinDocID = set.getInt(14);
    if(set.wasNull())
      anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
        anObject.servicesObjectRefCommentGen = set.getString(15);
        anObject.servicesObjectRefContractNumberServices = set.getString(16);
        anObject.servicesObjectRefContractDateServices = set.getDate(17);
        anObject.servicesObjectRefContragentName = set.getString(18);
        anObject.servicesObjectRefContragentAddress = set.getString(19);
        anObject.servicesObjectRefContragentAddressWork = set.getString(20);
        anObject.servicesObjectRefContragentOkpo = set.getString(21);
        anObject.servicesObjectRefContragentBankAccount = set.getString(22);
        anObject.servicesObjectRefContragentBankName = set.getString(23);
        anObject.servicesObjectRefContragentBankMfo = set.getString(24);
        anObject.servicesObjectRefContragentBossName = set.getString(25);
        anObject.servicesObjectRefContragentPassport = set.getString(26);
        anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(27);
        if(anObject.servicesObjectRefContractServicesSumma != null)
          anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(28);
        if(anObject.servicesObjectRefContractServicesPower != null)
          anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefCommentServicesGen = set.getString(29);
        anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(30);
        if(anObject.servicesObjectRefContractServicesDistance != null)
          anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(31);
        if(anObject.servicesObjectRefContractServicesDay != null)
          anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefUserGen = set.getString(32);
        anObject.servicesObjectRefDateEdit = set.getDate(33);
        anObject.servicesObjectRefWarrantDate = set.getDate(34);
        anObject.servicesObjectRefWarrantNumber = set.getString(35);
        anObject.servicesObjectRefWarrantFIO = set.getString(36);
        anObject.servicesObjectRefRegionalType = set.getInt(37);
    if(set.wasNull())
      anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
        anObject.servicesObjectRefBasisType = set.getBigDecimal(38);
        if(anObject.servicesObjectRefBasisType != null)
          anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContragentPosition = set.getString(39);
        anObject.servicesObjectRefExecuteWorkDate = set.getDate(40);
        anObject.servicesObjectRefTimeStart = set.getTimestamp(41);
        anObject.servicesObjectRefTimeFinal = set.getTimestamp(42);
        anObject.servicesObjectRefContragentPhoneNumber = set.getString(43);
        anObject.servicesObjectRefExecutorPhoneNumber = set.getString(44);
        anObject.servicesObjectRefContragentObjectWork = set.getString(45);
        anObject.servicesObjectRefIsNoPay = set.getInt(46);
    if(set.wasNull())
      anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
        anObject.servicesObjectRefIsCustomerMaterials = set.getInt(47);
    if(set.wasNull())
      anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
        anObject.servicesObjectRefPayDate = set.getDate(48);
        anObject.servicesObjectRefFinPayFormCode = set.getInt(49);
    if(set.wasNull())
      anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefFinPayFormName = set.getString(50);
        anObject.servicesObjectRefPartnerId = set.getInt(51);
    if(set.wasNull())
      anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
        anObject.servicesObjectRefPayDetail = set.getString(52);
        anObject.servicesObjectRefActTransferNumber = set.getString(53);
        anObject.servicesObjectRefActTransferDate = set.getDate(54);
        anObject.servicesObjectRefResposible = set.getString(55);
        anObject.servicesObjectRefResposiblePosition = set.getString(56);
        anObject.servicesObjectRefResposibleTabNumber = set.getString(57);
        anObject.servicesObjectRefPrevContractStatus = set.getInt(58);
    if(set.wasNull())
      anObject.servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
        anObject.servicesObjectRefReconnectionTU = set.getInt(59);
    if(set.wasNull())
      anObject.servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
        anObject.servicesObjectRefPersonalAccountCode = set.getInt(60);
    if(set.wasNull())
      anObject.servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefPersonalAccountNumber = set.getString(61);
        anObject.servicesObjectRefTabNumber = set.getString(62);
//        anObject.servicesObjectRefCitiesList = set.getString(63);
//        anObject.servicesObjectRefLineLength = set.getBigDecimal(64);
//        if(anObject.servicesObjectRefLineLength != null)
//          anObject.servicesObjectRefLineLength = anObject.servicesObjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
//        anObject.servicesObjectRefProjectCode = set.getString(65);
        anObject.servicesObjectRefCnPackCode = set.getInt(66);
    if(set.wasNull())
      anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefDfPackCode = set.getInt(67);
    if(set.wasNull())
      anObject.servicesObjectRefDfPackCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefCountersZoneType = set.getInt(68);
    if(set.wasNull())
      anObject.servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
        anObject.paymentTypeRefCode = set.getInt(69);
    if(set.wasNull())
      anObject.paymentTypeRefCode = Integer.MIN_VALUE;
        anObject.paymentTypeRefName = set.getString(70);
        anObject.soBillRefCode = set.getInt(71);
    if(set.wasNull())
      anObject.soBillRefCode = Integer.MIN_VALUE;
        anObject.soBillRefDateGen = set.getDate(72);
        anObject.soBillRefSumTotal = set.getBigDecimal(73);
        if(anObject.soBillRefSumTotal != null)
          anObject.soBillRefSumTotal = anObject.soBillRefSumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.soBillRefSumGen = set.getBigDecimal(74);
        if(anObject.soBillRefSumGen != null)
          anObject.soBillRefSumGen = anObject.soBillRefSumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.soBillRefSumVat = set.getBigDecimal(75);
        if(anObject.soBillRefSumVat != null)
          anObject.soBillRefSumVat = anObject.soBillRefSumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.soBillRefUserGen = set.getString(76);
        anObject.soBillRefDateEdit = set.getTimestamp(77);
        anObject.orderRefCode = set.getInt(78);
    if(set.wasNull())
      anObject.orderRefCode = Integer.MIN_VALUE;

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

  public int[] getFilteredCodeArrayOLD(ENPayment2SO aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENPAYMENT2SO.CODE FROM ENPAYMENT2SO";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPAYMENT2SO.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.CODE = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.DATEGEN = ?";
        }
        if(aFilterObject.sumTotal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.SUMTOTAL = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.SUMGEN = ?";
        }
        if(aFilterObject.sumVat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.SUMVAT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPAYMENT2SO.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENPAYMENT2SO.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.DATEEDIT = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPAYMENT2SO.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.paymentTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPAYMENT2SO.PAYMENTTYPEREFCODE = ? ";
        }
        if(aFilterObject.soBillRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPAYMENT2SO.SOBILLREFCODE = ? ";
        }
        if(aFilterObject.orderRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPAYMENT2SO.ORDERREFCODE = ? ";
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
        if(aFilterObject.sumTotal != null){
            number++;
            aFilterObject.sumTotal = aFilterObject.sumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumTotal);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.sumVat != null){
            number++;
            aFilterObject.sumVat = aFilterObject.sumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumVat);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPAYMENT2SO.USERGEN = ?";
             else
                 whereStr = whereStr + " ENPAYMENT2SO.USERGEN LIKE ?";

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
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.paymentTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.paymentTypeRef.code);
       }
       if(aFilterObject.soBillRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.soBillRef.code);
       }
       if(aFilterObject.orderRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.orderRef.code);
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

  public int[] getFilteredCodeArray(ENPayment2SOFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENPayment2SO aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENPAYMENT2SO.CODE FROM ENPAYMENT2SO";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPAYMENT2SO.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.CODE = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.DATEGEN = ?";
        }
        if(aFilterObject.sumTotal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.SUMTOTAL = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.SUMGEN = ?";
        }
        if(aFilterObject.sumVat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.SUMVAT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPAYMENT2SO.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENPAYMENT2SO.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPAYMENT2SO.DATEEDIT = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPAYMENT2SO.SERVICESOBJECTREFCODE = ? ";
        }
        if(aFilterObject.paymentTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPAYMENT2SO.PAYMENTTYPEREFCODE = ? ";
        }
        if(aFilterObject.soBillRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPAYMENT2SO.SOBILLREFCODE = ? ";
        }
        if(aFilterObject.orderRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPAYMENT2SO.ORDERREFCODE = ? ";
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
        if(aFilterObject.sumTotal != null){
            number++;
            aFilterObject.sumTotal = aFilterObject.sumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumTotal);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.sumVat != null){
            number++;
            aFilterObject.sumVat = aFilterObject.sumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumVat);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPAYMENT2SO.USERGEN = ?";
             else
                 whereStr = whereStr + " ENPAYMENT2SO.USERGEN LIKE ?";

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
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
       }
       if(aFilterObject.paymentTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.paymentTypeRef.code);
       }
       if(aFilterObject.soBillRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.soBillRef.code);
       }
       if(aFilterObject.orderRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.orderRef.code);
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


   public ENPayment2SO getObject(int uid) throws PersistenceException
   {
    ENPayment2SO result = new ENPayment2SO();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENPayment2SO anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENPAYMENT2SO.CODE, ENPAYMENT2SO.DATEGEN, ENPAYMENT2SO.SUMTOTAL, ENPAYMENT2SO.SUMGEN, ENPAYMENT2SO.SUMVAT, ENPAYMENT2SO.USERGEN, ENPAYMENT2SO.DATEEDIT, ENPAYMENT2SO.SERVICESOBJECTREFCODE, ENPAYMENT2SO.PAYMENTTYPEREFCODE, ENPAYMENT2SO.SOBILLREFCODE, ENPAYMENT2SO.ORDERREFCODE "
    +" FROM ENPAYMENT2SO WHERE ENPAYMENT2SO.CODE = ?";

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
        anObject.sumTotal = set.getBigDecimal(3);
        if(anObject.sumTotal != null)
            anObject.sumTotal = anObject.sumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGen = set.getBigDecimal(4);
        if(anObject.sumGen != null)
            anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumVat = set.getBigDecimal(5);
        if(anObject.sumVat != null)
            anObject.sumVat = anObject.sumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(6);
        anObject.dateEdit = set.getTimestamp(7);
        anObject.servicesObjectRef.code = set.getInt(8);
        if ( set.wasNull() )
            anObject.servicesObjectRef.code = Integer.MIN_VALUE;
        anObject.paymentTypeRef.code = set.getInt(9);
        if ( set.wasNull() )
            anObject.paymentTypeRef.code = Integer.MIN_VALUE;
        anObject.soBillRef.code = set.getInt(10);
        if ( set.wasNull() )
            anObject.soBillRef.code = Integer.MIN_VALUE;
        anObject.orderRef.code = set.getInt(11);
        if ( set.wasNull() )
            anObject.orderRef.code = Integer.MIN_VALUE;
        if(anObject.servicesObjectRef.code != Integer.MIN_VALUE)
        {
           anObject.setServicesObjectRef(
      new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.servicesObjectRef.code));
    }
        if(anObject.paymentTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setPaymentTypeRef(
      new com.ksoe.energynet.dataminer.generated.ENPayment2SOTypeDAOGen(connection,getUserProfile()).getRef(anObject.paymentTypeRef.code));
    }
        if(anObject.soBillRef.code != Integer.MIN_VALUE)
        {
           anObject.setSoBillRef(
      new com.ksoe.energynet.dataminer.generated.ENSOBillDAOGen(connection,getUserProfile()).getRef(anObject.soBillRef.code));
    }
        if(anObject.orderRef.code != Integer.MIN_VALUE)
        {
           anObject.setOrderRef(
      new com.ksoe.rqorder.dataminer.generated.RQOrderDAOGen(connection,getUserProfile()).getRef(anObject.orderRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENPayment2SORef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENPayment2SORef ref = new com.ksoe.energynet.valueobject.references.ENPayment2SORef();
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

    selectStr = "DELETE FROM  ENPAYMENT2SO WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENPayment2SO object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENPayment2SO.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENPayment2SO.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENPayment2SO.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPayment2SO.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENPayment2SO.getObject%} access denied");

    selectStr =

    "SELECT  ENPAYMENT2SO.CODE FROM  ENPAYMENT2SO WHERE  ENPAYMENT2SO.CODE = ?";
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
    _checkConditionToken(condition,"code","ENPAYMENT2SO.CODE");
    _checkConditionToken(condition,"dategen","ENPAYMENT2SO.DATEGEN");
    _checkConditionToken(condition,"sumtotal","ENPAYMENT2SO.SUMTOTAL");
    _checkConditionToken(condition,"sumgen","ENPAYMENT2SO.SUMGEN");
    _checkConditionToken(condition,"sumvat","ENPAYMENT2SO.SUMVAT");
    _checkConditionToken(condition,"usergen","ENPAYMENT2SO.USERGEN");
    _checkConditionToken(condition,"dateedit","ENPAYMENT2SO.DATEEDIT");
      // relationship conditions
    _checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
    _checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
    _checkConditionToken(condition,"paymenttyperef","PAYMENTTYPEREFCODE");
    _checkConditionToken(condition,"paymenttyperef.code","PAYMENTTYPEREFCODE");
    _checkConditionToken(condition,"sobillref","SOBILLREFCODE");
    _checkConditionToken(condition,"sobillref.code","SOBILLREFCODE");
    _checkConditionToken(condition,"orderref","ORDERREFCODE");
    _checkConditionToken(condition,"orderref.code","ORDERREFCODE");
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

  private void _collectAutoIncrementFields(ENPayment2SO anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENPAYMENT2SO", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENPAYMENT2SO", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENPAYMENT2SO", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENPAYMENT2SO");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENPayment2SODAO
