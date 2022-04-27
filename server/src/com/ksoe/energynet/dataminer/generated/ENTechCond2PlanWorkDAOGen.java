
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
import com.ksoe.energynet.valueobject.ENTechCond2PlanWork;
import com.ksoe.energynet.valueobject.brief.ENTechCond2PlanWorkShort;
import com.ksoe.energynet.valueobject.filter.ENTechCond2PlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENTechCond2PlanWorkShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENTechCond2PlanWork;
 *
 */

public class ENTechCond2PlanWorkDAOGen extends GenericDataMiner {

  public ENTechCond2PlanWorkDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTechCond2PlanWorkDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTechCond2PlanWork inObject) throws PersistenceException
   {
      ENTechCond2PlanWork obj = new ENTechCond2PlanWork();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.techConServicesRef.code != obj.techConServicesRef.code){
        return false;
     }
     if (inObject.planRef.code != obj.planRef.code){
        return false;
     }
      return true;
   }

   public int add(ENTechCond2PlanWork anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTechCond2PlanWork anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTECHCOND2PLANWORK (CODE,TECHCONSERVICESREFCODE,PLANREFCODE) VALUES (?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.techConServicesRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesDAOGen(connection,getUserProfile()).exists(anObject.techConServicesRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechCond2PlanWork.techConServicesRef.code%} = {%"+anObject.techConServicesRef.code+"%}");
        statement.setInt(2,anObject.techConServicesRef.code);
      }
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.planRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechCond2PlanWork.planRef.code%} = {%"+anObject.planRef.code+"%}");
        statement.setInt(3,anObject.planRef.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTechCond2PlanWorkDAOGen.add%}",e);
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

   public void save(ENTechCond2PlanWork anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTechCond2PlanWork anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("TECHCONSERVICESREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PLANREF") == 0)
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
        "UPDATE ENTECHCOND2PLANWORK SET TECHCONSERVICESREFCODE = ? , PLANREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTECHCOND2PLANWORK SET ";
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
      if (anObject.techConServicesRef.code != Integer.MIN_VALUE)
        statement.setInt(1,anObject.techConServicesRef.code);
      else
        statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.planRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.planRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
          statement.setInt(3,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("TECHCONSERVICESREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.techConServicesRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.techConServicesRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("PLANREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.planRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.planRef.code);
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

   } // end of save(ENTechCond2PlanWork anObject,String[] anAttributes)


 public ENTechCond2PlanWorkShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTechCond2PlanWork filterObject = new ENTechCond2PlanWork();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTechCond2PlanWorkShort)list.get(0);
   return null;
  }

  public ENTechCond2PlanWorkShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTechCond2PlanWorkShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTechCond2PlanWorkShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTechCond2PlanWorkShortList getFilteredList(ENTechCond2PlanWork filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTechCond2PlanWorkShortList getScrollableFilteredList(ENTechCond2PlanWork aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTechCond2PlanWorkShortList getScrollableFilteredList(ENTechCond2PlanWork aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTechCond2PlanWorkShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTechCond2PlanWorkShortList getScrollableFilteredList(ENTechCond2PlanWorkFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTechCond2PlanWorkShortList getScrollableFilteredList(ENTechCond2PlanWorkFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTechCond2PlanWorkShortList getScrollableFilteredList(ENTechCond2PlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTechCond2PlanWorkShortList getScrollableFilteredList(ENTechCond2PlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTechCond2PlanWorkShortList result = new ENTechCond2PlanWorkShortList();
    ENTechCond2PlanWorkShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTECHCOND2PLANWORK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTECHCOND2PLANWORK.CODE"+

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
      ", ENPLANWORK.CODE " +
      ", ENPLANWORK.DATEGEN " +
      ", ENPLANWORK.DATESTART " +
      ", ENPLANWORK.DATEFINAL " +
      ", ENPLANWORK.YEARGEN " +
      ", ENPLANWORK.MONTHGEN " +
      ", ENPLANWORK.YEARORIGINAL " +
      ", ENPLANWORK.MONTHORIGINAL " +
      ", ENPLANWORK.USERGEN " +
      ", ENPLANWORK.DATEEDIT " +
      ", ENPLANWORK.WORKORDERNUMBER " +
      ", ENPLANWORK.DATEWORKORDER " +
      ", ENPLANWORK.PRICONNECTIONNUMBER " +
      ", ENPLANWORK.DATEENDPRICONNECTION " +
      ", ENPLANWORK.INVESTWORKSDESCRIPTION " +
      ", ENPLANWORK.SERVICESFSIDEFINID " +
      ", ENPLANWORK.SERVICESFSIDECNNUM " +
      ", ENPLANWORK.TOTALTIMEHOURS " +
      ", ENPLANWORK.TOTALTIMEDAYS " +
      ", ENPLANWORK.INVESTITEMNUMBER " +
     " FROM ENTECHCOND2PLANWORK " +
     ", ENTECHCONDITIONSSERVCS " +
     ", ENPLANWORK " +
     //" WHERE "
    "";
     whereStr = " ENTECHCONDITIONSSERVCS.CODE = ENTECHCOND2PLANWORK.TECHCONSERVICESREFCODE" ; //+
      whereStr = whereStr +" AND ENPLANWORK.CODE = ENTECHCOND2PLANWORK.PLANREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENTECHCOND2PLANWORK.CODE IN ( SELECT ENTECHCOND2PLANWORK.CODE FROM ENTECHCOND2PLANWORK ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCOND2PLANWORK.CODE = ?";
        }
        if(aFilterObject.techConServicesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCOND2PLANWORK.TECHCONSERVICESREFCODE = ? ";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCOND2PLANWORK.PLANREFCODE = ? ";
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
       if(aFilterObject.techConServicesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techConServicesRef.code);
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
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

        anObject = new ENTechCond2PlanWorkShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.techConServicesRefCode = set.getInt(2);
        if(set.wasNull())
        anObject.techConServicesRefCode = Integer.MIN_VALUE;
        anObject.techConServicesRefContractNumber = set.getString(3);
        anObject.techConServicesRefContractDate = set.getDate(4);
        anObject.techConServicesRefFinContractNumber = set.getString(5);
        anObject.techConServicesRefFinContractDate = set.getDate(6);
        anObject.techConServicesRefPartnerName = set.getString(7);
        anObject.techConServicesRefPartnerCode = set.getString(8);
        anObject.techConServicesRefFinDocCode = set.getString(9);
        anObject.techConServicesRefFinDocID = set.getInt(10);
        if(set.wasNull())
        anObject.techConServicesRefFinDocID = Integer.MIN_VALUE;
        anObject.techConServicesRefFinCommentGen = set.getString(11);
        anObject.techConServicesRefTySummaGen = set.getBigDecimal(12);
        if(anObject.techConServicesRefTySummaGen != null)
          anObject.techConServicesRefTySummaGen = anObject.techConServicesRefTySummaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techConServicesRefTySummaVat = set.getBigDecimal(13);
        if(anObject.techConServicesRefTySummaVat != null)
          anObject.techConServicesRefTySummaVat = anObject.techConServicesRefTySummaVat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techConServicesRefTyServicesSumma = set.getBigDecimal(14);
        if(anObject.techConServicesRefTyServicesSumma != null)
          anObject.techConServicesRefTyServicesSumma = anObject.techConServicesRefTyServicesSumma.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techConServicesRefTyServicesPower = set.getBigDecimal(15);
        if(anObject.techConServicesRefTyServicesPower != null)
          anObject.techConServicesRefTyServicesPower = anObject.techConServicesRefTyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techConServicesRefCommentServicesGen = set.getString(16);
        anObject.techConServicesRefUserGen = set.getString(17);
        anObject.techConServicesRefDateEdit = set.getDate(18);
        anObject.techConServicesRefCnPackCode = set.getInt(19);
        if(set.wasNull())
        anObject.techConServicesRefCnPackCode = Integer.MIN_VALUE;

        anObject.planRefCode = set.getInt(27);
        if(set.wasNull())
        anObject.planRefCode = Integer.MIN_VALUE;
        anObject.planRefDateGen = set.getTimestamp(28);
        anObject.planRefDateStart = set.getDate(29);
        anObject.planRefDateFinal = set.getDate(30);
        anObject.planRefYearGen = set.getInt(31);
        if(set.wasNull())
        anObject.planRefYearGen = Integer.MIN_VALUE;
        anObject.planRefMonthGen = set.getInt(32);
        if(set.wasNull())
        anObject.planRefMonthGen = Integer.MIN_VALUE;
        anObject.planRefYearOriginal = set.getInt(33);
        if(set.wasNull())
        anObject.planRefYearOriginal = Integer.MIN_VALUE;
        anObject.planRefMonthOriginal = set.getInt(34);
        if(set.wasNull())
        anObject.planRefMonthOriginal = Integer.MIN_VALUE;
        anObject.planRefUserGen = set.getString(35);
        anObject.planRefDateEdit = set.getDate(36);
        anObject.planRefWorkOrderNumber = set.getString(37);
        anObject.planRefDateWorkOrder = set.getDate(38);
        anObject.planRefPriConnectionNumber = set.getString(39);

        anObject.planRefServicesFSideFinId = set.getInt(42);
        if(set.wasNull())
        anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
        anObject.planRefServicesFSideCnNum = set.getString(43);


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

  public int[] getFilteredCodeArrayOLD(ENTechCond2PlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTECHCOND2PLANWORK.CODE FROM ENTECHCOND2PLANWORK";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTECHCOND2PLANWORK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCOND2PLANWORK.CODE = ?";
        }
        if(aFilterObject.techConServicesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTECHCOND2PLANWORK.TECHCONSERVICESREFCODE = ? ";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTECHCOND2PLANWORK.PLANREFCODE = ? ";
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
       if(aFilterObject.techConServicesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techConServicesRef.code);
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
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

  public int[] getFilteredCodeArray(ENTechCond2PlanWorkFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTechCond2PlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTECHCOND2PLANWORK.CODE FROM ENTECHCOND2PLANWORK";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTECHCOND2PLANWORK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCOND2PLANWORK.CODE = ?";
        }
        if(aFilterObject.techConServicesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTECHCOND2PLANWORK.TECHCONSERVICESREFCODE = ? ";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTECHCOND2PLANWORK.PLANREFCODE = ? ";
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
       if(aFilterObject.techConServicesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techConServicesRef.code);
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
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


   public ENTechCond2PlanWork getObject(int uid) throws PersistenceException
   {
    ENTechCond2PlanWork result = new ENTechCond2PlanWork();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTechCond2PlanWork anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTECHCOND2PLANWORK.CODE, ENTECHCOND2PLANWORK.TECHCONSERVICESREFCODE, ENTECHCOND2PLANWORK.PLANREFCODE "
    +" FROM ENTECHCOND2PLANWORK WHERE ENTECHCOND2PLANWORK.CODE = ?";

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
        anObject.techConServicesRef.code = set.getInt(2);
        if ( set.wasNull() )
            anObject.techConServicesRef.code = Integer.MIN_VALUE;
        anObject.planRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.planRef.code = Integer.MIN_VALUE;
        if(anObject.techConServicesRef.code != Integer.MIN_VALUE)
        {
           anObject.setTechConServicesRef(
        new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesDAOGen(connection,getUserProfile()).getRef(anObject.techConServicesRef.code));
    }
        if(anObject.planRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlanRef(
        new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENTechCond2PlanWorkRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTechCond2PlanWorkRef ref = new com.ksoe.energynet.valueobject.references.ENTechCond2PlanWorkRef();
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

    selectStr = "DELETE FROM  ENTECHCOND2PLANWORK WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTechCond2PlanWork object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTechCond2PlanWork.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTechCond2PlanWork.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTechCond2PlanWork.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechCond2PlanWork.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTechCond2PlanWork.getObject%} access denied");

    selectStr =

    "SELECT  ENTECHCOND2PLANWORK.CODE FROM  ENTECHCOND2PLANWORK WHERE  ENTECHCOND2PLANWORK.CODE = ?";
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
    _checkConditionToken(condition,"code","ENTECHCOND2PLANWORK.CODE");
      // relationship conditions
    _checkConditionToken(condition,"techconservicesref","TECHCONSERVICESREFCODE");
    _checkConditionToken(condition,"techconservicesref.code","TECHCONSERVICESREFCODE");
    _checkConditionToken(condition,"planref","PLANREFCODE");
    _checkConditionToken(condition,"planref.code","PLANREFCODE");
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

    private void _collectAutoIncrementFields(ENTechCond2PlanWork anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENTECHCOND2PLANWORK", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENTECHCOND2PLANWORK", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENTECHCOND2PLANWORK", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENTECHCOND2PLANWORK");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENTechCond2PlanWorkDAO
