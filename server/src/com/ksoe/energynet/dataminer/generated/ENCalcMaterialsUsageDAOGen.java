
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
import com.ksoe.energynet.valueobject.ENCalcMaterialsUsage;
import com.ksoe.energynet.valueobject.brief.ENCalcMaterialsUsageShort;
import com.ksoe.energynet.valueobject.filter.ENCalcMaterialsUsageFilter;
import com.ksoe.energynet.valueobject.lists.ENCalcMaterialsUsageShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENCalcMaterialsUsage;
 *
 */

public class ENCalcMaterialsUsageDAOGen extends GenericDataMiner {

  public ENCalcMaterialsUsageDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENCalcMaterialsUsageDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENCalcMaterialsUsage inObject) throws PersistenceException
   {
      ENCalcMaterialsUsage obj = new ENCalcMaterialsUsage();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.numberGen != obj.numberGen){
       return false;
     }

     if (inObject.classificationTypeNumber != obj.classificationTypeNumber){
       return false;
     }

     if (inObject.materialName != obj.materialName){
       return false;
     }

     if (inObject.measureUnitName != obj.measureUnitName){
       return false;
     }

     if ( ! inObject.priceGen.equals(obj.priceGen)){
       return false;
     }

     if ( ! inObject.countGen.equals(obj.countGen)){
       return false;
     }

     if ( ! inObject.sumGen.equals(obj.sumGen)){
       return false;
     }
     if (inObject.planRef.code != obj.planRef.code){
        return false;
     }
     if (inObject.plan2CTypeRef.code != obj.plan2CTypeRef.code){
        return false;
     }
      return true;
   }

   public int add(ENCalcMaterialsUsage anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENCalcMaterialsUsage anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENCALCMATERIALSUSAGE (CODE,NUMBERGEN,CLASSIFICATIONTYPENMBR,MATERIALNAME,MEASUREUNITNAME,PRICEGEN,COUNTGEN,SUMGEN,MODIFY_TIME,PLANREFCODE,PLAN2CTYPEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.numberGen != Integer.MIN_VALUE )
         statement.setInt(2,anObject.numberGen);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      statement.setString(3,anObject.classificationTypeNumber);
      statement.setString(4,anObject.materialName);
      statement.setString(5,anObject.measureUnitName);
      if (anObject.priceGen != null)
        anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.priceGen);
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.countGen);
      if (anObject.sumGen != null)
        anObject.sumGen = anObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.sumGen);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(9,null);
      else
        statement.setBigDecimal(9,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.planRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalcMaterialsUsage.planRef.code%} = {%"+anObject.planRef.code+"%}");
        statement.setInt(10,anObject.planRef.code);
      }
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.plan2CTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWork2ClassificationTypeDAOGen(connection,getUserProfile()).exists(anObject.plan2CTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalcMaterialsUsage.plan2CTypeRef.code%} = {%"+anObject.plan2CTypeRef.code+"%}");
        statement.setInt(11,anObject.plan2CTypeRef.code);
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
      throw new PersistenceException("Error in method {%ENCalcMaterialsUsageDAOGen.add%}",e);
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

   public void save(ENCalcMaterialsUsage anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENCalcMaterialsUsage anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENCalcMaterialsUsage oldObject = new ENCalcMaterialsUsage();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENCalcMaterialsUsage.modify_time_Field+" FROM  ENCALCMATERIALSUSAGE WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("NUMBERGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CLASSIFICATIONTYPENUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MATERIALNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MEASUREUNITNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PRICEGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNTGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMGEN") == 0)
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
          if(fieldNameStr.compareTo("PLANREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PLAN2CTYPEREF") == 0)
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
        "UPDATE ENCALCMATERIALSUSAGE SET  NUMBERGEN = ? , CLASSIFICATIONTYPENMBR = ? , MATERIALNAME = ? , MEASUREUNITNAME = ? , PRICEGEN = ? , COUNTGEN = ? , SUMGEN = ? , MODIFY_TIME = ? , PLANREFCODE = ? , PLAN2CTYPEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENCALCMATERIALSUSAGE SET ";
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
      if (anObject.numberGen != Integer.MIN_VALUE )
         statement.setInt(1,anObject.numberGen);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.classificationTypeNumber);
      statement.setString(3,anObject.materialName);
      statement.setString(4,anObject.measureUnitName);
      if (anObject.priceGen != null)
        anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.priceGen);
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.countGen);
      if (anObject.sumGen != null)
        anObject.sumGen = anObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.sumGen);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(8,null);
      else
        statement.setBigDecimal(8,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.planRef.code != Integer.MIN_VALUE)
        statement.setInt(9,anObject.planRef.code);
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.plan2CTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.plan2CTypeRef.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
          statement.setInt(11,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("NUMBERGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.numberGen);
                continue;
             }
            if("CLASSIFICATIONTYPENUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.classificationTypeNumber);
                continue;
             }
            if("MATERIALNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.materialName);
                continue;
             }
            if("MEASUREUNITNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.measureUnitName);
                continue;
             }
            if("PRICEGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.priceGen != null)
                    anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.priceGen);
                continue;
             }
            if("COUNTGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countGen != null)
                    anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countGen);
                continue;
             }
            if("SUMGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumGen != null)
                    anObject.sumGen = anObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumGen);
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
            if("PLANREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.planRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.planRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("PLAN2CTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.plan2CTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.plan2CTypeRef.code);
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

   } // end of save(ENCalcMaterialsUsage anObject,String[] anAttributes)


 public ENCalcMaterialsUsageShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENCalcMaterialsUsage filterObject = new ENCalcMaterialsUsage();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENCalcMaterialsUsageShort)list.get(0);
   return null;
  }

  public ENCalcMaterialsUsageShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENCalcMaterialsUsageShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENCalcMaterialsUsageShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENCalcMaterialsUsageShortList getFilteredList(ENCalcMaterialsUsage filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENCalcMaterialsUsageShortList getScrollableFilteredList(ENCalcMaterialsUsage aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENCalcMaterialsUsageShortList getScrollableFilteredList(ENCalcMaterialsUsage aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENCalcMaterialsUsageShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENCalcMaterialsUsageShortList getScrollableFilteredList(ENCalcMaterialsUsageFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENCalcMaterialsUsageShortList getScrollableFilteredList(ENCalcMaterialsUsageFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENCalcMaterialsUsageShortList getScrollableFilteredList(ENCalcMaterialsUsage aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENCalcMaterialsUsageShortList getScrollableFilteredList(ENCalcMaterialsUsage aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENCalcMaterialsUsageShortList result = new ENCalcMaterialsUsageShortList();
    ENCalcMaterialsUsageShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCALCMATERIALSUSAGE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENCALCMATERIALSUSAGE.CODE"+
     ",ENCALCMATERIALSUSAGE.NUMBERGEN"+
     ",ENCALCMATERIALSUSAGE.CLASSIFICATIONTYPENMBR"+
     ",ENCALCMATERIALSUSAGE.MATERIALNAME"+
     ",ENCALCMATERIALSUSAGE.MEASUREUNITNAME"+
     ",ENCALCMATERIALSUSAGE.PRICEGEN"+
     ",ENCALCMATERIALSUSAGE.COUNTGEN"+
     ",ENCALCMATERIALSUSAGE.SUMGEN"+

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
      ", ENPLANWORK2CLASSFCTNTP.CODE " +
      ", ENPLANWORK2CLASSFCTNTP.COUNTGEN " +
      ", ENPLANWORK2CLASSFCTNTP.USERGEN " +
      ", ENPLANWORK2CLASSFCTNTP.DATEEDIT " +
      ", ENPLANWORK2CLASSFCTNTP.MACHINEHOURS " +
      ", ENPLANWORK2CLASSFCTNTP.RELOCATIONKM " +
      ", ENPLANWORK2CLASSFCTNTP.TRANSPORTATIONLOAD " +
      ", ENPLANWORK2CLASSFCTNTP.ISPRINTONKMORMH " +
      ", ENPLANWORK2CLASSFCTNTP.COSTWORKSCONTRACTOR " +
      ", ENPLANWORK2CLASSFCTNTP.DATEGEN " +
      ", ENPLANWORK2CLASSFCTNTP.TIMESTART " +
      ", ENPLANWORK2CLASSFCTNTP.TIMEFINAL " +
      ", ENPLANWORK2CLASSFCTNTP.CODEVIRTUALBRIGADE " +
      ", ENPLANWORK2CLASSFCTNTP.ISJOBSBYTIME " +
      ", ENPLANWORK2CLASSFCTNTP.ISVISITCLIENT " +
     " FROM ENCALCMATERIALSUSAGE " +
     ", ENPLANWORK " +
     ", ENPLANWORK2CLASSFCTNTP " +
     //" WHERE "
    "";
     whereStr = " ENPLANWORK.CODE = ENCALCMATERIALSUSAGE.PLANREFCODE" ; //+
      whereStr = whereStr +" AND ENPLANWORK2CLASSFCTNTP.CODE = ENCALCMATERIALSUSAGE.PLAN2CTYPEREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENCALCMATERIALSUSAGE.CODE IN ( SELECT ENCALCMATERIALSUSAGE.CODE FROM ENCALCMATERIALSUSAGE ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.CODE = ?";
        }
        if(aFilterObject.numberGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.NUMBERGEN = ?";
        }
         if (aFilterObject.classificationTypeNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.classificationTypeNumber.indexOf('*',0) < 0 && aFilterObject.classificationTypeNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCALCMATERIALSUSAGE.CLASSIFICATIONTYPENMBR) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCALCMATERIALSUSAGE.CLASSIFICATIONTYPENMBR) LIKE UPPER(?)";
         }
         if (aFilterObject.materialName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.materialName.indexOf('*',0) < 0 && aFilterObject.materialName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCALCMATERIALSUSAGE.MATERIALNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCALCMATERIALSUSAGE.MATERIALNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.measureUnitName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.measureUnitName.indexOf('*',0) < 0 && aFilterObject.measureUnitName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCALCMATERIALSUSAGE.MEASUREUNITNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCALCMATERIALSUSAGE.MEASUREUNITNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.priceGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.PRICEGEN = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.COUNTGEN = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.SUMGEN = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCALCMATERIALSUSAGE.PLANREFCODE = ? ";
        }
        if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCALCMATERIALSUSAGE.PLAN2CTYPEREFCODE = ? ";
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
         if(aFilterObject.numberGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.numberGen);
         }

           if(aFilterObject.classificationTypeNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.classificationTypeNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.materialName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.materialName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.measureUnitName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.measureUnitName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.priceGen != null){
            number++;
            aFilterObject.priceGen = aFilterObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGen);
        }
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.plan2CTypeRef.code);
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

        anObject = new ENCalcMaterialsUsageShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.numberGen = set.getInt(2);
        if ( set.wasNull() )
            anObject.numberGen = Integer.MIN_VALUE;
        anObject.classificationTypeNumber = set.getString(3);
        anObject.materialName = set.getString(4);
        anObject.measureUnitName = set.getString(5);
        anObject.priceGen = set.getBigDecimal(6);
        if(anObject.priceGen != null)
            anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countGen = set.getBigDecimal(7);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGen = set.getBigDecimal(8);
        if(anObject.sumGen != null)
            anObject.sumGen = anObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.planRefCode = set.getInt(9);
        if(set.wasNull())
        anObject.planRefCode = Integer.MIN_VALUE;
        anObject.planRefDateGen = set.getTimestamp(10);
        anObject.planRefDateStart = set.getDate(11);
        anObject.planRefDateFinal = set.getDate(12);
        anObject.planRefYearGen = set.getInt(13);
        if(set.wasNull())
        anObject.planRefYearGen = Integer.MIN_VALUE;
        anObject.planRefMonthGen = set.getInt(14);
        if(set.wasNull())
        anObject.planRefMonthGen = Integer.MIN_VALUE;
        anObject.planRefYearOriginal = set.getInt(15);
        if(set.wasNull())
        anObject.planRefYearOriginal = Integer.MIN_VALUE;
        anObject.planRefMonthOriginal = set.getInt(16);
        if(set.wasNull())
        anObject.planRefMonthOriginal = Integer.MIN_VALUE;
        anObject.planRefUserGen = set.getString(17);
        anObject.planRefDateEdit = set.getDate(18);
        anObject.planRefWorkOrderNumber = set.getString(19);
        anObject.planRefDateWorkOrder = set.getDate(20);
        anObject.planRefPriConnectionNumber = set.getString(21);

        anObject.plan2CTypeRefCode = set.getInt(29);
        if(set.wasNull())
        anObject.plan2CTypeRefCode = Integer.MIN_VALUE;
        anObject.plan2CTypeRefCountGen = set.getBigDecimal(30);
        if(anObject.plan2CTypeRefCountGen != null)
          anObject.plan2CTypeRefCountGen = anObject.plan2CTypeRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.plan2CTypeRefUserGen = set.getString(31);
        anObject.plan2CTypeRefDateEdit = set.getDate(32);


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

  public int[] getFilteredCodeArrayOLD(ENCalcMaterialsUsage aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCALCMATERIALSUSAGE.CODE FROM ENCALCMATERIALSUSAGE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCALCMATERIALSUSAGE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.CODE = ?";
        }
        if(aFilterObject.numberGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.NUMBERGEN = ?";
        }
         if (aFilterObject.classificationTypeNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.classificationTypeNumber.indexOf('*',0) < 0 && aFilterObject.classificationTypeNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCALCMATERIALSUSAGE.CLASSIFICATIONTYPENMBR = ?";
             else
                 whereStr = whereStr + "  ENCALCMATERIALSUSAGE.CLASSIFICATIONTYPENMBR LIKE ?";
         }
         if (aFilterObject.materialName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.materialName.indexOf('*',0) < 0 && aFilterObject.materialName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCALCMATERIALSUSAGE.MATERIALNAME = ?";
             else
                 whereStr = whereStr + "  ENCALCMATERIALSUSAGE.MATERIALNAME LIKE ?";
         }
         if (aFilterObject.measureUnitName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.measureUnitName.indexOf('*',0) < 0 && aFilterObject.measureUnitName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCALCMATERIALSUSAGE.MEASUREUNITNAME = ?";
             else
                 whereStr = whereStr + "  ENCALCMATERIALSUSAGE.MEASUREUNITNAME LIKE ?";
         }
        if(aFilterObject.priceGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.PRICEGEN = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.COUNTGEN = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.SUMGEN = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALCMATERIALSUSAGE.PLANREFCODE = ? ";
        }
        if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALCMATERIALSUSAGE.PLAN2CTYPEREFCODE = ? ";
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
         if(aFilterObject.numberGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.numberGen);
         }
         if (aFilterObject.classificationTypeNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.classificationTypeNumber.indexOf('*',0) < 0 && aFilterObject.classificationTypeNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCALCMATERIALSUSAGE.CLASSIFICATIONTYPENMBR = ?";
             else
                 whereStr = whereStr + " ENCALCMATERIALSUSAGE.CLASSIFICATIONTYPENMBR LIKE ?";

           if(aFilterObject.classificationTypeNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.classificationTypeNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.materialName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.materialName.indexOf('*',0) < 0 && aFilterObject.materialName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCALCMATERIALSUSAGE.MATERIALNAME = ?";
             else
                 whereStr = whereStr + " ENCALCMATERIALSUSAGE.MATERIALNAME LIKE ?";

           if(aFilterObject.materialName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.materialName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.measureUnitName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.measureUnitName.indexOf('*',0) < 0 && aFilterObject.measureUnitName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCALCMATERIALSUSAGE.MEASUREUNITNAME = ?";
             else
                 whereStr = whereStr + " ENCALCMATERIALSUSAGE.MEASUREUNITNAME LIKE ?";

           if(aFilterObject.measureUnitName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.measureUnitName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.priceGen != null){
            number++;
            aFilterObject.priceGen = aFilterObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGen);
        }
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.plan2CTypeRef.code);
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

  public int[] getFilteredCodeArray(ENCalcMaterialsUsageFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENCalcMaterialsUsage aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCALCMATERIALSUSAGE.CODE FROM ENCALCMATERIALSUSAGE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCALCMATERIALSUSAGE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.CODE = ?";
        }
        if(aFilterObject.numberGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.NUMBERGEN = ?";
        }
         if (aFilterObject.classificationTypeNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.classificationTypeNumber.indexOf('*',0) < 0 && aFilterObject.classificationTypeNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCALCMATERIALSUSAGE.CLASSIFICATIONTYPENMBR = ?";
             else
                 whereStr = whereStr + "  ENCALCMATERIALSUSAGE.CLASSIFICATIONTYPENMBR LIKE ?";
         }
         if (aFilterObject.materialName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.materialName.indexOf('*',0) < 0 && aFilterObject.materialName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCALCMATERIALSUSAGE.MATERIALNAME = ?";
             else
                 whereStr = whereStr + "  ENCALCMATERIALSUSAGE.MATERIALNAME LIKE ?";
         }
         if (aFilterObject.measureUnitName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.measureUnitName.indexOf('*',0) < 0 && aFilterObject.measureUnitName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCALCMATERIALSUSAGE.MEASUREUNITNAME = ?";
             else
                 whereStr = whereStr + "  ENCALCMATERIALSUSAGE.MEASUREUNITNAME LIKE ?";
         }
        if(aFilterObject.priceGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.PRICEGEN = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.COUNTGEN = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.SUMGEN = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCMATERIALSUSAGE.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALCMATERIALSUSAGE.PLANREFCODE = ? ";
        }
        if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALCMATERIALSUSAGE.PLAN2CTYPEREFCODE = ? ";
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
         if(aFilterObject.numberGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.numberGen);
         }
         if (aFilterObject.classificationTypeNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.classificationTypeNumber.indexOf('*',0) < 0 && aFilterObject.classificationTypeNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCALCMATERIALSUSAGE.CLASSIFICATIONTYPENMBR = ?";
             else
                 whereStr = whereStr + " ENCALCMATERIALSUSAGE.CLASSIFICATIONTYPENMBR LIKE ?";

           if(aFilterObject.classificationTypeNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.classificationTypeNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.materialName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.materialName.indexOf('*',0) < 0 && aFilterObject.materialName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCALCMATERIALSUSAGE.MATERIALNAME = ?";
             else
                 whereStr = whereStr + " ENCALCMATERIALSUSAGE.MATERIALNAME LIKE ?";

           if(aFilterObject.materialName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.materialName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.measureUnitName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.measureUnitName.indexOf('*',0) < 0 && aFilterObject.measureUnitName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCALCMATERIALSUSAGE.MEASUREUNITNAME = ?";
             else
                 whereStr = whereStr + " ENCALCMATERIALSUSAGE.MEASUREUNITNAME LIKE ?";

           if(aFilterObject.measureUnitName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.measureUnitName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.priceGen != null){
            number++;
            aFilterObject.priceGen = aFilterObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGen);
        }
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.plan2CTypeRef.code);
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


   public ENCalcMaterialsUsage getObject(int uid) throws PersistenceException
   {
    ENCalcMaterialsUsage result = new ENCalcMaterialsUsage();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENCalcMaterialsUsage anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENCALCMATERIALSUSAGE.CODE, ENCALCMATERIALSUSAGE.NUMBERGEN, ENCALCMATERIALSUSAGE.CLASSIFICATIONTYPENMBR, ENCALCMATERIALSUSAGE.MATERIALNAME, ENCALCMATERIALSUSAGE.MEASUREUNITNAME, ENCALCMATERIALSUSAGE.PRICEGEN, ENCALCMATERIALSUSAGE.COUNTGEN, ENCALCMATERIALSUSAGE.SUMGEN, ENCALCMATERIALSUSAGE.MODIFY_TIME, ENCALCMATERIALSUSAGE.PLANREFCODE, ENCALCMATERIALSUSAGE.PLAN2CTYPEREFCODE "
    +" FROM ENCALCMATERIALSUSAGE WHERE ENCALCMATERIALSUSAGE.CODE = ?";

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
        anObject.numberGen = set.getInt(2);
        if ( set.wasNull() )
           anObject.numberGen = Integer.MIN_VALUE;
        anObject.classificationTypeNumber = set.getString(3);
        anObject.materialName = set.getString(4);
        anObject.measureUnitName = set.getString(5);
        anObject.priceGen = set.getBigDecimal(6);
        if(anObject.priceGen != null)
            anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countGen = set.getBigDecimal(7);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGen = set.getBigDecimal(8);
        if(anObject.sumGen != null)
            anObject.sumGen = anObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.modify_time = set.getLong(9);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.planRef.code = set.getInt(10);
        if ( set.wasNull() )
            anObject.planRef.code = Integer.MIN_VALUE;
        anObject.plan2CTypeRef.code = set.getInt(11);
        if ( set.wasNull() )
            anObject.plan2CTypeRef.code = Integer.MIN_VALUE;
        if(anObject.planRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlanRef(
        new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
    }
        if(anObject.plan2CTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlan2CTypeRef(
        new com.ksoe.energynet.dataminer.generated.ENPlanWork2ClassificationTypeDAOGen(connection,getUserProfile()).getRef(anObject.plan2CTypeRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENCalcMaterialsUsageRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENCalcMaterialsUsageRef ref = new com.ksoe.energynet.valueobject.references.ENCalcMaterialsUsageRef();
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

    selectStr = "DELETE FROM  ENCALCMATERIALSUSAGE WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENCalcMaterialsUsage object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENCalcMaterialsUsage.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENCalcMaterialsUsage.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENCalcMaterialsUsage.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENCalcMaterialsUsage.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENCalcMaterialsUsage.getObject%} access denied");

    selectStr =

    "SELECT  ENCALCMATERIALSUSAGE.CODE FROM  ENCALCMATERIALSUSAGE WHERE  ENCALCMATERIALSUSAGE.CODE = ?";
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
    _checkConditionToken(condition,"code","ENCALCMATERIALSUSAGE.CODE");
    _checkConditionToken(condition,"numbergen","ENCALCMATERIALSUSAGE.NUMBERGEN");
    _checkConditionToken(condition,"classificationtypenumber","ENCALCMATERIALSUSAGE.CLASSIFICATIONTYPENMBR");
    _checkConditionToken(condition,"materialname","ENCALCMATERIALSUSAGE.MATERIALNAME");
    _checkConditionToken(condition,"measureunitname","ENCALCMATERIALSUSAGE.MEASUREUNITNAME");
    _checkConditionToken(condition,"pricegen","ENCALCMATERIALSUSAGE.PRICEGEN");
    _checkConditionToken(condition,"countgen","ENCALCMATERIALSUSAGE.COUNTGEN");
    _checkConditionToken(condition,"sumgen","ENCALCMATERIALSUSAGE.SUMGEN");
    _checkConditionToken(condition,"modify_time","ENCALCMATERIALSUSAGE.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"planref","PLANREFCODE");
    _checkConditionToken(condition,"planref.code","PLANREFCODE");
    _checkConditionToken(condition,"plan2ctyperef","PLAN2CTYPEREFCODE");
    _checkConditionToken(condition,"plan2ctyperef.code","PLAN2CTYPEREFCODE");
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

    private void _collectAutoIncrementFields(ENCalcMaterialsUsage anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENCALCMATERIALSUSAGE", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENCALCMATERIALSUSAGE", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENCALCMATERIALSUSAGE", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENCALCMATERIALSUSAGE");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENCalcMaterialsUsageDAO
