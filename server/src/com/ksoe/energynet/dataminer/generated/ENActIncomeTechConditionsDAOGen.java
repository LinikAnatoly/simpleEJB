
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
import com.ksoe.energynet.valueobject.ENActIncomeTechConditions;
import com.ksoe.energynet.valueobject.brief.ENActIncomeTechConditionsShort;
import com.ksoe.energynet.valueobject.filter.ENActIncomeTechConditionsFilter;
import com.ksoe.energynet.valueobject.lists.ENActIncomeTechConditionsShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENActIncomeTechConditions;
 *
 */

public class ENActIncomeTechConditionsDAOGen extends GenericDataMiner {

  public ENActIncomeTechConditionsDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENActIncomeTechConditionsDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENActIncomeTechConditions inObject) throws PersistenceException
   {
      ENActIncomeTechConditions obj = new ENActIncomeTechConditions();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.numbergen != obj.numbergen){
       return false;
     }

     if ( ! inObject.dategen.equals(obj.dategen)){
       return false;
     }

     if ( ! inObject.actDateStart.equals(obj.actDateStart)){
       return false;
     }

     if ( ! inObject.actDateEnd.equals(obj.actDateEnd)){
       return false;
     }

     if ( ! inObject.summaGen.equals(obj.summaGen)){
       return false;
     }

     if ( ! inObject.summaVat.equals(obj.summaVat)){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }
     if (inObject.techCondServicesRef.code != obj.techCondServicesRef.code){
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

   public int add(ENActIncomeTechConditions anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENActIncomeTechConditions anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();
    if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENACTINCOMETECHCONDTNS (CODE,NUMBERGEN,DATEGEN,ACTDATESTART,ACTDATEEND,SUMMAGEN,SUMMAVAT,COMMENTGEN,DOMAIN_INFO,MODIFY_TIME,TECHCONDSERVICESREFCOD,STATUSREFCODE,WARRANTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.numbergen);
      if (anObject.dategen == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.dategen.getTime()));
      if (anObject.actDateStart == null)
        statement.setDate(4,null);
      else
        statement.setDate(4,new java.sql.Date(anObject.actDateStart.getTime()));
      if (anObject.actDateEnd == null)
        statement.setDate(5,null);
      else
        statement.setDate(5,new java.sql.Date(anObject.actDateEnd.getTime()));
      if (anObject.summaGen != null)
        anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.summaGen);
      if (anObject.summaVat != null)
        anObject.summaVat = anObject.summaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.summaVat);
      statement.setString(8,anObject.commentGen);
      statement.setString(9,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(10,null);
      else
        statement.setBigDecimal(10,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.techCondServicesRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesDAOGen(connection,getUserProfile()).exists(anObject.techCondServicesRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActIncomeTechConditions.techCondServicesRef.code%} = {%"+anObject.techCondServicesRef.code+"%}");
        statement.setInt(11,anObject.techCondServicesRef.code);
      }
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.statusRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENActIncomeStatusDAOGen(connection,getUserProfile()).exists(anObject.statusRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActIncomeTechConditions.statusRef.code%} = {%"+anObject.statusRef.code+"%}");
        statement.setInt(12,anObject.statusRef.code);
      }
      else
        statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.warrantRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).exists(anObject.warrantRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActIncomeTechConditions.warrantRef.code%} = {%"+anObject.warrantRef.code+"%}");
        statement.setInt(13,anObject.warrantRef.code);
      }
      else
        statement.setNull(13,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENActIncomeTechConditionsDAOGen.add%}",e);
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

   public void save(ENActIncomeTechConditions anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENActIncomeTechConditions anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENActIncomeTechConditions oldObject = new ENActIncomeTechConditions();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENActIncomeTechConditions.modify_time_Field + "," + ENActIncomeTechConditions.domain_info_Field+" FROM  ENACTINCOMETECHCONDTNS WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("ACTDATESTART") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ACTDATEEND") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMMAGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMMAVAT") == 0)
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
          if(fieldNameStr.compareTo("TECHCONDSERVICESREF") == 0)
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
        "UPDATE ENACTINCOMETECHCONDTNS SET  NUMBERGEN = ? , DATEGEN = ? , ACTDATESTART = ? , ACTDATEEND = ? , SUMMAGEN = ? , SUMMAVAT = ? , COMMENTGEN = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , TECHCONDSERVICESREFCOD = ? , STATUSREFCODE = ? , WARRANTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENACTINCOMETECHCONDITIONS SET ";
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
      statement.setString(1,anObject.numbergen);
      if (anObject.dategen == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.dategen.getTime()));
      if (anObject.actDateStart == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.actDateStart.getTime()));
      if (anObject.actDateEnd == null)
        statement.setDate(4,null);
      else
        statement.setDate(4,new java.sql.Date(anObject.actDateEnd.getTime()));
      if (anObject.summaGen != null)
        anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.summaGen);
      if (anObject.summaVat != null)
        anObject.summaVat = anObject.summaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.summaVat);
      statement.setString(7,anObject.commentGen);
      statement.setString(8,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(9,null);
      else
        statement.setBigDecimal(9,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.techCondServicesRef.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.techCondServicesRef.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.statusRef.code != Integer.MIN_VALUE)
        statement.setInt(11,anObject.statusRef.code);
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.warrantRef.code != Integer.MIN_VALUE)
        statement.setInt(12,anObject.warrantRef.code);
      else
        statement.setNull(12,java.sql.Types.INTEGER);
          statement.setInt(13,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("NUMBERGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.numbergen);
                continue;
             }
            if("DATEGEN".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dategen == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.dategen.getTime()));
                continue;
             }
            if("ACTDATESTART".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.actDateStart == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.actDateStart.getTime()));
                continue;
             }
            if("ACTDATEEND".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.actDateEnd == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.actDateEnd.getTime()));
                continue;
             }
            if("SUMMAGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.summaGen != null)
                    anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.summaGen);
                continue;
             }
            if("SUMMAVAT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.summaVat != null)
                    anObject.summaVat = anObject.summaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.summaVat);
                continue;
             }
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
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
            if("TECHCONDSERVICESREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.techCondServicesRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.techCondServicesRef.code);
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

   } // end of save(ENActIncomeTechConditions anObject,String[] anAttributes)


 public ENActIncomeTechConditionsShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENActIncomeTechConditions filterObject = new ENActIncomeTechConditions();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENActIncomeTechConditionsShort)list.get(0);
   return null;
  }

  public ENActIncomeTechConditionsShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENActIncomeTechConditionsShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENActIncomeTechConditionsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENActIncomeTechConditionsShortList getFilteredList(ENActIncomeTechConditions filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENActIncomeTechConditionsShortList getScrollableFilteredList(ENActIncomeTechConditions aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENActIncomeTechConditionsShortList getScrollableFilteredList(ENActIncomeTechConditions aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENActIncomeTechConditionsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENActIncomeTechConditionsShortList getScrollableFilteredList(ENActIncomeTechConditionsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENActIncomeTechConditionsShortList getScrollableFilteredList(ENActIncomeTechConditionsFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENActIncomeTechConditionsShortList getScrollableFilteredList(ENActIncomeTechConditions aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENActIncomeTechConditionsShortList getScrollableFilteredList(ENActIncomeTechConditions aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENActIncomeTechConditionsShortList result = new ENActIncomeTechConditionsShortList();
    ENActIncomeTechConditionsShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACTINCOMETECHCONDTNS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENACTINCOMETECHCONDTNS.CODE"+
     ",ENACTINCOMETECHCONDTNS.NUMBERGEN"+
     ",ENACTINCOMETECHCONDTNS.DATEGEN"+
     ",ENACTINCOMETECHCONDTNS.ACTDATESTART"+
     ",ENACTINCOMETECHCONDTNS.ACTDATEEND"+
     ",ENACTINCOMETECHCONDTNS.SUMMAGEN"+
     ",ENACTINCOMETECHCONDTNS.SUMMAVAT"+

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
      ", ENACTINCOMESTATUS.CODE " +
      ", ENACTINCOMESTATUS.NAME " +
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
     " FROM ENACTINCOMETECHCONDTNS " +
     ", ENTECHCONDITIONSSERVCS " +
     ", ENACTINCOMESTATUS " +
     ", ENWARRANT " +
     //" WHERE "
    "";
     whereStr = " ENTECHCONDITIONSSERVCS.CODE = ENACTINCOMETECHCONDTNS.TECHCONDSERVICESREFCOD" ; //+
      whereStr = whereStr +" AND ENACTINCOMESTATUS.CODE = ENACTINCOMETECHCONDTNS.STATUSREFCODE" ; //+
      whereStr = whereStr +" AND ENWARRANT.CODE = ENACTINCOMETECHCONDTNS.WARRANTREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENACTINCOMETECHCONDTNS.CODE IN ( SELECT ENACTINCOMETECHCONDTNS.CODE FROM ENACTINCOMETECHCONDTNS ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.CODE = ?";
        }
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACTINCOMETECHCONDTNS.NUMBERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACTINCOMETECHCONDTNS.NUMBERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dategen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.DATEGEN = ?";
        }
        if(aFilterObject.actDateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.ACTDATESTART = ?";
        }
        if(aFilterObject.actDateEnd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.ACTDATEEND = ?";
        }
        if(aFilterObject.summaGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.SUMMAGEN = ?";
        }
        if(aFilterObject.summaVat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.SUMMAVAT = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACTINCOMETECHCONDTNS.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACTINCOMETECHCONDTNS.COMMENTGEN) LIKE UPPER(?)";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACTINCOMETECHCONDTNS.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACTINCOMETECHCONDTNS.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.MODIFY_TIME = ?";
        }
        if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACTINCOMETECHCONDTNS.TECHCONDSERVICESREFCOD = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACTINCOMETECHCONDTNS.STATUSREFCODE = ? ";
        }
        if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACTINCOMETECHCONDTNS.WARRANTREFCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncomeTechConditions.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENActIncomeTechConditions.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENACTINCOMETECHCONDTNS",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENACTINCOMETECHCONDTNS.DOMAIN_INFO IS NOT NULL";
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

    try
     {
      statement = connection.prepareStatement(selectStr);
      int number = 0;
      if(aFilterObject != null){
         if(aFilterObject.code != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.code);
         }

           if(aFilterObject.numbergen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numbergen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.dategen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dategen.getTime()));
        }
        if(aFilterObject.actDateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.actDateStart.getTime()));
        }
        if(aFilterObject.actDateEnd != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.actDateEnd.getTime()));
        }
        if(aFilterObject.summaGen != null){
            number++;
            aFilterObject.summaGen = aFilterObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summaGen);
        }
        if(aFilterObject.summaVat != null){
            number++;
            aFilterObject.summaVat = aFilterObject.summaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summaVat);
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
       if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServicesRef.code);
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

        anObject = new ENActIncomeTechConditionsShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.numbergen = set.getString(2);
        anObject.dategen = set.getDate(3);
        anObject.actDateStart = set.getDate(4);
        anObject.actDateEnd = set.getDate(5);
        anObject.summaGen = set.getBigDecimal(6);
        if(anObject.summaGen != null)
            anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.summaVat = set.getBigDecimal(7);
        if(anObject.summaVat != null)
            anObject.summaVat = anObject.summaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.techCondServicesRefCode = set.getInt(8);
        if(set.wasNull())
        anObject.techCondServicesRefCode = Integer.MIN_VALUE;
        anObject.techCondServicesRefContractNumber = set.getString(9);
        anObject.techCondServicesRefContractDate = set.getDate(10);
        anObject.techCondServicesRefFinContractNumber = set.getString(11);
        anObject.techCondServicesRefFinContractDate = set.getDate(12);
        anObject.techCondServicesRefPartnerName = set.getString(13);
        anObject.techCondServicesRefPartnerCode = set.getString(14);
        anObject.techCondServicesRefFinDocCode = set.getString(15);
        anObject.techCondServicesRefFinDocID = set.getInt(16);
        if(set.wasNull())
        anObject.techCondServicesRefFinDocID = Integer.MIN_VALUE;
        anObject.techCondServicesRefFinCommentGen = set.getString(17);
        anObject.techCondServicesRefTySummaGen = set.getBigDecimal(18);
        if(anObject.techCondServicesRefTySummaGen != null)
          anObject.techCondServicesRefTySummaGen = anObject.techCondServicesRefTySummaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServicesRefTySummaVat = set.getBigDecimal(19);
        if(anObject.techCondServicesRefTySummaVat != null)
          anObject.techCondServicesRefTySummaVat = anObject.techCondServicesRefTySummaVat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServicesRefTyServicesSumma = set.getBigDecimal(20);
        if(anObject.techCondServicesRefTyServicesSumma != null)
          anObject.techCondServicesRefTyServicesSumma = anObject.techCondServicesRefTyServicesSumma.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServicesRefTyServicesPower = set.getBigDecimal(21);
        if(anObject.techCondServicesRefTyServicesPower != null)
          anObject.techCondServicesRefTyServicesPower = anObject.techCondServicesRefTyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServicesRefCommentServicesGen = set.getString(22);
        anObject.techCondServicesRefUserGen = set.getString(23);
        anObject.techCondServicesRefDateEdit = set.getDate(24);
        anObject.techCondServicesRefCnPackCode = set.getInt(25);
        if(set.wasNull())
        anObject.techCondServicesRefCnPackCode = Integer.MIN_VALUE;
        anObject.techCondServicesRefExecutionTerm = set.getString(26);
        anObject.techCondServicesRefBuildersArea = set.getInt(27);
        if(set.wasNull())
        anObject.techCondServicesRefBuildersArea = Integer.MIN_VALUE;
        anObject.techCondServicesRefBaseStation = set.getInt(28);
        if(set.wasNull())
        anObject.techCondServicesRefBaseStation = Integer.MIN_VALUE;
        anObject.techCondServicesRefSmallArchFrm = set.getInt(29);
        if(set.wasNull())
        anObject.techCondServicesRefSmallArchFrm = Integer.MIN_VALUE;
        anObject.techCondServicesRefContractDateFinal = set.getDate(30);
        anObject.techCondServicesRefIsSea = set.getInt(31);
        if(set.wasNull())
        anObject.techCondServicesRefIsSea = Integer.MIN_VALUE;

        anObject.statusRefCode = set.getInt(33);
        if(set.wasNull())
        anObject.statusRefCode = Integer.MIN_VALUE;
        anObject.statusRefName = set.getString(34);
        anObject.warrantRefCode = set.getInt(35);
        if(set.wasNull())
        anObject.warrantRefCode = Integer.MIN_VALUE;
        anObject.warrantRefNumbergen = set.getString(36);
        anObject.warrantRefName = set.getString(37);
        anObject.warrantRefWarrantFIO = set.getString(38);
        anObject.warrantRefWarrantShortFIO = set.getString(39);
        anObject.warrantRefWarrantPosition = set.getString(40);
        anObject.warrantRefGenitiveFIO = set.getString(41);
        anObject.warrantRefGenitivePosition = set.getString(42);
        anObject.warrantRefPassport = set.getString(43);
        anObject.warrantRefAddress = set.getString(44);
        anObject.warrantRefPower = set.getInt(45);
        if(set.wasNull())
        anObject.warrantRefPower = Integer.MIN_VALUE;
        anObject.warrantRefMaxSum = set.getBigDecimal(46);
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

  public int[] getFilteredCodeArrayOLD(ENActIncomeTechConditions aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENACTINCOMETECHCONDTNS.CODE FROM ENACTINCOMETECHCONDTNS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACTINCOMETECHCONDTNS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncomeTechConditions.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENActIncomeTechConditions.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENACTINCOMETECHCONDTNS",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENACTINCOMETECHCONDTNS.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.CODE = ?";
        }
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.dategen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.DATEGEN = ?";
        }
        if(aFilterObject.actDateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.ACTDATESTART = ?";
        }
        if(aFilterObject.actDateEnd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.ACTDATEEND = ?";
        }
        if(aFilterObject.summaGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.SUMMAGEN = ?";
        }
        if(aFilterObject.summaVat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.SUMMAVAT = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.MODIFY_TIME = ?";
        }
        if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACTINCOMETECHCONDTNS.TECHCONDSERVICESREFCOD = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACTINCOMETECHCONDTNS.STATUSREFCODE = ? ";
        }
        if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACTINCOMETECHCONDTNS.WARRANTREFCODE = ? ";
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
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACTINCOMETECHCONDTNS.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENACTINCOMETECHCONDTNS.NUMBERGEN LIKE ?";

           if(aFilterObject.numbergen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numbergen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dategen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dategen.getTime()));
        }
        if(aFilterObject.actDateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.actDateStart.getTime()));
        }
        if(aFilterObject.actDateEnd != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.actDateEnd.getTime()));
        }
        if(aFilterObject.summaGen != null){
            number++;
            aFilterObject.summaGen = aFilterObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summaGen);
        }
        if(aFilterObject.summaVat != null){
            number++;
            aFilterObject.summaVat = aFilterObject.summaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summaVat);
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACTINCOMETECHCONDTNS.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENACTINCOMETECHCONDTNS.COMMENTGEN LIKE ?";

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
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACTINCOMETECHCONDTNS.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENACTINCOMETECHCONDTNS.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServicesRef.code);
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

  public int[] getFilteredCodeArray(ENActIncomeTechConditionsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENActIncomeTechConditions aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENACTINCOMETECHCONDTNS.CODE FROM ENACTINCOMETECHCONDTNS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACTINCOMETECHCONDTNS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncomeTechConditions.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENActIncomeTechConditions.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENACTINCOMETECHCONDTNS",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENACTINCOMETECHCONDTNS.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.CODE = ?";
        }
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.dategen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.DATEGEN = ?";
        }
        if(aFilterObject.actDateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.ACTDATESTART = ?";
        }
        if(aFilterObject.actDateEnd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.ACTDATEEND = ?";
        }
        if(aFilterObject.summaGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.SUMMAGEN = ?";
        }
        if(aFilterObject.summaVat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.SUMMAVAT = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.MODIFY_TIME = ?";
        }
        if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACTINCOMETECHCONDTNS.TECHCONDSERVICESREFCOD = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACTINCOMETECHCONDTNS.STATUSREFCODE = ? ";
        }
        if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACTINCOMETECHCONDTNS.WARRANTREFCODE = ? ";
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
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACTINCOMETECHCONDTNS.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENACTINCOMETECHCONDTNS.NUMBERGEN LIKE ?";

           if(aFilterObject.numbergen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numbergen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dategen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dategen.getTime()));
        }
        if(aFilterObject.actDateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.actDateStart.getTime()));
        }
        if(aFilterObject.actDateEnd != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.actDateEnd.getTime()));
        }
        if(aFilterObject.summaGen != null){
            number++;
            aFilterObject.summaGen = aFilterObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summaGen);
        }
        if(aFilterObject.summaVat != null){
            number++;
            aFilterObject.summaVat = aFilterObject.summaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summaVat);
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACTINCOMETECHCONDTNS.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENACTINCOMETECHCONDTNS.COMMENTGEN LIKE ?";

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
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACTINCOMETECHCONDTNS.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENACTINCOMETECHCONDTNS.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServicesRef.code);
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


   public ENActIncomeTechConditions getObject(int uid) throws PersistenceException
   {
    ENActIncomeTechConditions result = new ENActIncomeTechConditions();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENActIncomeTechConditions anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncomeTechConditions.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENActIncomeTechConditions.getObject%} access denied");



    selectStr =
    "SELECT  ENACTINCOMETECHCONDTNS.CODE, ENACTINCOMETECHCONDTNS.NUMBERGEN, ENACTINCOMETECHCONDTNS.DATEGEN, ENACTINCOMETECHCONDTNS.ACTDATESTART, ENACTINCOMETECHCONDTNS.ACTDATEEND, ENACTINCOMETECHCONDTNS.SUMMAGEN, ENACTINCOMETECHCONDTNS.SUMMAVAT, ENACTINCOMETECHCONDTNS.COMMENTGEN, ENACTINCOMETECHCONDTNS.DOMAIN_INFO, ENACTINCOMETECHCONDTNS.MODIFY_TIME, ENACTINCOMETECHCONDTNS.TECHCONDSERVICESREFCOD, ENACTINCOMETECHCONDTNS.STATUSREFCODE, ENACTINCOMETECHCONDTNS.WARRANTREFCODE "
    +" FROM ENACTINCOMETECHCONDTNS WHERE ENACTINCOMETECHCONDTNS.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENACTINCOMETECHCONDTNS",segregationInfo,getUserProfile().getDomainInfo());
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
        anObject.numbergen = set.getString(2);
        anObject.dategen = set.getDate(3);
        anObject.actDateStart = set.getDate(4);
        anObject.actDateEnd = set.getDate(5);
        anObject.summaGen = set.getBigDecimal(6);
        if(anObject.summaGen != null)
            anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.summaVat = set.getBigDecimal(7);
        if(anObject.summaVat != null)
            anObject.summaVat = anObject.summaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.commentGen = set.getString(8);
        anObject.domain_info = set.getString(9);
        anObject.modify_time = set.getLong(10);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.techCondServicesRef.code = set.getInt(11);
        if ( set.wasNull() )
            anObject.techCondServicesRef.code = Integer.MIN_VALUE;
        anObject.statusRef.code = set.getInt(12);
        if ( set.wasNull() )
            anObject.statusRef.code = Integer.MIN_VALUE;
        anObject.warrantRef.code = set.getInt(13);
        if ( set.wasNull() )
            anObject.warrantRef.code = Integer.MIN_VALUE;
        if(anObject.techCondServicesRef.code != Integer.MIN_VALUE)
        {
           anObject.setTechCondServicesRef(
        new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesDAOGen(connection,getUserProfile()).getRef(anObject.techCondServicesRef.code));
    }
        if(anObject.statusRef.code != Integer.MIN_VALUE)
        {
           anObject.setStatusRef(
        new com.ksoe.energynet.dataminer.generated.ENActIncomeStatusDAOGen(connection,getUserProfile()).getRef(anObject.statusRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENActIncomeTechConditionsRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENActIncomeTechConditionsRef ref = new com.ksoe.energynet.valueobject.references.ENActIncomeTechConditionsRef();
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

    selectStr = "DELETE FROM  ENACTINCOMETECHCONDTNS WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENActIncomeTechConditions object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENActIncomeTechConditions.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncomeTechConditions.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENActIncomeTechConditions.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncomeTechConditions.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENActIncomeTechConditions.getObject%} access denied");

    selectStr =

    "SELECT  ENACTINCOMETECHCONDTNS.CODE FROM  ENACTINCOMETECHCONDTNS WHERE  ENACTINCOMETECHCONDTNS.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENACTINCOMETECHCONDTNS",segregationInfo,getUserProfile().getDomainInfo());
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
    _checkConditionToken(condition,"code","ENACTINCOMETECHCONDTNS.CODE");
    _checkConditionToken(condition,"numbergen","ENACTINCOMETECHCONDTNS.NUMBERGEN");
    _checkConditionToken(condition,"dategen","ENACTINCOMETECHCONDTNS.DATEGEN");
    _checkConditionToken(condition,"actdatestart","ENACTINCOMETECHCONDTNS.ACTDATESTART");
    _checkConditionToken(condition,"actdateend","ENACTINCOMETECHCONDTNS.ACTDATEEND");
    _checkConditionToken(condition,"summagen","ENACTINCOMETECHCONDTNS.SUMMAGEN");
    _checkConditionToken(condition,"summavat","ENACTINCOMETECHCONDTNS.SUMMAVAT");
    _checkConditionToken(condition,"commentgen","ENACTINCOMETECHCONDTNS.COMMENTGEN");
    _checkConditionToken(condition,"domain_info","ENACTINCOMETECHCONDTNS.DOMAIN_INFO");
    _checkConditionToken(condition,"modify_time","ENACTINCOMETECHCONDTNS.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"techcondservicesref","TECHCONDSERVICESREFCOD");
    _checkConditionToken(condition,"techcondservicesref.code","TECHCONDSERVICESREFCOD");
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

    private void _collectAutoIncrementFields(ENActIncomeTechConditions anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENACTINCOMETECHCONDTNS", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENACTINCOMETECHCONDTNS", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENACTINCOMETECHCONDTNS", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENACTINCOMETECHCONDTNS");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENActIncomeTechConditionsDAO
