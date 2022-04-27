
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

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.brief.ENWorkOrderShort;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;


/**
 * DAO Object for ENWorkOrder;
 *
 */

public class ENWorkOrderDAOGen extends GenericDataMiner {

  public ENWorkOrderDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENWorkOrderDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENWorkOrder inObject) throws PersistenceException
   {
      ENWorkOrder obj = new ENWorkOrder();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.workOrderNumber != obj.workOrderNumber){
       return false;
     }

     if (inObject.numberInt != obj.numberInt){
       return false;
     }

     if ( ! inObject.dateGen.equals(obj.dateGen)){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }

     if (inObject.defectShortDesc != obj.defectShortDesc){
       return false;
     }

     if (inObject.finMolCode != obj.finMolCode){
       return false;
     }

     if (inObject.finMolName != obj.finMolName){
       return false;
     }

     if (inObject.finMechanicCode != obj.finMechanicCode){
       return false;
     }

     if (inObject.finMechanicName != obj.finMechanicName){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }
     if (inObject.department.code != obj.department.code){
        return false;
     }
     if (inObject.statusWorkOrder.code != obj.statusWorkOrder.code){
        return false;
     }
      return true;
   }

   public int add(ENWorkOrder anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENWorkOrder anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENWORKORDER (CODE,WORKORDERNUMBER,NUMBERINT,DATEGEN,COMMENTGEN,DEFECTSHORTDESC,FINMOLCODE,FINMOLNAME,FINMECHANICCODE,FINMECHANICNAME,USERGEN,DATEEDIT,MODIFY_TIME,DEPARTMENTCODE,STATUSWORKORDERCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.workOrderNumber);
      if (anObject.numberInt != Integer.MIN_VALUE )
         statement.setInt(3,anObject.numberInt);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.dateGen == null)
        statement.setDate(4,null);
      else
        statement.setDate(4,new java.sql.Date(anObject.dateGen.getTime()));
      statement.setString(5,anObject.commentGen);
      statement.setString(6,anObject.defectShortDesc);
      statement.setString(7,anObject.finMolCode);
      statement.setString(8,anObject.finMolName);
      statement.setString(9,anObject.finMechanicCode);
      statement.setString(10,anObject.finMechanicName);
      statement.setString(11,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(12,null);
      else
        statement.setDate(12,new java.sql.Date(anObject.dateEdit.getTime()));

      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(13,null);
      else
        statement.setBigDecimal(13,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.department.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.department.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrder.department.code%} = {%"+anObject.department.code+"%}");
        statement.setInt(14,anObject.department.code);
      }
      else
        statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.statusWorkOrder.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENWorkOrderStatusDAOGen(connection,getUserProfile()).exists(anObject.statusWorkOrder.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrder.statusWorkOrder.code%} = {%"+anObject.statusWorkOrder.code+"%}");
        statement.setInt(15,anObject.statusWorkOrder.code);
      }
      else
        statement.setNull(15,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENWorkOrderDAOGen.add%}",e);
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

   public void save(ENWorkOrder anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENWorkOrder anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENWorkOrder oldObject = new ENWorkOrder();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENWorkOrder.modify_time_Field + " FROM  ENWORKORDER WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("WORKORDERNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NUMBERINT") == 0)
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
          if(fieldNameStr.compareTo("COMMENTGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DEFECTSHORTDESC") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINMOLCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINMOLNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINMECHANICCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINMECHANICNAME") == 0)
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
          if(fieldNameStr.compareTo("MODIFY_TIME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DEPARTMENT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("STATUSWORKORDER") == 0)
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
        "UPDATE ENWORKORDER SET  WORKORDERNUMBER = ? , NUMBERINT = ? , DATEGEN = ? , COMMENTGEN = ? , DEFECTSHORTDESC = ? , FINMOLCODE = ? , FINMOLNAME = ? , FINMECHANICCODE = ? , FINMECHANICNAME = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , DEPARTMENTCODE = ? , STATUSWORKORDERCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENWORKORDER SET ";
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
      statement.setString(1,anObject.workOrderNumber);
      if (anObject.numberInt != Integer.MIN_VALUE )
         statement.setInt(2,anObject.numberInt);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.dateGen == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.dateGen.getTime()));
      statement.setString(4,anObject.commentGen);
      statement.setString(5,anObject.defectShortDesc);
      statement.setString(6,anObject.finMolCode);
      statement.setString(7,anObject.finMolName);
      statement.setString(8,anObject.finMechanicCode);
      statement.setString(9,anObject.finMechanicName);
      statement.setString(10,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(11,null);
      else
        statement.setDate(11,new java.sql.Date(anObject.dateEdit.getTime()));

      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(12,null);
      else
        statement.setBigDecimal(12,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.department.code != Integer.MIN_VALUE)
        statement.setInt(13,anObject.department.code);
      else
        statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.statusWorkOrder.code != Integer.MIN_VALUE)
        statement.setInt(14,anObject.statusWorkOrder.code);
      else
        statement.setNull(14,java.sql.Types.INTEGER);

      statement.setInt(15,anObject.code);

         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("WORKORDERNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.workOrderNumber);
                continue;
             }
            if("NUMBERINT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.numberInt);
                continue;
             }
            if("DATEGEN".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateGen == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.dateGen.getTime()));
                continue;
             }
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
                continue;
             }
            if("DEFECTSHORTDESC".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.defectShortDesc);
                continue;
             }
            if("FINMOLCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.finMolCode);
                continue;
             }
            if("FINMOLNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.finMolName);
                continue;
             }
            if("FINMECHANICCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.finMechanicCode);
                continue;
             }
            if("FINMECHANICNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.finMechanicName);
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
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.dateEdit.getTime()));
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
            if("DEPARTMENT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.department.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.department.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("STATUSWORKORDER".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.statusWorkOrder.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.statusWorkOrder.code);
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

   } // end of save(ENWorkOrder anObject,String[] anAttributes)


 public ENWorkOrderShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENWorkOrder filterObject = new ENWorkOrder();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENWorkOrderShort)list.get(0);
   return null;
  }

  public ENWorkOrderShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENWorkOrderShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENWorkOrderShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENWorkOrderShortList getFilteredList(ENWorkOrder filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENWorkOrderShortList getScrollableFilteredList(ENWorkOrder aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENWorkOrderShortList getScrollableFilteredList(ENWorkOrder aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENWorkOrderShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENWorkOrderShortList getScrollableFilteredList(ENWorkOrderFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENWorkOrderShortList getScrollableFilteredList(ENWorkOrderFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENWorkOrderShortList getScrollableFilteredList(ENWorkOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENWorkOrderShortList getScrollableFilteredList(ENWorkOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENWorkOrderShortList result = new ENWorkOrderShortList();
    ENWorkOrderShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENWORKORDER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENWORKORDER.CODE"+
     ",ENWORKORDER.WORKORDERNUMBER"+
     ",ENWORKORDER.DATEGEN"+
     ",ENWORKORDER.FINMOLCODE"+
     ",ENWORKORDER.FINMOLNAME"+
     ",ENWORKORDER.FINMECHANICCODE"+
     ",ENWORKORDER.FINMECHANICNAME"+
     ",ENWORKORDER.USERGEN"+
     ",ENWORKORDER.DATEEDIT"+

      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
      ", ENWORKORDERSTATUS.CODE " +
      ", ENWORKORDERSTATUS.NAME " +
     " FROM ENWORKORDER " +
     ", ENDEPARTMENT " +
     ", ENWORKORDERSTATUS " +
     //" WHERE "
    "";
     whereStr = " ENDEPARTMENT.CODE = ENWORKORDER.DEPARTMENTCODE" ; //+
      whereStr = whereStr +" AND ENWORKORDERSTATUS.CODE = ENWORKORDER.STATUSWORKORDERCODE" ; //+
        //selectStr = selectStr + " ${s} ENWORKORDER.CODE IN ( SELECT ENWORKORDER.CODE FROM ENWORKORDER ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.CODE = ?";
        }
         if (aFilterObject.workOrderNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.workOrderNumber.indexOf('*',0) < 0 && aFilterObject.workOrderNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDER.WORKORDERNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDER.WORKORDERNUMBER) LIKE UPPER(?)";
         }
        if(aFilterObject.numberInt != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.NUMBERINT = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.DATEGEN = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDER.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDER.COMMENTGEN) LIKE UPPER(?)";
         }
         if (aFilterObject.defectShortDesc != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.defectShortDesc.indexOf('*',0) < 0 && aFilterObject.defectShortDesc.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDER.DEFECTSHORTDESC) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDER.DEFECTSHORTDESC) LIKE UPPER(?)";
         }
         if (aFilterObject.finMolCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMolCode.indexOf('*',0) < 0 && aFilterObject.finMolCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDER.FINMOLCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDER.FINMOLCODE) LIKE UPPER(?)";
         }
         if (aFilterObject.finMolName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMolName.indexOf('*',0) < 0 && aFilterObject.finMolName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDER.FINMOLNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDER.FINMOLNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.finMechanicCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMechanicCode.indexOf('*',0) < 0 && aFilterObject.finMechanicCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDER.FINMECHANICCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDER.FINMECHANICCODE) LIKE UPPER(?)";
         }
         if (aFilterObject.finMechanicName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMechanicName.indexOf('*',0) < 0 && aFilterObject.finMechanicName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDER.FINMECHANICNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDER.FINMECHANICNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDER.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDER.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.DATEEDIT = ?";
        }

        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.MODIFY_TIME = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENWORKORDER.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.statusWorkOrder.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENWORKORDER.STATUSWORKORDERCODE = ? ";
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

           if(aFilterObject.workOrderNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.workOrderNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.numberInt != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.numberInt);
         }
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
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

           if(aFilterObject.defectShortDesc != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.defectShortDesc);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.finMolCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMolCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.finMolName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMolName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.finMechanicCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMechanicCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.finMechanicName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMechanicName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
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
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
        }


        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.statusWorkOrder.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusWorkOrder.code);
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

        anObject = new ENWorkOrderShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.workOrderNumber = set.getString(2);
        anObject.dateGen = set.getDate(3);
        anObject.finMolCode = set.getString(4);
        anObject.finMolName = set.getString(5);
        anObject.finMechanicCode = set.getString(6);
        anObject.finMechanicName = set.getString(7);
        anObject.userGen = set.getString(8);
        anObject.dateEdit = set.getDate(9);

        anObject.departmentCode = set.getInt(10);
        if(set.wasNull())
        anObject.departmentCode = Integer.MIN_VALUE;
        anObject.departmentShortName = set.getString(11);
        anObject.departmentDateStart = set.getDate(12);
        anObject.departmentDateFinal = set.getDate(13);

        anObject.statusWorkOrderCode = set.getInt(19);
        if(set.wasNull())
        anObject.statusWorkOrderCode = Integer.MIN_VALUE;
        anObject.statusWorkOrderName = set.getString(20);

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

  public int[] getFilteredCodeArrayOLD(ENWorkOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENWORKORDER.CODE FROM ENWORKORDER";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENWORKORDER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.CODE = ?";
        }
         if (aFilterObject.workOrderNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.workOrderNumber.indexOf('*',0) < 0 && aFilterObject.workOrderNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDER.WORKORDERNUMBER = ?";
             else
                 whereStr = whereStr + "  ENWORKORDER.WORKORDERNUMBER LIKE ?";
         }
        if(aFilterObject.numberInt != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.NUMBERINT = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.DATEGEN = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDER.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENWORKORDER.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.defectShortDesc != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.defectShortDesc.indexOf('*',0) < 0 && aFilterObject.defectShortDesc.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDER.DEFECTSHORTDESC = ?";
             else
                 whereStr = whereStr + "  ENWORKORDER.DEFECTSHORTDESC LIKE ?";
         }
         if (aFilterObject.finMolCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMolCode.indexOf('*',0) < 0 && aFilterObject.finMolCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDER.FINMOLCODE = ?";
             else
                 whereStr = whereStr + "  ENWORKORDER.FINMOLCODE LIKE ?";
         }
         if (aFilterObject.finMolName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMolName.indexOf('*',0) < 0 && aFilterObject.finMolName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDER.FINMOLNAME = ?";
             else
                 whereStr = whereStr + "  ENWORKORDER.FINMOLNAME LIKE ?";
         }
         if (aFilterObject.finMechanicCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMechanicCode.indexOf('*',0) < 0 && aFilterObject.finMechanicCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDER.FINMECHANICCODE = ?";
             else
                 whereStr = whereStr + "  ENWORKORDER.FINMECHANICCODE LIKE ?";
         }
         if (aFilterObject.finMechanicName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMechanicName.indexOf('*',0) < 0 && aFilterObject.finMechanicName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDER.FINMECHANICNAME = ?";
             else
                 whereStr = whereStr + "  ENWORKORDER.FINMECHANICNAME LIKE ?";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDER.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENWORKORDER.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.DATEEDIT = ?";
        }

        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.MODIFY_TIME = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENWORKORDER.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.statusWorkOrder.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENWORKORDER.STATUSWORKORDERCODE = ? ";
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
         if (aFilterObject.workOrderNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.workOrderNumber.indexOf('*',0) < 0 && aFilterObject.workOrderNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDER.WORKORDERNUMBER = ?";
             else
                 whereStr = whereStr + " ENWORKORDER.WORKORDERNUMBER LIKE ?";

           if(aFilterObject.workOrderNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.workOrderNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.numberInt != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.numberInt);
         }
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDER.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENWORKORDER.COMMENTGEN LIKE ?";

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
         if (aFilterObject.defectShortDesc != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.defectShortDesc.indexOf('*',0) < 0 && aFilterObject.defectShortDesc.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDER.DEFECTSHORTDESC = ?";
             else
                 whereStr = whereStr + " ENWORKORDER.DEFECTSHORTDESC LIKE ?";

           if(aFilterObject.defectShortDesc != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.defectShortDesc);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.finMolCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finMolCode.indexOf('*',0) < 0 && aFilterObject.finMolCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDER.FINMOLCODE = ?";
             else
                 whereStr = whereStr + " ENWORKORDER.FINMOLCODE LIKE ?";

           if(aFilterObject.finMolCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMolCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.finMolName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finMolName.indexOf('*',0) < 0 && aFilterObject.finMolName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDER.FINMOLNAME = ?";
             else
                 whereStr = whereStr + " ENWORKORDER.FINMOLNAME LIKE ?";

           if(aFilterObject.finMolName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMolName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.finMechanicCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finMechanicCode.indexOf('*',0) < 0 && aFilterObject.finMechanicCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDER.FINMECHANICCODE = ?";
             else
                 whereStr = whereStr + " ENWORKORDER.FINMECHANICCODE LIKE ?";

           if(aFilterObject.finMechanicCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMechanicCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.finMechanicName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finMechanicName.indexOf('*',0) < 0 && aFilterObject.finMechanicName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDER.FINMECHANICNAME = ?";
             else
                 whereStr = whereStr + " ENWORKORDER.FINMECHANICNAME LIKE ?";

           if(aFilterObject.finMechanicName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMechanicName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDER.USERGEN = ?";
             else
                 whereStr = whereStr + " ENWORKORDER.USERGEN LIKE ?";

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
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
        }

        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.statusWorkOrder.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusWorkOrder.code);
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

  public int[] getFilteredCodeArray(ENWorkOrderFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENWorkOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENWORKORDER.CODE FROM ENWORKORDER";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENWORKORDER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.CODE = ?";
        }
         if (aFilterObject.workOrderNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.workOrderNumber.indexOf('*',0) < 0 && aFilterObject.workOrderNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDER.WORKORDERNUMBER = ?";
             else
                 whereStr = whereStr + "  ENWORKORDER.WORKORDERNUMBER LIKE ?";
         }
        if(aFilterObject.numberInt != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.NUMBERINT = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.DATEGEN = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDER.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENWORKORDER.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.defectShortDesc != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.defectShortDesc.indexOf('*',0) < 0 && aFilterObject.defectShortDesc.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDER.DEFECTSHORTDESC = ?";
             else
                 whereStr = whereStr + "  ENWORKORDER.DEFECTSHORTDESC LIKE ?";
         }
         if (aFilterObject.finMolCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMolCode.indexOf('*',0) < 0 && aFilterObject.finMolCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDER.FINMOLCODE = ?";
             else
                 whereStr = whereStr + "  ENWORKORDER.FINMOLCODE LIKE ?";
         }
         if (aFilterObject.finMolName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMolName.indexOf('*',0) < 0 && aFilterObject.finMolName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDER.FINMOLNAME = ?";
             else
                 whereStr = whereStr + "  ENWORKORDER.FINMOLNAME LIKE ?";
         }
         if (aFilterObject.finMechanicCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMechanicCode.indexOf('*',0) < 0 && aFilterObject.finMechanicCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDER.FINMECHANICCODE = ?";
             else
                 whereStr = whereStr + "  ENWORKORDER.FINMECHANICCODE LIKE ?";
         }
         if (aFilterObject.finMechanicName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMechanicName.indexOf('*',0) < 0 && aFilterObject.finMechanicName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDER.FINMECHANICNAME = ?";
             else
                 whereStr = whereStr + "  ENWORKORDER.FINMECHANICNAME LIKE ?";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENWORKORDER.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENWORKORDER.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.DATEEDIT = ?";
        }

        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.MODIFY_TIME = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENWORKORDER.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.statusWorkOrder.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENWORKORDER.STATUSWORKORDERCODE = ? ";
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
         if (aFilterObject.workOrderNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.workOrderNumber.indexOf('*',0) < 0 && aFilterObject.workOrderNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDER.WORKORDERNUMBER = ?";
             else
                 whereStr = whereStr + " ENWORKORDER.WORKORDERNUMBER LIKE ?";

           if(aFilterObject.workOrderNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.workOrderNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.numberInt != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.numberInt);
         }
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDER.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENWORKORDER.COMMENTGEN LIKE ?";

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
         if (aFilterObject.defectShortDesc != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.defectShortDesc.indexOf('*',0) < 0 && aFilterObject.defectShortDesc.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDER.DEFECTSHORTDESC = ?";
             else
                 whereStr = whereStr + " ENWORKORDER.DEFECTSHORTDESC LIKE ?";

           if(aFilterObject.defectShortDesc != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.defectShortDesc);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.finMolCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finMolCode.indexOf('*',0) < 0 && aFilterObject.finMolCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDER.FINMOLCODE = ?";
             else
                 whereStr = whereStr + " ENWORKORDER.FINMOLCODE LIKE ?";

           if(aFilterObject.finMolCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMolCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.finMolName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finMolName.indexOf('*',0) < 0 && aFilterObject.finMolName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDER.FINMOLNAME = ?";
             else
                 whereStr = whereStr + " ENWORKORDER.FINMOLNAME LIKE ?";

           if(aFilterObject.finMolName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMolName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.finMechanicCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finMechanicCode.indexOf('*',0) < 0 && aFilterObject.finMechanicCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDER.FINMECHANICCODE = ?";
             else
                 whereStr = whereStr + " ENWORKORDER.FINMECHANICCODE LIKE ?";

           if(aFilterObject.finMechanicCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMechanicCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.finMechanicName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finMechanicName.indexOf('*',0) < 0 && aFilterObject.finMechanicName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDER.FINMECHANICNAME = ?";
             else
                 whereStr = whereStr + " ENWORKORDER.FINMECHANICNAME LIKE ?";

           if(aFilterObject.finMechanicName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMechanicName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENWORKORDER.USERGEN = ?";
             else
                 whereStr = whereStr + " ENWORKORDER.USERGEN LIKE ?";

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
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
        }

        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.statusWorkOrder.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusWorkOrder.code);
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


   public ENWorkOrder getObject(int uid) throws PersistenceException
   {
    ENWorkOrder result = new ENWorkOrder();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENWorkOrder anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr =
    "SELECT  ENWORKORDER.CODE, ENWORKORDER.WORKORDERNUMBER, ENWORKORDER.NUMBERINT, ENWORKORDER.DATEGEN, ENWORKORDER.COMMENTGEN, ENWORKORDER.DEFECTSHORTDESC, ENWORKORDER.FINMOLCODE, ENWORKORDER.FINMOLNAME, ENWORKORDER.FINMECHANICCODE, ENWORKORDER.FINMECHANICNAME, ENWORKORDER.USERGEN, ENWORKORDER.DATEEDIT, ENWORKORDER.MODIFY_TIME, ENWORKORDER.DEPARTMENTCODE, ENWORKORDER.STATUSWORKORDERCODE "
    +" FROM ENWORKORDER WHERE ENWORKORDER.CODE = ?";

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
        anObject.workOrderNumber = set.getString(2);
        anObject.numberInt = set.getInt(3);
        if ( set.wasNull() )
           anObject.numberInt = Integer.MIN_VALUE;
        anObject.dateGen = set.getDate(4);
        anObject.commentGen = set.getString(5);
        anObject.defectShortDesc = set.getString(6);
        anObject.finMolCode = set.getString(7);
        anObject.finMolName = set.getString(8);
        anObject.finMechanicCode = set.getString(9);
        anObject.finMechanicName = set.getString(10);
        anObject.userGen = set.getString(11);
        anObject.dateEdit = set.getDate(12);

        anObject.modify_time = set.getLong(13);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.department.code = set.getInt(14);
        if ( set.wasNull() )
            anObject.department.code = Integer.MIN_VALUE;
        anObject.statusWorkOrder.code = set.getInt(15);
        if ( set.wasNull() )
            anObject.statusWorkOrder.code = Integer.MIN_VALUE;
        if(anObject.department.code != Integer.MIN_VALUE)
        {
           anObject.setDepartment(
        new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getObject(anObject.department.code));
    }
        if(anObject.statusWorkOrder.code != Integer.MIN_VALUE)
        {
           anObject.setStatusWorkOrder(
        new com.ksoe.energynet.dataminer.generated.ENWorkOrderStatusDAOGen(connection,getUserProfile()).getObject(anObject.statusWorkOrder.code));
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


  public com.ksoe.energynet.valueobject.references.ENWorkOrderRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENWorkOrderRef ref = new com.ksoe.energynet.valueobject.references.ENWorkOrderRef();
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

    selectStr = "DELETE FROM  ENWORKORDER WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENWorkOrder object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENWorkOrder.getObject%} access denied");

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


    selectStr =

    "SELECT  ENWORKORDER.CODE FROM  ENWORKORDER WHERE  ENWORKORDER.CODE = ?";

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
    _checkConditionToken(condition,"code","ENWORKORDER.CODE");
    _checkConditionToken(condition,"workordernumber","ENWORKORDER.WORKORDERNUMBER");
    _checkConditionToken(condition,"numberint","ENWORKORDER.NUMBERINT");
    _checkConditionToken(condition,"dategen","ENWORKORDER.DATEGEN");
    _checkConditionToken(condition,"commentgen","ENWORKORDER.COMMENTGEN");
    _checkConditionToken(condition,"defectshortdesc","ENWORKORDER.DEFECTSHORTDESC");
    _checkConditionToken(condition,"finmolcode","ENWORKORDER.FINMOLCODE");
    _checkConditionToken(condition,"finmolname","ENWORKORDER.FINMOLNAME");
    _checkConditionToken(condition,"finmechaniccode","ENWORKORDER.FINMECHANICCODE");
    _checkConditionToken(condition,"finmechanicname","ENWORKORDER.FINMECHANICNAME");
    _checkConditionToken(condition,"usergen","ENWORKORDER.USERGEN");
    _checkConditionToken(condition,"dateedit","ENWORKORDER.DATEEDIT");

    _checkConditionToken(condition,"modify_time","ENWORKORDER.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"department","DEPARTMENTCODE");
    _checkConditionToken(condition,"department.code","DEPARTMENTCODE");
    _checkConditionToken(condition,"statusworkorder","STATUSWORKORDERCODE");
    _checkConditionToken(condition,"statusworkorder.code","STATUSWORKORDERCODE");
    return condition.toString();
   }

   @Override
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

    private void _collectAutoIncrementFields(ENWorkOrder anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENWORKORDER", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENWORKORDER", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENWORKORDER", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENWORKORDER");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENWorkOrderDAO
