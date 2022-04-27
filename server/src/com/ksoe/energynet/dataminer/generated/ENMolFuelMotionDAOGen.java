
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
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
import com.ksoe.energynet.valueobject.ENMolFuelMotion;
import com.ksoe.energynet.valueobject.brief.ENMolFuelMotionShort;
import com.ksoe.energynet.valueobject.filter.ENMolFuelMotionFilter;
import com.ksoe.energynet.valueobject.lists.ENMolFuelMotionShortList;
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
  *  DAO Generated for ENMolFuelMotion;
  *
  */

public class ENMolFuelMotionDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENMolFuelMotionDAOGen() {super();}
  //public ENMolFuelMotionDAOGen(Connection aConnection) {super(aConnection);}
  //public ENMolFuelMotionDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENMolFuelMotionDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENMolFuelMotionDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENMolFuelMotion inObject) throws PersistenceException
   {
      ENMolFuelMotion obj = new ENMolFuelMotion();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.molcode != obj.molcode){
       return false;
     }

     if (inObject.molname != obj.molname){
       return false;
     }

     if ( ! inObject.dateGen.equals(obj.dateGen)){
       return false;
     }

     if (inObject.nn != obj.nn){
       return false;
     }

     if (inObject.mat_name != obj.mat_name){
       return false;
     }

     if ( ! inObject.countGen.equals(obj.countGen)){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }
     if (inObject.motionTypeRef.code != obj.motionTypeRef.code){
        return false;
     }
     if (inObject.fuelTypeRef.code != obj.fuelTypeRef.code){
        return false;
     }
     if (inObject.fkorderRef.code != obj.fkorderRef.code){
        return false;
     }
     if (inObject.actRef.code != obj.actRef.code){
        return false;
     }
      return true;
   }

   public int add(ENMolFuelMotion anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENMolFuelMotion anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENMOLFUELMOTION (CODE,MOLCODE,MOLNAME,DATEGEN,NN,MAT_NAME,COUNTGEN,MODIFY_TIME,USERGEN,DATEEDIT,MOTIONTYPEREFCODE,FUELTYPEREFCODE,FKORDERREFCODE,ACTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.molcode);
      statement.setString(3,anObject.molname);
      if (anObject.dateGen == null)
        statement.setDate(4,null);
      else
        statement.setDate(4,new java.sql.Date(anObject.dateGen.getTime()));
      statement.setString(5,anObject.nn);
      statement.setString(6,anObject.mat_name);
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.countGen);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(8,null);
      else
        statement.setBigDecimal(8,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(9,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(10,null);
      else
        statement.setTimestamp(10,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.motionTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENMolFuelMotionTypeDAOGen(connection,getUserProfile()).exists(anObject.motionTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENMolFuelMotion.motionTypeRef.code%} = {%"+anObject.motionTypeRef.code+"%}");
        statement.setInt(11,anObject.motionTypeRef.code);
      }
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.fuelTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKFuelTypeDAOGen(connection,getUserProfile()).exists(anObject.fuelTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENMolFuelMotion.fuelTypeRef.code%} = {%"+anObject.fuelTypeRef.code+"%}");
        statement.setInt(12,anObject.fuelTypeRef.code);
      }
      else
        statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.fkorderRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.rqorder.dataminer.generated.RQFKOrderDAOGen(connection,getUserProfile()).exists(anObject.fkorderRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.rqorder.valueobject.ENMolFuelMotion.fkorderRef.code%} = {%"+anObject.fkorderRef.code+"%}");
        statement.setInt(13,anObject.fkorderRef.code);
      }
      else
        statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.actRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).exists(anObject.actRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENMolFuelMotion.actRef.code%} = {%"+anObject.actRef.code+"%}");
        statement.setInt(14,anObject.actRef.code);
      }
      else
        statement.setNull(14,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENMolFuelMotionDAOGen.add%}",e);
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

   public void save(ENMolFuelMotion anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENMolFuelMotion anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENMolFuelMotion oldObject = new ENMolFuelMotion();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENMolFuelMotion.modify_time_Field+" FROM  ENMOLFUELMOTION WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("MOLCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MOLNAME") == 0)
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
          if(fieldNameStr.compareTo("NN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MAT_NAME") == 0)
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
          if(fieldNameStr.compareTo("MOTIONTYPEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FUELTYPEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FKORDERREF") == 0)
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
         }
       if(fields.size() == 0)
         return;
       }
      if(fields == null)
       {
        selectStr =
        "UPDATE ENMOLFUELMOTION SET  MOLCODE = ? , MOLNAME = ? , DATEGEN = ? , NN = ? , MAT_NAME = ? , COUNTGEN = ? , MODIFY_TIME = ? , USERGEN = ? , DATEEDIT = ? , MOTIONTYPEREFCODE = ? , FUELTYPEREFCODE = ? , FKORDERREFCODE = ? , ACTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENMOLFUELMOTION SET ";
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
      statement.setString(1,anObject.molcode);
      statement.setString(2,anObject.molname);
      if (anObject.dateGen == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.dateGen.getTime()));
      statement.setString(4,anObject.nn);
      statement.setString(5,anObject.mat_name);
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.countGen);

      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(7,null);
      else
        statement.setBigDecimal(7,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(8,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(9,null);
      else
        statement.setTimestamp(9,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.motionTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.motionTypeRef.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.fuelTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(11,anObject.fuelTypeRef.code);
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.fkorderRef.code != Integer.MIN_VALUE)
        statement.setInt(12,anObject.fkorderRef.code);
      else
        statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.actRef.code != Integer.MIN_VALUE)
        statement.setInt(13,anObject.actRef.code);
      else
        statement.setNull(13,java.sql.Types.INTEGER);
          statement.setInt(14,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("MOLCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.molcode);
                continue;
             }
            if("MOLNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.molname);
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
            if("NN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.nn);
                continue;
             }
            if("MAT_NAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.mat_name);
                continue;
             }
            if("COUNTGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countGen != null)
                    anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countGen);
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
            if("MOTIONTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.motionTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.motionTypeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("FUELTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.fuelTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.fuelTypeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("FKORDERREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.fkorderRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.fkorderRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
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

   } // end of save(ENMolFuelMotion anObject,String[] anAttributes)


 public ENMolFuelMotionShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENMolFuelMotion filterObject = new ENMolFuelMotion();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENMolFuelMotionShort)list.get(0);
   return null;
  }

  public ENMolFuelMotionShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENMolFuelMotionShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENMolFuelMotionShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENMolFuelMotionShortList getFilteredList(ENMolFuelMotion filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENMolFuelMotionShortList getScrollableFilteredList(ENMolFuelMotion aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENMolFuelMotionShortList getScrollableFilteredList(ENMolFuelMotion aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENMolFuelMotionShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENMolFuelMotionShortList getScrollableFilteredList(ENMolFuelMotionFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENMolFuelMotionShortList getScrollableFilteredList(ENMolFuelMotionFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENMolFuelMotionShortList getScrollableFilteredList(ENMolFuelMotion aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENMolFuelMotionShortList getScrollableFilteredList(ENMolFuelMotion aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENMolFuelMotionShortList result = new ENMolFuelMotionShortList();
    ENMolFuelMotionShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENMOLFUELMOTION.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENMOLFUELMOTION.CODE"+
     ",ENMOLFUELMOTION.MOLCODE"+
     ",ENMOLFUELMOTION.MOLNAME"+
     ",ENMOLFUELMOTION.DATEGEN"+
     ",ENMOLFUELMOTION.NN"+
     ",ENMOLFUELMOTION.MAT_NAME"+
     ",ENMOLFUELMOTION.COUNTGEN"+
     ",ENMOLFUELMOTION.USERGEN"+
     ",ENMOLFUELMOTION.DATEEDIT"+

      ", ENMOLFUELMOTIONTYPE.CODE " +
      ", ENMOLFUELMOTIONTYPE.NAME " +
      ", TKFUELTYPE.CODE " +
      ", TKFUELTYPE.NAME " +
      ", RQFKORDER.CODE " +
      ", RQFKORDER.NUMBERDOC " +
      ", RQFKORDER.DATEGEN " +
      ", RQFKORDER.DATESHIPMENT " +
      ", RQFKORDER.MOLOUTCODE " +
      ", RQFKORDER.MOLOUTNAME " +
      ", RQFKORDER.MOLINCODE " +
      ", RQFKORDER.MOLINNAME " +
      ", RQFKORDER.EXPEDITORCODE " +
      ", RQFKORDER.EXPEDITORNAME " +
      ", RQFKORDER.WARRANTNUMBER " +
      ", RQFKORDER.WARRANTDATE " +
      ", RQFKORDER.WARRANTFIO " +
      ", RQFKORDER.SUMWITHOUTNDS " +
      ", RQFKORDER.SUMNDS " +
      ", RQFKORDER.NDSPERCENT " +
      ", RQFKORDER.DATEADD " +
      ", RQFKORDER.USERADD " +
      ", RQFKORDER.DATEEDIT " +
      ", RQFKORDER.USERGEN " +
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
     " FROM ENMOLFUELMOTION " +
     ", ENMOLFUELMOTIONTYPE " +
     ", TKFUELTYPE " +
     ", RQFKORDER " +
     ", ENACT " +
     //" WHERE "
    "";
     whereStr = " ENMOLFUELMOTIONTYPE.CODE = ENMOLFUELMOTION.MOTIONTYPEREFCODE" ; //+
      whereStr = whereStr +" AND TKFUELTYPE.CODE = ENMOLFUELMOTION.FUELTYPEREFCODE" ; //+
      whereStr = whereStr +" AND RQFKORDER.CODE = ENMOLFUELMOTION.FKORDERREFCODE" ; //+
      whereStr = whereStr +" AND ENACT.CODE = ENMOLFUELMOTION.ACTREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENMOLFUELMOTION.CODE IN ( SELECT ENMOLFUELMOTION.CODE FROM ENMOLFUELMOTION ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLFUELMOTION.CODE = ?";
        }
         if (aFilterObject.molcode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molcode.indexOf('*',0) < 0 && aFilterObject.molcode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENMOLFUELMOTION.MOLCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENMOLFUELMOTION.MOLCODE) LIKE UPPER(?)";
         }
         if (aFilterObject.molname != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molname.indexOf('*',0) < 0 && aFilterObject.molname.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENMOLFUELMOTION.MOLNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENMOLFUELMOTION.MOLNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLFUELMOTION.DATEGEN = ?";
        }
         if (aFilterObject.nn != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.nn.indexOf('*',0) < 0 && aFilterObject.nn.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENMOLFUELMOTION.NN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENMOLFUELMOTION.NN) LIKE UPPER(?)";
         }
         if (aFilterObject.mat_name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.mat_name.indexOf('*',0) < 0 && aFilterObject.mat_name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENMOLFUELMOTION.MAT_NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENMOLFUELMOTION.MAT_NAME) LIKE UPPER(?)";
         }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLFUELMOTION.COUNTGEN = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLFUELMOTION.MODIFY_TIME = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENMOLFUELMOTION.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENMOLFUELMOTION.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLFUELMOTION.DATEEDIT = ?";
        }
        if(aFilterObject.motionTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENMOLFUELMOTION.MOTIONTYPEREFCODE = ? ";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENMOLFUELMOTION.FUELTYPEREFCODE = ? ";
        }
        if(aFilterObject.fkorderRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENMOLFUELMOTION.FKORDERREFCODE = ? ";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENMOLFUELMOTION.ACTREFCODE = ? ";
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

           if(aFilterObject.molcode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molcode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.molname != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molname);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }

           if(aFilterObject.nn != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.nn);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.mat_name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.mat_name);
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
       if(aFilterObject.motionTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.motionTypeRef.code);
       }
       if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fuelTypeRef.code);
       }
       if(aFilterObject.fkorderRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fkorderRef.code);
       }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actRef.code);
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

        anObject = new ENMolFuelMotionShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.molcode = set.getString(2);
        anObject.molname = set.getString(3);
        anObject.dateGen = set.getDate(4);
        anObject.nn = set.getString(5);
        anObject.mat_name = set.getString(6);
        anObject.countGen = set.getBigDecimal(7);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(8);
        anObject.dateEdit = set.getTimestamp(9);

        anObject.motionTypeRefCode = set.getInt(10);
        if(set.wasNull())
        anObject.motionTypeRefCode = Integer.MIN_VALUE;
        anObject.motionTypeRefName = set.getString(11);
        anObject.fuelTypeRefCode = set.getInt(12);
        if(set.wasNull())
        anObject.fuelTypeRefCode = Integer.MIN_VALUE;
        anObject.fuelTypeRefName = set.getString(13);
        anObject.fkorderRefCode = set.getInt(14);
        if(set.wasNull())
        anObject.fkorderRefCode = Integer.MIN_VALUE;
        anObject.fkorderRefNumberDoc = set.getString(15);
        anObject.fkorderRefDateGen = set.getDate(16);
        anObject.fkorderRefDateShipment = set.getDate(17);
        anObject.fkorderRefMolOutCode = set.getString(18);
        anObject.fkorderRefMolOutName = set.getString(19);
        anObject.fkorderRefMolInCode = set.getString(20);
        anObject.fkorderRefMolInName = set.getString(21);
        anObject.fkorderRefExpeditorCode = set.getString(22);
        anObject.fkorderRefExpeditorName = set.getString(23);
        anObject.fkorderRefWarrantNumber = set.getString(24);
        anObject.fkorderRefWarrantDate = set.getDate(25);
        anObject.fkorderRefWarrantFIO = set.getString(26);
        anObject.fkorderRefSumWithoutNds = set.getBigDecimal(27);
        if(anObject.fkorderRefSumWithoutNds != null)
          anObject.fkorderRefSumWithoutNds = anObject.fkorderRefSumWithoutNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkorderRefSumNds = set.getBigDecimal(28);
        if(anObject.fkorderRefSumNds != null)
          anObject.fkorderRefSumNds = anObject.fkorderRefSumNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkorderRefNdsPercent = set.getInt(29);
        if(set.wasNull())
        anObject.fkorderRefNdsPercent = Integer.MIN_VALUE;
        anObject.fkorderRefDateAdd = set.getTimestamp(30);
        anObject.fkorderRefUserAdd = set.getString(31);
        anObject.fkorderRefDateEdit = set.getTimestamp(32);
        anObject.fkorderRefUserGen = set.getString(33);
        anObject.actRefCode = set.getInt(34);
        if(set.wasNull())
        anObject.actRefCode = Integer.MIN_VALUE;
        anObject.actRefNumberGen = set.getString(35);
        anObject.actRefDateGen = set.getDate(36);
        anObject.actRefFinDocCode = set.getInt(37);
        if(set.wasNull())
        anObject.actRefFinDocCode = Integer.MIN_VALUE;
        anObject.actRefFinDocMechanicCode = set.getInt(38);
        if(set.wasNull())
        anObject.actRefFinDocMechanicCode = Integer.MIN_VALUE;
        anObject.actRefFinMolName = set.getString(39);
        anObject.actRefFinMechanicName = set.getString(40);
        anObject.actRefInvNumber = set.getString(41);
        anObject.actRefUserGen = set.getString(42);
        anObject.actRefDateEdit = set.getDate(43);
        anObject.actRefDateAct = set.getDate(44);

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

  public int[] getFilteredCodeArrayOLD(ENMolFuelMotion aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENMOLFUELMOTION.CODE FROM ENMOLFUELMOTION";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENMOLFUELMOTION.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLFUELMOTION.CODE = ?";
        }
         if (aFilterObject.molcode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molcode.indexOf('*',0) < 0 && aFilterObject.molcode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENMOLFUELMOTION.MOLCODE = ?";
             else
                 whereStr = whereStr + "  ENMOLFUELMOTION.MOLCODE LIKE ?";
         }
         if (aFilterObject.molname != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molname.indexOf('*',0) < 0 && aFilterObject.molname.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENMOLFUELMOTION.MOLNAME = ?";
             else
                 whereStr = whereStr + "  ENMOLFUELMOTION.MOLNAME LIKE ?";
         }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLFUELMOTION.DATEGEN = ?";
        }
         if (aFilterObject.nn != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.nn.indexOf('*',0) < 0 && aFilterObject.nn.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENMOLFUELMOTION.NN = ?";
             else
                 whereStr = whereStr + "  ENMOLFUELMOTION.NN LIKE ?";
         }
         if (aFilterObject.mat_name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.mat_name.indexOf('*',0) < 0 && aFilterObject.mat_name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENMOLFUELMOTION.MAT_NAME = ?";
             else
                 whereStr = whereStr + "  ENMOLFUELMOTION.MAT_NAME LIKE ?";
         }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLFUELMOTION.COUNTGEN = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLFUELMOTION.MODIFY_TIME = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENMOLFUELMOTION.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENMOLFUELMOTION.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLFUELMOTION.DATEEDIT = ?";
        }
        if(aFilterObject.motionTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENMOLFUELMOTION.MOTIONTYPEREFCODE = ? ";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENMOLFUELMOTION.FUELTYPEREFCODE = ? ";
        }
        if(aFilterObject.fkorderRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENMOLFUELMOTION.FKORDERREFCODE = ? ";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENMOLFUELMOTION.ACTREFCODE = ? ";
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
         if (aFilterObject.molcode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.molcode.indexOf('*',0) < 0 && aFilterObject.molcode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENMOLFUELMOTION.MOLCODE = ?";
             else
                 whereStr = whereStr + " ENMOLFUELMOTION.MOLCODE LIKE ?";

           if(aFilterObject.molcode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molcode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.molname != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.molname.indexOf('*',0) < 0 && aFilterObject.molname.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENMOLFUELMOTION.MOLNAME = ?";
             else
                 whereStr = whereStr + " ENMOLFUELMOTION.MOLNAME LIKE ?";

           if(aFilterObject.molname != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molname);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
         if (aFilterObject.nn != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.nn.indexOf('*',0) < 0 && aFilterObject.nn.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENMOLFUELMOTION.NN = ?";
             else
                 whereStr = whereStr + " ENMOLFUELMOTION.NN LIKE ?";

           if(aFilterObject.nn != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.nn);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.mat_name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.mat_name.indexOf('*',0) < 0 && aFilterObject.mat_name.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENMOLFUELMOTION.MAT_NAME = ?";
             else
                 whereStr = whereStr + " ENMOLFUELMOTION.MAT_NAME LIKE ?";

           if(aFilterObject.mat_name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.mat_name);
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
                 whereStr = whereStr + " ENMOLFUELMOTION.USERGEN = ?";
             else
                 whereStr = whereStr + " ENMOLFUELMOTION.USERGEN LIKE ?";

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
       if(aFilterObject.motionTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.motionTypeRef.code);
       }
       if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fuelTypeRef.code);
       }
       if(aFilterObject.fkorderRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fkorderRef.code);
       }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actRef.code);
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

  public int[] getFilteredCodeArray(ENMolFuelMotionFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENMolFuelMotion aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENMOLFUELMOTION.CODE FROM ENMOLFUELMOTION";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENMOLFUELMOTION.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLFUELMOTION.CODE = ?";
        }
         if (aFilterObject.molcode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molcode.indexOf('*',0) < 0 && aFilterObject.molcode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENMOLFUELMOTION.MOLCODE = ?";
             else
                 whereStr = whereStr + "  ENMOLFUELMOTION.MOLCODE LIKE ?";
         }
         if (aFilterObject.molname != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molname.indexOf('*',0) < 0 && aFilterObject.molname.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENMOLFUELMOTION.MOLNAME = ?";
             else
                 whereStr = whereStr + "  ENMOLFUELMOTION.MOLNAME LIKE ?";
         }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLFUELMOTION.DATEGEN = ?";
        }
         if (aFilterObject.nn != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.nn.indexOf('*',0) < 0 && aFilterObject.nn.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENMOLFUELMOTION.NN = ?";
             else
                 whereStr = whereStr + "  ENMOLFUELMOTION.NN LIKE ?";
         }
         if (aFilterObject.mat_name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.mat_name.indexOf('*',0) < 0 && aFilterObject.mat_name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENMOLFUELMOTION.MAT_NAME = ?";
             else
                 whereStr = whereStr + "  ENMOLFUELMOTION.MAT_NAME LIKE ?";
         }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLFUELMOTION.COUNTGEN = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLFUELMOTION.MODIFY_TIME = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENMOLFUELMOTION.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENMOLFUELMOTION.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENMOLFUELMOTION.DATEEDIT = ?";
        }
        if(aFilterObject.motionTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENMOLFUELMOTION.MOTIONTYPEREFCODE = ? ";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENMOLFUELMOTION.FUELTYPEREFCODE = ? ";
        }
        if(aFilterObject.fkorderRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENMOLFUELMOTION.FKORDERREFCODE = ? ";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENMOLFUELMOTION.ACTREFCODE = ? ";
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
         if (aFilterObject.molcode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.molcode.indexOf('*',0) < 0 && aFilterObject.molcode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENMOLFUELMOTION.MOLCODE = ?";
             else
                 whereStr = whereStr + " ENMOLFUELMOTION.MOLCODE LIKE ?";

           if(aFilterObject.molcode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molcode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.molname != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.molname.indexOf('*',0) < 0 && aFilterObject.molname.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENMOLFUELMOTION.MOLNAME = ?";
             else
                 whereStr = whereStr + " ENMOLFUELMOTION.MOLNAME LIKE ?";

           if(aFilterObject.molname != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molname);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
         if (aFilterObject.nn != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.nn.indexOf('*',0) < 0 && aFilterObject.nn.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENMOLFUELMOTION.NN = ?";
             else
                 whereStr = whereStr + " ENMOLFUELMOTION.NN LIKE ?";

           if(aFilterObject.nn != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.nn);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.mat_name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.mat_name.indexOf('*',0) < 0 && aFilterObject.mat_name.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENMOLFUELMOTION.MAT_NAME = ?";
             else
                 whereStr = whereStr + " ENMOLFUELMOTION.MAT_NAME LIKE ?";

           if(aFilterObject.mat_name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.mat_name);
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
                 whereStr = whereStr + " ENMOLFUELMOTION.USERGEN = ?";
             else
                 whereStr = whereStr + " ENMOLFUELMOTION.USERGEN LIKE ?";

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
       if(aFilterObject.motionTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.motionTypeRef.code);
       }
       if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fuelTypeRef.code);
       }
       if(aFilterObject.fkorderRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fkorderRef.code);
       }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actRef.code);
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


   public ENMolFuelMotion getObject(int uid) throws PersistenceException
   {
    ENMolFuelMotion result = new ENMolFuelMotion();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENMolFuelMotion anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENMOLFUELMOTION.CODE, ENMOLFUELMOTION.MOLCODE, ENMOLFUELMOTION.MOLNAME, ENMOLFUELMOTION.DATEGEN, ENMOLFUELMOTION.NN, ENMOLFUELMOTION.MAT_NAME, ENMOLFUELMOTION.COUNTGEN, ENMOLFUELMOTION.MODIFY_TIME, ENMOLFUELMOTION.USERGEN, ENMOLFUELMOTION.DATEEDIT, ENMOLFUELMOTION.MOTIONTYPEREFCODE, ENMOLFUELMOTION.FUELTYPEREFCODE, ENMOLFUELMOTION.FKORDERREFCODE, ENMOLFUELMOTION.ACTREFCODE "
    +" FROM ENMOLFUELMOTION WHERE ENMOLFUELMOTION.CODE = ?";

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
        anObject.molcode = set.getString(2);
        anObject.molname = set.getString(3);
        anObject.dateGen = set.getDate(4);
        anObject.nn = set.getString(5);
        anObject.mat_name = set.getString(6);
        anObject.countGen = set.getBigDecimal(7);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.modify_time = set.getLong(8);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.userGen = set.getString(9);
        anObject.dateEdit = set.getTimestamp(10);
        anObject.motionTypeRef.code = set.getInt(11);
        if ( set.wasNull() )
            anObject.motionTypeRef.code = Integer.MIN_VALUE;
        anObject.fuelTypeRef.code = set.getInt(12);
        if ( set.wasNull() )
            anObject.fuelTypeRef.code = Integer.MIN_VALUE;
        anObject.fkorderRef.code = set.getInt(13);
        if ( set.wasNull() )
            anObject.fkorderRef.code = Integer.MIN_VALUE;
        anObject.actRef.code = set.getInt(14);
        if ( set.wasNull() )
            anObject.actRef.code = Integer.MIN_VALUE;
        if(anObject.motionTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setMotionTypeRef(
        new com.ksoe.energynet.dataminer.generated.ENMolFuelMotionTypeDAOGen(connection,getUserProfile()).getRef(anObject.motionTypeRef.code));
    }
        if(anObject.fuelTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setFuelTypeRef(
        new com.ksoe.techcard.dataminer.generated.TKFuelTypeDAOGen(connection,getUserProfile()).getRef(anObject.fuelTypeRef.code));
    }
        if(anObject.fkorderRef.code != Integer.MIN_VALUE)
        {
           anObject.setFkorderRef(
        new com.ksoe.rqorder.dataminer.generated.RQFKOrderDAOGen(connection,getUserProfile()).getRef(anObject.fkorderRef.code));
    }
        if(anObject.actRef.code != Integer.MIN_VALUE)
        {
           anObject.setActRef(
        new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).getRef(anObject.actRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENMolFuelMotionRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENMolFuelMotionRef ref = new com.ksoe.energynet.valueobject.references.ENMolFuelMotionRef();
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

    selectStr = "DELETE FROM  ENMOLFUELMOTION WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENMolFuelMotion object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENMolFuelMotion.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENMolFuelMotion.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENMolFuelMotion.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENMolFuelMotion.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENMolFuelMotion.getObject%} access denied");

    selectStr =

    "SELECT  ENMOLFUELMOTION.CODE FROM  ENMOLFUELMOTION WHERE  ENMOLFUELMOTION.CODE = ?";
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
    _checkConditionToken(condition,"code","ENMOLFUELMOTION.CODE");
    _checkConditionToken(condition,"molcode","ENMOLFUELMOTION.MOLCODE");
    _checkConditionToken(condition,"molname","ENMOLFUELMOTION.MOLNAME");
    _checkConditionToken(condition,"dategen","ENMOLFUELMOTION.DATEGEN");
    _checkConditionToken(condition,"nn","ENMOLFUELMOTION.NN");
    _checkConditionToken(condition,"mat_name","ENMOLFUELMOTION.MAT_NAME");
    _checkConditionToken(condition,"countgen","ENMOLFUELMOTION.COUNTGEN");
    _checkConditionToken(condition,"modify_time","ENMOLFUELMOTION.MODIFY_TIME");
    _checkConditionToken(condition,"usergen","ENMOLFUELMOTION.USERGEN");
    _checkConditionToken(condition,"dateedit","ENMOLFUELMOTION.DATEEDIT");
      // relationship conditions
    _checkConditionToken(condition,"motiontyperef","MOTIONTYPEREFCODE");
    _checkConditionToken(condition,"motiontyperef.code","MOTIONTYPEREFCODE");
    _checkConditionToken(condition,"fueltyperef","FUELTYPEREFCODE");
    _checkConditionToken(condition,"fueltyperef.code","FUELTYPEREFCODE");
    _checkConditionToken(condition,"fkorderref","FKORDERREFCODE");
    _checkConditionToken(condition,"fkorderref.code","FKORDERREFCODE");
    _checkConditionToken(condition,"actref","ACTREFCODE");
    _checkConditionToken(condition,"actref.code","ACTREFCODE");
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

   private void _collectAutoIncrementFields(ENMolFuelMotion anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENMOLFUELMOTION", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENMOLFUELMOTION", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENMOLFUELMOTION", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENMOLFUELMOTION");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENMolFuelMotionDAO

