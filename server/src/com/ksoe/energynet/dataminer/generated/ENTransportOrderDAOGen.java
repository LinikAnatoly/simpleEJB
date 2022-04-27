
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
import com.ksoe.energynet.valueobject.ENTransportOrder;
import com.ksoe.energynet.valueobject.brief.ENTransportOrderShort;
import com.ksoe.energynet.valueobject.filter.ENTransportOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportOrderShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

  /**
  *  DAO Generated for ENTransportOrder;
  *
  */

public class ENTransportOrderDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTransportOrderDAOGen() {super();}
  //public ENTransportOrderDAOGen(Connection aConnection) {super(aConnection);}
  //public ENTransportOrderDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportOrderDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportOrderDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTransportOrder inObject) throws PersistenceException
   {
      ENTransportOrder obj = new ENTransportOrder();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.numbergen != obj.numbergen){
       return false;
     }

     if ( ! inObject.timeStart.equals(obj.timeStart)){
       return false;
     }

     if ( ! inObject.timeFinal.equals(obj.timeFinal)){
       return false;
     }

     if ( ! inObject.dateStart.equals(obj.dateStart)){
       return false;
     }

     if ( ! inObject.dateFinal.equals(obj.dateFinal)){
       return false;
     }

     if (inObject.isAssignment != obj.isAssignment){
       return false;
     }

     if (inObject.isApproved != obj.isApproved){
       return false;
     }

     if (inObject.isRejected != obj.isRejected){
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
     if (inObject.transportOrderStatus.code != obj.transportOrderStatus.code){
        return false;
     }
     if (inObject.planRef.code != obj.planRef.code){
        return false;
     }
     if (inObject.transport.code != obj.transport.code){
        return false;
     }
     if (inObject.transportReal.code != obj.transportReal.code){
        return false;
     }
     if (inObject.transportDepartment.code != obj.transportDepartment.code){
        return false;
     }
     if (inObject.parentRef.code != obj.parentRef.code){
        return false;
     }
      return true;
   }

   public int add(ENTransportOrder anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTransportOrder anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTRANSPORTORDER (CODE,NUMBERGEN,TIMESTART,TIMEFINAL,DATESTART,DATEFINAL,ISASSIGNMENT,ISAPPROVED,ISREJECTED,COMMENTGEN,DATEEDIT,USERGEN,MODIFY_TIME,TRANSPORTORDERSTATUSCD,PLANREFCODE,TRANSPORTCODE,TRANSPORTREALCODE,TRANSPORTDEPARTMENTCOD,PARENTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.numbergen);
      if (anObject.timeStart == null)
        statement.setTimestamp(3,null);
      else
        statement.setTimestamp(3,new java.sql.Timestamp(anObject.timeStart.getTime()));
      if (anObject.timeFinal == null)
        statement.setTimestamp(4,null);
      else
        statement.setTimestamp(4,new java.sql.Timestamp(anObject.timeFinal.getTime()));
      if (anObject.dateStart == null)
        statement.setTimestamp(5,null);
      else
        statement.setTimestamp(5,new java.sql.Timestamp(anObject.dateStart.getTime()));
      if (anObject.dateFinal == null)
        statement.setTimestamp(6,null);
      else
        statement.setTimestamp(6,new java.sql.Timestamp(anObject.dateFinal.getTime()));
      if (anObject.isAssignment != Integer.MIN_VALUE )
         statement.setInt(7,anObject.isAssignment);
      else
         statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.isApproved != Integer.MIN_VALUE )
         statement.setInt(8,anObject.isApproved);
      else
         statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.isRejected != Integer.MIN_VALUE )
         statement.setInt(9,anObject.isRejected);
      else
         statement.setNull(9,java.sql.Types.INTEGER);
      statement.setString(10,anObject.commentGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(11,null);
      else
        statement.setTimestamp(11,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      statement.setString(12,anObject.userGen);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(13,null);
      else
        statement.setBigDecimal(13,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.transportOrderStatus.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransportOrderStatusDAOGen(connection,getUserProfile()).exists(anObject.transportOrderStatus.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportOrder.transportOrderStatus.code%} = {%"+anObject.transportOrderStatus.code+"%}");
        statement.setInt(14,anObject.transportOrderStatus.code);
      }
      else
        statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.planRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportOrder.planRef.code%} = {%"+anObject.planRef.code+"%}");
        statement.setInt(15,anObject.planRef.code);
      }
      else
        statement.setNull(15,java.sql.Types.INTEGER);
      if (anObject.transport.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKTransportDAOGen(connection,getUserProfile()).exists(anObject.transport.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENTransportOrder.transport.code%} = {%"+anObject.transport.code+"%}");
        statement.setInt(16,anObject.transport.code);
      }
      else
        statement.setNull(16,java.sql.Types.INTEGER);
      if (anObject.transportReal.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).exists(anObject.transportReal.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENTransportOrder.transportReal.code%} = {%"+anObject.transportReal.code+"%}");
        statement.setInt(17,anObject.transportReal.code);
      }
      else
        statement.setNull(17,java.sql.Types.INTEGER);
      if (anObject.transportDepartment.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransportDepartmentDAOGen(connection,getUserProfile()).exists(anObject.transportDepartment.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportOrder.transportDepartment.code%} = {%"+anObject.transportDepartment.code+"%}");
        statement.setInt(18,anObject.transportDepartment.code);
      }
      else
        statement.setNull(18,java.sql.Types.INTEGER);
      if (anObject.parentRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransportOrderDAOGen(connection,getUserProfile()).exists(anObject.parentRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportOrder.parentRef.code%} = {%"+anObject.parentRef.code+"%}");
        statement.setInt(19,anObject.parentRef.code);
      }
      else
        statement.setNull(19,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTransportOrderDAOGen.add%}",e);
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

   public void save(ENTransportOrder anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTransportOrder anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENTransportOrder oldObject = new ENTransportOrder();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENTransportOrder.modify_time_Field + " FROM  ENTRANSPORTORDER WHERE CODE = ?";

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
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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
          if(fieldNameStr.compareTo("NUMBERGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TIMESTART") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TIMEFINAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATESTART") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEFINAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ISASSIGNMENT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ISAPPROVED") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ISREJECTED") == 0)
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
          if(fieldNameStr.compareTo("TRANSPORTORDERSTATUS") == 0)
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
          if(fieldNameStr.compareTo("TRANSPORT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRANSPORTREAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRANSPORTDEPARTMENT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PARENTREF") == 0)
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
        "UPDATE ENTRANSPORTORDER SET  NUMBERGEN = ? , TIMESTART = ? , TIMEFINAL = ? , DATESTART = ? , DATEFINAL = ? , ISASSIGNMENT = ? , ISAPPROVED = ? , ISREJECTED = ? , COMMENTGEN = ? , DATEEDIT = ? , USERGEN = ? , MODIFY_TIME = ? , TRANSPORTORDERSTATUSCD = ? , PLANREFCODE = ? , TRANSPORTCODE = ? , TRANSPORTREALCODE = ? , TRANSPORTDEPARTMENTCOD = ? , PARENTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRANSPORTORDER SET ";
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
      if (anObject.timeStart == null)
        statement.setDate(2,null);
      else
        statement.setTimestamp(2,new java.sql.Timestamp(anObject.timeStart.getTime()));
      if (anObject.timeFinal == null)
        statement.setDate(3,null);
      else
        statement.setTimestamp(3,new java.sql.Timestamp(anObject.timeFinal.getTime()));
      if (anObject.dateStart == null)
        statement.setDate(4,null);
      else
        statement.setTimestamp(4,new java.sql.Timestamp(anObject.dateStart.getTime()));
      if (anObject.dateFinal == null)
        statement.setDate(5,null);
      else
        statement.setTimestamp(5,new java.sql.Timestamp(anObject.dateFinal.getTime()));
      if (anObject.isAssignment != Integer.MIN_VALUE )
         statement.setInt(6,anObject.isAssignment);
      else
         statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.isApproved != Integer.MIN_VALUE )
         statement.setInt(7,anObject.isApproved);
      else
         statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.isRejected != Integer.MIN_VALUE )
         statement.setInt(8,anObject.isRejected);
      else
         statement.setNull(8,java.sql.Types.INTEGER);
      statement.setString(9,anObject.commentGen);
      if (anObject.dateEdit == null)
        statement.setDate(10,null);
      else
        statement.setTimestamp(10,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      statement.setString(11,anObject.userGen);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(12,null);
      else
        statement.setBigDecimal(12,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.transportOrderStatus.code != Integer.MIN_VALUE)
        statement.setInt(13,anObject.transportOrderStatus.code);
      else
        statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.planRef.code != Integer.MIN_VALUE)
        statement.setInt(14,anObject.planRef.code);
      else
        statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.transport.code != Integer.MIN_VALUE)
        statement.setInt(15,anObject.transport.code);
      else
        statement.setNull(15,java.sql.Types.INTEGER);
      if (anObject.transportReal.code != Integer.MIN_VALUE)
        statement.setInt(16,anObject.transportReal.code);
      else
        statement.setNull(16,java.sql.Types.INTEGER);
      if (anObject.transportDepartment.code != Integer.MIN_VALUE)
        statement.setInt(17,anObject.transportDepartment.code);
      else
        statement.setNull(17,java.sql.Types.INTEGER);
      if (anObject.parentRef.code != Integer.MIN_VALUE)
        statement.setInt(18,anObject.parentRef.code);
      else
        statement.setNull(18,java.sql.Types.INTEGER);
          statement.setInt(19,anObject.code);
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
            if("TIMESTART".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.timeStart == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.timeStart.getTime()));
                continue;
             }
            if("TIMEFINAL".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.timeFinal == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.timeFinal.getTime()));
                continue;
             }
            if("DATESTART".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateStart == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateStart.getTime()));
                continue;
             }
            if("DATEFINAL".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateFinal == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateFinal.getTime()));
                continue;
             }
            if("ISASSIGNMENT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.isAssignment);
                continue;
             }
            if("ISAPPROVED".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.isApproved);
                continue;
             }
            if("ISREJECTED".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.isRejected);
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
            if("TRANSPORTORDERSTATUS".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportOrderStatus.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportOrderStatus.code);
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
            if("TRANSPORT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transport.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transport.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRANSPORTREAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportReal.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportReal.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRANSPORTDEPARTMENT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportDepartment.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportDepartment.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("PARENTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.parentRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.parentRef.code);
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

   } // end of save(ENTransportOrder anObject,String[] anAttributes)


 public ENTransportOrderShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTransportOrder filterObject = new ENTransportOrder();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTransportOrderShort)list.get(0);
   return null;
  }

  public ENTransportOrderShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTransportOrderShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTransportOrderShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTransportOrderShortList getFilteredList(ENTransportOrder filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTransportOrderShortList getScrollableFilteredList(ENTransportOrder aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTransportOrderShortList getScrollableFilteredList(ENTransportOrder aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTransportOrderShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTransportOrderShortList getScrollableFilteredList(ENTransportOrderFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTransportOrderShortList getScrollableFilteredList(ENTransportOrderFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTransportOrderShortList getScrollableFilteredList(ENTransportOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTransportOrderShortList getScrollableFilteredList(ENTransportOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTransportOrderShortList result = new ENTransportOrderShortList();
    ENTransportOrderShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTORDER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRANSPORTORDER.CODE"+
     ",ENTRANSPORTORDER.NUMBERGEN"+
     ",ENTRANSPORTORDER.TIMESTART"+
     ",ENTRANSPORTORDER.TIMEFINAL"+
     ",ENTRANSPORTORDER.DATESTART"+
     ",ENTRANSPORTORDER.DATEFINAL"+
     ",ENTRANSPORTORDER.ISASSIGNMENT"+
     ",ENTRANSPORTORDER.ISAPPROVED"+
     ",ENTRANSPORTORDER.ISREJECTED"+
     ",ENTRANSPORTORDER.DATEEDIT"+
     ",ENTRANSPORTORDER.USERGEN"+

      ", ENTRANSPORTORDERSTATUS.CODE " +
      ", ENTRANSPORTORDERSTATUS.NAME " +
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
      ", ENPLANWORK.SERVICESFSIDEFINID " +
      ", ENPLANWORK.SERVICESFSIDECNNUM " +
      ", ENPLANWORK.TOTALTIMEHOURS " +
      ", ENPLANWORK.TOTALTIMEDAYS " +
      ", TKTRANSPORT.CODE " +
      ", TKTRANSPORT.NAME " +
      ", TKTRANSPORTREAL.CODE " +
      ", TKTRANSPORTREAL.NAME " +
      ", TKTRANSPORTREAL.INVNUMBER " +
      ", TKTRANSPORTREAL.GOSNUMBER " +
      ", ENTRANSPORTDEPARTMENT.CODE " +
      ", ENTRANSPORTDEPARTMENT.NAME " +
      ", ENTRANSPORTORDER.CODE " +
      ", ENTRANSPORTORDER.NUMBERGEN " +
      ", ENTRANSPORTORDER.TIMESTART " +
      ", ENTRANSPORTORDER.TIMEFINAL " +
      ", ENTRANSPORTORDER.DATESTART " +
      ", ENTRANSPORTORDER.DATEFINAL " +
      ", ENTRANSPORTORDER.ISASSIGNMENT " +
      ", ENTRANSPORTORDER.ISAPPROVED " +
      ", ENTRANSPORTORDER.ISREJECTED " +
      ", ENTRANSPORTORDER.DATEEDIT " +
      ", ENTRANSPORTORDER.USERGEN " +
     " FROM ENTRANSPORTORDER " +
     ", ENTRANSPORTORDERSTATUS " +
     ", ENPLANWORK " +
     ", TKTRANSPORT " +
     ", TKTRANSPORTREAL " +
     ", ENTRANSPORTDEPARTMENT " +
     ", ENTRANSPORTORDER " +
     //" WHERE "
    "";
     whereStr = " ENTRANSPORTORDERSTATUS.CODE = ENTRANSPORTORDER.TRANSPORTORDERSTATUSCD" ; //+
      whereStr = whereStr +" AND ENPLANWORK.CODE = ENTRANSPORTORDER.PLANREFCODE" ; //+
      whereStr = whereStr +" AND TKTRANSPORT.CODE = ENTRANSPORTORDER.TRANSPORTCODE" ; //+
      whereStr = whereStr +" AND TKTRANSPORTREAL.CODE = ENTRANSPORTORDER.TRANSPORTREALCODE" ; //+
      whereStr = whereStr +" AND ENTRANSPORTDEPARTMENT.CODE = ENTRANSPORTORDER.TRANSPORTDEPARTMENTCOD" ; //+
      whereStr = whereStr +" AND ENTRANSPORTORDER.CODE = ENTRANSPORTORDER.PARENTREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENTRANSPORTORDER.CODE IN ( SELECT ENTRANSPORTORDER.CODE FROM ENTRANSPORTORDER ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.CODE = ?";
        }
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRANSPORTORDER.NUMBERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRANSPORTORDER.NUMBERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.timeStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.TIMESTART = ?";
        }
        if(aFilterObject.timeFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.TIMEFINAL = ?";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.DATEFINAL = ?";
        }
        if(aFilterObject.isAssignment != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.ISASSIGNMENT = ?";
        }
        if(aFilterObject.isApproved != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.ISAPPROVED = ?";
        }
        if(aFilterObject.isRejected != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.ISREJECTED = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRANSPORTORDER.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRANSPORTORDER.COMMENTGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.DATEEDIT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRANSPORTORDER.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRANSPORTORDER.USERGEN) LIKE UPPER(?)";
         }
         
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.MODIFY_TIME = ?";
        }
        if(aFilterObject.transportOrderStatus.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTORDER.TRANSPORTORDERSTATUSCD = ? ";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTORDER.PLANREFCODE = ? ";
        }
        if(aFilterObject.transport.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTORDER.TRANSPORTCODE = ? ";
        }
        if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTORDER.TRANSPORTREALCODE = ? ";
        }
        if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTORDER.TRANSPORTDEPARTMENTCOD = ? ";
        }
        if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTORDER.PARENTREFCODE = ? ";
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
        if(aFilterObject.timeStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
        }
        if(aFilterObject.timeFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
        }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateFinal.getTime()));
        }
         if(aFilterObject.isAssignment != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isAssignment);
         }
         if(aFilterObject.isApproved != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isApproved);
         }
         if(aFilterObject.isRejected != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isRejected);
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
       if(aFilterObject.transportOrderStatus.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportOrderStatus.code);
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.transport.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transport.code);
       }
       if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportReal.code);
       }
       if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportDepartment.code);
       }
       if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.parentRef.code);
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

        anObject = new ENTransportOrderShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.numbergen = set.getString(2);
        anObject.timeStart = set.getTimestamp(3);
        anObject.timeFinal = set.getTimestamp(4);
        anObject.dateStart = set.getTimestamp(5);
        anObject.dateFinal = set.getTimestamp(6);
        anObject.isAssignment = set.getInt(7);
        if ( set.wasNull() )
            anObject.isAssignment = Integer.MIN_VALUE;
        anObject.isApproved = set.getInt(8);
        if ( set.wasNull() )
            anObject.isApproved = Integer.MIN_VALUE;
        anObject.isRejected = set.getInt(9);
        if ( set.wasNull() )
            anObject.isRejected = Integer.MIN_VALUE;
        anObject.dateEdit = set.getTimestamp(10);
        anObject.userGen = set.getString(11);

        anObject.transportOrderStatusCode = set.getInt(12);
        if(set.wasNull())
        anObject.transportOrderStatusCode = Integer.MIN_VALUE;
        anObject.transportOrderStatusName = set.getString(13);
        anObject.planRefCode = set.getInt(14);
        if(set.wasNull())
        anObject.planRefCode = Integer.MIN_VALUE;
        anObject.planRefDateGen = set.getDate(15);
        anObject.planRefDateStart = set.getDate(16);
        anObject.planRefDateFinal = set.getDate(17);
        anObject.planRefYearGen = set.getInt(18);
        if(set.wasNull())
        anObject.planRefYearGen = Integer.MIN_VALUE;
        anObject.planRefMonthGen = set.getInt(19);
        if(set.wasNull())
        anObject.planRefMonthGen = Integer.MIN_VALUE;
        anObject.planRefYearOriginal = set.getInt(20);
        if(set.wasNull())
        anObject.planRefYearOriginal = Integer.MIN_VALUE;
        anObject.planRefMonthOriginal = set.getInt(21);
        if(set.wasNull())
        anObject.planRefMonthOriginal = Integer.MIN_VALUE;
        anObject.planRefUserGen = set.getString(22);
        anObject.planRefDateEdit = set.getDate(23);
        anObject.planRefWorkOrderNumber = set.getString(24);
        anObject.planRefDateWorkOrder = set.getDate(25);
        anObject.planRefPriConnectionNumber = set.getString(26);
        anObject.planRefServicesFSideFinId = set.getInt(27);
        if(set.wasNull())
        anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
        anObject.planRefServicesFSideCnNum = set.getString(28);
        anObject.transportCode = set.getInt(31);
        if(set.wasNull())
        anObject.transportCode = Integer.MIN_VALUE;
        anObject.transportName = set.getString(32);
        anObject.transportRealCode = set.getInt(33);
        if(set.wasNull())
        anObject.transportRealCode = Integer.MIN_VALUE;
        anObject.transportRealName = set.getString(34);
        anObject.transportRealInvNumber = set.getString(35);
        anObject.transportRealGosNumber = set.getString(36);
        anObject.transportDepartmentCode = set.getInt(37);
        if(set.wasNull())
        anObject.transportDepartmentCode = Integer.MIN_VALUE;
        anObject.transportDepartmentName = set.getString(38);
        anObject.parentRefCode = set.getInt(39);
        if(set.wasNull())
        anObject.parentRefCode = Integer.MIN_VALUE;
        anObject.parentRefNumbergen = set.getString(40);
        anObject.parentRefTimeStart = set.getTimestamp(41);
        anObject.parentRefTimeFinal = set.getTimestamp(42);
        anObject.parentRefDateStart = set.getTimestamp(43);
        anObject.parentRefDateFinal = set.getTimestamp(44);
        anObject.parentRefDateEdit = set.getTimestamp(48);
        anObject.parentRefUserGen = set.getString(49);

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

  public int[] getFilteredCodeArrayOLD(ENTransportOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSPORTORDER.CODE FROM ENTRANSPORTORDER";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTORDER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.CODE = ?";
        }
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSPORTORDER.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRANSPORTORDER.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.timeStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.TIMESTART = ?";
        }
        if(aFilterObject.timeFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.TIMEFINAL = ?";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.DATEFINAL = ?";
        }
        if(aFilterObject.isAssignment != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.ISASSIGNMENT = ?";
        }
        if(aFilterObject.isApproved != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.ISAPPROVED = ?";
        }
        if(aFilterObject.isRejected != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.ISREJECTED = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSPORTORDER.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENTRANSPORTORDER.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.DATEEDIT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSPORTORDER.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRANSPORTORDER.USERGEN LIKE ?";
         }

        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.MODIFY_TIME = ?";
        }
        if(aFilterObject.transportOrderStatus.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTORDER.TRANSPORTORDERSTATUSCD = ? ";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTORDER.PLANREFCODE = ? ";
        }
        if(aFilterObject.transport.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTORDER.TRANSPORTCODE = ? ";
        }
        if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTORDER.TRANSPORTREALCODE = ? ";
        }
        if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTORDER.TRANSPORTDEPARTMENTCOD = ? ";
        }
        if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTORDER.PARENTREFCODE = ? ";
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
                 whereStr = whereStr + " ENTRANSPORTORDER.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENTRANSPORTORDER.NUMBERGEN LIKE ?";

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
        if(aFilterObject.timeStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
        }
        if(aFilterObject.timeFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
        }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateFinal.getTime()));
        }
         if(aFilterObject.isAssignment != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isAssignment);
         }
         if(aFilterObject.isApproved != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isApproved);
         }
         if(aFilterObject.isRejected != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isRejected);
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRANSPORTORDER.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENTRANSPORTORDER.COMMENTGEN LIKE ?";

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
                 whereStr = whereStr + " ENTRANSPORTORDER.USERGEN = ?";
             else
                 whereStr = whereStr + " ENTRANSPORTORDER.USERGEN LIKE ?";

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
       if(aFilterObject.transportOrderStatus.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportOrderStatus.code);
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.transport.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transport.code);
       }
       if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportReal.code);
       }
       if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportDepartment.code);
       }
       if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.parentRef.code);
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

  public int[] getFilteredCodeArray(ENTransportOrderFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTransportOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSPORTORDER.CODE FROM ENTRANSPORTORDER";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTORDER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.CODE = ?";
        }
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSPORTORDER.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRANSPORTORDER.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.timeStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.TIMESTART = ?";
        }
        if(aFilterObject.timeFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.TIMEFINAL = ?";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.DATEFINAL = ?";
        }
        if(aFilterObject.isAssignment != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.ISASSIGNMENT = ?";
        }
        if(aFilterObject.isApproved != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.ISAPPROVED = ?";
        }
        if(aFilterObject.isRejected != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.ISREJECTED = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSPORTORDER.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENTRANSPORTORDER.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.DATEEDIT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRANSPORTORDER.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRANSPORTORDER.USERGEN LIKE ?";
         }

        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER.MODIFY_TIME = ?";
        }
        if(aFilterObject.transportOrderStatus.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTORDER.TRANSPORTORDERSTATUSCD = ? ";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTORDER.PLANREFCODE = ? ";
        }
        if(aFilterObject.transport.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTORDER.TRANSPORTCODE = ? ";
        }
        if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTORDER.TRANSPORTREALCODE = ? ";
        }
        if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTORDER.TRANSPORTDEPARTMENTCOD = ? ";
        }
        if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTORDER.PARENTREFCODE = ? ";
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
                 whereStr = whereStr + " ENTRANSPORTORDER.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENTRANSPORTORDER.NUMBERGEN LIKE ?";

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
        if(aFilterObject.timeStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
        }
        if(aFilterObject.timeFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
        }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateFinal.getTime()));
        }
         if(aFilterObject.isAssignment != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isAssignment);
         }
         if(aFilterObject.isApproved != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isApproved);
         }
         if(aFilterObject.isRejected != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isRejected);
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRANSPORTORDER.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENTRANSPORTORDER.COMMENTGEN LIKE ?";

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
                 whereStr = whereStr + " ENTRANSPORTORDER.USERGEN = ?";
             else
                 whereStr = whereStr + " ENTRANSPORTORDER.USERGEN LIKE ?";

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
       if(aFilterObject.transportOrderStatus.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportOrderStatus.code);
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.transport.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transport.code);
       }
       if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportReal.code);
       }
       if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportDepartment.code);
       }
       if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.parentRef.code);
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


   public ENTransportOrder getObject(int uid) throws PersistenceException
   {
    ENTransportOrder result = new ENTransportOrder();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTransportOrder anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");


    selectStr =
    "SELECT  ENTRANSPORTORDER.CODE, ENTRANSPORTORDER.NUMBERGEN, ENTRANSPORTORDER.TIMESTART, ENTRANSPORTORDER.TIMEFINAL, ENTRANSPORTORDER.DATESTART, ENTRANSPORTORDER.DATEFINAL, ENTRANSPORTORDER.ISASSIGNMENT, ENTRANSPORTORDER.ISAPPROVED, ENTRANSPORTORDER.ISREJECTED, ENTRANSPORTORDER.COMMENTGEN, ENTRANSPORTORDER.DATEEDIT, ENTRANSPORTORDER.USERGEN, ENTRANSPORTORDER.MODIFY_TIME, ENTRANSPORTORDER.TRANSPORTORDERSTATUSCD, ENTRANSPORTORDER.PLANREFCODE, ENTRANSPORTORDER.TRANSPORTCODE, ENTRANSPORTORDER.TRANSPORTREALCODE, ENTRANSPORTORDER.TRANSPORTDEPARTMENTCOD, ENTRANSPORTORDER.PARENTREFCODE "
    +" FROM ENTRANSPORTORDER WHERE ENTRANSPORTORDER.CODE = ?";

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
        anObject.timeStart = set.getTimestamp(3);
        anObject.timeFinal = set.getTimestamp(4);
        anObject.dateStart = set.getTimestamp(5);
        anObject.dateFinal = set.getTimestamp(6);
        anObject.isAssignment = set.getInt(7);
        if ( set.wasNull() )
           anObject.isAssignment = Integer.MIN_VALUE;
        anObject.isApproved = set.getInt(8);
        if ( set.wasNull() )
           anObject.isApproved = Integer.MIN_VALUE;
        anObject.isRejected = set.getInt(9);
        if ( set.wasNull() )
           anObject.isRejected = Integer.MIN_VALUE;
        anObject.commentGen = set.getString(10);
        anObject.dateEdit = set.getTimestamp(11);
        anObject.userGen = set.getString(12);
        anObject.modify_time = set.getLong(13);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.transportOrderStatus.code = set.getInt(14);
        if ( set.wasNull() )
            anObject.transportOrderStatus.code = Integer.MIN_VALUE;
        anObject.planRef.code = set.getInt(15);
        if ( set.wasNull() )
            anObject.planRef.code = Integer.MIN_VALUE;
        anObject.transport.code = set.getInt(16);
        if ( set.wasNull() )
            anObject.transport.code = Integer.MIN_VALUE;
        anObject.transportReal.code = set.getInt(17);
        if ( set.wasNull() )
            anObject.transportReal.code = Integer.MIN_VALUE;
        anObject.transportDepartment.code = set.getInt(18);
        if ( set.wasNull() )
            anObject.transportDepartment.code = Integer.MIN_VALUE;
        anObject.parentRef.code = set.getInt(19);
        if ( set.wasNull() )
            anObject.parentRef.code = Integer.MIN_VALUE;
        if(anObject.transportOrderStatus.code != Integer.MIN_VALUE)
        {
           anObject.setTransportOrderStatus(
        new com.ksoe.energynet.dataminer.generated.ENTransportOrderStatusDAOGen(connection,getUserProfile()).getObject(anObject.transportOrderStatus.code));
    }
        if(anObject.planRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlanRef(
        new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
    }
        if(anObject.transport.code != Integer.MIN_VALUE)
        {
           anObject.setTransport(
        new com.ksoe.techcard.dataminer.generated.TKTransportDAOGen(connection,getUserProfile()).getRef(anObject.transport.code));
    }
        if(anObject.transportReal.code != Integer.MIN_VALUE)
        {
           anObject.setTransportReal(
        new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getObject(anObject.transportReal.code));
    }
        if(anObject.transportDepartment.code != Integer.MIN_VALUE)
        {
           anObject.setTransportDepartment(
        new com.ksoe.energynet.dataminer.generated.ENTransportDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.transportDepartment.code));
    }
        if(anObject.parentRef.code != Integer.MIN_VALUE)
        {
           anObject.setParentRef(
        new com.ksoe.energynet.dataminer.generated.ENTransportOrderDAOGen(connection,getUserProfile()).getRef(anObject.parentRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENTransportOrderRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTransportOrderRef ref = new com.ksoe.energynet.valueobject.references.ENTransportOrderRef();
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

    selectStr = "DELETE FROM  ENTRANSPORTORDER WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTransportOrder object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTransportOrder.getObject%} access denied");

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

    selectStr =

    "SELECT  ENTRANSPORTORDER.CODE FROM  ENTRANSPORTORDER WHERE  ENTRANSPORTORDER.CODE = ?";

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
    _checkConditionToken(condition,"code","ENTRANSPORTORDER.CODE");
    _checkConditionToken(condition,"numbergen","ENTRANSPORTORDER.NUMBERGEN");
    _checkConditionToken(condition,"timestart","ENTRANSPORTORDER.TIMESTART");
    _checkConditionToken(condition,"timefinal","ENTRANSPORTORDER.TIMEFINAL");
    _checkConditionToken(condition,"datestart","ENTRANSPORTORDER.DATESTART");
    _checkConditionToken(condition,"datefinal","ENTRANSPORTORDER.DATEFINAL");
    _checkConditionToken(condition,"isassignment","ENTRANSPORTORDER.ISASSIGNMENT");
    _checkConditionToken(condition,"isapproved","ENTRANSPORTORDER.ISAPPROVED");
    _checkConditionToken(condition,"isrejected","ENTRANSPORTORDER.ISREJECTED");
    _checkConditionToken(condition,"commentgen","ENTRANSPORTORDER.COMMENTGEN");
    _checkConditionToken(condition,"dateedit","ENTRANSPORTORDER.DATEEDIT");
    _checkConditionToken(condition,"usergen","ENTRANSPORTORDER.USERGEN");
    _checkConditionToken(condition,"modify_time","ENTRANSPORTORDER.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"transportorderstatus","TRANSPORTORDERSTATUSCD");
    _checkConditionToken(condition,"transportorderstatus.code","TRANSPORTORDERSTATUSCD");
    _checkConditionToken(condition,"planref","PLANREFCODE");
    _checkConditionToken(condition,"planref.code","PLANREFCODE");
    _checkConditionToken(condition,"transport","TRANSPORTCODE");
    _checkConditionToken(condition,"transport.code","TRANSPORTCODE");
    _checkConditionToken(condition,"transportreal","TRANSPORTREALCODE");
    _checkConditionToken(condition,"transportreal.code","TRANSPORTREALCODE");
    _checkConditionToken(condition,"transportdepartment","TRANSPORTDEPARTMENTCOD");
    _checkConditionToken(condition,"transportdepartment.code","TRANSPORTDEPARTMENTCOD");
    _checkConditionToken(condition,"parentref","PARENTREFCODE");
    _checkConditionToken(condition,"parentref.code","PARENTREFCODE");
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

   private void _collectAutoIncrementFields(ENTransportOrder anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENTRANSPORTORDER", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENTRANSPORTORDER", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENTRANSPORTORDER", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENTRANSPORTORDER");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENTransportOrderDAO

