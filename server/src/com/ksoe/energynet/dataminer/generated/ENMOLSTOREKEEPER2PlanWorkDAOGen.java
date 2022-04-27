
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
import com.ksoe.energynet.valueobject.ENMOLSTOREKEEPER2PlanWork;
import com.ksoe.energynet.valueobject.brief.ENMOLSTOREKEEPER2PlanWorkShort;
import com.ksoe.energynet.valueobject.filter.ENMOLSTOREKEEPER2PlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENMOLSTOREKEEPER2PlanWorkShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENMOLSTOREKEEPER2PlanWork;
 *
 */

public class ENMOLSTOREKEEPER2PlanWorkDAOGen extends GenericDataMiner {

  public ENMOLSTOREKEEPER2PlanWorkDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENMOLSTOREKEEPER2PlanWorkDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENMOLSTOREKEEPER2PlanWork inObject) throws PersistenceException
   {
      ENMOLSTOREKEEPER2PlanWork obj = new ENMOLSTOREKEEPER2PlanWork();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.molName != obj.molName){
       return false;
     }

     if (inObject.molCode != obj.molCode){
       return false;
     }
     if (inObject.planRef.code != obj.planRef.code){
        return false;
     }
      return true;
   }

   public int add(ENMOLSTOREKEEPER2PlanWork anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENMOLSTOREKEEPER2PlanWork anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENMOLSTOREKEEPR2PLNWRK (CODE,MOLNAME,MOLCODE,PLANREFCODE) VALUES (?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.molName);
      statement.setString(3,anObject.molCode);
      if (anObject.planRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENMOLSTOREKEEPER2PlanWork.planRef.code%} = {%"+anObject.planRef.code+"%}");
        statement.setInt(4,anObject.planRef.code);
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
      throw new PersistenceException("Error in method {%ENMOLSTOREKEEPER2PlanWorkDAOGen.add%}",e);
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

   public void save(ENMOLSTOREKEEPER2PlanWork anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENMOLSTOREKEEPER2PlanWork anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("MOLNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MOLCODE") == 0)
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
        "UPDATE ENMOLSTOREKEEPR2PLNWRK SET  MOLNAME = ? , MOLCODE = ? , PLANREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENMOLSTOREKEEPER2PLANWORK SET ";
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
      statement.setString(1,anObject.molName);
      statement.setString(2,anObject.molCode);
      if (anObject.planRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.planRef.code);
      else
        statement.setNull(3,java.sql.Types.INTEGER);
          statement.setInt(4,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("MOLNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.molName);
                continue;
             }
            if("MOLCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.molCode);
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

   } // end of save(ENMOLSTOREKEEPER2PlanWork anObject,String[] anAttributes)


 public ENMOLSTOREKEEPER2PlanWorkShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENMOLSTOREKEEPER2PlanWork filterObject = new ENMOLSTOREKEEPER2PlanWork();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENMOLSTOREKEEPER2PlanWorkShort)list.get(0);
   return null;
  }

  public ENMOLSTOREKEEPER2PlanWorkShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENMOLSTOREKEEPER2PlanWorkShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENMOLSTOREKEEPER2PlanWorkShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENMOLSTOREKEEPER2PlanWorkShortList getFilteredList(ENMOLSTOREKEEPER2PlanWork filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENMOLSTOREKEEPER2PlanWorkShortList getScrollableFilteredList(ENMOLSTOREKEEPER2PlanWork aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENMOLSTOREKEEPER2PlanWorkShortList getScrollableFilteredList(ENMOLSTOREKEEPER2PlanWork aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENMOLSTOREKEEPER2PlanWorkShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENMOLSTOREKEEPER2PlanWorkShortList getScrollableFilteredList(ENMOLSTOREKEEPER2PlanWorkFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENMOLSTOREKEEPER2PlanWorkShortList getScrollableFilteredList(ENMOLSTOREKEEPER2PlanWorkFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENMOLSTOREKEEPER2PlanWorkShortList getScrollableFilteredList(ENMOLSTOREKEEPER2PlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENMOLSTOREKEEPER2PlanWorkShortList getScrollableFilteredList(ENMOLSTOREKEEPER2PlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENMOLSTOREKEEPER2PlanWorkShortList result = new ENMOLSTOREKEEPER2PlanWorkShortList();
    ENMOLSTOREKEEPER2PlanWorkShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENMOLSTOREKEEPR2PLNWRK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENMOLSTOREKEEPR2PLNWRK.CODE"+
     ",ENMOLSTOREKEEPR2PLNWRK.MOLNAME"+
     ",ENMOLSTOREKEEPR2PLNWRK.MOLCODE"+

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
     " FROM ENMOLSTOREKEEPR2PLNWRK " +
     ", ENPLANWORK " +
     //" WHERE "
    "";
     whereStr = " ENPLANWORK.CODE = ENMOLSTOREKEEPR2PLNWRK.PLANREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENMOLSTOREKEEPR2PLNWRK.CODE IN ( SELECT ENMOLSTOREKEEPR2PLNWRK.CODE FROM ENMOLSTOREKEEPR2PLNWRK ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLSTOREKEEPR2PLNWRK.CODE = ?";
        }
         if (aFilterObject.molName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molName.indexOf('*',0) < 0 && aFilterObject.molName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENMOLSTOREKEEPR2PLNWRK.MOLNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENMOLSTOREKEEPR2PLNWRK.MOLNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.molCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENMOLSTOREKEEPR2PLNWRK.MOLCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENMOLSTOREKEEPR2PLNWRK.MOLCODE) LIKE UPPER(?)";
         }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENMOLSTOREKEEPR2PLNWRK.PLANREFCODE = ? ";
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

           if(aFilterObject.molName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.molCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
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

        anObject = new ENMOLSTOREKEEPER2PlanWorkShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.molName = set.getString(2);
        anObject.molCode = set.getString(3);

        anObject.planRefCode = set.getInt(4);
        if(set.wasNull())
        anObject.planRefCode = Integer.MIN_VALUE;
        anObject.planRefDateGen = set.getTimestamp(5);
        anObject.planRefDateStart = set.getDate(6);
        anObject.planRefDateFinal = set.getDate(7);
        anObject.planRefYearGen = set.getInt(8);
        if(set.wasNull())
        anObject.planRefYearGen = Integer.MIN_VALUE;
        anObject.planRefMonthGen = set.getInt(9);
        if(set.wasNull())
        anObject.planRefMonthGen = Integer.MIN_VALUE;
        anObject.planRefYearOriginal = set.getInt(10);
        if(set.wasNull())
        anObject.planRefYearOriginal = Integer.MIN_VALUE;
        anObject.planRefMonthOriginal = set.getInt(11);
        if(set.wasNull())
        anObject.planRefMonthOriginal = Integer.MIN_VALUE;
        anObject.planRefUserGen = set.getString(12);
        anObject.planRefDateEdit = set.getDate(13);
        anObject.planRefWorkOrderNumber = set.getString(14);
        anObject.planRefDateWorkOrder = set.getDate(15);
        anObject.planRefPriConnectionNumber = set.getString(16);
        anObject.planRefDateEndPriConnection = set.getDate(17);
        anObject.planRefInvestWorksDescription = set.getString(18);
        anObject.planRefServicesFSideFinId = set.getInt(19);
        if(set.wasNull())
        anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
        anObject.planRefServicesFSideCnNum = set.getString(20);
        anObject.planRefTotalTimeHours = set.getBigDecimal(21);
        if(anObject.planRefTotalTimeHours != null)
          anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planRefTotalTimeDays = set.getBigDecimal(22);
        if(anObject.planRefTotalTimeDays != null)
          anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planRefInvestItemNumber = set.getString(23);

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

  public int[] getFilteredCodeArrayOLD(ENMOLSTOREKEEPER2PlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENMOLSTOREKEEPR2PLNWRK.CODE FROM ENMOLSTOREKEEPR2PLNWRK";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENMOLSTOREKEEPR2PLNWRK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLSTOREKEEPR2PLNWRK.CODE = ?";
        }
         if (aFilterObject.molName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molName.indexOf('*',0) < 0 && aFilterObject.molName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENMOLSTOREKEEPR2PLNWRK.MOLNAME = ?";
             else
                 whereStr = whereStr + "  ENMOLSTOREKEEPR2PLNWRK.MOLNAME LIKE ?";
         }
         if (aFilterObject.molCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENMOLSTOREKEEPR2PLNWRK.MOLCODE = ?";
             else
                 whereStr = whereStr + "  ENMOLSTOREKEEPR2PLNWRK.MOLCODE LIKE ?";
         }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENMOLSTOREKEEPR2PLNWRK.PLANREFCODE = ? ";
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
         if (aFilterObject.molName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.molName.indexOf('*',0) < 0 && aFilterObject.molName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENMOLSTOREKEEPR2PLNWRK.MOLNAME = ?";
             else
                 whereStr = whereStr + " ENMOLSTOREKEEPR2PLNWRK.MOLNAME LIKE ?";

           if(aFilterObject.molName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.molCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENMOLSTOREKEEPR2PLNWRK.MOLCODE = ?";
             else
                 whereStr = whereStr + " ENMOLSTOREKEEPR2PLNWRK.MOLCODE LIKE ?";

           if(aFilterObject.molCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
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

  public int[] getFilteredCodeArray(ENMOLSTOREKEEPER2PlanWorkFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENMOLSTOREKEEPER2PlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENMOLSTOREKEEPR2PLNWRK.CODE FROM ENMOLSTOREKEEPR2PLNWRK";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENMOLSTOREKEEPR2PLNWRK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLSTOREKEEPR2PLNWRK.CODE = ?";
        }
         if (aFilterObject.molName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molName.indexOf('*',0) < 0 && aFilterObject.molName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENMOLSTOREKEEPR2PLNWRK.MOLNAME = ?";
             else
                 whereStr = whereStr + "  ENMOLSTOREKEEPR2PLNWRK.MOLNAME LIKE ?";
         }
         if (aFilterObject.molCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENMOLSTOREKEEPR2PLNWRK.MOLCODE = ?";
             else
                 whereStr = whereStr + "  ENMOLSTOREKEEPR2PLNWRK.MOLCODE LIKE ?";
         }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENMOLSTOREKEEPR2PLNWRK.PLANREFCODE = ? ";
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
         if (aFilterObject.molName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.molName.indexOf('*',0) < 0 && aFilterObject.molName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENMOLSTOREKEEPR2PLNWRK.MOLNAME = ?";
             else
                 whereStr = whereStr + " ENMOLSTOREKEEPR2PLNWRK.MOLNAME LIKE ?";

           if(aFilterObject.molName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.molCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENMOLSTOREKEEPR2PLNWRK.MOLCODE = ?";
             else
                 whereStr = whereStr + " ENMOLSTOREKEEPR2PLNWRK.MOLCODE LIKE ?";

           if(aFilterObject.molCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
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


   public ENMOLSTOREKEEPER2PlanWork getObject(int uid) throws PersistenceException
   {
    ENMOLSTOREKEEPER2PlanWork result = new ENMOLSTOREKEEPER2PlanWork();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENMOLSTOREKEEPER2PlanWork anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENMOLSTOREKEEPR2PLNWRK.CODE, ENMOLSTOREKEEPR2PLNWRK.MOLNAME, ENMOLSTOREKEEPR2PLNWRK.MOLCODE, ENMOLSTOREKEEPR2PLNWRK.PLANREFCODE "
    +" FROM ENMOLSTOREKEEPR2PLNWRK WHERE ENMOLSTOREKEEPR2PLNWRK.CODE = ?";

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
        anObject.molName = set.getString(2);
        anObject.molCode = set.getString(3);
        anObject.planRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.planRef.code = Integer.MIN_VALUE;
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


  public com.ksoe.energynet.valueobject.references.ENMOLSTOREKEEPER2PlanWorkRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENMOLSTOREKEEPER2PlanWorkRef ref = new com.ksoe.energynet.valueobject.references.ENMOLSTOREKEEPER2PlanWorkRef();
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

    selectStr = "DELETE FROM  ENMOLSTOREKEEPR2PLNWRK WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENMOLSTOREKEEPER2PlanWork object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENMOLSTOREKEEPER2PlanWork.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENMOLSTOREKEEPER2PlanWork.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENMOLSTOREKEEPER2PlanWork.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENMOLSTOREKEEPER2PlanWork.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENMOLSTOREKEEPER2PlanWork.getObject%} access denied");

    selectStr =

    "SELECT  ENMOLSTOREKEEPR2PLNWRK.CODE FROM  ENMOLSTOREKEEPR2PLNWRK WHERE  ENMOLSTOREKEEPR2PLNWRK.CODE = ?";
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
    _checkConditionToken(condition,"code","ENMOLSTOREKEEPR2PLNWRK.CODE");
    _checkConditionToken(condition,"molname","ENMOLSTOREKEEPR2PLNWRK.MOLNAME");
    _checkConditionToken(condition,"molcode","ENMOLSTOREKEEPR2PLNWRK.MOLCODE");
      // relationship conditions
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

   private void _collectAutoIncrementFields(ENMOLSTOREKEEPER2PlanWork anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENMOLSTOREKEEPR2PLNWRK", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENMOLSTOREKEEPR2PLNWRK", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENMOLSTOREKEEPR2PLNWRK", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENMOLSTOREKEEPR2PLNWRK");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENMOLSTOREKEEPER2PlanWorkDAO
