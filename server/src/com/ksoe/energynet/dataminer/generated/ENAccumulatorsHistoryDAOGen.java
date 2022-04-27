
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
import com.ksoe.energynet.valueobject.ENAccumulatorsHistory;
import com.ksoe.energynet.valueobject.brief.ENAccumulatorsHistoryShort;
import com.ksoe.energynet.valueobject.filter.ENAccumulatorsHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENAccumulatorsHistoryShortList;
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
 * DAO Object for ENAccumulatorsHistory;
 *
 */

public class ENAccumulatorsHistoryDAOGen extends GenericDataMiner {

  public ENAccumulatorsHistoryDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAccumulatorsHistoryDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENAccumulatorsHistory inObject) throws PersistenceException
   {
      ENAccumulatorsHistory obj = new ENAccumulatorsHistory();
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

     if (inObject.replacementReason != obj.replacementReason){
       return false;
     }
     if (inObject.accumulatorsRef.code != obj.accumulatorsRef.code){
        return false;
     }
     if (inObject.transportRealRef.code != obj.transportRealRef.code){
        return false;
     }
      return true;
   }

   public int add(ENAccumulatorsHistory anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENAccumulatorsHistory anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();
    if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENACCUMULATORSHISTORY (CODE,INSTALLDATE,UNINSTALLDATE,DISTANCE,REPLACEMENTREASON,DOMAIN_INFO,MODIFY_TIME,ACCUMULATORSREFCODE,TRANSPORTREALREFCODE) VALUES (?,?,?,?,?,?,?,?,?)";

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
      statement.setString(5,anObject.replacementReason);
      statement.setString(6,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(7,null);
      else
        statement.setBigDecimal(7,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.accumulatorsRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENAccumulatorsDAOGen(connection,getUserProfile()).exists(anObject.accumulatorsRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAccumulatorsHistory.accumulatorsRef.code%} = {%"+anObject.accumulatorsRef.code+"%}");
        statement.setInt(8,anObject.accumulatorsRef.code);
      }
      else
        statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.transportRealRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).exists(anObject.transportRealRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENAccumulatorsHistory.transportRealRef.code%} = {%"+anObject.transportRealRef.code+"%}");
        statement.setInt(9,anObject.transportRealRef.code);
      }
      else
        statement.setNull(9,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENAccumulatorsHistoryDAOGen.add%}",e);
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

   public void save(ENAccumulatorsHistory anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENAccumulatorsHistory anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENAccumulatorsHistory oldObject = new ENAccumulatorsHistory();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENAccumulatorsHistory.modify_time_Field + "," + ENAccumulatorsHistory.domain_info_Field+" FROM  ENACCUMULATORSHISTORY WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("ACCUMULATORSREF") == 0)
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
         }
       if(fields.size() == 0)
         return;
       }
      if(fields == null)
       {
        selectStr =
        "UPDATE ENACCUMULATORSHISTORY SET  INSTALLDATE = ? , UNINSTALLDATE = ? , DISTANCE = ? , REPLACEMENTREASON = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , ACCUMULATORSREFCODE = ? , TRANSPORTREALREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENACCUMULATORSHISTORY SET ";
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
      statement.setString(4,anObject.replacementReason);
      statement.setString(5,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(6,null);
      else
        statement.setBigDecimal(6,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.accumulatorsRef.code != Integer.MIN_VALUE)
        statement.setInt(7,anObject.accumulatorsRef.code);
      else
        statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.transportRealRef.code != Integer.MIN_VALUE)
        statement.setInt(8,anObject.transportRealRef.code);
      else
        statement.setNull(8,java.sql.Types.INTEGER);
          statement.setInt(9,anObject.code);
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
            if("ACCUMULATORSREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.accumulatorsRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.accumulatorsRef.code);
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

   } // end of save(ENAccumulatorsHistory anObject,String[] anAttributes)


 public ENAccumulatorsHistoryShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENAccumulatorsHistory filterObject = new ENAccumulatorsHistory();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENAccumulatorsHistoryShort)list.get(0);
   return null;
  }

  public ENAccumulatorsHistoryShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENAccumulatorsHistoryShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENAccumulatorsHistoryShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENAccumulatorsHistoryShortList getFilteredList(ENAccumulatorsHistory filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENAccumulatorsHistoryShortList getScrollableFilteredList(ENAccumulatorsHistory aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENAccumulatorsHistoryShortList getScrollableFilteredList(ENAccumulatorsHistory aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENAccumulatorsHistoryShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENAccumulatorsHistoryShortList getScrollableFilteredList(ENAccumulatorsHistoryFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENAccumulatorsHistoryShortList getScrollableFilteredList(ENAccumulatorsHistoryFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENAccumulatorsHistoryShortList getScrollableFilteredList(ENAccumulatorsHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENAccumulatorsHistoryShortList getScrollableFilteredList(ENAccumulatorsHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENAccumulatorsHistoryShortList result = new ENAccumulatorsHistoryShortList();
    ENAccumulatorsHistoryShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACCUMULATORSHISTORY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENACCUMULATORSHISTORY.CODE"+
     ",ENACCUMULATORSHISTORY.INSTALLDATE"+
     ",ENACCUMULATORSHISTORY.UNINSTALLDATE"+
     ",ENACCUMULATORSHISTORY.DISTANCE"+
     ",ENACCUMULATORSHISTORY.REPLACEMENTREASON"+

      ", ENACCUMULATORS.CODE " +
      ", ENACCUMULATORS.NAME " +
      ", ENACCUMULATORS.TYPENAME " +
      ", ENACCUMULATORS.FACTORY " +
      ", ENACCUMULATORS.GARAGENUMBER " +
      ", ENACCUMULATORS.YEARPRODUCTION " +
      ", ENACCUMULATORS.SERIALNUMBER " +
      ", ENACCUMULATORS.RECEIPTDATE " +
      ", ENACCUMULATORS.MILEAGE " +
      ", ENACCUMULATORS.MILEAGEALL " +
      ", ENACCUMULATORS.POTENCIAL " +
      ", TKTRANSPORTREAL.CODE " +
      ", TKTRANSPORTREAL.NAME " +
      ", TKTRANSPORTREAL.INVNUMBER " +
      ", TKTRANSPORTREAL.GOSNUMBER " +
     " FROM ENACCUMULATORSHISTORY " +
     ", ENACCUMULATORS " +
     ", TKTRANSPORTREAL " +
     //" WHERE "
    "";
     whereStr = " ENACCUMULATORS.CODE = ENACCUMULATORSHISTORY.ACCUMULATORSREFCODE" ; //+
      whereStr = whereStr +" AND TKTRANSPORTREAL.CODE = ENACCUMULATORSHISTORY.TRANSPORTREALREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENACCUMULATORSHISTORY.CODE IN ( SELECT ENACCUMULATORSHISTORY.CODE FROM ENACCUMULATORSHISTORY ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.CODE = ?";
        }
        if(aFilterObject.installDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.INSTALLDATE = ?";
        }
        if(aFilterObject.uninstallDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.UNINSTALLDATE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.DISTANCE = ?";
        }
         if (aFilterObject.replacementReason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.replacementReason.indexOf('*',0) < 0 && aFilterObject.replacementReason.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORSHISTORY.REPLACEMENTREASON) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORSHISTORY.REPLACEMENTREASON) LIKE UPPER(?)";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORSHISTORY.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORSHISTORY.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.MODIFY_TIME = ?";
        }
        if(aFilterObject.accumulatorsRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACCUMULATORSHISTORY.ACCUMULATORSREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACCUMULATORSHISTORY.TRANSPORTREALREFCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAccumulatorsHistory.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAccumulatorsHistory.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENACCUMULATORSHISTORY",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENACCUMULATORSHISTORY.DOMAIN_INFO IS NOT NULL";
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
       if(aFilterObject.accumulatorsRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.accumulatorsRef.code);
       }
       if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRealRef.code);
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

        anObject = new ENAccumulatorsHistoryShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.installDate = set.getDate(2);
        anObject.uninstallDate = set.getDate(3);
        anObject.distance = set.getBigDecimal(4);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.replacementReason = set.getString(5);

        anObject.accumulatorsRefCode = set.getInt(6);
        if(set.wasNull())
        anObject.accumulatorsRefCode = Integer.MIN_VALUE;
        anObject.accumulatorsRefName = set.getString(7);
        anObject.accumulatorsRefTypeName = set.getString(8);
        anObject.accumulatorsRefFactory = set.getString(9);
        anObject.accumulatorsRefGarageNumber = set.getString(10);
        anObject.accumulatorsRefYearProduction = set.getString(11);
        anObject.accumulatorsRefSerialNumber = set.getString(12);
        anObject.accumulatorsRefReceiptDate = set.getDate(13);
        anObject.accumulatorsRefMileage = set.getBigDecimal(14);
        if(anObject.accumulatorsRefMileage != null)
          anObject.accumulatorsRefMileage = anObject.accumulatorsRefMileage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.accumulatorsRefMileageAll = set.getBigDecimal(15);
        if(anObject.accumulatorsRefMileageAll != null)
          anObject.accumulatorsRefMileageAll = anObject.accumulatorsRefMileageAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.accumulatorsRefPotencial = set.getBigDecimal(16);
        if(anObject.accumulatorsRefPotencial != null)
          anObject.accumulatorsRefPotencial = anObject.accumulatorsRefPotencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportRealRefCode = set.getInt(17);
        if(set.wasNull())
        anObject.transportRealRefCode = Integer.MIN_VALUE;


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

  public int[] getFilteredCodeArrayOLD(ENAccumulatorsHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENACCUMULATORSHISTORY.CODE FROM ENACCUMULATORSHISTORY";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACCUMULATORSHISTORY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAccumulatorsHistory.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAccumulatorsHistory.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENACCUMULATORSHISTORY",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENACCUMULATORSHISTORY.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.CODE = ?";
        }
        if(aFilterObject.installDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.INSTALLDATE = ?";
        }
        if(aFilterObject.uninstallDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.UNINSTALLDATE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.DISTANCE = ?";
        }
         if (aFilterObject.replacementReason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.replacementReason.indexOf('*',0) < 0 && aFilterObject.replacementReason.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORSHISTORY.REPLACEMENTREASON = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORSHISTORY.REPLACEMENTREASON LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORSHISTORY.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORSHISTORY.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.MODIFY_TIME = ?";
        }
        if(aFilterObject.accumulatorsRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACCUMULATORSHISTORY.ACCUMULATORSREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACCUMULATORSHISTORY.TRANSPORTREALREFCODE = ? ";
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
         if (aFilterObject.replacementReason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.replacementReason.indexOf('*',0) < 0 && aFilterObject.replacementReason.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACCUMULATORSHISTORY.REPLACEMENTREASON = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORSHISTORY.REPLACEMENTREASON LIKE ?";

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
                 whereStr = whereStr + " ENACCUMULATORSHISTORY.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORSHISTORY.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.accumulatorsRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.accumulatorsRef.code);
       }
       if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRealRef.code);
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

  public int[] getFilteredCodeArray(ENAccumulatorsHistoryFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENAccumulatorsHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENACCUMULATORSHISTORY.CODE FROM ENACCUMULATORSHISTORY";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACCUMULATORSHISTORY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAccumulatorsHistory.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAccumulatorsHistory.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENACCUMULATORSHISTORY",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENACCUMULATORSHISTORY.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.CODE = ?";
        }
        if(aFilterObject.installDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.INSTALLDATE = ?";
        }
        if(aFilterObject.uninstallDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.UNINSTALLDATE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.DISTANCE = ?";
        }
         if (aFilterObject.replacementReason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.replacementReason.indexOf('*',0) < 0 && aFilterObject.replacementReason.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORSHISTORY.REPLACEMENTREASON = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORSHISTORY.REPLACEMENTREASON LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORSHISTORY.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORSHISTORY.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.MODIFY_TIME = ?";
        }
        if(aFilterObject.accumulatorsRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACCUMULATORSHISTORY.ACCUMULATORSREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACCUMULATORSHISTORY.TRANSPORTREALREFCODE = ? ";
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
         if (aFilterObject.replacementReason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.replacementReason.indexOf('*',0) < 0 && aFilterObject.replacementReason.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACCUMULATORSHISTORY.REPLACEMENTREASON = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORSHISTORY.REPLACEMENTREASON LIKE ?";

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
                 whereStr = whereStr + " ENACCUMULATORSHISTORY.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORSHISTORY.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.accumulatorsRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.accumulatorsRef.code);
       }
       if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRealRef.code);
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


   public ENAccumulatorsHistory getObject(int uid) throws PersistenceException
   {
    ENAccumulatorsHistory result = new ENAccumulatorsHistory();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENAccumulatorsHistory anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAccumulatorsHistory.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAccumulatorsHistory.getObject%} access denied");



    selectStr =
    "SELECT  ENACCUMULATORSHISTORY.CODE, ENACCUMULATORSHISTORY.INSTALLDATE, ENACCUMULATORSHISTORY.UNINSTALLDATE, ENACCUMULATORSHISTORY.DISTANCE, ENACCUMULATORSHISTORY.REPLACEMENTREASON, ENACCUMULATORSHISTORY.DOMAIN_INFO, ENACCUMULATORSHISTORY.MODIFY_TIME, ENACCUMULATORSHISTORY.ACCUMULATORSREFCODE, ENACCUMULATORSHISTORY.TRANSPORTREALREFCODE "
    +" FROM ENACCUMULATORSHISTORY WHERE ENACCUMULATORSHISTORY.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENACCUMULATORSHISTORY",segregationInfo,getUserProfile().getDomainInfo());
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
        anObject.replacementReason = set.getString(5);
        anObject.domain_info = set.getString(6);
        anObject.modify_time = set.getLong(7);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.accumulatorsRef.code = set.getInt(8);
        if ( set.wasNull() )
            anObject.accumulatorsRef.code = Integer.MIN_VALUE;
        anObject.transportRealRef.code = set.getInt(9);
        if ( set.wasNull() )
            anObject.transportRealRef.code = Integer.MIN_VALUE;
        if(anObject.accumulatorsRef.code != Integer.MIN_VALUE)
        {
           anObject.setAccumulatorsRef(
        new com.ksoe.energynet.dataminer.generated.ENAccumulatorsDAOGen(connection,getUserProfile()).getRef(anObject.accumulatorsRef.code));
    }
        if(anObject.transportRealRef.code != Integer.MIN_VALUE)
        {
           anObject.setTransportRealRef(
        new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getRef(anObject.transportRealRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENAccumulatorsHistoryRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENAccumulatorsHistoryRef ref = new com.ksoe.energynet.valueobject.references.ENAccumulatorsHistoryRef();
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

    selectStr = "DELETE FROM  ENACCUMULATORSHISTORY WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENAccumulatorsHistory object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENAccumulatorsHistory.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENAccumulatorsHistory.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENAccumulatorsHistory.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAccumulatorsHistory.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAccumulatorsHistory.getObject%} access denied");

    selectStr =

    "SELECT  ENACCUMULATORSHISTORY.CODE FROM  ENACCUMULATORSHISTORY WHERE  ENACCUMULATORSHISTORY.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENACCUMULATORSHISTORY",segregationInfo,getUserProfile().getDomainInfo());
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
    _checkConditionToken(condition,"code","ENACCUMULATORSHISTORY.CODE");
    _checkConditionToken(condition,"installdate","ENACCUMULATORSHISTORY.INSTALLDATE");
    _checkConditionToken(condition,"uninstalldate","ENACCUMULATORSHISTORY.UNINSTALLDATE");
    _checkConditionToken(condition,"distance","ENACCUMULATORSHISTORY.DISTANCE");
    _checkConditionToken(condition,"replacementreason","ENACCUMULATORSHISTORY.REPLACEMENTREASON");
    _checkConditionToken(condition,"domain_info","ENACCUMULATORSHISTORY.DOMAIN_INFO");
    _checkConditionToken(condition,"modify_time","ENACCUMULATORSHISTORY.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"accumulatorsref","ACCUMULATORSREFCODE");
    _checkConditionToken(condition,"accumulatorsref.code","ACCUMULATORSREFCODE");
    _checkConditionToken(condition,"transportrealref","TRANSPORTREALREFCODE");
    _checkConditionToken(condition,"transportrealref.code","TRANSPORTREALREFCODE");
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

    private void _collectAutoIncrementFields(ENAccumulatorsHistory anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENACCUMULATORSHISTORY", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENACCUMULATORSHISTORY", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENACCUMULATORSHISTORY", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENACCUMULATORSHISTORY");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENAccumulatorsHistoryDAO
