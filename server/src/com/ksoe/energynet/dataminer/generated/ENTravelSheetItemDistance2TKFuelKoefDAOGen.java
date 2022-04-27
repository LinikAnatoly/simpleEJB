
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
import com.ksoe.energynet.valueobject.ENTravelSheetItemDistance2TKFuelKoef;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetItemDistance2TKFuelKoefShort;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemDistance2TKFuelKoefFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemDistance2TKFuelKoefShortList;
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
  *  DAO Generated for ENTravelSheetItemDistance2TKFuelKoef;
  *
  */

public class ENTravelSheetItemDistance2TKFuelKoefDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTravelSheetItemDistance2TKFuelKoefDAOGen() {super();}
  //public ENTravelSheetItemDistance2TKFuelKoefDAOGen(Connection aConnection) {super(aConnection);}
  //public ENTravelSheetItemDistance2TKFuelKoefDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTravelSheetItemDistance2TKFuelKoefDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTravelSheetItemDistance2TKFuelKoefDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTravelSheetItemDistance2TKFuelKoef inObject) throws PersistenceException
   {
      ENTravelSheetItemDistance2TKFuelKoef obj = new ENTravelSheetItemDistance2TKFuelKoef();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.travelSheetItemDistanceRef.code != obj.travelSheetItemDistanceRef.code){
        return false;
     }
     if (inObject.tkFuelKoefRef.code != obj.tkFuelKoefRef.code){
        return false;
     }
      return true;
   }

   public int add(ENTravelSheetItemDistance2TKFuelKoef anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTravelSheetItemDistance2TKFuelKoef anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO NTRVLSHTTMDSTNC2TKFLKF (CODE,TRAVELSHEETTMDSTNCRFCD,TKFUELKOEFREFCODE) VALUES (?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.travelSheetItemDistanceRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTravelSheetItemDistanceDAOGen(connection,getUserProfile()).exists(anObject.travelSheetItemDistanceRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTravelSheetItemDistance2TKFuelKoef.travelSheetItemDistanceRef.code%} = {%"+anObject.travelSheetItemDistanceRef.code+"%}");
        statement.setInt(2,anObject.travelSheetItemDistanceRef.code);
      }
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.tkFuelKoefRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKFuelKoefDAOGen(connection,getUserProfile()).exists(anObject.tkFuelKoefRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENTravelSheetItemDistance2TKFuelKoef.tkFuelKoefRef.code%} = {%"+anObject.tkFuelKoefRef.code+"%}");
        statement.setInt(3,anObject.tkFuelKoefRef.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTravelSheetItemDistance2TKFuelKoefDAOGen.add%}",e);
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

   public void save(ENTravelSheetItemDistance2TKFuelKoef anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTravelSheetItemDistance2TKFuelKoef anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("TRAVELSHEETITEMDISTANCEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TKFUELKOEFREF") == 0)
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
        "UPDATE NTRVLSHTTMDSTNC2TKFLKF SET TRAVELSHEETTMDSTNCRFCD = ? , TKFUELKOEFREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRAVELSHEETITEMDISTANCE2TKFUELKOEF SET ";
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
      if (anObject.travelSheetItemDistanceRef.code != Integer.MIN_VALUE)
        statement.setInt(1,anObject.travelSheetItemDistanceRef.code);
      else
        statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.tkFuelKoefRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.tkFuelKoefRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
          statement.setInt(3,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("TRAVELSHEETITEMDISTANCEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.travelSheetItemDistanceRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.travelSheetItemDistanceRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TKFUELKOEFREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.tkFuelKoefRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.tkFuelKoefRef.code);
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

   } // end of save(ENTravelSheetItemDistance2TKFuelKoef anObject,String[] anAttributes)


 public ENTravelSheetItemDistance2TKFuelKoefShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTravelSheetItemDistance2TKFuelKoef filterObject = new ENTravelSheetItemDistance2TKFuelKoef();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTravelSheetItemDistance2TKFuelKoefShort)list.get(0);
   return null;
  }

  public ENTravelSheetItemDistance2TKFuelKoefShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTravelSheetItemDistance2TKFuelKoefShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTravelSheetItemDistance2TKFuelKoefShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTravelSheetItemDistance2TKFuelKoefShortList getFilteredList(ENTravelSheetItemDistance2TKFuelKoef filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTravelSheetItemDistance2TKFuelKoefShortList getScrollableFilteredList(ENTravelSheetItemDistance2TKFuelKoef aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTravelSheetItemDistance2TKFuelKoefShortList getScrollableFilteredList(ENTravelSheetItemDistance2TKFuelKoef aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTravelSheetItemDistance2TKFuelKoefShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTravelSheetItemDistance2TKFuelKoefShortList getScrollableFilteredList(ENTravelSheetItemDistance2TKFuelKoefFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTravelSheetItemDistance2TKFuelKoefShortList getScrollableFilteredList(ENTravelSheetItemDistance2TKFuelKoefFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTravelSheetItemDistance2TKFuelKoefShortList getScrollableFilteredList(ENTravelSheetItemDistance2TKFuelKoef aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTravelSheetItemDistance2TKFuelKoefShortList getScrollableFilteredList(ENTravelSheetItemDistance2TKFuelKoef aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTravelSheetItemDistance2TKFuelKoefShortList result = new ENTravelSheetItemDistance2TKFuelKoefShortList();
    ENTravelSheetItemDistance2TKFuelKoefShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "NTRVLSHTTMDSTNC2TKFLKF.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "NTRVLSHTTMDSTNC2TKFLKF.CODE"+

      ", ENTRAVELSHEETITEMDSTNC.CODE " +
      ", ENTRAVELSHEETITEMDSTNC.DISTANCE " +
      ", ENTRAVELSHEETITEMDSTNC.SUMMACHINEHOURS " +
      ", ENTRAVELSHEETITEMDSTNC.KOEF " +
      ", TKFUELKOEF.CODE " +
      ", TKFUELKOEF.KOEF " +
      ", TKFUELKOEF.NAME " +
     " FROM NTRVLSHTTMDSTNC2TKFLKF " +
     ", ENTRAVELSHEETITEMDSTNC " +
     ", TKFUELKOEF " +
     //" WHERE "
    "";
     whereStr = " ENTRAVELSHEETITEMDSTNC.CODE = NTRVLSHTTMDSTNC2TKFLKF.TRAVELSHEETTMDSTNCRFCD" ; //+
      whereStr = whereStr +" AND TKFUELKOEF.CODE = NTRVLSHTTMDSTNC2TKFLKF.TKFUELKOEFREFCODE" ; //+
        //selectStr = selectStr + " ${s} NTRVLSHTTMDSTNC2TKFLKF.CODE IN ( SELECT NTRVLSHTTMDSTNC2TKFLKF.CODE FROM NTRVLSHTTMDSTNC2TKFLKF ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  NTRVLSHTTMDSTNC2TKFLKF.CODE = ?";
        }
        if(aFilterObject.travelSheetItemDistanceRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "NTRVLSHTTMDSTNC2TKFLKF.TRAVELSHEETTMDSTNCRFCD = ? ";
        }
        if(aFilterObject.tkFuelKoefRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "NTRVLSHTTMDSTNC2TKFLKF.TKFUELKOEFREFCODE = ? ";
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
       if(aFilterObject.travelSheetItemDistanceRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetItemDistanceRef.code);
       }
       if(aFilterObject.tkFuelKoefRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tkFuelKoefRef.code);
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

        anObject = new ENTravelSheetItemDistance2TKFuelKoefShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.travelSheetItemDistanceRefCode = set.getInt(2);
        if(set.wasNull())
        anObject.travelSheetItemDistanceRefCode = Integer.MIN_VALUE;
        anObject.travelSheetItemDistanceRefDistance = set.getBigDecimal(3);
        if(anObject.travelSheetItemDistanceRefDistance != null)
          anObject.travelSheetItemDistanceRefDistance = anObject.travelSheetItemDistanceRefDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetItemDistanceRefSumMachineHours = set.getBigDecimal(4);
        if(anObject.travelSheetItemDistanceRefSumMachineHours != null)
          anObject.travelSheetItemDistanceRefSumMachineHours = anObject.travelSheetItemDistanceRefSumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetItemDistanceRefKoef = set.getBigDecimal(5);
        if(anObject.travelSheetItemDistanceRefKoef != null)
          anObject.travelSheetItemDistanceRefKoef = anObject.travelSheetItemDistanceRefKoef.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tkFuelKoefRefCode = set.getInt(6);
        if(set.wasNull())
        anObject.tkFuelKoefRefCode = Integer.MIN_VALUE;
        anObject.tkFuelKoefRefKoef = set.getBigDecimal(7);
        if(anObject.tkFuelKoefRefKoef != null)
          anObject.tkFuelKoefRefKoef = anObject.tkFuelKoefRefKoef.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tkFuelKoefRefName = set.getString(8);

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

  public int[] getFilteredCodeArrayOLD(ENTravelSheetItemDistance2TKFuelKoef aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT NTRVLSHTTMDSTNC2TKFLKF.CODE FROM NTRVLSHTTMDSTNC2TKFLKF";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "NTRVLSHTTMDSTNC2TKFLKF.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  NTRVLSHTTMDSTNC2TKFLKF.CODE = ?";
        }
        if(aFilterObject.travelSheetItemDistanceRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " NTRVLSHTTMDSTNC2TKFLKF.TRAVELSHEETTMDSTNCRFCD = ? ";
        }
        if(aFilterObject.tkFuelKoefRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " NTRVLSHTTMDSTNC2TKFLKF.TKFUELKOEFREFCODE = ? ";
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
       if(aFilterObject.travelSheetItemDistanceRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetItemDistanceRef.code);
       }
       if(aFilterObject.tkFuelKoefRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tkFuelKoefRef.code);
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

  public int[] getFilteredCodeArray(ENTravelSheetItemDistance2TKFuelKoefFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTravelSheetItemDistance2TKFuelKoef aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT NTRVLSHTTMDSTNC2TKFLKF.CODE FROM NTRVLSHTTMDSTNC2TKFLKF";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "NTRVLSHTTMDSTNC2TKFLKF.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  NTRVLSHTTMDSTNC2TKFLKF.CODE = ?";
        }
        if(aFilterObject.travelSheetItemDistanceRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " NTRVLSHTTMDSTNC2TKFLKF.TRAVELSHEETTMDSTNCRFCD = ? ";
        }
        if(aFilterObject.tkFuelKoefRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " NTRVLSHTTMDSTNC2TKFLKF.TKFUELKOEFREFCODE = ? ";
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
       if(aFilterObject.travelSheetItemDistanceRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetItemDistanceRef.code);
       }
       if(aFilterObject.tkFuelKoefRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tkFuelKoefRef.code);
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


   public ENTravelSheetItemDistance2TKFuelKoef getObject(int uid) throws PersistenceException
   {
    ENTravelSheetItemDistance2TKFuelKoef result = new ENTravelSheetItemDistance2TKFuelKoef();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTravelSheetItemDistance2TKFuelKoef anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  NTRVLSHTTMDSTNC2TKFLKF.CODE, NTRVLSHTTMDSTNC2TKFLKF.TRAVELSHEETTMDSTNCRFCD, NTRVLSHTTMDSTNC2TKFLKF.TKFUELKOEFREFCODE "
    +" FROM NTRVLSHTTMDSTNC2TKFLKF WHERE NTRVLSHTTMDSTNC2TKFLKF.CODE = ?";

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
        anObject.travelSheetItemDistanceRef.code = set.getInt(2);
        if ( set.wasNull() )
            anObject.travelSheetItemDistanceRef.code = Integer.MIN_VALUE;
        anObject.tkFuelKoefRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.tkFuelKoefRef.code = Integer.MIN_VALUE;
        if(anObject.travelSheetItemDistanceRef.code != Integer.MIN_VALUE)
        {
           anObject.setTravelSheetItemDistanceRef(
        new com.ksoe.energynet.dataminer.generated.ENTravelSheetItemDistanceDAOGen(connection,getUserProfile()).getRef(anObject.travelSheetItemDistanceRef.code));
    }
        if(anObject.tkFuelKoefRef.code != Integer.MIN_VALUE)
        {
           anObject.setTkFuelKoefRef(
        new com.ksoe.techcard.dataminer.generated.TKFuelKoefDAOGen(connection,getUserProfile()).getRef(anObject.tkFuelKoefRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENTravelSheetItemDistance2TKFuelKoefRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTravelSheetItemDistance2TKFuelKoefRef ref = new com.ksoe.energynet.valueobject.references.ENTravelSheetItemDistance2TKFuelKoefRef();
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

    selectStr = "DELETE FROM  NTRVLSHTTMDSTNC2TKFLKF WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTravelSheetItemDistance2TKFuelKoef object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTravelSheetItemDistance2TKFuelKoef.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheetItemDistance2TKFuelKoef.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTravelSheetItemDistance2TKFuelKoef.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheetItemDistance2TKFuelKoef.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTravelSheetItemDistance2TKFuelKoef.getObject%} access denied");

    selectStr =

    "SELECT  NTRVLSHTTMDSTNC2TKFLKF.CODE FROM  NTRVLSHTTMDSTNC2TKFLKF WHERE  NTRVLSHTTMDSTNC2TKFLKF.CODE = ?";
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
    _checkConditionToken(condition,"code","NTRVLSHTTMDSTNC2TKFLKF.CODE");
      // relationship conditions
    _checkConditionToken(condition,"travelsheetitemdistanceref","TRAVELSHEETTMDSTNCRFCD");
    _checkConditionToken(condition,"travelsheetitemdistanceref.code","TRAVELSHEETTMDSTNCRFCD");
    _checkConditionToken(condition,"tkfuelkoefref","TKFUELKOEFREFCODE");
    _checkConditionToken(condition,"tkfuelkoefref.code","TKFUELKOEFREFCODE");
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

   private void _collectAutoIncrementFields(ENTravelSheetItemDistance2TKFuelKoef anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("NTRVLSHTTMDSTNC2TKFLKF", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("NTRVLSHTTMDSTNC2TKFLKF", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("NTRVLSHTTMDSTNC2TKFLKF", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: NTRVLSHTTMDSTNC2TKFLKF");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENTravelSheetItemDistance2TKFuelKoefDAO

