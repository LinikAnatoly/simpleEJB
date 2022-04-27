
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
import com.ksoe.energynet.valueobject.ENAct2CostRecovery;
import com.ksoe.energynet.valueobject.brief.ENAct2CostRecoveryShort;
import com.ksoe.energynet.valueobject.filter.ENAct2CostRecoveryFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2CostRecoveryShortList;
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
  *  DAO Generated for ENAct2CostRecovery;
  *
  */

public class ENAct2CostRecoveryDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENAct2CostRecoveryDAOGen() {super();}
  //public ENAct2CostRecoveryDAOGen(Connection aConnection) {super(aConnection);}
  //public ENAct2CostRecoveryDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENAct2CostRecoveryDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAct2CostRecoveryDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENAct2CostRecovery inObject) throws PersistenceException
   {
      ENAct2CostRecovery obj = new ENAct2CostRecovery();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.name != obj.name){
       return false;
     }

     if (inObject.measureUnitName != obj.measureUnitName){
       return false;
     }

     if ( ! inObject.countGen.equals(obj.countGen)){
       return false;
     }

     if ( ! inObject.price.equals(obj.price)){
       return false;
     }

     if ( ! inObject.summa.equals(obj.summa)){
       return false;
     }
     if (inObject.actRef.code != obj.actRef.code){
        return false;
     }
     if (inObject.classificationTypeRef.code != obj.classificationTypeRef.code){
        return false;
     }
      return true;
   }

   public int add(ENAct2CostRecovery anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENAct2CostRecovery anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENACT2COSTRECOVERY (CODE,NAME,MEASUREUNITNAME,COUNTGEN,PRICE,SUMMA,ACTREFCODE,CLASSIFICATIONTYPERFCD) VALUES (?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.name);
      statement.setString(3,anObject.measureUnitName);
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.countGen);
      if (anObject.price != null)
        anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.price);
      if (anObject.summa != null)
        anObject.summa = anObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.summa);
      if (anObject.actRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).exists(anObject.actRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAct2CostRecovery.actRef.code%} = {%"+anObject.actRef.code+"%}");
        statement.setInt(7,anObject.actRef.code);
      }
      else
        statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.classificationTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKClassificationTypeDAOGen(connection,getUserProfile()).exists(anObject.classificationTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENAct2CostRecovery.classificationTypeRef.code%} = {%"+anObject.classificationTypeRef.code+"%}");
        statement.setInt(8,anObject.classificationTypeRef.code);
      }
      else
        statement.setNull(8,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENAct2CostRecoveryDAOGen.add%}",e);
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

   public void save(ENAct2CostRecovery anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENAct2CostRecovery anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("MEASUREUNITNAME") == 0)
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
          if(fieldNameStr.compareTo("PRICE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMMA") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ACTREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CLASSIFICATIONTYPEREF") == 0)
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
        "UPDATE ENACT2COSTRECOVERY SET  NAME = ? , MEASUREUNITNAME = ? , COUNTGEN = ? , PRICE = ? , SUMMA = ? , ACTREFCODE = ? , CLASSIFICATIONTYPERFCD = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENACT2COSTRECOVERY SET ";
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
      statement.setString(2,anObject.measureUnitName);
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.countGen);

      if (anObject.price != null)
        anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.price);

      if (anObject.summa != null)
        anObject.summa = anObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.summa);

      if (anObject.actRef.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.actRef.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.classificationTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(7,anObject.classificationTypeRef.code);
      else
        statement.setNull(7,java.sql.Types.INTEGER);
          statement.setInt(8,anObject.code);
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
            if("MEASUREUNITNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.measureUnitName);
                continue;
             }
            if("COUNTGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countGen != null)
                    anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countGen);
                continue;
             }
            if("PRICE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.price != null)
                    anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.price);
                continue;
             }
            if("SUMMA".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.summa != null)
                    anObject.summa = anObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.summa);
                continue;
             }
            if("ACTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.actRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.actRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("CLASSIFICATIONTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.classificationTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.classificationTypeRef.code);
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

   } // end of save(ENAct2CostRecovery anObject,String[] anAttributes)


 public ENAct2CostRecoveryShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENAct2CostRecovery filterObject = new ENAct2CostRecovery();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENAct2CostRecoveryShort)list.get(0);
   return null;
  }

  public ENAct2CostRecoveryShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENAct2CostRecoveryShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENAct2CostRecoveryShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENAct2CostRecoveryShortList getFilteredList(ENAct2CostRecovery filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENAct2CostRecoveryShortList getScrollableFilteredList(ENAct2CostRecovery aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENAct2CostRecoveryShortList getScrollableFilteredList(ENAct2CostRecovery aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENAct2CostRecoveryShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENAct2CostRecoveryShortList getScrollableFilteredList(ENAct2CostRecoveryFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENAct2CostRecoveryShortList getScrollableFilteredList(ENAct2CostRecoveryFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENAct2CostRecoveryShortList getScrollableFilteredList(ENAct2CostRecovery aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENAct2CostRecoveryShortList getScrollableFilteredList(ENAct2CostRecovery aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENAct2CostRecoveryShortList result = new ENAct2CostRecoveryShortList();
    ENAct2CostRecoveryShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACT2COSTRECOVERY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENACT2COSTRECOVERY.CODE"+
     ",ENACT2COSTRECOVERY.NAME"+
     ",ENACT2COSTRECOVERY.MEASUREUNITNAME"+
     ",ENACT2COSTRECOVERY.COUNTGEN"+
     ",ENACT2COSTRECOVERY.PRICE"+
     ",ENACT2COSTRECOVERY.SUMMA"+

      ", ENACT.CODE " +
      ", ENACT.NUMBERGEN " +
      ", ENACT.DATEGEN " +
      ", ENACT.FINDOCCODE " +
      ", ENACT.FINDOCMECHANICCODE " +
      ", ENACT.FINMOLNAME " +
      ", ENACT.FINMECHANICNAME " +
      ", ENACT.INVNUMBER " +
      ", ENACT.USERGEN " +
      ", ENACT.DATEEDIT " +
      ", ENACT.DATEACT " +
      ", TKCLASSIFICATIONTYPE.CODE " +
      ", TKCLASSIFICATIONTYPE.NAME " +
      ", TKCLASSIFICATIONTYPE.KOD " +
     " FROM ENACT2COSTRECOVERY " +
     ", ENACT " +
     ", TKCLASSIFICATIONTYPE " +
     //" WHERE "
    "";
     whereStr = " ENACT.CODE = ENACT2COSTRECOVERY.ACTREFCODE" ; //+
      whereStr = whereStr +" AND TKCLASSIFICATIONTYPE.CODE = ENACT2COSTRECOVERY.CLASSIFICATIONTYPERFCD" ; //+
        //selectStr = selectStr + " ${s} ENACT2COSTRECOVERY.CODE IN ( SELECT ENACT2COSTRECOVERY.CODE FROM ENACT2COSTRECOVERY ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACT2COSTRECOVERY.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACT2COSTRECOVERY.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACT2COSTRECOVERY.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.measureUnitName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.measureUnitName.indexOf('*',0) < 0 && aFilterObject.measureUnitName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACT2COSTRECOVERY.MEASUREUNITNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACT2COSTRECOVERY.MEASUREUNITNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACT2COSTRECOVERY.COUNTGEN = ?";
        }
        if(aFilterObject.price != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACT2COSTRECOVERY.PRICE = ?";
        }
        if(aFilterObject.summa != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACT2COSTRECOVERY.SUMMA = ?";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACT2COSTRECOVERY.ACTREFCODE = ? ";
        }
        if(aFilterObject.classificationTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACT2COSTRECOVERY.CLASSIFICATIONTYPERFCD = ? ";
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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.price != null){
            number++;
            aFilterObject.price = aFilterObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.price);
        }
        if(aFilterObject.summa != null){
            number++;
            aFilterObject.summa = aFilterObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summa);
        }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actRef.code);
       }
       if(aFilterObject.classificationTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.classificationTypeRef.code);
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

        anObject = new ENAct2CostRecoveryShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.measureUnitName = set.getString(3);
        anObject.countGen = set.getBigDecimal(4);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.price = set.getBigDecimal(5);
        if(anObject.price != null)
            anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.summa = set.getBigDecimal(6);
        if(anObject.summa != null)
            anObject.summa = anObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.actRefCode = set.getInt(7);
        if(set.wasNull())
        anObject.actRefCode = Integer.MIN_VALUE;
        anObject.actRefNumberGen = set.getString(8);
        anObject.actRefDateGen = set.getDate(9);
        anObject.actRefFinDocCode = set.getInt(10);
        if(set.wasNull())
        anObject.actRefFinDocCode = Integer.MIN_VALUE;
        anObject.actRefFinDocMechanicCode = set.getInt(11);
        if(set.wasNull())
        anObject.actRefFinDocMechanicCode = Integer.MIN_VALUE;
        anObject.actRefFinMolName = set.getString(12);
        anObject.actRefFinMechanicName = set.getString(13);
        anObject.actRefInvNumber = set.getString(14);
        anObject.actRefUserGen = set.getString(15);
        anObject.actRefDateEdit = set.getDate(16);
        anObject.actRefDateAct = set.getDate(17);
        anObject.classificationTypeRefCode = set.getInt(18);
        if(set.wasNull())
        anObject.classificationTypeRefCode = Integer.MIN_VALUE;
        anObject.classificationTypeRefName = set.getString(19);
        anObject.classificationTypeRefKod = set.getString(20);

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

  public int[] getFilteredCodeArrayOLD(ENAct2CostRecovery aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENACT2COSTRECOVERY.CODE FROM ENACT2COSTRECOVERY";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACT2COSTRECOVERY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACT2COSTRECOVERY.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACT2COSTRECOVERY.NAME = ?";
             else
                 whereStr = whereStr + "  ENACT2COSTRECOVERY.NAME LIKE ?";
         }
         if (aFilterObject.measureUnitName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.measureUnitName.indexOf('*',0) < 0 && aFilterObject.measureUnitName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACT2COSTRECOVERY.MEASUREUNITNAME = ?";
             else
                 whereStr = whereStr + "  ENACT2COSTRECOVERY.MEASUREUNITNAME LIKE ?";
         }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACT2COSTRECOVERY.COUNTGEN = ?";
        }
        if(aFilterObject.price != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACT2COSTRECOVERY.PRICE = ?";
        }
        if(aFilterObject.summa != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACT2COSTRECOVERY.SUMMA = ?";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACT2COSTRECOVERY.ACTREFCODE = ? ";
        }
        if(aFilterObject.classificationTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACT2COSTRECOVERY.CLASSIFICATIONTYPERFCD = ? ";
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
                 whereStr = whereStr + " ENACT2COSTRECOVERY.NAME = ?";
             else
                 whereStr = whereStr + " ENACT2COSTRECOVERY.NAME LIKE ?";

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
         if (aFilterObject.measureUnitName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.measureUnitName.indexOf('*',0) < 0 && aFilterObject.measureUnitName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACT2COSTRECOVERY.MEASUREUNITNAME = ?";
             else
                 whereStr = whereStr + " ENACT2COSTRECOVERY.MEASUREUNITNAME LIKE ?";

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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.price != null){
            number++;
            aFilterObject.price = aFilterObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.price);
        }
        if(aFilterObject.summa != null){
            number++;
            aFilterObject.summa = aFilterObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summa);
        }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actRef.code);
       }
       if(aFilterObject.classificationTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.classificationTypeRef.code);
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

  public int[] getFilteredCodeArray(ENAct2CostRecoveryFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENAct2CostRecovery aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENACT2COSTRECOVERY.CODE FROM ENACT2COSTRECOVERY";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACT2COSTRECOVERY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACT2COSTRECOVERY.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACT2COSTRECOVERY.NAME = ?";
             else
                 whereStr = whereStr + "  ENACT2COSTRECOVERY.NAME LIKE ?";
         }
         if (aFilterObject.measureUnitName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.measureUnitName.indexOf('*',0) < 0 && aFilterObject.measureUnitName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACT2COSTRECOVERY.MEASUREUNITNAME = ?";
             else
                 whereStr = whereStr + "  ENACT2COSTRECOVERY.MEASUREUNITNAME LIKE ?";
         }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACT2COSTRECOVERY.COUNTGEN = ?";
        }
        if(aFilterObject.price != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACT2COSTRECOVERY.PRICE = ?";
        }
        if(aFilterObject.summa != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACT2COSTRECOVERY.SUMMA = ?";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACT2COSTRECOVERY.ACTREFCODE = ? ";
        }
        if(aFilterObject.classificationTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACT2COSTRECOVERY.CLASSIFICATIONTYPERFCD = ? ";
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
                 whereStr = whereStr + " ENACT2COSTRECOVERY.NAME = ?";
             else
                 whereStr = whereStr + " ENACT2COSTRECOVERY.NAME LIKE ?";

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
         if (aFilterObject.measureUnitName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.measureUnitName.indexOf('*',0) < 0 && aFilterObject.measureUnitName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACT2COSTRECOVERY.MEASUREUNITNAME = ?";
             else
                 whereStr = whereStr + " ENACT2COSTRECOVERY.MEASUREUNITNAME LIKE ?";

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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.price != null){
            number++;
            aFilterObject.price = aFilterObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.price);
        }
        if(aFilterObject.summa != null){
            number++;
            aFilterObject.summa = aFilterObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summa);
        }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actRef.code);
       }
       if(aFilterObject.classificationTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.classificationTypeRef.code);
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


   public ENAct2CostRecovery getObject(int uid) throws PersistenceException
   {
    ENAct2CostRecovery result = new ENAct2CostRecovery();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENAct2CostRecovery anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENACT2COSTRECOVERY.CODE, ENACT2COSTRECOVERY.NAME, ENACT2COSTRECOVERY.MEASUREUNITNAME, ENACT2COSTRECOVERY.COUNTGEN, ENACT2COSTRECOVERY.PRICE, ENACT2COSTRECOVERY.SUMMA, ENACT2COSTRECOVERY.ACTREFCODE, ENACT2COSTRECOVERY.CLASSIFICATIONTYPERFCD "
    +" FROM ENACT2COSTRECOVERY WHERE ENACT2COSTRECOVERY.CODE = ?";

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
        anObject.measureUnitName = set.getString(3);
        anObject.countGen = set.getBigDecimal(4);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.price = set.getBigDecimal(5);
        if(anObject.price != null)
            anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.summa = set.getBigDecimal(6);
        if(anObject.summa != null)
            anObject.summa = anObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.actRef.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.actRef.code = Integer.MIN_VALUE;
        anObject.classificationTypeRef.code = set.getInt(8);
        if ( set.wasNull() )
            anObject.classificationTypeRef.code = Integer.MIN_VALUE;
        if(anObject.actRef.code != Integer.MIN_VALUE)
        {
           anObject.setActRef(
        new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).getRef(anObject.actRef.code));
    }
        if(anObject.classificationTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setClassificationTypeRef(
        new com.ksoe.techcard.dataminer.generated.TKClassificationTypeDAOGen(connection,getUserProfile()).getRef(anObject.classificationTypeRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENAct2CostRecoveryRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENAct2CostRecoveryRef ref = new com.ksoe.energynet.valueobject.references.ENAct2CostRecoveryRef();
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

    selectStr = "DELETE FROM  ENACT2COSTRECOVERY WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENAct2CostRecovery object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENAct2CostRecovery.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENAct2CostRecovery.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENAct2CostRecovery.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAct2CostRecovery.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAct2CostRecovery.getObject%} access denied");

    selectStr =

    "SELECT  ENACT2COSTRECOVERY.CODE FROM  ENACT2COSTRECOVERY WHERE  ENACT2COSTRECOVERY.CODE = ?";
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
    _checkConditionToken(condition,"code","ENACT2COSTRECOVERY.CODE");
    _checkConditionToken(condition,"name","ENACT2COSTRECOVERY.NAME");
    _checkConditionToken(condition,"measureunitname","ENACT2COSTRECOVERY.MEASUREUNITNAME");
    _checkConditionToken(condition,"countgen","ENACT2COSTRECOVERY.COUNTGEN");
    _checkConditionToken(condition,"price","ENACT2COSTRECOVERY.PRICE");
    _checkConditionToken(condition,"summa","ENACT2COSTRECOVERY.SUMMA");
      // relationship conditions
    _checkConditionToken(condition,"actref","ACTREFCODE");
    _checkConditionToken(condition,"actref.code","ACTREFCODE");
    _checkConditionToken(condition,"classificationtyperef","CLASSIFICATIONTYPERFCD");
    _checkConditionToken(condition,"classificationtyperef.code","CLASSIFICATIONTYPERFCD");
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

   private void _collectAutoIncrementFields(ENAct2CostRecovery anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENACT2COSTRECOVERY", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENACT2COSTRECOVERY", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENACT2COSTRECOVERY", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENACT2COSTRECOVERY");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENAct2CostRecoveryDAO

