
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


import java.util.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.energynet.valueobject.ENTravelSheetFuel2FINMaterials;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuel2FINMaterialsFilter;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetFuel2FINMaterialsShort;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuel2FINMaterialsShortList;


/**
 * DAO Object for ENTravelSheetFuel2FINMaterials;
 *
 */

public class ENTravelSheetFuel2FINMaterialsDAOGen extends GenericDataMiner {

   public ENTravelSheetFuel2FINMaterialsDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENTravelSheetFuel2FINMaterialsDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   protected boolean isEqual(ENTravelSheetFuel2FINMaterials inObject) throws PersistenceException
   {
      ENTravelSheetFuel2FINMaterials obj = new ENTravelSheetFuel2FINMaterials();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.userGen == null && obj.userGen == null){}
	else
		if(inObject.userGen == null || obj.userGen == null) return false;
		else
			if ( ! inObject.userGen.equals(obj.userGen)){
				return false;
			}

	if(inObject.dateEdit == null && obj.dateEdit == null){}
	else
		if(inObject.dateEdit == null || obj.dateEdit == null) return false;
		else
			if ( ! inObject.dateEdit.equals(obj.dateEdit)){
				return false;
			}
     if (inObject.travelSheetFuelRef.code != obj.travelSheetFuelRef.code){
        return false;
     }
     if (inObject.finMaterialsRef.code != obj.finMaterialsRef.code){
        return false;
     }
      return true;
   }

   public int add(ENTravelSheetFuel2FINMaterials anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTravelSheetFuel2FINMaterials anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTRAVELSHETFL2FNMTRLS (CODE,MODIFY_TIME,USERGEN,DATEEDIT,TRAVELSHEETFUELREFCODE,FINMATERIALSREFCODE) VALUES (?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(2,null);
      else
        statement.setBigDecimal(2,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(3,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(4,null);
      else
        statement.setTimestamp(4,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.travelSheetFuelRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTravelSheetFuelDAOGen(connection,getUserProfile()).exists(anObject.travelSheetFuelRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTravelSheetFuel2FINMaterials.travelSheetFuelRef.code%} = {%"+anObject.travelSheetFuelRef.code+"%}");
        statement.setInt(5,anObject.travelSheetFuelRef.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.finMaterialsRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINMaterialsDAOGen(connection,getUserProfile()).exists(anObject.finMaterialsRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTravelSheetFuel2FINMaterials.finMaterialsRef.code%} = {%"+anObject.finMaterialsRef.code+"%}");
        statement.setInt(6,anObject.finMaterialsRef.code);
      }
      else
        statement.setNull(6,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTravelSheetFuel2FINMaterialsDAOGen.add%}",e);
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

   public void save(ENTravelSheetFuel2FINMaterials anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTravelSheetFuel2FINMaterials anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENTravelSheetFuel2FINMaterials oldObject = new ENTravelSheetFuel2FINMaterials();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENTravelSheetFuel2FINMaterials.modify_time_Field+" FROM  ENTRAVELSHETFL2FNMTRLS WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("MODIFY_TIME") == 0)
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
          if(fieldNameStr.compareTo("TRAVELSHEETFUELREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINMATERIALSREF") == 0)
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
        "UPDATE ENTRAVELSHETFL2FNMTRLS SET  MODIFY_TIME = ? , USERGEN = ? , DATEEDIT = ? , TRAVELSHEETFUELREFCODE = ? , FINMATERIALSREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRAVELSHEETFUEL2FINMATERIALS SET ";
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
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(1,null);
      else
        statement.setBigDecimal(1,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(2,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(3,null);
      else
        statement.setTimestamp(3,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.travelSheetFuelRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.travelSheetFuelRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.finMaterialsRef.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.finMaterialsRef.code);
      else
        statement.setNull(5,java.sql.Types.INTEGER);
          statement.setInt(6,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(i+1,null);
                else
                     statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
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
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateEdit.getTime()));
                continue;
             }
            if("TRAVELSHEETFUELREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.travelSheetFuelRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.travelSheetFuelRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("FINMATERIALSREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.finMaterialsRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.finMaterialsRef.code);
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

   } // end of save(ENTravelSheetFuel2FINMaterials anObject,String[] anAttributes)


 public ENTravelSheetFuel2FINMaterialsShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTravelSheetFuel2FINMaterials filterObject = new ENTravelSheetFuel2FINMaterials();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTravelSheetFuel2FINMaterialsShort)list.get(0);
   return null;
  }

  public ENTravelSheetFuel2FINMaterialsShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTravelSheetFuel2FINMaterialsShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTravelSheetFuel2FINMaterialsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTravelSheetFuel2FINMaterialsShortList getFilteredList(ENTravelSheetFuel2FINMaterials filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTravelSheetFuel2FINMaterialsShortList getScrollableFilteredList(ENTravelSheetFuel2FINMaterials aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTravelSheetFuel2FINMaterialsShortList getScrollableFilteredList(ENTravelSheetFuel2FINMaterials aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTravelSheetFuel2FINMaterialsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTravelSheetFuel2FINMaterialsShortList getScrollableFilteredList(ENTravelSheetFuel2FINMaterialsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTravelSheetFuel2FINMaterialsShortList getScrollableFilteredList(ENTravelSheetFuel2FINMaterialsFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTravelSheetFuel2FINMaterialsShortList getScrollableFilteredList(ENTravelSheetFuel2FINMaterials aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTravelSheetFuel2FINMaterialsShortList getScrollableFilteredList(ENTravelSheetFuel2FINMaterials aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTravelSheetFuel2FINMaterialsShortList result = new ENTravelSheetFuel2FINMaterialsShortList();
    ENTravelSheetFuel2FINMaterialsShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHETFL2FNMTRLS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRAVELSHETFL2FNMTRLS.CODE"+
     ",ENTRAVELSHETFL2FNMTRLS.USERGEN"+
     ",ENTRAVELSHETFL2FNMTRLS.DATEEDIT"+

      ", ENTRAVELSHEETFUEL.CODE " +
      ", ENTRAVELSHEETFUEL.COUNTGEN " +
      ", ENTRAVELSHEETFUEL.SERIES " +
      ", ENTRAVELSHEETFUEL.NUMBERS " +
      ", ENTRAVELSHEETFUEL.DATEGEN " +
      ", ENTRAVELSHEETFUEL.ISVRTU " +
      ", FINMATERIALS.CODE " +
      ", FINMATERIALS.NN " +
      ", FINMATERIALS.MAT_NAME " +
      ", FINMATERIALS.MU_NAME " +
      ", FINMATERIALS.DIV_NAME " +
      ", FINMATERIALS.PARTY_ID " +
      ", FINMATERIALS.PARTNER_NAME " +
      ", FINMATERIALS.DOC_DATE " +
      ", FINMATERIALS.PARTY_DISCRIPTION " +
      ", FINMATERIALS.REST_PURPOSE_ID " +
      ", FINMATERIALS.REST_PURPOSE_NAME " +
      ", FINMATERIALS.REST_PURPOSE_TYPE_ID " +
      ", FINMATERIALS.BUDGET_CORE_ID " +
      ", FINMATERIALS.FRC_CODE " +
      ", FINMATERIALS.FRC_NAME " +
      ", FINMATERIALS.CALC_PRICE " +
      ", FINMATERIALS.QUANTITY " +
      ", FINMATERIALS.PRICE " +
      ", FINMATERIALS.COST " +
      ", FINMATERIALS.BAL_SCH " +
      ", FINMATERIALS.FULLQUANTITY " +
      ", FINMATERIALS.FULLCOST " +
      ", FINMATERIALS.WEAR_DATE " +
      ", FINMATERIALS.USERGEN " +
      ", FINMATERIALS.DATEEDIT " +
      ", FINMATERIALS.EXTRA_CARGO " +
      ", FINMATERIALS.COST_EXT " +
     " FROM ENTRAVELSHETFL2FNMTRLS " +
     ", ENTRAVELSHEETFUEL " +
     ", FINMATERIALS " +
     //" WHERE "
  "";
     whereStr = " ENTRAVELSHEETFUEL.CODE = ENTRAVELSHETFL2FNMTRLS.TRAVELSHEETFUELREFCODE" ; //+
      whereStr = whereStr +" AND FINMATERIALS.CODE = ENTRAVELSHETFL2FNMTRLS.FINMATERIALSREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENTRAVELSHETFL2FNMTRLS.CODE IN ( SELECT ENTRAVELSHETFL2FNMTRLS.CODE FROM ENTRAVELSHETFL2FNMTRLS ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHETFL2FNMTRLS.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHETFL2FNMTRLS.MODIFY_TIME = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRAVELSHETFL2FNMTRLS.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRAVELSHETFL2FNMTRLS.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHETFL2FNMTRLS.DATEEDIT = ?";
        }
        if(aFilterObject.travelSheetFuelRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHETFL2FNMTRLS.TRAVELSHEETFUELREFCODE = ? ";
        }
        if(aFilterObject.finMaterialsRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHETFL2FNMTRLS.FINMATERIALSREFCODE = ? ";
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

    selectStr = selectStr + " OFFSET " + fromPosition;
    if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

    try
     {
      statement = connection.prepareStatement(selectStr);
      int number = 0;
      if(aFilterObject != null){
         if(aFilterObject.code != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.code);
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
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
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
       if(aFilterObject.travelSheetFuelRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetFuelRef.code);
       }
       if(aFilterObject.finMaterialsRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finMaterialsRef.code);
       }
      }

      if(condition.length() > 0 && aBindObjects != null)
       _bindObjectsToPreparedStatement(statement,aBindObjects,number);

      set = statement.executeQuery();
      int i;
      for (i = 0; set.next(); i++) {
        /*
        if (i < fromPosition)
          continue;
        else if (i >= fromPosition + quantity) {
          i++;
          break;
        } */

        anObject = new ENTravelSheetFuel2FINMaterialsShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.userGen = set.getString(2);
        anObject.dateEdit = set.getTimestamp(3);

        anObject.travelSheetFuelRefCode = set.getInt(4);
    if(set.wasNull())
      anObject.travelSheetFuelRefCode = Integer.MIN_VALUE;
        anObject.travelSheetFuelRefCountGen = set.getBigDecimal(5);
        if(anObject.travelSheetFuelRefCountGen != null)
          anObject.travelSheetFuelRefCountGen = anObject.travelSheetFuelRefCountGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetFuelRefSeries = set.getString(6);
        anObject.travelSheetFuelRefNumbers = set.getString(7);
        anObject.travelSheetFuelRefDateGen = set.getDate(8);
        anObject.travelSheetFuelRefIsVRTU = set.getInt(9);
    if(set.wasNull())
      anObject.travelSheetFuelRefIsVRTU = Integer.MIN_VALUE;
        anObject.finMaterialsRefCode = set.getInt(10);
    if(set.wasNull())
      anObject.finMaterialsRefCode = Integer.MIN_VALUE;
        anObject.finMaterialsRefNn = set.getString(11);
        anObject.finMaterialsRefMat_name = set.getString(12);
        anObject.finMaterialsRefMu_name = set.getString(13);
        anObject.finMaterialsRefDiv_name = set.getString(14);
        anObject.finMaterialsRefParty_id = set.getInt(15);
    if(set.wasNull())
      anObject.finMaterialsRefParty_id = Integer.MIN_VALUE;
        anObject.finMaterialsRefPartner_name = set.getString(16);
        anObject.finMaterialsRefDoc_date = set.getDate(17);
        anObject.finMaterialsRefParty_discription = set.getString(18);
        anObject.finMaterialsRefRest_purpose_id = set.getInt(19);
    if(set.wasNull())
      anObject.finMaterialsRefRest_purpose_id = Integer.MIN_VALUE;
        anObject.finMaterialsRefRest_purpose_name = set.getString(20);
        anObject.finMaterialsRefRest_purpose_type_id = set.getInt(21);
    if(set.wasNull())
      anObject.finMaterialsRefRest_purpose_type_id = Integer.MIN_VALUE;
        anObject.finMaterialsRefBudget_core_id = set.getInt(22);
    if(set.wasNull())
      anObject.finMaterialsRefBudget_core_id = Integer.MIN_VALUE;
        anObject.finMaterialsRefFrc_code = set.getInt(23);
    if(set.wasNull())
      anObject.finMaterialsRefFrc_code = Integer.MIN_VALUE;
        anObject.finMaterialsRefFrc_name = set.getString(24);
        anObject.finMaterialsRefCalc_price = set.getBigDecimal(25);
        if(anObject.finMaterialsRefCalc_price != null)
          anObject.finMaterialsRefCalc_price = anObject.finMaterialsRefCalc_price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.finMaterialsRefQuantity = set.getBigDecimal(26);
        if(anObject.finMaterialsRefQuantity != null)
          anObject.finMaterialsRefQuantity = anObject.finMaterialsRefQuantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.finMaterialsRefPrice = set.getBigDecimal(27);
        if(anObject.finMaterialsRefPrice != null)
          anObject.finMaterialsRefPrice = anObject.finMaterialsRefPrice.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.finMaterialsRefCost = set.getBigDecimal(28);
        if(anObject.finMaterialsRefCost != null)
          anObject.finMaterialsRefCost = anObject.finMaterialsRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.finMaterialsRefBal_sch = set.getString(29);
        anObject.finMaterialsRefFullQuantity = set.getBigDecimal(30);
        if(anObject.finMaterialsRefFullQuantity != null)
          anObject.finMaterialsRefFullQuantity = anObject.finMaterialsRefFullQuantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.finMaterialsRefFullCost = set.getBigDecimal(31);
        if(anObject.finMaterialsRefFullCost != null)
          anObject.finMaterialsRefFullCost = anObject.finMaterialsRefFullCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.finMaterialsRefWear_date = set.getDate(32);
        anObject.finMaterialsRefUserGen = set.getString(33);
        anObject.finMaterialsRefDateEdit = set.getTimestamp(34);
        anObject.finMaterialsRefExtra_cargo = set.getBigDecimal(35);
        if(anObject.finMaterialsRefExtra_cargo != null)
          anObject.finMaterialsRefExtra_cargo = anObject.finMaterialsRefExtra_cargo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.finMaterialsRefCost_ext = set.getBigDecimal(36);
        if(anObject.finMaterialsRefCost_ext != null)
          anObject.finMaterialsRefCost_ext = anObject.finMaterialsRefCost_ext.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

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

  public int[] getFilteredCodeArrayOLD(ENTravelSheetFuel2FINMaterials aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRAVELSHETFL2FNMTRLS.CODE FROM ENTRAVELSHETFL2FNMTRLS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHETFL2FNMTRLS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHETFL2FNMTRLS.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHETFL2FNMTRLS.MODIFY_TIME = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHETFL2FNMTRLS.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHETFL2FNMTRLS.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHETFL2FNMTRLS.DATEEDIT = ?";
        }
        if(aFilterObject.travelSheetFuelRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHETFL2FNMTRLS.TRAVELSHEETFUELREFCODE = ? ";
        }
        if(aFilterObject.finMaterialsRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHETFL2FNMTRLS.FINMATERIALSREFCODE = ? ";
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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHETFL2FNMTRLS.USERGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHETFL2FNMTRLS.USERGEN LIKE ?";

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
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
       if(aFilterObject.travelSheetFuelRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetFuelRef.code);
       }
       if(aFilterObject.finMaterialsRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finMaterialsRef.code);
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

  public int[] getFilteredCodeArray(ENTravelSheetFuel2FINMaterialsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTravelSheetFuel2FINMaterials aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRAVELSHETFL2FNMTRLS.CODE FROM ENTRAVELSHETFL2FNMTRLS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHETFL2FNMTRLS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHETFL2FNMTRLS.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHETFL2FNMTRLS.MODIFY_TIME = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHETFL2FNMTRLS.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHETFL2FNMTRLS.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHETFL2FNMTRLS.DATEEDIT = ?";
        }
        if(aFilterObject.travelSheetFuelRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHETFL2FNMTRLS.TRAVELSHEETFUELREFCODE = ? ";
        }
        if(aFilterObject.finMaterialsRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHETFL2FNMTRLS.FINMATERIALSREFCODE = ? ";
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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHETFL2FNMTRLS.USERGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHETFL2FNMTRLS.USERGEN LIKE ?";

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
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
       if(aFilterObject.travelSheetFuelRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetFuelRef.code);
       }
       if(aFilterObject.finMaterialsRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finMaterialsRef.code);
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


   public ENTravelSheetFuel2FINMaterials getObject(int uid) throws PersistenceException
   {
    ENTravelSheetFuel2FINMaterials result = new ENTravelSheetFuel2FINMaterials();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTravelSheetFuel2FINMaterials anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTRAVELSHETFL2FNMTRLS.CODE, ENTRAVELSHETFL2FNMTRLS.MODIFY_TIME, ENTRAVELSHETFL2FNMTRLS.USERGEN, ENTRAVELSHETFL2FNMTRLS.DATEEDIT, ENTRAVELSHETFL2FNMTRLS.TRAVELSHEETFUELREFCODE, ENTRAVELSHETFL2FNMTRLS.FINMATERIALSREFCODE "
    +" FROM ENTRAVELSHETFL2FNMTRLS WHERE ENTRAVELSHETFL2FNMTRLS.CODE = ?";

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
        anObject.modify_time = set.getLong(2);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.userGen = set.getString(3);
        anObject.dateEdit = set.getTimestamp(4);
        anObject.travelSheetFuelRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.travelSheetFuelRef.code = Integer.MIN_VALUE;
        anObject.finMaterialsRef.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.finMaterialsRef.code = Integer.MIN_VALUE;
        if(anObject.travelSheetFuelRef.code != Integer.MIN_VALUE)
        {
           anObject.setTravelSheetFuelRef(
      new com.ksoe.energynet.dataminer.generated.ENTravelSheetFuelDAOGen(connection,getUserProfile()).getRef(anObject.travelSheetFuelRef.code));
    }
        if(anObject.finMaterialsRef.code != Integer.MIN_VALUE)
        {
           anObject.setFinMaterialsRef(
      new com.ksoe.energynet.dataminer.generated.FINMaterialsDAOGen(connection,getUserProfile()).getRef(anObject.finMaterialsRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENTravelSheetFuel2FINMaterialsRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTravelSheetFuel2FINMaterialsRef ref = new com.ksoe.energynet.valueobject.references.ENTravelSheetFuel2FINMaterialsRef();
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

    selectStr = "DELETE FROM  ENTRAVELSHETFL2FNMTRLS WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTravelSheetFuel2FINMaterials object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTravelSheetFuel2FINMaterials.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheetFuel2FINMaterials.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTravelSheetFuel2FINMaterials.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheetFuel2FINMaterials.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTravelSheetFuel2FINMaterials.getObject%} access denied");

    selectStr =

    "SELECT  ENTRAVELSHETFL2FNMTRLS.CODE FROM  ENTRAVELSHETFL2FNMTRLS WHERE  ENTRAVELSHETFL2FNMTRLS.CODE = ?";
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
    _checkConditionToken(condition,"code","ENTRAVELSHETFL2FNMTRLS.CODE");
    _checkConditionToken(condition,"modify_time","ENTRAVELSHETFL2FNMTRLS.MODIFY_TIME");
    _checkConditionToken(condition,"usergen","ENTRAVELSHETFL2FNMTRLS.USERGEN");
    _checkConditionToken(condition,"dateedit","ENTRAVELSHETFL2FNMTRLS.DATEEDIT");
      // relationship conditions
    _checkConditionToken(condition,"travelsheetfuelref","TRAVELSHEETFUELREFCODE");
    _checkConditionToken(condition,"travelsheetfuelref.code","TRAVELSHEETFUELREFCODE");
    _checkConditionToken(condition,"finmaterialsref","FINMATERIALSREFCODE");
    _checkConditionToken(condition,"finmaterialsref.code","FINMATERIALSREFCODE");
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

  private void _collectAutoIncrementFields(ENTravelSheetFuel2FINMaterials anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENTRAVELSHETFL2FNMTRLS", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENTRAVELSHETFL2FNMTRLS", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENTRAVELSHETFL2FNMTRLS", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENTRAVELSHETFL2FNMTRLS");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENTravelSheetFuel2FINMaterialsDAO
