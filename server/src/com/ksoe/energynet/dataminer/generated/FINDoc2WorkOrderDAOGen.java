
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
import com.ksoe.energynet.valueobject.FINDoc2WorkOrder;
import com.ksoe.energynet.valueobject.brief.FINDoc2WorkOrderShort;
import com.ksoe.energynet.valueobject.filter.FINDoc2WorkOrderFilter;
import com.ksoe.energynet.valueobject.lists.FINDoc2WorkOrderShortList;
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
 * DAO Object for FINDoc2WorkOrder;
 *
 */

public class FINDoc2WorkOrderDAOGen extends GenericDataMiner {

  public FINDoc2WorkOrderDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public FINDoc2WorkOrderDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(FINDoc2WorkOrder inObject) throws PersistenceException
   {
      FINDoc2WorkOrder obj = new FINDoc2WorkOrder();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.finDocMOLCode != obj.finDocMOLCode){
       return false;
     }

     if (inObject.finDocMechanicCode != obj.finDocMechanicCode){
       return false;
     }
     if (inObject.typeRef.code != obj.typeRef.code){
        return false;
     }
     if (inObject.workOrderRef.code != obj.workOrderRef.code){
        return false;
     }
      return true;
   }

   public int add(FINDoc2WorkOrder anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(FINDoc2WorkOrder anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();
    if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO FINDOC2WORKORDER (CODE,FINDOCMOLCODE,FINDOCMECHANICCODE,DOMAIN_INFO,MODIFY_TIME,TYPEREFCODE,WORKORDERREFCODE) VALUES (?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.finDocMOLCode != Integer.MIN_VALUE )
         statement.setInt(2,anObject.finDocMOLCode);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.finDocMechanicCode != Integer.MIN_VALUE )
         statement.setInt(3,anObject.finDocMechanicCode);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      statement.setString(4,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(5,null);
      else
        statement.setBigDecimal(5,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.typeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINDocTypeDAOGen(connection,getUserProfile()).exists(anObject.typeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINDoc2WorkOrder.typeRef.code%} = {%"+anObject.typeRef.code+"%}");
        statement.setInt(6,anObject.typeRef.code);
      }
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.workOrderRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENWorkOrderDAOGen(connection,getUserProfile()).exists(anObject.workOrderRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINDoc2WorkOrder.workOrderRef.code%} = {%"+anObject.workOrderRef.code+"%}");
        statement.setInt(7,anObject.workOrderRef.code);
      }
      else
        statement.setNull(7,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%FINDoc2WorkOrderDAOGen.add%}",e);
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

   public void save(FINDoc2WorkOrder anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(FINDoc2WorkOrder anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      FINDoc2WorkOrder oldObject = new FINDoc2WorkOrder();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+FINDoc2WorkOrder.modify_time_Field + "," + FINDoc2WorkOrder.domain_info_Field+" FROM  FINDOC2WORKORDER WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("FINDOCMOLCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINDOCMECHANICCODE") == 0)
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
          if(fieldNameStr.compareTo("TYPEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("WORKORDERREF") == 0)
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
        "UPDATE FINDOC2WORKORDER SET  FINDOCMOLCODE = ? , FINDOCMECHANICCODE = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , TYPEREFCODE = ? , WORKORDERREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE FINDOC2WORKORDER SET ";
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
      if (anObject.finDocMOLCode != Integer.MIN_VALUE )
         statement.setInt(1,anObject.finDocMOLCode);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.finDocMechanicCode != Integer.MIN_VALUE )
         statement.setInt(2,anObject.finDocMechanicCode);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      statement.setString(3,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(4,null);
      else
        statement.setBigDecimal(4,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.typeRef.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.typeRef.code);
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.workOrderRef.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.workOrderRef.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);
          statement.setInt(7,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("FINDOCMOLCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.finDocMOLCode);
                continue;
             }
            if("FINDOCMECHANICCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.finDocMechanicCode);
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
            if("TYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.typeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.typeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("WORKORDERREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.workOrderRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.workOrderRef.code);
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

   } // end of save(FINDoc2WorkOrder anObject,String[] anAttributes)


 public FINDoc2WorkOrderShort getShortObject(int anObjectCode) throws PersistenceException
  {
   FINDoc2WorkOrder filterObject = new FINDoc2WorkOrder();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (FINDoc2WorkOrderShort)list.get(0);
   return null;
  }

  public FINDoc2WorkOrderShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public FINDoc2WorkOrderShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public FINDoc2WorkOrderShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public FINDoc2WorkOrderShortList getFilteredList(FINDoc2WorkOrder filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public FINDoc2WorkOrderShortList getScrollableFilteredList(FINDoc2WorkOrder aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public FINDoc2WorkOrderShortList getScrollableFilteredList(FINDoc2WorkOrder aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public FINDoc2WorkOrderShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public FINDoc2WorkOrderShortList getScrollableFilteredList(FINDoc2WorkOrderFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public FINDoc2WorkOrderShortList getScrollableFilteredList(FINDoc2WorkOrderFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public FINDoc2WorkOrderShortList getScrollableFilteredList(FINDoc2WorkOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public FINDoc2WorkOrderShortList getScrollableFilteredList(FINDoc2WorkOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    FINDoc2WorkOrderShortList result = new FINDoc2WorkOrderShortList();
    FINDoc2WorkOrderShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINDOC2WORKORDER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "FINDOC2WORKORDER.CODE"+
     ",FINDOC2WORKORDER.FINDOCMOLCODE"+
     ",FINDOC2WORKORDER.FINDOCMECHANICCODE"+

      ", FINDOCTYPE.CODE " +
      ", FINDOCTYPE.NAME " +
      ", ENWORKORDER.CODE " +
      ", ENWORKORDER.WORKORDERNUMBER " +
      ", ENWORKORDER.DATEGEN " +
      ", ENWORKORDER.FINMOLCODE " +
      ", ENWORKORDER.FINMOLNAME " +
      ", ENWORKORDER.FINMECHANICCODE " +
      ", ENWORKORDER.FINMECHANICNAME " +
      ", ENWORKORDER.USERGEN " +
      ", ENWORKORDER.DATEEDIT " +
     " FROM FINDOC2WORKORDER " +
     ", FINDOCTYPE " +
     ", ENWORKORDER " +
     //" WHERE "
    "";
     whereStr = " FINDOCTYPE.CODE = FINDOC2WORKORDER.TYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENWORKORDER.CODE = FINDOC2WORKORDER.WORKORDERREFCODE" ; //+
        //selectStr = selectStr + " ${s} FINDOC2WORKORDER.CODE IN ( SELECT FINDOC2WORKORDER.CODE FROM FINDOC2WORKORDER ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2WORKORDER.CODE = ?";
        }
        if(aFilterObject.finDocMOLCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2WORKORDER.FINDOCMOLCODE = ?";
        }
        if(aFilterObject.finDocMechanicCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2WORKORDER.FINDOCMECHANICCODE = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINDOC2WORKORDER.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINDOC2WORKORDER.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2WORKORDER.MODIFY_TIME = ?";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "FINDOC2WORKORDER.TYPEREFCODE = ? ";
        }
        if(aFilterObject.workOrderRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "FINDOC2WORKORDER.WORKORDERREFCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINDoc2WorkOrder.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FINDoc2WorkOrder.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("FINDOC2WORKORDER",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND FINDOC2WORKORDER.DOMAIN_INFO IS NOT NULL";
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
         if(aFilterObject.finDocMOLCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finDocMOLCode);
         }
         if(aFilterObject.finDocMechanicCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finDocMechanicCode);
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
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.workOrderRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrderRef.code);
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

        anObject = new FINDoc2WorkOrderShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.finDocMOLCode = set.getInt(2);
        if ( set.wasNull() )
            anObject.finDocMOLCode = Integer.MIN_VALUE;
        anObject.finDocMechanicCode = set.getInt(3);
        if ( set.wasNull() )
            anObject.finDocMechanicCode = Integer.MIN_VALUE;

        anObject.typeRefCode = set.getInt(4);
        if(set.wasNull())
        anObject.typeRefCode = Integer.MIN_VALUE;
        anObject.typeRefName = set.getString(5);
        anObject.workOrderRefCode = set.getInt(6);
        if(set.wasNull())
        anObject.workOrderRefCode = Integer.MIN_VALUE;
        anObject.workOrderRefWorkOrderNumber = set.getString(7);
        anObject.workOrderRefDateGen = set.getDate(8);

        anObject.workOrderRefFinMolName = set.getString(10);

        anObject.workOrderRefFinMechanicName = set.getString(12);
        anObject.workOrderRefUserGen = set.getString(13);
        anObject.workOrderRefDateEdit = set.getDate(14);

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

  public int[] getFilteredCodeArrayOLD(FINDoc2WorkOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINDOC2WORKORDER.CODE FROM FINDOC2WORKORDER";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINDOC2WORKORDER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINDoc2WorkOrder.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FINDoc2WorkOrder.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("FINDOC2WORKORDER",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (FINDOC2WORKORDER.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2WORKORDER.CODE = ?";
        }
        if(aFilterObject.finDocMOLCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2WORKORDER.FINDOCMOLCODE = ?";
        }
        if(aFilterObject.finDocMechanicCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2WORKORDER.FINDOCMECHANICCODE = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINDOC2WORKORDER.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  FINDOC2WORKORDER.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2WORKORDER.MODIFY_TIME = ?";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINDOC2WORKORDER.TYPEREFCODE = ? ";
        }
        if(aFilterObject.workOrderRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINDOC2WORKORDER.WORKORDERREFCODE = ? ";
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
         if(aFilterObject.finDocMOLCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finDocMOLCode);
         }
         if(aFilterObject.finDocMechanicCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finDocMechanicCode);
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINDOC2WORKORDER.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " FINDOC2WORKORDER.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.workOrderRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrderRef.code);
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

  public int[] getFilteredCodeArray(FINDoc2WorkOrderFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(FINDoc2WorkOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINDOC2WORKORDER.CODE FROM FINDOC2WORKORDER";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINDOC2WORKORDER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINDoc2WorkOrder.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FINDoc2WorkOrder.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("FINDOC2WORKORDER",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (FINDOC2WORKORDER.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2WORKORDER.CODE = ?";
        }
        if(aFilterObject.finDocMOLCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2WORKORDER.FINDOCMOLCODE = ?";
        }
        if(aFilterObject.finDocMechanicCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2WORKORDER.FINDOCMECHANICCODE = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINDOC2WORKORDER.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  FINDOC2WORKORDER.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINDOC2WORKORDER.MODIFY_TIME = ?";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINDOC2WORKORDER.TYPEREFCODE = ? ";
        }
        if(aFilterObject.workOrderRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINDOC2WORKORDER.WORKORDERREFCODE = ? ";
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
         if(aFilterObject.finDocMOLCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finDocMOLCode);
         }
         if(aFilterObject.finDocMechanicCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finDocMechanicCode);
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINDOC2WORKORDER.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " FINDOC2WORKORDER.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.workOrderRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrderRef.code);
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


   public FINDoc2WorkOrder getObject(int uid) throws PersistenceException
   {
    FINDoc2WorkOrder result = new FINDoc2WorkOrder();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(FINDoc2WorkOrder anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINDoc2WorkOrder.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FINDoc2WorkOrder.getObject%} access denied");



    selectStr =
    "SELECT  FINDOC2WORKORDER.CODE, FINDOC2WORKORDER.FINDOCMOLCODE, FINDOC2WORKORDER.FINDOCMECHANICCODE, FINDOC2WORKORDER.DOMAIN_INFO, FINDOC2WORKORDER.MODIFY_TIME, FINDOC2WORKORDER.TYPEREFCODE, FINDOC2WORKORDER.WORKORDERREFCODE "
    +" FROM FINDOC2WORKORDER WHERE FINDOC2WORKORDER.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("FINDOC2WORKORDER",segregationInfo,getUserProfile().getDomainInfo());
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
        anObject.finDocMOLCode = set.getInt(2);
        if ( set.wasNull() )
           anObject.finDocMOLCode = Integer.MIN_VALUE;
        anObject.finDocMechanicCode = set.getInt(3);
        if ( set.wasNull() )
           anObject.finDocMechanicCode = Integer.MIN_VALUE;
        anObject.domain_info = set.getString(4);
        anObject.modify_time = set.getLong(5);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.typeRef.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.typeRef.code = Integer.MIN_VALUE;
        anObject.workOrderRef.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.workOrderRef.code = Integer.MIN_VALUE;
        if(anObject.typeRef.code != Integer.MIN_VALUE)
        {
           anObject.setTypeRef(
        new com.ksoe.energynet.dataminer.generated.FINDocTypeDAOGen(connection,getUserProfile()).getRef(anObject.typeRef.code));
    }
        if(anObject.workOrderRef.code != Integer.MIN_VALUE)
        {
           anObject.setWorkOrderRef(
        new com.ksoe.energynet.dataminer.generated.ENWorkOrderDAOGen(connection,getUserProfile()).getRef(anObject.workOrderRef.code));
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


  public com.ksoe.energynet.valueobject.references.FINDoc2WorkOrderRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.FINDoc2WorkOrderRef ref = new com.ksoe.energynet.valueobject.references.FINDoc2WorkOrderRef();
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

    selectStr = "DELETE FROM  FINDOC2WORKORDER WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    FINDoc2WorkOrder object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%FINDoc2WorkOrder.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(FINDoc2WorkOrder.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%FINDoc2WorkOrder.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINDoc2WorkOrder.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FINDoc2WorkOrder.getObject%} access denied");

    selectStr =

    "SELECT  FINDOC2WORKORDER.CODE FROM  FINDOC2WORKORDER WHERE  FINDOC2WORKORDER.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("FINDOC2WORKORDER",segregationInfo,getUserProfile().getDomainInfo());
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
    _checkConditionToken(condition,"code","FINDOC2WORKORDER.CODE");
    _checkConditionToken(condition,"findocmolcode","FINDOC2WORKORDER.FINDOCMOLCODE");
    _checkConditionToken(condition,"findocmechaniccode","FINDOC2WORKORDER.FINDOCMECHANICCODE");
    _checkConditionToken(condition,"domain_info","FINDOC2WORKORDER.DOMAIN_INFO");
    _checkConditionToken(condition,"modify_time","FINDOC2WORKORDER.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"typeref","TYPEREFCODE");
    _checkConditionToken(condition,"typeref.code","TYPEREFCODE");
    _checkConditionToken(condition,"workorderref","WORKORDERREFCODE");
    _checkConditionToken(condition,"workorderref.code","WORKORDERREFCODE");
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

    private void _collectAutoIncrementFields(FINDoc2WorkOrder anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("FINDOC2WORKORDER", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("FINDOC2WORKORDER", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("FINDOC2WORKORDER", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: FINDOC2WORKORDER");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of FINDoc2WorkOrderDAO
