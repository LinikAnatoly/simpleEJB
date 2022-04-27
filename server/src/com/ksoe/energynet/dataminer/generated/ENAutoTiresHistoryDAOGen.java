
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
import com.ksoe.energynet.valueobject.ENAutoTiresHistory;
import com.ksoe.energynet.valueobject.brief.ENAutoTiresHistoryShort;
import com.ksoe.energynet.valueobject.filter.ENAutoTiresHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENAutoTiresHistoryShortList;
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
 * DAO Object for ENAutoTiresHistory;
 *
 */

public class ENAutoTiresHistoryDAOGen extends GenericDataMiner {

  public ENAutoTiresHistoryDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAutoTiresHistoryDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENAutoTiresHistory inObject) throws PersistenceException
   {
      ENAutoTiresHistory obj = new ENAutoTiresHistory();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.installDate.equals(obj.installDate)){
       return false;
     }

     if ( ! inObject.uninstallDate.equals(obj.uninstallDate)){
       return false;
     }

     if ( ! inObject.distance.equals(obj.distance)){
       return false;
     }

     if (inObject.actInstallNumber != obj.actInstallNumber){
       return false;
     }

     if (inObject.actUninstallNumber != obj.actUninstallNumber){
       return false;
     }

     if (inObject.replacementReason != obj.replacementReason){
       return false;
     }
     if (inObject.tiresRef.code != obj.tiresRef.code){
        return false;
     }
     if (inObject.transportRealRef.code != obj.transportRealRef.code){
        return false;
     }
     if (inObject.installPlacesRef.code != obj.installPlacesRef.code){
        return false;
     }
      return true;
   }

   public int add(ENAutoTiresHistory anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENAutoTiresHistory anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();
    if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENAUTOTIRESHISTORY (CODE,INSTALLDATE,UNINSTALLDATE,DISTANCE,ACTINSTALLNUMBER,ACTUNINSTALLNUMBER,REPLACEMENTREASON,DOMAIN_INFO,MODIFY_TIME,TIRESREFCODE,TRANSPORTREALREFCODE,INSTALLPLACESREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.installDate == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.installDate.getTime()));
      if (anObject.uninstallDate == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.uninstallDate.getTime()));
      if (anObject.distance != null)
        anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.distance);
      statement.setString(5,anObject.actInstallNumber);
      statement.setString(6,anObject.actUninstallNumber);
      statement.setString(7,anObject.replacementReason);
      statement.setString(8,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(9,null);
      else
        statement.setBigDecimal(9,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.tiresRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENAutoTiresDAOGen(connection,getUserProfile()).exists(anObject.tiresRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAutoTiresHistory.tiresRef.code%} = {%"+anObject.tiresRef.code+"%}");
        statement.setInt(10,anObject.tiresRef.code);
      }
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.transportRealRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).exists(anObject.transportRealRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENAutoTiresHistory.transportRealRef.code%} = {%"+anObject.transportRealRef.code+"%}");
        statement.setInt(11,anObject.transportRealRef.code);
      }
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.installPlacesRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTiresInstallPlacesDAOGen(connection,getUserProfile()).exists(anObject.installPlacesRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAutoTiresHistory.installPlacesRef.code%} = {%"+anObject.installPlacesRef.code+"%}");
        statement.setInt(12,anObject.installPlacesRef.code);
      }
      else
        statement.setNull(12,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENAutoTiresHistoryDAOGen.add%}",e);
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

   public void save(ENAutoTiresHistory anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENAutoTiresHistory anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENAutoTiresHistory oldObject = new ENAutoTiresHistory();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENAutoTiresHistory.modify_time_Field + "," + ENAutoTiresHistory.domain_info_Field+" FROM  ENAUTOTIRESHISTORY WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("INSTALLDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("UNINSTALLDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DISTANCE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ACTINSTALLNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ACTUNINSTALLNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("REPLACEMENTREASON") == 0)
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
          if(fieldNameStr.compareTo("TIRESREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRANSPORTREALREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("INSTALLPLACESREF") == 0)
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
        "UPDATE ENAUTOTIRESHISTORY SET  INSTALLDATE = ? , UNINSTALLDATE = ? , DISTANCE = ? , ACTINSTALLNUMBER = ? , ACTUNINSTALLNUMBER = ? , REPLACEMENTREASON = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , TIRESREFCODE = ? , TRANSPORTREALREFCODE = ? , INSTALLPLACESREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENAUTOTIRESHISTORY SET ";
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
      if (anObject.installDate == null)
        statement.setDate(1,null);
      else
        statement.setDate(1,new java.sql.Date(anObject.installDate.getTime()));
      if (anObject.uninstallDate == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.uninstallDate.getTime()));
      if (anObject.distance != null)
        anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.distance);
      statement.setString(4,anObject.actInstallNumber);
      statement.setString(5,anObject.actUninstallNumber);
      statement.setString(6,anObject.replacementReason);
      statement.setString(7,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(8,null);
      else
        statement.setBigDecimal(8,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.tiresRef.code != Integer.MIN_VALUE)
        statement.setInt(9,anObject.tiresRef.code);
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.transportRealRef.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.transportRealRef.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.installPlacesRef.code != Integer.MIN_VALUE)
        statement.setInt(11,anObject.installPlacesRef.code);
      else
        statement.setNull(11,java.sql.Types.INTEGER);
          statement.setInt(12,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("INSTALLDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.installDate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.installDate.getTime()));
                continue;
             }
            if("UNINSTALLDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.uninstallDate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.uninstallDate.getTime()));
                continue;
             }
            if("DISTANCE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.distance != null)
                    anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.distance);
                continue;
             }
            if("ACTINSTALLNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.actInstallNumber);
                continue;
             }
            if("ACTUNINSTALLNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.actUninstallNumber);
                continue;
             }
            if("REPLACEMENTREASON".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.replacementReason);
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
            if("TIRESREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.tiresRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.tiresRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRANSPORTREALREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportRealRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportRealRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("INSTALLPLACESREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.installPlacesRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.installPlacesRef.code);
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

   } // end of save(ENAutoTiresHistory anObject,String[] anAttributes)


 public ENAutoTiresHistoryShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENAutoTiresHistory filterObject = new ENAutoTiresHistory();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENAutoTiresHistoryShort)list.get(0);
   return null;
  }

  public ENAutoTiresHistoryShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENAutoTiresHistoryShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENAutoTiresHistoryShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENAutoTiresHistoryShortList getFilteredList(ENAutoTiresHistory filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENAutoTiresHistoryShortList getScrollableFilteredList(ENAutoTiresHistory aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENAutoTiresHistoryShortList getScrollableFilteredList(ENAutoTiresHistory aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENAutoTiresHistoryShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENAutoTiresHistoryShortList getScrollableFilteredList(ENAutoTiresHistoryFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENAutoTiresHistoryShortList getScrollableFilteredList(ENAutoTiresHistoryFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENAutoTiresHistoryShortList getScrollableFilteredList(ENAutoTiresHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENAutoTiresHistoryShortList getScrollableFilteredList(ENAutoTiresHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENAutoTiresHistoryShortList result = new ENAutoTiresHistoryShortList();
    ENAutoTiresHistoryShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENAUTOTIRESHISTORY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENAUTOTIRESHISTORY.CODE"+
     ",ENAUTOTIRESHISTORY.INSTALLDATE"+
     ",ENAUTOTIRESHISTORY.UNINSTALLDATE"+
     ",ENAUTOTIRESHISTORY.DISTANCE"+
     ",ENAUTOTIRESHISTORY.ACTINSTALLNUMBER"+
     ",ENAUTOTIRESHISTORY.ACTUNINSTALLNUMBER"+
     ",ENAUTOTIRESHISTORY.REPLACEMENTREASON"+

      ", ENAUTOTIRES.CODE " +
      ", ENAUTOTIRES.TYPENAME " +
      ", ENAUTOTIRES.GARAGENUMBER " +
      ", ENAUTOTIRES.SERIALNUMBER " +
      ", ENAUTOTIRES.FACTORY " +
      ", ENAUTOTIRES.POTENCIAL " +
      ", ENAUTOTIRES.DISTANCEALL " +
      ", ENAUTOTIRES.NOMINAL " +
      ", TKTRANSPORTREAL.CODE " +
      ", TKTRANSPORTREAL.NAME " +
      ", TKTRANSPORTREAL.INVNUMBER " +
      ", TKTRANSPORTREAL.GOSNUMBER " +
      ", ENTIRESINSTALLPLACES.CODE " +
      ", ENTIRESINSTALLPLACES.NAME " +
     " FROM ENAUTOTIRESHISTORY " +
     ", ENAUTOTIRES " +
     ", TKTRANSPORTREAL " +
     ", ENTIRESINSTALLPLACES " +
     //" WHERE "
    "";
     whereStr = " ENAUTOTIRES.CODE = ENAUTOTIRESHISTORY.TIRESREFCODE" ; //+
      whereStr = whereStr +" AND TKTRANSPORTREAL.CODE = ENAUTOTIRESHISTORY.TRANSPORTREALREFCODE" ; //+
      whereStr = whereStr +" AND ENTIRESINSTALLPLACES.CODE = ENAUTOTIRESHISTORY.INSTALLPLACESREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENAUTOTIRESHISTORY.CODE IN ( SELECT ENAUTOTIRESHISTORY.CODE FROM ENAUTOTIRESHISTORY ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.CODE = ?";
        }
        if(aFilterObject.installDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.INSTALLDATE = ?";
        }
        if(aFilterObject.uninstallDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.UNINSTALLDATE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.DISTANCE = ?";
        }
         if (aFilterObject.actInstallNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.actInstallNumber.indexOf('*',0) < 0 && aFilterObject.actInstallNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRESHISTORY.ACTINSTALLNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRESHISTORY.ACTINSTALLNUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.actUninstallNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.actUninstallNumber.indexOf('*',0) < 0 && aFilterObject.actUninstallNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRESHISTORY.ACTUNINSTALLNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRESHISTORY.ACTUNINSTALLNUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.replacementReason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.replacementReason.indexOf('*',0) < 0 && aFilterObject.replacementReason.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRESHISTORY.REPLACEMENTREASON) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRESHISTORY.REPLACEMENTREASON) LIKE UPPER(?)";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRESHISTORY.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRESHISTORY.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.MODIFY_TIME = ?";
        }
        if(aFilterObject.tiresRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRESHISTORY.TIRESREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRESHISTORY.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.installPlacesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRESHISTORY.INSTALLPLACESREFCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAutoTiresHistory.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAutoTiresHistory.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENAUTOTIRESHISTORY",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENAUTOTIRESHISTORY.DOMAIN_INFO IS NOT NULL";
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
        if(aFilterObject.installDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.installDate.getTime()));
        }
        if(aFilterObject.uninstallDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.uninstallDate.getTime()));
        }
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }

           if(aFilterObject.actInstallNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.actInstallNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.actUninstallNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.actUninstallNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.replacementReason != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.replacementReason);
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
       if(aFilterObject.tiresRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tiresRef.code);
       }
       if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRealRef.code);
       }
       if(aFilterObject.installPlacesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.installPlacesRef.code);
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

        anObject = new ENAutoTiresHistoryShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.installDate = set.getDate(2);
        anObject.uninstallDate = set.getDate(3);
        anObject.distance = set.getBigDecimal(4);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.actInstallNumber = set.getString(5);
        anObject.actUninstallNumber = set.getString(6);
        anObject.replacementReason = set.getString(7);

        anObject.tiresRefCode = set.getInt(8);
        if(set.wasNull())
        anObject.tiresRefCode = Integer.MIN_VALUE;
        anObject.tiresRefTypeName = set.getString(9);
        anObject.tiresRefGarageNumber = set.getString(10);
        anObject.tiresRefSerialNumber = set.getString(11);
        anObject.tiresRefFactory = set.getString(12);
        anObject.tiresRefPotencial = set.getBigDecimal(13);
        if(anObject.tiresRefPotencial != null)
          anObject.tiresRefPotencial = anObject.tiresRefPotencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tiresRefDistanceAll = set.getBigDecimal(14);
        if(anObject.tiresRefDistanceAll != null)
          anObject.tiresRefDistanceAll = anObject.tiresRefDistanceAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tiresRefNominal = set.getString(15);
        anObject.transportRealRefCode = set.getInt(16);
        if(set.wasNull())
        anObject.transportRealRefCode = Integer.MIN_VALUE;

        anObject.installPlacesRefCode = set.getInt(20);
        if(set.wasNull())
        anObject.installPlacesRefCode = Integer.MIN_VALUE;
        anObject.installPlacesRefName = set.getString(21);

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

  public int[] getFilteredCodeArrayOLD(ENAutoTiresHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENAUTOTIRESHISTORY.CODE FROM ENAUTOTIRESHISTORY";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENAUTOTIRESHISTORY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAutoTiresHistory.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAutoTiresHistory.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENAUTOTIRESHISTORY",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENAUTOTIRESHISTORY.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.CODE = ?";
        }
        if(aFilterObject.installDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.INSTALLDATE = ?";
        }
        if(aFilterObject.uninstallDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.UNINSTALLDATE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.DISTANCE = ?";
        }
         if (aFilterObject.actInstallNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.actInstallNumber.indexOf('*',0) < 0 && aFilterObject.actInstallNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRESHISTORY.ACTINSTALLNUMBER = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRESHISTORY.ACTINSTALLNUMBER LIKE ?";
         }
         if (aFilterObject.actUninstallNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.actUninstallNumber.indexOf('*',0) < 0 && aFilterObject.actUninstallNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRESHISTORY.ACTUNINSTALLNUMBER = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRESHISTORY.ACTUNINSTALLNUMBER LIKE ?";
         }
         if (aFilterObject.replacementReason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.replacementReason.indexOf('*',0) < 0 && aFilterObject.replacementReason.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRESHISTORY.REPLACEMENTREASON = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRESHISTORY.REPLACEMENTREASON LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRESHISTORY.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRESHISTORY.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.MODIFY_TIME = ?";
        }
        if(aFilterObject.tiresRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRESHISTORY.TIRESREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRESHISTORY.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.installPlacesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRESHISTORY.INSTALLPLACESREFCODE = ? ";
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
        if(aFilterObject.installDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.installDate.getTime()));
        }
        if(aFilterObject.uninstallDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.uninstallDate.getTime()));
        }
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
         if (aFilterObject.actInstallNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.actInstallNumber.indexOf('*',0) < 0 && aFilterObject.actInstallNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRESHISTORY.ACTINSTALLNUMBER = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRESHISTORY.ACTINSTALLNUMBER LIKE ?";

           if(aFilterObject.actInstallNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.actInstallNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.actUninstallNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.actUninstallNumber.indexOf('*',0) < 0 && aFilterObject.actUninstallNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRESHISTORY.ACTUNINSTALLNUMBER = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRESHISTORY.ACTUNINSTALLNUMBER LIKE ?";

           if(aFilterObject.actUninstallNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.actUninstallNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.replacementReason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.replacementReason.indexOf('*',0) < 0 && aFilterObject.replacementReason.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRESHISTORY.REPLACEMENTREASON = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRESHISTORY.REPLACEMENTREASON LIKE ?";

           if(aFilterObject.replacementReason != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.replacementReason);
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
                 whereStr = whereStr + " ENAUTOTIRESHISTORY.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRESHISTORY.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.tiresRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tiresRef.code);
       }
       if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRealRef.code);
       }
       if(aFilterObject.installPlacesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.installPlacesRef.code);
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

  public int[] getFilteredCodeArray(ENAutoTiresHistoryFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENAutoTiresHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENAUTOTIRESHISTORY.CODE FROM ENAUTOTIRESHISTORY";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENAUTOTIRESHISTORY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAutoTiresHistory.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAutoTiresHistory.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENAUTOTIRESHISTORY",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENAUTOTIRESHISTORY.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.CODE = ?";
        }
        if(aFilterObject.installDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.INSTALLDATE = ?";
        }
        if(aFilterObject.uninstallDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.UNINSTALLDATE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.DISTANCE = ?";
        }
         if (aFilterObject.actInstallNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.actInstallNumber.indexOf('*',0) < 0 && aFilterObject.actInstallNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRESHISTORY.ACTINSTALLNUMBER = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRESHISTORY.ACTINSTALLNUMBER LIKE ?";
         }
         if (aFilterObject.actUninstallNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.actUninstallNumber.indexOf('*',0) < 0 && aFilterObject.actUninstallNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRESHISTORY.ACTUNINSTALLNUMBER = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRESHISTORY.ACTUNINSTALLNUMBER LIKE ?";
         }
         if (aFilterObject.replacementReason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.replacementReason.indexOf('*',0) < 0 && aFilterObject.replacementReason.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRESHISTORY.REPLACEMENTREASON = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRESHISTORY.REPLACEMENTREASON LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRESHISTORY.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRESHISTORY.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESHISTORY.MODIFY_TIME = ?";
        }
        if(aFilterObject.tiresRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRESHISTORY.TIRESREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRESHISTORY.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.installPlacesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRESHISTORY.INSTALLPLACESREFCODE = ? ";
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
        if(aFilterObject.installDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.installDate.getTime()));
        }
        if(aFilterObject.uninstallDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.uninstallDate.getTime()));
        }
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
         if (aFilterObject.actInstallNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.actInstallNumber.indexOf('*',0) < 0 && aFilterObject.actInstallNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRESHISTORY.ACTINSTALLNUMBER = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRESHISTORY.ACTINSTALLNUMBER LIKE ?";

           if(aFilterObject.actInstallNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.actInstallNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.actUninstallNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.actUninstallNumber.indexOf('*',0) < 0 && aFilterObject.actUninstallNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRESHISTORY.ACTUNINSTALLNUMBER = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRESHISTORY.ACTUNINSTALLNUMBER LIKE ?";

           if(aFilterObject.actUninstallNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.actUninstallNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.replacementReason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.replacementReason.indexOf('*',0) < 0 && aFilterObject.replacementReason.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRESHISTORY.REPLACEMENTREASON = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRESHISTORY.REPLACEMENTREASON LIKE ?";

           if(aFilterObject.replacementReason != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.replacementReason);
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
                 whereStr = whereStr + " ENAUTOTIRESHISTORY.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRESHISTORY.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.tiresRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tiresRef.code);
       }
       if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRealRef.code);
       }
       if(aFilterObject.installPlacesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.installPlacesRef.code);
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


   public ENAutoTiresHistory getObject(int uid) throws PersistenceException
   {
    ENAutoTiresHistory result = new ENAutoTiresHistory();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENAutoTiresHistory anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAutoTiresHistory.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAutoTiresHistory.getObject%} access denied");



    selectStr =
    "SELECT  ENAUTOTIRESHISTORY.CODE, ENAUTOTIRESHISTORY.INSTALLDATE, ENAUTOTIRESHISTORY.UNINSTALLDATE, ENAUTOTIRESHISTORY.DISTANCE, ENAUTOTIRESHISTORY.ACTINSTALLNUMBER, ENAUTOTIRESHISTORY.ACTUNINSTALLNUMBER, ENAUTOTIRESHISTORY.REPLACEMENTREASON, ENAUTOTIRESHISTORY.DOMAIN_INFO, ENAUTOTIRESHISTORY.MODIFY_TIME, ENAUTOTIRESHISTORY.TIRESREFCODE, ENAUTOTIRESHISTORY.TRANSPORTREALREFCODE, ENAUTOTIRESHISTORY.INSTALLPLACESREFCODE "
    +" FROM ENAUTOTIRESHISTORY WHERE ENAUTOTIRESHISTORY.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENAUTOTIRESHISTORY",segregationInfo,getUserProfile().getDomainInfo());
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
        anObject.installDate = set.getDate(2);
        anObject.uninstallDate = set.getDate(3);
        anObject.distance = set.getBigDecimal(4);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.actInstallNumber = set.getString(5);
        anObject.actUninstallNumber = set.getString(6);
        anObject.replacementReason = set.getString(7);
        anObject.domain_info = set.getString(8);
        anObject.modify_time = set.getLong(9);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.tiresRef.code = set.getInt(10);
        if ( set.wasNull() )
            anObject.tiresRef.code = Integer.MIN_VALUE;
        anObject.transportRealRef.code = set.getInt(11);
        if ( set.wasNull() )
            anObject.transportRealRef.code = Integer.MIN_VALUE;
        anObject.installPlacesRef.code = set.getInt(12);
        if ( set.wasNull() )
            anObject.installPlacesRef.code = Integer.MIN_VALUE;
        if(anObject.tiresRef.code != Integer.MIN_VALUE)
        {
           anObject.setTiresRef(
        new com.ksoe.energynet.dataminer.generated.ENAutoTiresDAOGen(connection,getUserProfile()).getRef(anObject.tiresRef.code));
    }
        if(anObject.transportRealRef.code != Integer.MIN_VALUE)
        {
           anObject.setTransportRealRef(
        new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getRef(anObject.transportRealRef.code));
    }
        if(anObject.installPlacesRef.code != Integer.MIN_VALUE)
        {
           anObject.setInstallPlacesRef(
        new com.ksoe.energynet.dataminer.generated.ENTiresInstallPlacesDAOGen(connection,getUserProfile()).getRef(anObject.installPlacesRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENAutoTiresHistoryRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENAutoTiresHistoryRef ref = new com.ksoe.energynet.valueobject.references.ENAutoTiresHistoryRef();
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

    selectStr = "DELETE FROM  ENAUTOTIRESHISTORY WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENAutoTiresHistory object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENAutoTiresHistory.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENAutoTiresHistory.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENAutoTiresHistory.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAutoTiresHistory.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAutoTiresHistory.getObject%} access denied");

    selectStr =

    "SELECT  ENAUTOTIRESHISTORY.CODE FROM  ENAUTOTIRESHISTORY WHERE  ENAUTOTIRESHISTORY.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENAUTOTIRESHISTORY",segregationInfo,getUserProfile().getDomainInfo());
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
    _checkConditionToken(condition,"code","ENAUTOTIRESHISTORY.CODE");
    _checkConditionToken(condition,"installdate","ENAUTOTIRESHISTORY.INSTALLDATE");
    _checkConditionToken(condition,"uninstalldate","ENAUTOTIRESHISTORY.UNINSTALLDATE");
    _checkConditionToken(condition,"distance","ENAUTOTIRESHISTORY.DISTANCE");
    _checkConditionToken(condition,"actinstallnumber","ENAUTOTIRESHISTORY.ACTINSTALLNUMBER");
    _checkConditionToken(condition,"actuninstallnumber","ENAUTOTIRESHISTORY.ACTUNINSTALLNUMBER");
    _checkConditionToken(condition,"replacementreason","ENAUTOTIRESHISTORY.REPLACEMENTREASON");
    _checkConditionToken(condition,"domain_info","ENAUTOTIRESHISTORY.DOMAIN_INFO");
    _checkConditionToken(condition,"modify_time","ENAUTOTIRESHISTORY.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"tiresref","TIRESREFCODE");
    _checkConditionToken(condition,"tiresref.code","TIRESREFCODE");
    _checkConditionToken(condition,"transportrealref","TRANSPORTREALREFCODE");
    _checkConditionToken(condition,"transportrealref.code","TRANSPORTREALREFCODE");
    _checkConditionToken(condition,"installplacesref","INSTALLPLACESREFCODE");
    _checkConditionToken(condition,"installplacesref.code","INSTALLPLACESREFCODE");
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

    private void _collectAutoIncrementFields(ENAutoTiresHistory anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENAUTOTIRESHISTORY", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENAUTOTIRESHISTORY", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENAUTOTIRESHISTORY", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENAUTOTIRESHISTORY");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENAutoTiresHistoryDAO
