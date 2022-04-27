
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
import com.ksoe.energynet.valueobject.ENTransportRoute;
import com.ksoe.energynet.valueobject.brief.ENTransportRouteShort;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportRouteShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENTransportRoute;
 *
 */

public class ENTransportRouteDAOGen extends GenericDataMiner {

  public ENTransportRouteDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportRouteDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTransportRoute inObject) throws PersistenceException
   {
      ENTransportRoute obj = new ENTransportRoute();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.distance.equals(obj.distance)){
       return false;
     }

     if ( ! inObject.weight.equals(obj.weight)){
       return false;
     }

     if ( ! inObject.distanceNew.equals(obj.distanceNew)){
       return false;
     }

     if ( ! inObject.speedometerStart.equals(obj.speedometerStart)){
       return false;
     }

     if ( ! inObject.speedometerFinal.equals(obj.speedometerFinal)){
       return false;
     }

     if ( ! inObject.fuelCounterStart.equals(obj.fuelCounterStart)){
       return false;
     }

     if ( ! inObject.fuelCounterFinal.equals(obj.fuelCounterFinal)){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }
     if (inObject.elementInRef.code != obj.elementInRef.code){
        return false;
     }
     if (inObject.elementOutRef.code != obj.elementOutRef.code){
        return false;
     }
     if (inObject.distanceRef.code != obj.distanceRef.code){
        return false;
     }
     if (inObject.distanceTypeRef.code != obj.distanceTypeRef.code){
        return false;
     }
     if (inObject.planRef.code != obj.planRef.code){
        return false;
     }
     if (inObject.parentRouteRef.code != obj.parentRouteRef.code){
        return false;
     }
      return true;
   }

   public int add(ENTransportRoute anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTransportRoute anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTRANSPORTROUTE (CODE,DISTANCE,WEIGHT,DISTANCENEW,SPEEDOMETERSTART,SPEEDOMETERFINAL,FUELCOUNTERSTART,FUELCOUNTERFINAL,COMMENTGEN,DATEEDIT,USERGEN,MODIFY_TIME,ELEMENTINREFCODE,ELEMENTOUTREFCODE,DISTANCEREFCODE,DISTANCETYPEREFCODE,PLANREFCODE,PARENTROUTEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.distance != null)
        anObject.distance = anObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.distance);
      if (anObject.weight != null)
        anObject.weight = anObject.weight.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.weight);
      if (anObject.distanceNew != null)
        anObject.distanceNew = anObject.distanceNew.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.distanceNew);
      if (anObject.speedometerStart != null)
        anObject.speedometerStart = anObject.speedometerStart.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.speedometerStart);
      if (anObject.speedometerFinal != null)
        anObject.speedometerFinal = anObject.speedometerFinal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.speedometerFinal);
      if (anObject.fuelCounterStart != null)
        anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.fuelCounterStart);
      if (anObject.fuelCounterFinal != null)
        anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.fuelCounterFinal);
      statement.setString(9,anObject.commentGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(10,null);
      else
        statement.setTimestamp(10,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      statement.setString(11,anObject.userGen);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(12,null);
      else
        statement.setBigDecimal(12,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.elementInRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.elementInRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportRoute.elementInRef.code%} = {%"+anObject.elementInRef.code+"%}");
        statement.setInt(13,anObject.elementInRef.code);
      }
      else
        statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.elementOutRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.elementOutRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportRoute.elementOutRef.code%} = {%"+anObject.elementOutRef.code+"%}");
        statement.setInt(14,anObject.elementOutRef.code);
      }
      else
        statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.distanceRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDistanceDAOGen(connection,getUserProfile()).exists(anObject.distanceRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportRoute.distanceRef.code%} = {%"+anObject.distanceRef.code+"%}");
        statement.setInt(15,anObject.distanceRef.code);
      }
      else
        statement.setNull(15,java.sql.Types.INTEGER);
      if (anObject.distanceTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDistanceTypeDAOGen(connection,getUserProfile()).exists(anObject.distanceTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportRoute.distanceTypeRef.code%} = {%"+anObject.distanceTypeRef.code+"%}");
        statement.setInt(16,anObject.distanceTypeRef.code);
      }
      else
        statement.setNull(16,java.sql.Types.INTEGER);
      if (anObject.planRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportRoute.planRef.code%} = {%"+anObject.planRef.code+"%}");
        statement.setInt(17,anObject.planRef.code);
      }
      else
        statement.setNull(17,java.sql.Types.INTEGER);
      if (anObject.parentRouteRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransportRouteDAOGen(connection,getUserProfile()).exists(anObject.parentRouteRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportRoute.parentRouteRef.code%} = {%"+anObject.parentRouteRef.code+"%}");
        statement.setInt(18,anObject.parentRouteRef.code);
      }
      else
        statement.setNull(18,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTransportRouteDAOGen.add%}",e);
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

   public void save(ENTransportRoute anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTransportRoute anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENTransportRoute oldObject = new ENTransportRoute();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENTransportRoute.modify_time_Field+" FROM  ENTRANSPORTROUTE WHERE CODE = ?";

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
      String selectStr;

      Vector fields = null;
      if(anAttributes != null)
       {
        String fieldNameStr;
        fields = new Vector();
        for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++)
         {
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DISTANCE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("WEIGHT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DISTANCENEW") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SPEEDOMETERSTART") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SPEEDOMETERFINAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FUELCOUNTERSTART") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FUELCOUNTERFINAL") == 0)
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
          if(fieldNameStr.compareTo("DATEEDIT") == 0)
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
          if(fieldNameStr.compareTo("MODIFY_TIME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ELEMENTINREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ELEMENTOUTREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DISTANCEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DISTANCETYPEREF") == 0)
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
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PARENTROUTEREF") == 0)
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
        "UPDATE ENTRANSPORTROUTE SET  DISTANCE = ? , WEIGHT = ? , DISTANCENEW = ? , SPEEDOMETERSTART = ? , SPEEDOMETERFINAL = ? , FUELCOUNTERSTART = ? , FUELCOUNTERFINAL = ? , COMMENTGEN = ? , DATEEDIT = ? , USERGEN = ? , MODIFY_TIME = ? , ELEMENTINREFCODE = ? , ELEMENTOUTREFCODE = ? , DISTANCEREFCODE = ? , DISTANCETYPEREFCODE = ? , PLANREFCODE = ? , PARENTROUTEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRANSPORTROUTE SET ";
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
      if (anObject.distance != null)
        anObject.distance = anObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.distance);
      if (anObject.weight != null)
        anObject.weight = anObject.weight.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.weight);
      if (anObject.distanceNew != null)
        anObject.distanceNew = anObject.distanceNew.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.distanceNew);
      if (anObject.speedometerStart != null)
        anObject.speedometerStart = anObject.speedometerStart.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.speedometerStart);
      if (anObject.speedometerFinal != null)
        anObject.speedometerFinal = anObject.speedometerFinal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.speedometerFinal);
      if (anObject.fuelCounterStart != null)
        anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.fuelCounterStart);
      if (anObject.fuelCounterFinal != null)
        anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.fuelCounterFinal);
      statement.setString(8,anObject.commentGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(9,null);
      else
        statement.setTimestamp(9,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      statement.setString(10,anObject.userGen);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(11,null);
      else
        statement.setBigDecimal(11,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.elementInRef.code != Integer.MIN_VALUE)
        statement.setInt(12,anObject.elementInRef.code);
      else
        statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.elementOutRef.code != Integer.MIN_VALUE)
        statement.setInt(13,anObject.elementOutRef.code);
      else
        statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.distanceRef.code != Integer.MIN_VALUE)
        statement.setInt(14,anObject.distanceRef.code);
      else
        statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.distanceTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(15,anObject.distanceTypeRef.code);
      else
        statement.setNull(15,java.sql.Types.INTEGER);
      if (anObject.planRef.code != Integer.MIN_VALUE)
        statement.setInt(16,anObject.planRef.code);
      else
        statement.setNull(16,java.sql.Types.INTEGER);
      if (anObject.parentRouteRef.code != Integer.MIN_VALUE)
        statement.setInt(17,anObject.parentRouteRef.code);
      else
        statement.setNull(17,java.sql.Types.INTEGER);
          statement.setInt(18,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("DISTANCE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.distance != null)
                    anObject.distance = anObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.distance);
                continue;
             }
            if("WEIGHT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.weight != null)
                    anObject.weight = anObject.weight.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.weight);
                continue;
             }
            if("DISTANCENEW".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.distanceNew != null)
                    anObject.distanceNew = anObject.distanceNew.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.distanceNew);
                continue;
             }
            if("SPEEDOMETERSTART".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.speedometerStart != null)
                    anObject.speedometerStart = anObject.speedometerStart.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.speedometerStart);
                continue;
             }
            if("SPEEDOMETERFINAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.speedometerFinal != null)
                    anObject.speedometerFinal = anObject.speedometerFinal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.speedometerFinal);
                continue;
             }
            if("FUELCOUNTERSTART".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.fuelCounterStart != null)
                    anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.fuelCounterStart);
                continue;
             }
            if("FUELCOUNTERFINAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.fuelCounterFinal != null)
                    anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.fuelCounterFinal);
                continue;
             }
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
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
            if("USERGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.userGen);
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
            if("ELEMENTINREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.elementInRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.elementInRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("ELEMENTOUTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.elementOutRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.elementOutRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("DISTANCEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.distanceRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.distanceRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("DISTANCETYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.distanceTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.distanceTypeRef.code);
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
            if("PARENTROUTEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.parentRouteRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.parentRouteRef.code);
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

   } // end of save(ENTransportRoute anObject,String[] anAttributes)


 public ENTransportRouteShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTransportRoute filterObject = new ENTransportRoute();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTransportRouteShort)list.get(0);
   return null;
  }

  public ENTransportRouteShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTransportRouteShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTransportRouteShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTransportRouteShortList getFilteredList(ENTransportRoute filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTransportRouteShortList getScrollableFilteredList(ENTransportRoute aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTransportRouteShortList getScrollableFilteredList(ENTransportRoute aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTransportRouteShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTransportRouteShortList getScrollableFilteredList(ENTransportRouteFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTransportRouteShortList getScrollableFilteredList(ENTransportRouteFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTransportRouteShortList getScrollableFilteredList(ENTransportRoute aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTransportRouteShortList getScrollableFilteredList(ENTransportRoute aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTransportRouteShortList result = new ENTransportRouteShortList();
    ENTransportRouteShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTROUTE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRANSPORTROUTE.CODE"+
     ",ENTRANSPORTROUTE.DISTANCE"+
     ",ENTRANSPORTROUTE.WEIGHT"+
     ",ENTRANSPORTROUTE.DISTANCENEW"+
     ",ENTRANSPORTROUTE.SPEEDOMETERSTART"+
     ",ENTRANSPORTROUTE.SPEEDOMETERFINAL"+
     ",ENTRANSPORTROUTE.FUELCOUNTERSTART"+
     ",ENTRANSPORTROUTE.FUELCOUNTERFINAL"+
     ",ENTRANSPORTROUTE.DATEEDIT"+
     ",ENTRANSPORTROUTE.USERGEN"+

      ", ENELEMENT.CODE " +
      ", ENELEMENT.CODE " +
      ", ENDISTANCE.CODE " +
      ", ENDISTANCE.DISTANCE " +
      ", ENDISTANCETYPE.CODE " +
      ", ENDISTANCETYPE.NAME " +
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
      ", ENTRANSPORTROUTE.CODE " +
      ", ENTRANSPORTROUTE.DISTANCE " +
      ", ENTRANSPORTROUTE.WEIGHT " +
      ", ENTRANSPORTROUTE.DISTANCENEW " +
      ", ENTRANSPORTROUTE.SPEEDOMETERSTART " +
      ", ENTRANSPORTROUTE.SPEEDOMETERFINAL " +
      ", ENTRANSPORTROUTE.FUELCOUNTERSTART " +
      ", ENTRANSPORTROUTE.FUELCOUNTERFINAL " +
      ", ENTRANSPORTROUTE.DATEEDIT " +
      ", ENTRANSPORTROUTE.USERGEN " +
     " FROM ENTRANSPORTROUTE " +
     ", ENELEMENT " +
     ", ENELEMENT " +
     ", ENDISTANCE " +
     ", ENDISTANCETYPE " +
     ", ENPLANWORK " +
     ", ENTRANSPORTROUTE " +
     //" WHERE "
    "";
     whereStr = " ENELEMENT.CODE = ENTRANSPORTROUTE.ELEMENTINREFCODE" ; //+
      whereStr = whereStr +" AND ENELEMENT.CODE = ENTRANSPORTROUTE.ELEMENTOUTREFCODE" ; //+
      whereStr = whereStr +" AND ENDISTANCE.CODE = ENTRANSPORTROUTE.DISTANCEREFCODE" ; //+
      whereStr = whereStr +" AND ENDISTANCETYPE.CODE = ENTRANSPORTROUTE.DISTANCETYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENPLANWORK.CODE = ENTRANSPORTROUTE.PLANREFCODE" ; //+
      whereStr = whereStr +" AND ENTRANSPORTROUTE.CODE = ENTRANSPORTROUTE.PARENTROUTEREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENTRANSPORTROUTE.CODE IN ( SELECT ENTRANSPORTROUTE.CODE FROM ENTRANSPORTROUTE ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.CODE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.DISTANCE = ?";
        }
        if(aFilterObject.weight != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.WEIGHT = ?";
        }
        if(aFilterObject.distanceNew != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.DISTANCENEW = ?";
        }
        if(aFilterObject.speedometerStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.SPEEDOMETERSTART = ?";
        }
        if(aFilterObject.speedometerFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.SPEEDOMETERFINAL = ?";
        }
        if(aFilterObject.fuelCounterStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.FUELCOUNTERSTART = ?";
        }
        if(aFilterObject.fuelCounterFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.FUELCOUNTERFINAL = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRANSPORTROUTE.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRANSPORTROUTE.COMMENTGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.DATEEDIT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRANSPORTROUTE.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRANSPORTROUTE.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.MODIFY_TIME = ?";
        }
        if(aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTROUTE.ELEMENTINREFCODE = ? ";
        }
        if(aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTROUTE.ELEMENTOUTREFCODE = ? ";
        }
        if(aFilterObject.distanceRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTROUTE.DISTANCEREFCODE = ? ";
        }
        if(aFilterObject.distanceTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTROUTE.DISTANCETYPEREFCODE = ? ";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTROUTE.PLANREFCODE = ? ";
        }
        if(aFilterObject.parentRouteRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTROUTE.PARENTROUTEREFCODE = ? ";
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
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
        if(aFilterObject.weight != null){
            number++;
            aFilterObject.weight = aFilterObject.weight.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.weight);
        }
        if(aFilterObject.distanceNew != null){
            number++;
            aFilterObject.distanceNew = aFilterObject.distanceNew.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distanceNew);
        }
        if(aFilterObject.speedometerStart != null){
            number++;
            aFilterObject.speedometerStart = aFilterObject.speedometerStart.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerStart);
        }
        if(aFilterObject.speedometerFinal != null){
            number++;
            aFilterObject.speedometerFinal = aFilterObject.speedometerFinal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerFinal);
        }
        if(aFilterObject.fuelCounterStart != null){
            number++;
            aFilterObject.fuelCounterStart = aFilterObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterStart);
        }
        if(aFilterObject.fuelCounterFinal != null){
            number++;
            aFilterObject.fuelCounterFinal = aFilterObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterFinal);
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
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementInRef.code);
       }
       if(aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementOutRef.code);
       }
       if(aFilterObject.distanceRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.distanceRef.code);
       }
       if(aFilterObject.distanceTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.distanceTypeRef.code);
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.parentRouteRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.parentRouteRef.code);
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

        anObject = new ENTransportRouteShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.distance = set.getBigDecimal(2);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.weight = set.getBigDecimal(3);
        if(anObject.weight != null)
            anObject.weight = anObject.weight.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.distanceNew = set.getBigDecimal(4);
        if(anObject.distanceNew != null)
            anObject.distanceNew = anObject.distanceNew.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.speedometerStart = set.getBigDecimal(5);
        if(anObject.speedometerStart != null)
            anObject.speedometerStart = anObject.speedometerStart.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.speedometerFinal = set.getBigDecimal(6);
        if(anObject.speedometerFinal != null)
            anObject.speedometerFinal = anObject.speedometerFinal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelCounterStart = set.getBigDecimal(7);
        if(anObject.fuelCounterStart != null)
            anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelCounterFinal = set.getBigDecimal(8);
        if(anObject.fuelCounterFinal != null)
            anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.dateEdit = set.getTimestamp(9);
        anObject.userGen = set.getString(10);

        anObject.elementInRefCode = set.getInt(11);
        if(set.wasNull())
        anObject.elementInRefCode = Integer.MIN_VALUE;
        anObject.elementOutRefCode = set.getInt(12);
        if(set.wasNull())
        anObject.elementOutRefCode = Integer.MIN_VALUE;
        anObject.distanceRefCode = set.getInt(13);
        if(set.wasNull())
        anObject.distanceRefCode = Integer.MIN_VALUE;
        anObject.distanceRefDistance = set.getBigDecimal(14);
        if(anObject.distanceRefDistance != null)
          anObject.distanceRefDistance = anObject.distanceRefDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.distanceTypeRefCode = set.getInt(15);
        if(set.wasNull())
        anObject.distanceTypeRefCode = Integer.MIN_VALUE;
        anObject.distanceTypeRefName = set.getString(16);
        anObject.planRefCode = set.getInt(17);
        if(set.wasNull())
        anObject.planRefCode = Integer.MIN_VALUE;
        anObject.planRefDateGen = set.getTimestamp(18);
        anObject.planRefDateStart = set.getDate(19);
        anObject.planRefDateFinal = set.getDate(20);
        anObject.planRefYearGen = set.getInt(21);
        if(set.wasNull())
        anObject.planRefYearGen = Integer.MIN_VALUE;
        anObject.planRefMonthGen = set.getInt(22);
        if(set.wasNull())
        anObject.planRefMonthGen = Integer.MIN_VALUE;
        anObject.planRefYearOriginal = set.getInt(23);
        if(set.wasNull())
        anObject.planRefYearOriginal = Integer.MIN_VALUE;
        anObject.planRefMonthOriginal = set.getInt(24);
        if(set.wasNull())
        anObject.planRefMonthOriginal = Integer.MIN_VALUE;
        anObject.planRefUserGen = set.getString(25);
        anObject.planRefDateEdit = set.getDate(26);
        anObject.planRefWorkOrderNumber = set.getString(27);
        anObject.planRefDateWorkOrder = set.getDate(28);
        anObject.planRefPriConnectionNumber = set.getString(29);
        anObject.planRefDateEndPriConnection = set.getDate(30);
        anObject.planRefInvestWorksDescription = set.getString(31);
        anObject.planRefServicesFSideFinId = set.getInt(32);
        if(set.wasNull())
        anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
        anObject.planRefServicesFSideCnNum = set.getString(33);
        anObject.planRefTotalTimeHours = set.getBigDecimal(34);
        if(anObject.planRefTotalTimeHours != null)
          anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planRefTotalTimeDays = set.getBigDecimal(35);
        if(anObject.planRefTotalTimeDays != null)
          anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.parentRouteRefCode = set.getInt(37);
        if(set.wasNull())
        anObject.parentRouteRefCode = Integer.MIN_VALUE;
        anObject.parentRouteRefDistance = set.getBigDecimal(38);
        if(anObject.parentRouteRefDistance != null)
          anObject.parentRouteRefDistance = anObject.parentRouteRefDistance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.parentRouteRefWeight = set.getBigDecimal(39);
        if(anObject.parentRouteRefWeight != null)
          anObject.parentRouteRefWeight = anObject.parentRouteRefWeight.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.parentRouteRefDistanceNew = set.getBigDecimal(40);
        if(anObject.parentRouteRefDistanceNew != null)
          anObject.parentRouteRefDistanceNew = anObject.parentRouteRefDistanceNew.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.parentRouteRefSpeedometerStart = set.getBigDecimal(41);
        if(anObject.parentRouteRefSpeedometerStart != null)
          anObject.parentRouteRefSpeedometerStart = anObject.parentRouteRefSpeedometerStart.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.parentRouteRefSpeedometerFinal = set.getBigDecimal(42);
        if(anObject.parentRouteRefSpeedometerFinal != null)
          anObject.parentRouteRefSpeedometerFinal = anObject.parentRouteRefSpeedometerFinal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.parentRouteRefFuelCounterStart = set.getBigDecimal(43);
        if(anObject.parentRouteRefFuelCounterStart != null)
          anObject.parentRouteRefFuelCounterStart = anObject.parentRouteRefFuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.parentRouteRefFuelCounterFinal = set.getBigDecimal(44);
        if(anObject.parentRouteRefFuelCounterFinal != null)
          anObject.parentRouteRefFuelCounterFinal = anObject.parentRouteRefFuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.parentRouteRefDateEdit = set.getTimestamp(45);
        anObject.parentRouteRefUserGen = set.getString(46);

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

  public int[] getFilteredCodeArrayOLD(ENTransportRoute aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSPORTROUTE.CODE FROM ENTRANSPORTROUTE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTROUTE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.CODE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.DISTANCE = ?";
        }
        if(aFilterObject.weight != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.WEIGHT = ?";
        }
        if(aFilterObject.distanceNew != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.DISTANCENEW = ?";
        }
        if(aFilterObject.speedometerStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.SPEEDOMETERSTART = ?";
        }
        if(aFilterObject.speedometerFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.SPEEDOMETERFINAL = ?";
        }
        if(aFilterObject.fuelCounterStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.FUELCOUNTERSTART = ?";
        }
        if(aFilterObject.fuelCounterFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.FUELCOUNTERFINAL = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSPORTROUTE.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENTRANSPORTROUTE.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.DATEEDIT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSPORTROUTE.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRANSPORTROUTE.USERGEN LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.MODIFY_TIME = ?";
        }
        if(aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROUTE.ELEMENTINREFCODE = ? ";
        }
        if(aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROUTE.ELEMENTOUTREFCODE = ? ";
        }
        if(aFilterObject.distanceRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROUTE.DISTANCEREFCODE = ? ";
        }
        if(aFilterObject.distanceTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROUTE.DISTANCETYPEREFCODE = ? ";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROUTE.PLANREFCODE = ? ";
        }
        if(aFilterObject.parentRouteRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROUTE.PARENTROUTEREFCODE = ? ";
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
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
        if(aFilterObject.weight != null){
            number++;
            aFilterObject.weight = aFilterObject.weight.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.weight);
        }
        if(aFilterObject.distanceNew != null){
            number++;
            aFilterObject.distanceNew = aFilterObject.distanceNew.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distanceNew);
        }
        if(aFilterObject.speedometerStart != null){
            number++;
            aFilterObject.speedometerStart = aFilterObject.speedometerStart.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerStart);
        }
        if(aFilterObject.speedometerFinal != null){
            number++;
            aFilterObject.speedometerFinal = aFilterObject.speedometerFinal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerFinal);
        }
        if(aFilterObject.fuelCounterStart != null){
            number++;
            aFilterObject.fuelCounterStart = aFilterObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterStart);
        }
        if(aFilterObject.fuelCounterFinal != null){
            number++;
            aFilterObject.fuelCounterFinal = aFilterObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterFinal);
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRANSPORTROUTE.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENTRANSPORTROUTE.COMMENTGEN LIKE ?";

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
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRANSPORTROUTE.USERGEN = ?";
             else
                 whereStr = whereStr + " ENTRANSPORTROUTE.USERGEN LIKE ?";

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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementInRef.code);
       }
       if(aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementOutRef.code);
       }
       if(aFilterObject.distanceRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.distanceRef.code);
       }
       if(aFilterObject.distanceTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.distanceTypeRef.code);
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.parentRouteRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.parentRouteRef.code);
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

  public int[] getFilteredCodeArray(ENTransportRouteFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTransportRoute aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSPORTROUTE.CODE FROM ENTRANSPORTROUTE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTROUTE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.CODE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.DISTANCE = ?";
        }
        if(aFilterObject.weight != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.WEIGHT = ?";
        }
        if(aFilterObject.distanceNew != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.DISTANCENEW = ?";
        }
        if(aFilterObject.speedometerStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.SPEEDOMETERSTART = ?";
        }
        if(aFilterObject.speedometerFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.SPEEDOMETERFINAL = ?";
        }
        if(aFilterObject.fuelCounterStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.FUELCOUNTERSTART = ?";
        }
        if(aFilterObject.fuelCounterFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.FUELCOUNTERFINAL = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSPORTROUTE.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENTRANSPORTROUTE.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.DATEEDIT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSPORTROUTE.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRANSPORTROUTE.USERGEN LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.MODIFY_TIME = ?";
        }
        if(aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROUTE.ELEMENTINREFCODE = ? ";
        }
        if(aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROUTE.ELEMENTOUTREFCODE = ? ";
        }
        if(aFilterObject.distanceRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROUTE.DISTANCEREFCODE = ? ";
        }
        if(aFilterObject.distanceTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROUTE.DISTANCETYPEREFCODE = ? ";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROUTE.PLANREFCODE = ? ";
        }
        if(aFilterObject.parentRouteRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROUTE.PARENTROUTEREFCODE = ? ";
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
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
        if(aFilterObject.weight != null){
            number++;
            aFilterObject.weight = aFilterObject.weight.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.weight);
        }
        if(aFilterObject.distanceNew != null){
            number++;
            aFilterObject.distanceNew = aFilterObject.distanceNew.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distanceNew);
        }
        if(aFilterObject.speedometerStart != null){
            number++;
            aFilterObject.speedometerStart = aFilterObject.speedometerStart.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerStart);
        }
        if(aFilterObject.speedometerFinal != null){
            number++;
            aFilterObject.speedometerFinal = aFilterObject.speedometerFinal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerFinal);
        }
        if(aFilterObject.fuelCounterStart != null){
            number++;
            aFilterObject.fuelCounterStart = aFilterObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterStart);
        }
        if(aFilterObject.fuelCounterFinal != null){
            number++;
            aFilterObject.fuelCounterFinal = aFilterObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterFinal);
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRANSPORTROUTE.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENTRANSPORTROUTE.COMMENTGEN LIKE ?";

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
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRANSPORTROUTE.USERGEN = ?";
             else
                 whereStr = whereStr + " ENTRANSPORTROUTE.USERGEN LIKE ?";

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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementInRef.code);
       }
       if(aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementOutRef.code);
       }
       if(aFilterObject.distanceRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.distanceRef.code);
       }
       if(aFilterObject.distanceTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.distanceTypeRef.code);
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.parentRouteRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.parentRouteRef.code);
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


   public ENTransportRoute getObject(int uid) throws PersistenceException
   {
    ENTransportRoute result = new ENTransportRoute();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTransportRoute anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTRANSPORTROUTE.CODE, ENTRANSPORTROUTE.DISTANCE, ENTRANSPORTROUTE.WEIGHT, ENTRANSPORTROUTE.DISTANCENEW, ENTRANSPORTROUTE.SPEEDOMETERSTART, ENTRANSPORTROUTE.SPEEDOMETERFINAL, ENTRANSPORTROUTE.FUELCOUNTERSTART, ENTRANSPORTROUTE.FUELCOUNTERFINAL, ENTRANSPORTROUTE.COMMENTGEN, ENTRANSPORTROUTE.DATEEDIT, ENTRANSPORTROUTE.USERGEN, ENTRANSPORTROUTE.MODIFY_TIME, ENTRANSPORTROUTE.ELEMENTINREFCODE, ENTRANSPORTROUTE.ELEMENTOUTREFCODE, ENTRANSPORTROUTE.DISTANCEREFCODE, ENTRANSPORTROUTE.DISTANCETYPEREFCODE, ENTRANSPORTROUTE.PLANREFCODE, ENTRANSPORTROUTE.PARENTROUTEREFCODE "
    +" FROM ENTRANSPORTROUTE WHERE ENTRANSPORTROUTE.CODE = ?";

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
        anObject.distance = set.getBigDecimal(2);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.weight = set.getBigDecimal(3);
        if(anObject.weight != null)
            anObject.weight = anObject.weight.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.distanceNew = set.getBigDecimal(4);
        if(anObject.distanceNew != null)
            anObject.distanceNew = anObject.distanceNew.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.speedometerStart = set.getBigDecimal(5);
        if(anObject.speedometerStart != null)
            anObject.speedometerStart = anObject.speedometerStart.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.speedometerFinal = set.getBigDecimal(6);
        if(anObject.speedometerFinal != null)
            anObject.speedometerFinal = anObject.speedometerFinal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelCounterStart = set.getBigDecimal(7);
        if(anObject.fuelCounterStart != null)
            anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelCounterFinal = set.getBigDecimal(8);
        if(anObject.fuelCounterFinal != null)
            anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.commentGen = set.getString(9);
        anObject.dateEdit = set.getTimestamp(10);
        anObject.userGen = set.getString(11);
        anObject.modify_time = set.getLong(12);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.elementInRef.code = set.getInt(13);
        if ( set.wasNull() )
            anObject.elementInRef.code = Integer.MIN_VALUE;
        anObject.elementOutRef.code = set.getInt(14);
        if ( set.wasNull() )
            anObject.elementOutRef.code = Integer.MIN_VALUE;
        anObject.distanceRef.code = set.getInt(15);
        if ( set.wasNull() )
            anObject.distanceRef.code = Integer.MIN_VALUE;
        anObject.distanceTypeRef.code = set.getInt(16);
        if ( set.wasNull() )
            anObject.distanceTypeRef.code = Integer.MIN_VALUE;
        anObject.planRef.code = set.getInt(17);
        if ( set.wasNull() )
            anObject.planRef.code = Integer.MIN_VALUE;
        anObject.parentRouteRef.code = set.getInt(18);
        if ( set.wasNull() )
            anObject.parentRouteRef.code = Integer.MIN_VALUE;
        if(anObject.elementInRef.code != Integer.MIN_VALUE)
        {
           anObject.setElementInRef(
        new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getRef(anObject.elementInRef.code));
    }
        if(anObject.elementOutRef.code != Integer.MIN_VALUE)
        {
           anObject.setElementOutRef(
        new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getRef(anObject.elementOutRef.code));
    }
        if(anObject.distanceRef.code != Integer.MIN_VALUE)
        {
           anObject.setDistanceRef(
        new com.ksoe.energynet.dataminer.generated.ENDistanceDAOGen(connection,getUserProfile()).getRef(anObject.distanceRef.code));
    }
        if(anObject.distanceTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setDistanceTypeRef(
        new com.ksoe.energynet.dataminer.generated.ENDistanceTypeDAOGen(connection,getUserProfile()).getRef(anObject.distanceTypeRef.code));
    }
        if(anObject.planRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlanRef(
        new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
    }
        if(anObject.parentRouteRef.code != Integer.MIN_VALUE)
        {
           anObject.setParentRouteRef(
        new com.ksoe.energynet.dataminer.generated.ENTransportRouteDAOGen(connection,getUserProfile()).getRef(anObject.parentRouteRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENTransportRouteRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTransportRouteRef ref = new com.ksoe.energynet.valueobject.references.ENTransportRouteRef();
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

    selectStr = "DELETE FROM  ENTRANSPORTROUTE WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTransportRoute object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTransportRoute.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportRoute.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTransportRoute.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportRoute.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTransportRoute.getObject%} access denied");

    selectStr =

    "SELECT  ENTRANSPORTROUTE.CODE FROM  ENTRANSPORTROUTE WHERE  ENTRANSPORTROUTE.CODE = ?";
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
    _checkConditionToken(condition,"code","ENTRANSPORTROUTE.CODE");
    _checkConditionToken(condition,"distance","ENTRANSPORTROUTE.DISTANCE");
    _checkConditionToken(condition,"weight","ENTRANSPORTROUTE.WEIGHT");
    _checkConditionToken(condition,"distancenew","ENTRANSPORTROUTE.DISTANCENEW");
    _checkConditionToken(condition,"speedometerstart","ENTRANSPORTROUTE.SPEEDOMETERSTART");
    _checkConditionToken(condition,"speedometerfinal","ENTRANSPORTROUTE.SPEEDOMETERFINAL");
    _checkConditionToken(condition,"fuelcounterstart","ENTRANSPORTROUTE.FUELCOUNTERSTART");
    _checkConditionToken(condition,"fuelcounterfinal","ENTRANSPORTROUTE.FUELCOUNTERFINAL");
    _checkConditionToken(condition,"commentgen","ENTRANSPORTROUTE.COMMENTGEN");
    _checkConditionToken(condition,"dateedit","ENTRANSPORTROUTE.DATEEDIT");
    _checkConditionToken(condition,"usergen","ENTRANSPORTROUTE.USERGEN");
    _checkConditionToken(condition,"modify_time","ENTRANSPORTROUTE.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"elementinref","ELEMENTINREFCODE");
    _checkConditionToken(condition,"elementinref.code","ELEMENTINREFCODE");
    _checkConditionToken(condition,"elementoutref","ELEMENTOUTREFCODE");
    _checkConditionToken(condition,"elementoutref.code","ELEMENTOUTREFCODE");
    _checkConditionToken(condition,"distanceref","DISTANCEREFCODE");
    _checkConditionToken(condition,"distanceref.code","DISTANCEREFCODE");
    _checkConditionToken(condition,"distancetyperef","DISTANCETYPEREFCODE");
    _checkConditionToken(condition,"distancetyperef.code","DISTANCETYPEREFCODE");
    _checkConditionToken(condition,"planref","PLANREFCODE");
    _checkConditionToken(condition,"planref.code","PLANREFCODE");
    _checkConditionToken(condition,"parentrouteref","PARENTROUTEREFCODE");
    _checkConditionToken(condition,"parentrouteref.code","PARENTROUTEREFCODE");
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

    private void _collectAutoIncrementFields(ENTransportRoute anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENTRANSPORTROUTE", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENTRANSPORTROUTE", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENTRANSPORTROUTE", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENTRANSPORTROUTE");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENTransportRouteDAO
