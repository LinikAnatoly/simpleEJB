
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
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
import com.ksoe.energynet.valueobject.ENSITFeature;
import com.ksoe.energynet.valueobject.brief.ENSITFeatureShort;
import com.ksoe.energynet.valueobject.filter.ENSITFeatureFilter;
import com.ksoe.energynet.valueobject.lists.ENSITFeatureShortList;
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
  *  DAO Generated for ENSITFeature;
  *
  */

public class ENSITFeatureDAOGen extends GenericDataMiner {

  public ENSITFeatureDAOGen() {super();}
  public ENSITFeatureDAOGen(Connection aConnection) {super(aConnection);}
  public ENSITFeatureDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENSITFeatureDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENSITFeatureDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENSITFeature inObject) throws PersistenceException
   {
      ENSITFeature obj = new ENSITFeature();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.name != obj.name){
       return false;
     }

     if (inObject.value != obj.value){
       return false;
     }
     if (inObject.equipment.code != obj.equipment.code){
        return false;
     }
     if (inObject.featureType.code != obj.featureType.code){
        return false;
     }
      return true;
   }

   public int add(ENSITFeature anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENSITFeature anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENSITFEATURE (CODE,NAME,VALUE,EQUIPMENTCODE,FEATURETYPECODE) VALUES (?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.name);
      statement.setString(3,anObject.value);
      if (anObject.equipment.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENSITEquipmentDAOGen(connection,getUserProfile()).exists(anObject.equipment.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSITFeature.equipment.code%} = {%"+anObject.equipment.code+"%}");
        statement.setInt(4,anObject.equipment.code);
      }
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.featureType.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENSITFeatureTypeDAOGen(connection,getUserProfile()).exists(anObject.featureType.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSITFeature.featureType.code%} = {%"+anObject.featureType.code+"%}");
        statement.setInt(5,anObject.featureType.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENSITFeatureDAOGen.add%}",e);
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

   public void save(ENSITFeature anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENSITFeature anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("NAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("VALUE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("EQUIPMENT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FEATURETYPE") == 0)
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
        "UPDATE ENSITFEATURE SET  NAME = ? , VALUE = ? , EQUIPMENTCODE = ? , FEATURETYPECODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENSITFEATURE SET ";
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
      statement.setString(2,anObject.value);
      if (anObject.equipment.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.equipment.code);
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.featureType.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.featureType.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
          statement.setInt(5,anObject.code);
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
            if("VALUE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.value);
                continue;
             }
            if("EQUIPMENT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.equipment.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.equipment.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("FEATURETYPE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.featureType.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.featureType.code);
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

   } // end of save(ENSITFeature anObject,String[] anAttributes)


 public ENSITFeatureShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENSITFeature filterObject = new ENSITFeature();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENSITFeatureShort)list.get(0);
   return null;
  }

  public ENSITFeatureShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENSITFeatureShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENSITFeatureShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENSITFeatureShortList getFilteredList(ENSITFeature filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENSITFeatureShortList getScrollableFilteredList(ENSITFeature aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENSITFeatureShortList getScrollableFilteredList(ENSITFeature aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENSITFeatureShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENSITFeatureShortList getScrollableFilteredList(ENSITFeatureFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENSITFeatureShortList getScrollableFilteredList(ENSITFeatureFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENSITFeatureShortList getScrollableFilteredList(ENSITFeature aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENSITFeatureShortList getScrollableFilteredList(ENSITFeature aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENSITFeatureShortList result = new ENSITFeatureShortList();
    ENSITFeatureShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSITFEATURE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENSITFEATURE.CODE"+
     ",ENSITFEATURE.NAME"+
     ",ENSITFEATURE.VALUE"+

      ", ENSITEQUIPMENT.CODE " +
      ", ENSITEQUIPMENT.NAME " +
      ", ENSITEQUIPMENT.SERIALNUMBER " +
      ", ENSITEQUIPMENT.SUPPLIERNAME " +
      ", ENSITEQUIPMENT.NUM " +
      ", ENSITEQUIPMENT.SUPPLIERDATE " +
      ", ENSITEQUIPMENT.LISENCEPACK " +
      ", ENSITEQUIPMENT.DESCR " +
      ", ENSITEQUIPMENT.LOCATION " +
      ", ENSITEQUIPMENT.INSTALLDATE " +
      ", ENSITEQUIPMENT.INPUTDATE " +
      ", ENSITFEATURETYPE.CODE " +
      ", ENSITFEATURETYPE.NAME " +
      ", ENSITFEATURETYPE.DESCRIPTION " +
     " FROM ENSITFEATURE " +
     ", ENSITEQUIPMENT " +
     ", ENSITFEATURETYPE " +
     //" WHERE "
    "";
     whereStr = " ENSITEQUIPMENT.CODE = ENSITFEATURE.EQUIPMENTCODE" ; //+
      whereStr = whereStr +" AND ENSITFEATURETYPE.CODE = ENSITFEATURE.FEATURETYPECODE" ; //+
        //selectStr = selectStr + " ${s} ENSITFEATURE.CODE IN ( SELECT ENSITFEATURE.CODE FROM ENSITFEATURE ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITFEATURE.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSITFEATURE.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSITFEATURE.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.value != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.value.indexOf('*',0) < 0 && aFilterObject.value.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSITFEATURE.VALUE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSITFEATURE.VALUE) LIKE UPPER(?)";
         }
        if(aFilterObject.equipment.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSITFEATURE.EQUIPMENTCODE = ? ";
        }
        if(aFilterObject.featureType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSITFEATURE.FEATURETYPECODE = ? ";
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
         selectStr = selectStr + " WHERE" + whereStr;

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

           if(aFilterObject.value != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.value);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
       if(aFilterObject.equipment.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.equipment.code);
       }
       if(aFilterObject.featureType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.featureType.code);
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

        anObject = new ENSITFeatureShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.value = set.getString(3);


        anObject.equipmentCode = set.getInt(4);

        anObject.equipmentName = set.getString(5);

        anObject.equipmentSerialnumber = set.getString(6);

        anObject.equipmentSuppliername = set.getString(7);

        anObject.equipmentNum = set.getString(8);

        anObject.equipmentSupplierdate = set.getDate(9);

        anObject.equipmentLisencepack = set.getString(10);

        anObject.equipmentDescr = set.getString(11);

        anObject.equipmentLocation = set.getString(12);

        anObject.equipmentInstalldate = set.getDate(13);

        anObject.equipmentInputdate = set.getDate(14);

        anObject.featureTypeCode = set.getInt(15);

        anObject.featureTypeName = set.getString(16);

        anObject.featureTypeDesc = set.getString(17);

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

  public int[] getFilteredCodeArrayOLD(ENSITFeature aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENSITFEATURE.CODE FROM ENSITFEATURE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSITFEATURE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITFEATURE.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITFEATURE.NAME = ?";
             else
                 whereStr = whereStr + "  ENSITFEATURE.NAME LIKE ?";
         }
         if (aFilterObject.value != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.value.indexOf('*',0) < 0 && aFilterObject.value.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITFEATURE.VALUE = ?";
             else
                 whereStr = whereStr + "  ENSITFEATURE.VALUE LIKE ?";
         }
        if(aFilterObject.equipment.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSITFEATURE.EQUIPMENTCODE = ? ";
        }
        if(aFilterObject.featureType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSITFEATURE.FEATURETYPECODE = ? ";
        }

      }

      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";
         whereStr = whereStr + " (" + condition + ")";
      }

     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE" + whereStr;

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
                 whereStr = whereStr + " ENSITFEATURE.NAME = ?";
             else
                 whereStr = whereStr + " ENSITFEATURE.NAME LIKE ?";

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
         if (aFilterObject.value != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.value.indexOf('*',0) < 0 && aFilterObject.value.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSITFEATURE.VALUE = ?";
             else
                 whereStr = whereStr + " ENSITFEATURE.VALUE LIKE ?";

           if(aFilterObject.value != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.value);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
       if(aFilterObject.equipment.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.equipment.code);
       }
       if(aFilterObject.featureType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.featureType.code);
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

  public int[] getFilteredCodeArray(ENSITFeatureFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENSITFeature aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENSITFEATURE.CODE FROM ENSITFEATURE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSITFEATURE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITFEATURE.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITFEATURE.NAME = ?";
             else
                 whereStr = whereStr + "  ENSITFEATURE.NAME LIKE ?";
         }
         if (aFilterObject.value != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.value.indexOf('*',0) < 0 && aFilterObject.value.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITFEATURE.VALUE = ?";
             else
                 whereStr = whereStr + "  ENSITFEATURE.VALUE LIKE ?";
         }
        if(aFilterObject.equipment.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSITFEATURE.EQUIPMENTCODE = ? ";
        }
        if(aFilterObject.featureType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSITFEATURE.FEATURETYPECODE = ? ";
        }

      }

      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";
         whereStr = whereStr + " (" + condition + ")";
      }

     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE" + whereStr;

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
                 whereStr = whereStr + " ENSITFEATURE.NAME = ?";
             else
                 whereStr = whereStr + " ENSITFEATURE.NAME LIKE ?";

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
         if (aFilterObject.value != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.value.indexOf('*',0) < 0 && aFilterObject.value.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSITFEATURE.VALUE = ?";
             else
                 whereStr = whereStr + " ENSITFEATURE.VALUE LIKE ?";

           if(aFilterObject.value != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.value);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
       if(aFilterObject.equipment.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.equipment.code);
       }
       if(aFilterObject.featureType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.featureType.code);
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


   public ENSITFeature getObject(int uid) throws PersistenceException
   {
    ENSITFeature result = new ENSITFeature();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENSITFeature anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENSITFEATURE.CODE, ENSITFEATURE.NAME, ENSITFEATURE.VALUE, ENSITFEATURE.EQUIPMENTCODE, ENSITFEATURE.FEATURETYPECODE "
    +" FROM ENSITFEATURE WHERE ENSITFEATURE.CODE = ?";

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
        anObject.value = set.getString(3);
        anObject.equipment.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.equipment.code = Integer.MIN_VALUE;
        anObject.featureType.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.featureType.code = Integer.MIN_VALUE;
        if(anObject.equipment.code != Integer.MIN_VALUE)
        {
           anObject.setEquipment(
        new com.ksoe.energynet.dataminer.generated.ENSITEquipmentDAOGen(connection,getUserProfile()).getObject(anObject.equipment.code));
    }
        if(anObject.featureType.code != Integer.MIN_VALUE)
        {
           anObject.setFeatureType(
        new com.ksoe.energynet.dataminer.generated.ENSITFeatureTypeDAOGen(connection,getUserProfile()).getObject(anObject.featureType.code));
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


  public com.ksoe.energynet.valueobject.references.ENSITFeatureRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENSITFeatureRef ref = new com.ksoe.energynet.valueobject.references.ENSITFeatureRef();
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

    selectStr = "DELETE FROM  ENSITFEATURE WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENSITFeature object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENSITFeature.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENSITFeature.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENSITFeature.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENSITFeature.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENSITFeature.getObject%} access denied");

    selectStr =

    "SELECT  ENSITFEATURE.CODE FROM  ENSITFEATURE WHERE  ENSITFEATURE.CODE = ?";
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
    _checkConditionToken(condition,"code","ENSITFEATURE.CODE");
    _checkConditionToken(condition,"name","ENSITFEATURE.NAME");
    _checkConditionToken(condition,"value","ENSITFEATURE.VALUE");
      // relationship conditions
    _checkConditionToken(condition,"equipment","EQUIPMENTCODE");
    _checkConditionToken(condition,"equipment.code","EQUIPMENTCODE");
    _checkConditionToken(condition,"featuretype","FEATURETYPECODE");
    _checkConditionToken(condition,"featuretype.code","FEATURETYPECODE");
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

   private void _collectAutoIncrementFields(ENSITFeature anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENSITFEATURE", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENSITFEATURE", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENSITFEATURE", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENSITFEATURE");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENSITFeatureDAO

