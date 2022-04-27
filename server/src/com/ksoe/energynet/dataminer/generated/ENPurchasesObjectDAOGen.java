
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
import com.ksoe.energynet.valueobject.ENPurchasesObject;
import com.ksoe.energynet.valueobject.brief.ENPurchasesObjectShort;
import com.ksoe.energynet.valueobject.filter.ENPurchasesObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENPurchasesObjectShortList;
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
 * DAO Object for ENPurchasesObject;
 *
 */

public class ENPurchasesObjectDAOGen extends GenericDataMiner {

  public ENPurchasesObjectDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENPurchasesObjectDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENPurchasesObject inObject) throws PersistenceException
   {
      ENPurchasesObject obj = new ENPurchasesObject();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.name != obj.name){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }

     if (inObject.expandMaterialsIP != obj.expandMaterialsIP){
       return false;
     }
     if (inObject.purchasesReason.code != obj.purchasesReason.code){
        return false;
     }
     if (inObject.elementTypeRef.code != obj.elementTypeRef.code){
        return false;
     }
     if (inObject.budget.code != obj.budget.code){
        return false;
     }
     if (inObject.department.code != obj.department.code){
        return false;
     }
     if (inObject.element.code != obj.element.code){
        return false;
     }
      return true;
   }

   public int add(ENPurchasesObject anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENPurchasesObject anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();
    if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENPURCHASESOBJECT (CODE,NAME,COMMENTGEN,EXPANDMATERIALSIP,DOMAIN_INFO,MODIFY_TIME,PURCHASESREASONCODE,ELEMENTTYPEREFCODE,BUDGETCODE,DEPARTMENTCODE,ELEMENTCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.name);
      statement.setString(3,anObject.commentGen);
      if (anObject.expandMaterialsIP != Integer.MIN_VALUE )
         statement.setInt(4,anObject.expandMaterialsIP);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      statement.setString(5,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(6,null);
      else
        statement.setBigDecimal(6,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.purchasesReason.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPurchasesObjectReasonDAOGen(connection,getUserProfile()).exists(anObject.purchasesReason.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPurchasesObject.purchasesReason.code%} = {%"+anObject.purchasesReason.code+"%}");
        statement.setInt(7,anObject.purchasesReason.code);
      }
      else
        statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.elementTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENElementTypeDAOGen(connection,getUserProfile()).exists(anObject.elementTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPurchasesObject.elementTypeRef.code%} = {%"+anObject.elementTypeRef.code+"%}");
        statement.setInt(8,anObject.elementTypeRef.code);
      }
      else
        statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.budget.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.budget.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPurchasesObject.budget.code%} = {%"+anObject.budget.code+"%}");
        statement.setInt(9,anObject.budget.code);
      }
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.department.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.department.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPurchasesObject.department.code%} = {%"+anObject.department.code+"%}");
        statement.setInt(10,anObject.department.code);
      }
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.element.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.element.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPurchasesObject.element.code%} = {%"+anObject.element.code+"%}");
        statement.setInt(11,anObject.element.code);
      }
      else
        statement.setNull(11,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENPurchasesObjectDAOGen.add%}",e);
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

   public void save(ENPurchasesObject anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENPurchasesObject anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENPurchasesObject oldObject = new ENPurchasesObject();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENPurchasesObject.modify_time_Field + "," + ENPurchasesObject.domain_info_Field+" FROM  ENPURCHASESOBJECT WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("NAME") == 0)
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
          if(fieldNameStr.compareTo("EXPANDMATERIALSIP") == 0)
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
          if(fieldNameStr.compareTo("PURCHASESREASON") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ELEMENTTYPEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("BUDGET") == 0)
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
          if(fieldNameStr.compareTo("ELEMENT") == 0)
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
        "UPDATE ENPURCHASESOBJECT SET  NAME = ? , COMMENTGEN = ? , EXPANDMATERIALSIP = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , PURCHASESREASONCODE = ? , ELEMENTTYPEREFCODE = ? , BUDGETCODE = ? , DEPARTMENTCODE = ? , ELEMENTCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENPURCHASESOBJECT SET ";
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
      statement.setString(1,anObject.name);
      statement.setString(2,anObject.commentGen);
      if (anObject.expandMaterialsIP != Integer.MIN_VALUE )
         statement.setInt(3,anObject.expandMaterialsIP);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      statement.setString(4,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(5,null);
      else
        statement.setBigDecimal(5,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.purchasesReason.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.purchasesReason.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.elementTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(7,anObject.elementTypeRef.code);
      else
        statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.budget.code != Integer.MIN_VALUE)
        statement.setInt(8,anObject.budget.code);
      else
        statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.department.code != Integer.MIN_VALUE)
        statement.setInt(9,anObject.department.code);
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.element.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.element.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
          statement.setInt(11,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("NAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.name);
                continue;
             }
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
                continue;
             }
            if("EXPANDMATERIALSIP".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.expandMaterialsIP);
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
            if("PURCHASESREASON".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.purchasesReason.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.purchasesReason.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("ELEMENTTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.elementTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.elementTypeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("BUDGET".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.budget.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.budget.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
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
            if("ELEMENT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.element.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.element.code);
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

   } // end of save(ENPurchasesObject anObject,String[] anAttributes)


 public ENPurchasesObjectShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENPurchasesObject filterObject = new ENPurchasesObject();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENPurchasesObjectShort)list.get(0);
   return null;
  }

  public ENPurchasesObjectShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENPurchasesObjectShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENPurchasesObjectShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENPurchasesObjectShortList getFilteredList(ENPurchasesObject filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENPurchasesObjectShortList getScrollableFilteredList(ENPurchasesObject aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENPurchasesObjectShortList getScrollableFilteredList(ENPurchasesObject aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENPurchasesObjectShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENPurchasesObjectShortList getScrollableFilteredList(ENPurchasesObjectFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENPurchasesObjectShortList getScrollableFilteredList(ENPurchasesObjectFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENPurchasesObjectShortList getScrollableFilteredList(ENPurchasesObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENPurchasesObjectShortList getScrollableFilteredList(ENPurchasesObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENPurchasesObjectShortList result = new ENPurchasesObjectShortList();
    ENPurchasesObjectShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPURCHASESOBJECT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENPURCHASESOBJECT.CODE"+
     ",ENPURCHASESOBJECT.NAME"+
     ",ENPURCHASESOBJECT.EXPANDMATERIALSIP"+

      ", ENPURCHASESOBJECTREASN.CODE " +
      ", ENPURCHASESOBJECTREASN.NAME " +
      ", ENELEMENTTYPE.CODE " +
      ", ENELEMENTTYPE.NAME " +
      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
      ", ENELEMENT.CODE " +
     " FROM ENPURCHASESOBJECT " +
     ", ENPURCHASESOBJECTREASN " +
     ", ENELEMENTTYPE " +
     ", ENDEPARTMENT " +
     ", ENDEPARTMENT " +
     ", ENELEMENT " +
     //" WHERE "
    "";
     whereStr = " ENPURCHASESOBJECTREASN.CODE = ENPURCHASESOBJECT.PURCHASESREASONCODE" ; //+
      whereStr = whereStr +" AND ENELEMENTTYPE.CODE = ENPURCHASESOBJECT.ELEMENTTYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENDEPARTMENT.CODE = ENPURCHASESOBJECT.BUDGETCODE" ; //+
      whereStr = whereStr +" AND ENDEPARTMENT.CODE = ENPURCHASESOBJECT.DEPARTMENTCODE" ; //+
      whereStr = whereStr +" AND ENELEMENT.CODE = ENPURCHASESOBJECT.ELEMENTCODE" ; //+
        //selectStr = selectStr + " ${s} ENPURCHASESOBJECT.CODE IN ( SELECT ENPURCHASESOBJECT.CODE FROM ENPURCHASESOBJECT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPURCHASESOBJECT.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENPURCHASESOBJECT.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENPURCHASESOBJECT.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENPURCHASESOBJECT.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENPURCHASESOBJECT.COMMENTGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.expandMaterialsIP != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPURCHASESOBJECT.EXPANDMATERIALSIP = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENPURCHASESOBJECT.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENPURCHASESOBJECT.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPURCHASESOBJECT.MODIFY_TIME = ?";
        }
        if(aFilterObject.purchasesReason.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPURCHASESOBJECT.PURCHASESREASONCODE = ? ";
        }
        if(aFilterObject.elementTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPURCHASESOBJECT.ELEMENTTYPEREFCODE = ? ";
        }
        if(aFilterObject.budget.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPURCHASESOBJECT.BUDGETCODE = ? ";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPURCHASESOBJECT.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPURCHASESOBJECT.ELEMENTCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPurchasesObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENPurchasesObject.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENPURCHASESOBJECT",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENPURCHASESOBJECT.DOMAIN_INFO IS NOT NULL";
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

           if(aFilterObject.name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
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
         if(aFilterObject.expandMaterialsIP != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.expandMaterialsIP);
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
       if(aFilterObject.purchasesReason.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.purchasesReason.code);
       }
       if(aFilterObject.elementTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementTypeRef.code);
       }
       if(aFilterObject.budget.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.budget.code);
       }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.element.code);
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

        anObject = new ENPurchasesObjectShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.expandMaterialsIP = set.getInt(3);
        if ( set.wasNull() )
            anObject.expandMaterialsIP = Integer.MIN_VALUE;

        anObject.purchasesReasonCode = set.getInt(4);
        if(set.wasNull())
        anObject.purchasesReasonCode = Integer.MIN_VALUE;
        anObject.purchasesReasonName = set.getString(5);
        anObject.elementTypeRefCode = set.getInt(6);
        if(set.wasNull())
        anObject.elementTypeRefCode = Integer.MIN_VALUE;
        anObject.elementTypeRefName = set.getString(7);
        anObject.budgetCode = set.getInt(8);
        if(set.wasNull())
        anObject.budgetCode = Integer.MIN_VALUE;
        anObject.budgetShortName = set.getString(9);
        anObject.budgetDateStart = set.getDate(10);
        anObject.budgetDateFinal = set.getDate(11);
        anObject.budgetRenCode = set.getInt(12);
        if(set.wasNull())
        anObject.budgetRenCode = Integer.MIN_VALUE;
        anObject.budgetShpzBalans = set.getString(13);
        anObject.budgetKau_table_id_1884 = set.getInt(14);
        if(set.wasNull())
        anObject.budgetKau_table_id_1884 = Integer.MIN_VALUE;
        anObject.budgetKau_1884 = set.getString(15);
        anObject.budgetName_1884 = set.getString(16);
        anObject.departmentCode = set.getInt(17);
        if(set.wasNull())
        anObject.departmentCode = Integer.MIN_VALUE;
        anObject.departmentShortName = set.getString(18);
        anObject.departmentDateStart = set.getDate(19);
        anObject.departmentDateFinal = set.getDate(20);
        anObject.departmentRenCode = set.getInt(21);
        if(set.wasNull())
        anObject.departmentRenCode = Integer.MIN_VALUE;
        anObject.departmentShpzBalans = set.getString(22);
        anObject.departmentKau_table_id_1884 = set.getInt(23);
        if(set.wasNull())
        anObject.departmentKau_table_id_1884 = Integer.MIN_VALUE;
        anObject.departmentKau_1884 = set.getString(24);
        anObject.departmentName_1884 = set.getString(25);
        anObject.elementCode = set.getInt(26);
        if(set.wasNull())
        anObject.elementCode = Integer.MIN_VALUE;

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

  public int[] getFilteredCodeArrayOLD(ENPurchasesObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENPURCHASESOBJECT.CODE FROM ENPURCHASESOBJECT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPURCHASESOBJECT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPurchasesObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENPurchasesObject.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENPURCHASESOBJECT",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENPURCHASESOBJECT.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPURCHASESOBJECT.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPURCHASESOBJECT.NAME = ?";
             else
                 whereStr = whereStr + "  ENPURCHASESOBJECT.NAME LIKE ?";
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPURCHASESOBJECT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENPURCHASESOBJECT.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.expandMaterialsIP != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPURCHASESOBJECT.EXPANDMATERIALSIP = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPURCHASESOBJECT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENPURCHASESOBJECT.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPURCHASESOBJECT.MODIFY_TIME = ?";
        }
        if(aFilterObject.purchasesReason.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPURCHASESOBJECT.PURCHASESREASONCODE = ? ";
        }
        if(aFilterObject.elementTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPURCHASESOBJECT.ELEMENTTYPEREFCODE = ? ";
        }
        if(aFilterObject.budget.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPURCHASESOBJECT.BUDGETCODE = ? ";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPURCHASESOBJECT.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPURCHASESOBJECT.ELEMENTCODE = ? ";
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
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPURCHASESOBJECT.NAME = ?";
             else
                 whereStr = whereStr + " ENPURCHASESOBJECT.NAME LIKE ?";

           if(aFilterObject.name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPURCHASESOBJECT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENPURCHASESOBJECT.COMMENTGEN LIKE ?";

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
         if(aFilterObject.expandMaterialsIP != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.expandMaterialsIP);
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPURCHASESOBJECT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENPURCHASESOBJECT.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.purchasesReason.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.purchasesReason.code);
       }
       if(aFilterObject.elementTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementTypeRef.code);
       }
       if(aFilterObject.budget.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.budget.code);
       }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.element.code);
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

  public int[] getFilteredCodeArray(ENPurchasesObjectFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENPurchasesObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENPURCHASESOBJECT.CODE FROM ENPURCHASESOBJECT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPURCHASESOBJECT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPurchasesObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENPurchasesObject.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENPURCHASESOBJECT",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENPURCHASESOBJECT.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPURCHASESOBJECT.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPURCHASESOBJECT.NAME = ?";
             else
                 whereStr = whereStr + "  ENPURCHASESOBJECT.NAME LIKE ?";
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPURCHASESOBJECT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENPURCHASESOBJECT.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.expandMaterialsIP != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPURCHASESOBJECT.EXPANDMATERIALSIP = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPURCHASESOBJECT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENPURCHASESOBJECT.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPURCHASESOBJECT.MODIFY_TIME = ?";
        }
        if(aFilterObject.purchasesReason.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPURCHASESOBJECT.PURCHASESREASONCODE = ? ";
        }
        if(aFilterObject.elementTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPURCHASESOBJECT.ELEMENTTYPEREFCODE = ? ";
        }
        if(aFilterObject.budget.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPURCHASESOBJECT.BUDGETCODE = ? ";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPURCHASESOBJECT.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPURCHASESOBJECT.ELEMENTCODE = ? ";
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
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPURCHASESOBJECT.NAME = ?";
             else
                 whereStr = whereStr + " ENPURCHASESOBJECT.NAME LIKE ?";

           if(aFilterObject.name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPURCHASESOBJECT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENPURCHASESOBJECT.COMMENTGEN LIKE ?";

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
         if(aFilterObject.expandMaterialsIP != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.expandMaterialsIP);
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPURCHASESOBJECT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENPURCHASESOBJECT.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.purchasesReason.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.purchasesReason.code);
       }
       if(aFilterObject.elementTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementTypeRef.code);
       }
       if(aFilterObject.budget.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.budget.code);
       }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.element.code);
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


   public ENPurchasesObject getObject(int uid) throws PersistenceException
   {
    ENPurchasesObject result = new ENPurchasesObject();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENPurchasesObject anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPurchasesObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENPurchasesObject.getObject%} access denied");



    selectStr =
    "SELECT  ENPURCHASESOBJECT.CODE, ENPURCHASESOBJECT.NAME, ENPURCHASESOBJECT.COMMENTGEN, ENPURCHASESOBJECT.EXPANDMATERIALSIP, ENPURCHASESOBJECT.DOMAIN_INFO, ENPURCHASESOBJECT.MODIFY_TIME, ENPURCHASESOBJECT.PURCHASESREASONCODE, ENPURCHASESOBJECT.ELEMENTTYPEREFCODE, ENPURCHASESOBJECT.BUDGETCODE, ENPURCHASESOBJECT.DEPARTMENTCODE, ENPURCHASESOBJECT.ELEMENTCODE "
    +" FROM ENPURCHASESOBJECT WHERE ENPURCHASESOBJECT.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENPURCHASESOBJECT",segregationInfo,getUserProfile().getDomainInfo());
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
        anObject.name = set.getString(2);
        anObject.commentGen = set.getString(3);
        anObject.expandMaterialsIP = set.getInt(4);
        if ( set.wasNull() )
           anObject.expandMaterialsIP = Integer.MIN_VALUE;
        anObject.domain_info = set.getString(5);
        anObject.modify_time = set.getLong(6);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.purchasesReason.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.purchasesReason.code = Integer.MIN_VALUE;
        anObject.elementTypeRef.code = set.getInt(8);
        if ( set.wasNull() )
            anObject.elementTypeRef.code = Integer.MIN_VALUE;
        anObject.budget.code = set.getInt(9);
        if ( set.wasNull() )
            anObject.budget.code = Integer.MIN_VALUE;
        anObject.department.code = set.getInt(10);
        if ( set.wasNull() )
            anObject.department.code = Integer.MIN_VALUE;
        anObject.element.code = set.getInt(11);
        if ( set.wasNull() )
            anObject.element.code = Integer.MIN_VALUE;
        if(anObject.purchasesReason.code != Integer.MIN_VALUE)
        {
           anObject.setPurchasesReason(
        new com.ksoe.energynet.dataminer.generated.ENPurchasesObjectReasonDAOGen(connection,getUserProfile()).getObject(anObject.purchasesReason.code));
    }
        if(anObject.elementTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setElementTypeRef(
        new com.ksoe.energynet.dataminer.generated.ENElementTypeDAOGen(connection,getUserProfile()).getRef(anObject.elementTypeRef.code));
    }
        if(anObject.budget.code != Integer.MIN_VALUE)
        {
           anObject.setBudget(
        new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getObject(anObject.budget.code));
    }
        if(anObject.department.code != Integer.MIN_VALUE)
        {
           anObject.setDepartment(
        new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getObject(anObject.department.code));
    }
        if(anObject.element.code != Integer.MIN_VALUE)
        {
           anObject.setElement(
        new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getObject(anObject.element.code));
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


  public com.ksoe.energynet.valueobject.references.ENPurchasesObjectRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENPurchasesObjectRef ref = new com.ksoe.energynet.valueobject.references.ENPurchasesObjectRef();
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

    selectStr = "DELETE FROM  ENPURCHASESOBJECT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENPurchasesObject object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENPurchasesObject.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENPurchasesObject.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENPurchasesObject.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPurchasesObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENPurchasesObject.getObject%} access denied");

    selectStr =

    "SELECT  ENPURCHASESOBJECT.CODE FROM  ENPURCHASESOBJECT WHERE  ENPURCHASESOBJECT.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENPURCHASESOBJECT",segregationInfo,getUserProfile().getDomainInfo());
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
    _checkConditionToken(condition,"code","ENPURCHASESOBJECT.CODE");
    _checkConditionToken(condition,"name","ENPURCHASESOBJECT.NAME");
    _checkConditionToken(condition,"commentgen","ENPURCHASESOBJECT.COMMENTGEN");
    _checkConditionToken(condition,"expandmaterialsip","ENPURCHASESOBJECT.EXPANDMATERIALSIP");
    _checkConditionToken(condition,"domain_info","ENPURCHASESOBJECT.DOMAIN_INFO");
    _checkConditionToken(condition,"modify_time","ENPURCHASESOBJECT.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"purchasesreason","PURCHASESREASONCODE");
    _checkConditionToken(condition,"purchasesreason.code","PURCHASESREASONCODE");
    _checkConditionToken(condition,"elementtyperef","ELEMENTTYPEREFCODE");
    _checkConditionToken(condition,"elementtyperef.code","ELEMENTTYPEREFCODE");
    _checkConditionToken(condition,"budget","BUDGETCODE");
    _checkConditionToken(condition,"budget.code","BUDGETCODE");
    _checkConditionToken(condition,"department","DEPARTMENTCODE");
    _checkConditionToken(condition,"department.code","DEPARTMENTCODE");
    _checkConditionToken(condition,"element","ELEMENTCODE");
    _checkConditionToken(condition,"element.code","ELEMENTCODE");
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

    private void _collectAutoIncrementFields(ENPurchasesObject anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENPURCHASESOBJECT", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENPURCHASESOBJECT", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENPURCHASESOBJECT", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENPURCHASESOBJECT");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENPurchasesObjectDAO
