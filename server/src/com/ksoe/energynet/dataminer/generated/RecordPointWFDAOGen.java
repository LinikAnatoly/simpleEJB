
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

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.valueobject.RecordPointWF;
import com.ksoe.energynet.valueobject.brief.RecordPointWFShort;
import com.ksoe.energynet.valueobject.filter.RecordPointWFFilter;
import com.ksoe.energynet.valueobject.lists.RecordPointWFShortList;
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
  *  DAO Generated for RecordPointWF;
  *
  */

public class RecordPointWFDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public RecordPointWFDAOGen() {super();}
  //public RecordPointWFDAOGen(Connection aConnection) {super(aConnection);}
  //public RecordPointWFDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public RecordPointWFDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public RecordPointWFDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(RecordPointWF inObject) throws PersistenceException
   {
      RecordPointWF obj = new RecordPointWF();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.accountnumber != obj.accountnumber){
       return false;
     }

     if (inObject.contractnumber != obj.contractnumber){
       return false;
     }

     if (inObject.contragentname != obj.contragentname){
       return false;
     }

     if (inObject.contragentaddress != obj.contragentaddress){
       return false;
     }

     if (inObject.contragentpassport != obj.contragentpassport){
       return false;
     }

     if (inObject.contragentokpo != obj.contragentokpo){
       return false;
     }

     if (inObject.cnpackcode != obj.cnpackcode){
       return false;
     }

     if (inObject.cnsubsystemtyperefcode != obj.cnsubsystemtyperefcode){
       return false;
     }

     if (inObject.rencode != obj.rencode){
       return false;
     }

     if (inObject.isbyt != obj.isbyt){
       return false;
     }

     if (inObject.phasityrefcode != obj.phasityrefcode){
       return false;
     }

     if ( ! inObject.contractdate.equals(obj.contractdate)){
       return false;
     }

     if (inObject.techcondservicesrefcod != obj.techcondservicesrefcod){
       return false;
     }

     if (inObject.iscounterinst != obj.iscounterinst){
       return false;
     }

     if (inObject.rpcode != obj.rpcode){
       return false;
     }

     if (inObject.rpname != obj.rpname){
       return false;
     }
      return true;
   }

   public int add(RecordPointWF anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(RecordPointWF anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO RECORDPOINTWF (CODE,ACCOUNTNUMBER,CONTRACTNUMBER,CONTRAGENTNAME,CONTRAGENTADDRESS,CONTRAGENTPASSPORT,CONTRAGENTOKPO,CNPACKCODE,CNSUBSYSTEMTYPEREFCODE,RENCODE,ISBYT,PHASITYREFCODE,CONTRACTDATE,TECHCONDSERVICESREFCOD,ISCOUNTERINST,RPCODE,RPNAME) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.accountnumber);
      statement.setString(3,anObject.contractnumber);
      statement.setString(4,anObject.contragentname);
      statement.setString(5,anObject.contragentaddress);
      statement.setString(6,anObject.contragentpassport);
      statement.setString(7,anObject.contragentokpo);
      if (anObject.cnpackcode != Integer.MIN_VALUE )
         statement.setInt(8,anObject.cnpackcode);
      else
         statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.cnsubsystemtyperefcode != Integer.MIN_VALUE )
         statement.setInt(9,anObject.cnsubsystemtyperefcode);
      else
         statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.rencode != Integer.MIN_VALUE )
         statement.setInt(10,anObject.rencode);
      else
         statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.isbyt != Integer.MIN_VALUE )
         statement.setInt(11,anObject.isbyt);
      else
         statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.phasityrefcode != Integer.MIN_VALUE )
         statement.setInt(12,anObject.phasityrefcode);
      else
         statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.contractdate == null)
        statement.setDate(13,null);
      else
        statement.setDate(13,new java.sql.Date(anObject.contractdate.getTime()));
      if (anObject.techcondservicesrefcod != Integer.MIN_VALUE )
         statement.setInt(14,anObject.techcondservicesrefcod);
      else
         statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.iscounterinst != Integer.MIN_VALUE )
         statement.setInt(15,anObject.iscounterinst);
      else
         statement.setNull(15,java.sql.Types.INTEGER);
      if (anObject.rpcode != Integer.MIN_VALUE )
         statement.setInt(16,anObject.rpcode);
      else
         statement.setNull(16,java.sql.Types.INTEGER);
      statement.setString(17,anObject.rpname);

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
      throw new PersistenceException("Error in method {%RecordPointWFDAOGen.add%}",e);
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

   public void save(RecordPointWF anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(RecordPointWF anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("ACCOUNTNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRACTNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRAGENTNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRAGENTADDRESS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRAGENTPASSPORT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRAGENTOKPO") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CNPACKCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CNSUBSYSTEMTYPEREFCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RENCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ISBYT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PHASITYREFCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONTRACTDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TECHCONDSERVICESREFCOD") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ISCOUNTERINST") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RPCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RPNAME") == 0)
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
        "UPDATE RECORDPOINTWF SET  ACCOUNTNUMBER = ? , CONTRACTNUMBER = ? , CONTRAGENTNAME = ? , CONTRAGENTADDRESS = ? , CONTRAGENTPASSPORT = ? , CONTRAGENTOKPO = ? , CNPACKCODE = ? , CNSUBSYSTEMTYPEREFCODE = ? , RENCODE = ? , ISBYT = ? , PHASITYREFCODE = ? , CONTRACTDATE = ? , TECHCONDSERVICESREFCOD = ? , ISCOUNTERINST = ? , RPCODE = ? , RPNAME = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE RECORDPOINTWF SET ";
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
      statement.setString(1,anObject.accountnumber);
      statement.setString(2,anObject.contractnumber);
      statement.setString(3,anObject.contragentname);
      statement.setString(4,anObject.contragentaddress);
      statement.setString(5,anObject.contragentpassport);
      statement.setString(6,anObject.contragentokpo);
      if (anObject.cnpackcode != Integer.MIN_VALUE )
         statement.setInt(7,anObject.cnpackcode);
      else
         statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.cnsubsystemtyperefcode != Integer.MIN_VALUE )
         statement.setInt(8,anObject.cnsubsystemtyperefcode);
      else
         statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.rencode != Integer.MIN_VALUE )
         statement.setInt(9,anObject.rencode);
      else
         statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.isbyt != Integer.MIN_VALUE )
         statement.setInt(10,anObject.isbyt);
      else
         statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.phasityrefcode != Integer.MIN_VALUE )
         statement.setInt(11,anObject.phasityrefcode);
      else
         statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.contractdate == null)
        statement.setDate(12,null);
      else
        statement.setDate(12,new java.sql.Date(anObject.contractdate.getTime()));
      if (anObject.techcondservicesrefcod != Integer.MIN_VALUE )
         statement.setInt(13,anObject.techcondservicesrefcod);
      else
         statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.iscounterinst != Integer.MIN_VALUE )
         statement.setInt(14,anObject.iscounterinst);
      else
         statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.rpcode != Integer.MIN_VALUE )
         statement.setInt(15,anObject.rpcode);
      else
         statement.setNull(15,java.sql.Types.INTEGER);
      statement.setString(16,anObject.rpname);
          statement.setInt(17,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("ACCOUNTNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.accountnumber);
                continue;
             }
            if("CONTRACTNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.contractnumber);
                continue;
             }
            if("CONTRAGENTNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.contragentname);
                continue;
             }
            if("CONTRAGENTADDRESS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.contragentaddress);
                continue;
             }
            if("CONTRAGENTPASSPORT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.contragentpassport);
                continue;
             }
            if("CONTRAGENTOKPO".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.contragentokpo);
                continue;
             }
            if("CNPACKCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.cnpackcode);
                continue;
             }
            if("CNSUBSYSTEMTYPEREFCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.cnsubsystemtyperefcode);
                continue;
             }
            if("RENCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.rencode);
                continue;
             }
            if("ISBYT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.isbyt);
                continue;
             }
            if("PHASITYREFCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.phasityrefcode);
                continue;
             }
            if("CONTRACTDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.contractdate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.contractdate.getTime()));
                continue;
             }
            if("TECHCONDSERVICESREFCOD".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.techcondservicesrefcod);
                continue;
             }
            if("ISCOUNTERINST".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.iscounterinst);
                continue;
             }
            if("RPCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.rpcode);
                continue;
             }
            if("RPNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.rpname);
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

   } // end of save(RecordPointWF anObject,String[] anAttributes)


 public RecordPointWFShort getShortObject(int anObjectCode) throws PersistenceException
  {
   RecordPointWF filterObject = new RecordPointWF();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (RecordPointWFShort)list.get(0);
   return null;
  }

  public RecordPointWFShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public RecordPointWFShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public RecordPointWFShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public RecordPointWFShortList getFilteredList(RecordPointWF filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public RecordPointWFShortList getScrollableFilteredList(RecordPointWF aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public RecordPointWFShortList getScrollableFilteredList(RecordPointWF aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public RecordPointWFShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public RecordPointWFShortList getScrollableFilteredList(RecordPointWFFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public RecordPointWFShortList getScrollableFilteredList(RecordPointWFFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public RecordPointWFShortList getScrollableFilteredList(RecordPointWF aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public RecordPointWFShortList getScrollableFilteredList(RecordPointWF aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    RecordPointWFShortList result = new RecordPointWFShortList();
    RecordPointWFShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "RECORDPOINTWF.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "RECORDPOINTWF.CODE"+
     ",RECORDPOINTWF.ACCOUNTNUMBER"+
     ",RECORDPOINTWF.CONTRACTNUMBER"+
     ",RECORDPOINTWF.CONTRAGENTNAME"+
     ",RECORDPOINTWF.CONTRAGENTADDRESS"+
     ",RECORDPOINTWF.CONTRAGENTPASSPORT"+
     ",RECORDPOINTWF.CONTRAGENTOKPO"+
     ",RECORDPOINTWF.CNPACKCODE"+
     ",RECORDPOINTWF.CNSUBSYSTEMTYPEREFCODE"+
     ",RECORDPOINTWF.RENCODE"+
     ",RECORDPOINTWF.ISBYT"+
     ",RECORDPOINTWF.PHASITYREFCODE"+
     ",RECORDPOINTWF.TECHCONDSERVICESREFCOD"+
     ",RECORDPOINTWF.ISCOUNTERINST"+
     ",RECORDPOINTWF.RPCODE"+
     ",RECORDPOINTWF.RPNAME"+

     " FROM RECORDPOINTWF " +
     //" WHERE "
    "";
        //selectStr = selectStr + " ${s} RECORDPOINTWF.CODE IN ( SELECT RECORDPOINTWF.CODE FROM RECORDPOINTWF ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.CODE = ?";
        }
         if (aFilterObject.accountnumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.accountnumber.indexOf('*',0) < 0 && aFilterObject.accountnumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(RECORDPOINTWF.ACCOUNTNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(RECORDPOINTWF.ACCOUNTNUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.contractnumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contractnumber.indexOf('*',0) < 0 && aFilterObject.contractnumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(RECORDPOINTWF.CONTRACTNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(RECORDPOINTWF.CONTRACTNUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentname != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentname.indexOf('*',0) < 0 && aFilterObject.contragentname.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(RECORDPOINTWF.CONTRAGENTNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(RECORDPOINTWF.CONTRAGENTNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentaddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentaddress.indexOf('*',0) < 0 && aFilterObject.contragentaddress.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(RECORDPOINTWF.CONTRAGENTADDRESS) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(RECORDPOINTWF.CONTRAGENTADDRESS) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentpassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentpassport.indexOf('*',0) < 0 && aFilterObject.contragentpassport.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(RECORDPOINTWF.CONTRAGENTPASSPORT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(RECORDPOINTWF.CONTRAGENTPASSPORT) LIKE UPPER(?)";
         }
         if (aFilterObject.contragentokpo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentokpo.indexOf('*',0) < 0 && aFilterObject.contragentokpo.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(RECORDPOINTWF.CONTRAGENTOKPO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(RECORDPOINTWF.CONTRAGENTOKPO) LIKE UPPER(?)";
         }
        if(aFilterObject.cnpackcode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.CNPACKCODE = ?";
        }
        if(aFilterObject.cnsubsystemtyperefcode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.CNSUBSYSTEMTYPEREFCODE = ?";
        }
        if(aFilterObject.rencode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.RENCODE = ?";
        }
        if(aFilterObject.isbyt != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.ISBYT = ?";
        }
        if(aFilterObject.phasityrefcode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.PHASITYREFCODE = ?";
        }
        if(aFilterObject.contractdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.CONTRACTDATE = ?";
        }
        if(aFilterObject.techcondservicesrefcod != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.TECHCONDSERVICESREFCOD = ?";
        }
        if(aFilterObject.iscounterinst != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.ISCOUNTERINST = ?";
        }
        if(aFilterObject.rpcode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.RPCODE = ?";
        }
         if (aFilterObject.rpname != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.rpname.indexOf('*',0) < 0 && aFilterObject.rpname.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(RECORDPOINTWF.RPNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(RECORDPOINTWF.RPNAME) LIKE UPPER(?)";
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

           if(aFilterObject.accountnumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.accountnumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contractnumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contractnumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentname != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentname);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentaddress != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentaddress);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentpassport != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentpassport);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.contragentokpo != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentokpo);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.cnpackcode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.cnpackcode);
         }
         if(aFilterObject.cnsubsystemtyperefcode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.cnsubsystemtyperefcode);
         }
         if(aFilterObject.rencode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.rencode);
         }
         if(aFilterObject.isbyt != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isbyt);
         }
         if(aFilterObject.phasityrefcode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.phasityrefcode);
         }
        if(aFilterObject.contractdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.contractdate.getTime()));
        }
         if(aFilterObject.techcondservicesrefcod != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.techcondservicesrefcod);
         }
         if(aFilterObject.iscounterinst != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.iscounterinst);
         }
         if(aFilterObject.rpcode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.rpcode);
         }

           if(aFilterObject.rpname != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.rpname);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
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

        anObject = new RecordPointWFShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.accountnumber = set.getString(2);
        anObject.contractnumber = set.getString(3);
        anObject.contragentname = set.getString(4);
        anObject.contragentaddress = set.getString(5);
        anObject.contragentpassport = set.getString(6);
        anObject.contragentokpo = set.getString(7);
        anObject.cnpackcode = set.getInt(8);
        if ( set.wasNull() )
            anObject.cnpackcode = Integer.MIN_VALUE;
        anObject.cnsubsystemtyperefcode = set.getInt(9);
        if ( set.wasNull() )
            anObject.cnsubsystemtyperefcode = Integer.MIN_VALUE;
        anObject.rencode = set.getInt(10);
        if ( set.wasNull() )
            anObject.rencode = Integer.MIN_VALUE;
        anObject.isbyt = set.getInt(11);
        if ( set.wasNull() )
            anObject.isbyt = Integer.MIN_VALUE;
        anObject.phasityrefcode = set.getInt(12);
        if ( set.wasNull() )
            anObject.phasityrefcode = Integer.MIN_VALUE;
        anObject.techcondservicesrefcod = set.getInt(13);
        if ( set.wasNull() )
            anObject.techcondservicesrefcod = Integer.MIN_VALUE;
        anObject.iscounterinst = set.getInt(14);
        if ( set.wasNull() )
            anObject.iscounterinst = Integer.MIN_VALUE;
        anObject.rpcode = set.getInt(15);
        if ( set.wasNull() )
            anObject.rpcode = Integer.MIN_VALUE;
        anObject.rpname = set.getString(16);


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

  public int[] getFilteredCodeArrayOLD(RecordPointWF aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT RECORDPOINTWF.CODE FROM RECORDPOINTWF";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "RECORDPOINTWF.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.CODE = ?";
        }
         if (aFilterObject.accountnumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.accountnumber.indexOf('*',0) < 0 && aFilterObject.accountnumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  RECORDPOINTWF.ACCOUNTNUMBER = ?";
             else
                 whereStr = whereStr + "  RECORDPOINTWF.ACCOUNTNUMBER LIKE ?";
         }
         if (aFilterObject.contractnumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contractnumber.indexOf('*',0) < 0 && aFilterObject.contractnumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRACTNUMBER = ?";
             else
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRACTNUMBER LIKE ?";
         }
         if (aFilterObject.contragentname != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentname.indexOf('*',0) < 0 && aFilterObject.contragentname.indexOf('?',0) < 0)
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRAGENTNAME = ?";
             else
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRAGENTNAME LIKE ?";
         }
         if (aFilterObject.contragentaddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentaddress.indexOf('*',0) < 0 && aFilterObject.contragentaddress.indexOf('?',0) < 0)
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRAGENTADDRESS = ?";
             else
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRAGENTADDRESS LIKE ?";
         }
         if (aFilterObject.contragentpassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentpassport.indexOf('*',0) < 0 && aFilterObject.contragentpassport.indexOf('?',0) < 0)
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRAGENTPASSPORT = ?";
             else
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRAGENTPASSPORT LIKE ?";
         }
         if (aFilterObject.contragentokpo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentokpo.indexOf('*',0) < 0 && aFilterObject.contragentokpo.indexOf('?',0) < 0)
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRAGENTOKPO = ?";
             else
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRAGENTOKPO LIKE ?";
         }
        if(aFilterObject.cnpackcode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.CNPACKCODE = ?";
        }
        if(aFilterObject.cnsubsystemtyperefcode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.CNSUBSYSTEMTYPEREFCODE = ?";
        }
        if(aFilterObject.rencode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.RENCODE = ?";
        }
        if(aFilterObject.isbyt != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.ISBYT = ?";
        }
        if(aFilterObject.phasityrefcode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.PHASITYREFCODE = ?";
        }
        if(aFilterObject.contractdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.CONTRACTDATE = ?";
        }
        if(aFilterObject.techcondservicesrefcod != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.TECHCONDSERVICESREFCOD = ?";
        }
        if(aFilterObject.iscounterinst != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.ISCOUNTERINST = ?";
        }
        if(aFilterObject.rpcode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.RPCODE = ?";
        }
         if (aFilterObject.rpname != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.rpname.indexOf('*',0) < 0 && aFilterObject.rpname.indexOf('?',0) < 0)
                 whereStr = whereStr + "  RECORDPOINTWF.RPNAME = ?";
             else
                 whereStr = whereStr + "  RECORDPOINTWF.RPNAME LIKE ?";
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
         if (aFilterObject.accountnumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.accountnumber.indexOf('*',0) < 0 && aFilterObject.accountnumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " RECORDPOINTWF.ACCOUNTNUMBER = ?";
             else
                 whereStr = whereStr + " RECORDPOINTWF.ACCOUNTNUMBER LIKE ?";

           if(aFilterObject.accountnumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.accountnumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contractnumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contractnumber.indexOf('*',0) < 0 && aFilterObject.contractnumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " RECORDPOINTWF.CONTRACTNUMBER = ?";
             else
                 whereStr = whereStr + " RECORDPOINTWF.CONTRACTNUMBER LIKE ?";

           if(aFilterObject.contractnumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contractnumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentname != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentname.indexOf('*',0) < 0 && aFilterObject.contragentname.indexOf('?',0) < 0)
                 whereStr = whereStr + " RECORDPOINTWF.CONTRAGENTNAME = ?";
             else
                 whereStr = whereStr + " RECORDPOINTWF.CONTRAGENTNAME LIKE ?";

           if(aFilterObject.contragentname != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentname);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentaddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentaddress.indexOf('*',0) < 0 && aFilterObject.contragentaddress.indexOf('?',0) < 0)
                 whereStr = whereStr + " RECORDPOINTWF.CONTRAGENTADDRESS = ?";
             else
                 whereStr = whereStr + " RECORDPOINTWF.CONTRAGENTADDRESS LIKE ?";

           if(aFilterObject.contragentaddress != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentaddress);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentpassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentpassport.indexOf('*',0) < 0 && aFilterObject.contragentpassport.indexOf('?',0) < 0)
                 whereStr = whereStr + " RECORDPOINTWF.CONTRAGENTPASSPORT = ?";
             else
                 whereStr = whereStr + " RECORDPOINTWF.CONTRAGENTPASSPORT LIKE ?";

           if(aFilterObject.contragentpassport != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentpassport);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentokpo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentokpo.indexOf('*',0) < 0 && aFilterObject.contragentokpo.indexOf('?',0) < 0)
                 whereStr = whereStr + " RECORDPOINTWF.CONTRAGENTOKPO = ?";
             else
                 whereStr = whereStr + " RECORDPOINTWF.CONTRAGENTOKPO LIKE ?";

           if(aFilterObject.contragentokpo != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentokpo);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.cnpackcode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.cnpackcode);
         }
         if(aFilterObject.cnsubsystemtyperefcode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.cnsubsystemtyperefcode);
         }
         if(aFilterObject.rencode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.rencode);
         }
         if(aFilterObject.isbyt != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isbyt);
         }
         if(aFilterObject.phasityrefcode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.phasityrefcode);
         }
        if(aFilterObject.contractdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.contractdate.getTime()));
        }
         if(aFilterObject.techcondservicesrefcod != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.techcondservicesrefcod);
         }
         if(aFilterObject.iscounterinst != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.iscounterinst);
         }
         if(aFilterObject.rpcode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.rpcode);
         }
         if (aFilterObject.rpname != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.rpname.indexOf('*',0) < 0 && aFilterObject.rpname.indexOf('?',0) < 0)
                 whereStr = whereStr + " RECORDPOINTWF.RPNAME = ?";
             else
                 whereStr = whereStr + " RECORDPOINTWF.RPNAME LIKE ?";

           if(aFilterObject.rpname != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.rpname);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
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

  public int[] getFilteredCodeArray(RecordPointWFFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(RecordPointWF aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT RECORDPOINTWF.CODE FROM RECORDPOINTWF";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "RECORDPOINTWF.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.CODE = ?";
        }
         if (aFilterObject.accountnumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.accountnumber.indexOf('*',0) < 0 && aFilterObject.accountnumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  RECORDPOINTWF.ACCOUNTNUMBER = ?";
             else
                 whereStr = whereStr + "  RECORDPOINTWF.ACCOUNTNUMBER LIKE ?";
         }
         if (aFilterObject.contractnumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contractnumber.indexOf('*',0) < 0 && aFilterObject.contractnumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRACTNUMBER = ?";
             else
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRACTNUMBER LIKE ?";
         }
         if (aFilterObject.contragentname != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentname.indexOf('*',0) < 0 && aFilterObject.contragentname.indexOf('?',0) < 0)
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRAGENTNAME = ?";
             else
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRAGENTNAME LIKE ?";
         }
         if (aFilterObject.contragentaddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentaddress.indexOf('*',0) < 0 && aFilterObject.contragentaddress.indexOf('?',0) < 0)
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRAGENTADDRESS = ?";
             else
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRAGENTADDRESS LIKE ?";
         }
         if (aFilterObject.contragentpassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentpassport.indexOf('*',0) < 0 && aFilterObject.contragentpassport.indexOf('?',0) < 0)
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRAGENTPASSPORT = ?";
             else
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRAGENTPASSPORT LIKE ?";
         }
         if (aFilterObject.contragentokpo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contragentokpo.indexOf('*',0) < 0 && aFilterObject.contragentokpo.indexOf('?',0) < 0)
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRAGENTOKPO = ?";
             else
                 whereStr = whereStr + "  RECORDPOINTWF.CONTRAGENTOKPO LIKE ?";
         }
        if(aFilterObject.cnpackcode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.CNPACKCODE = ?";
        }
        if(aFilterObject.cnsubsystemtyperefcode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.CNSUBSYSTEMTYPEREFCODE = ?";
        }
        if(aFilterObject.rencode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.RENCODE = ?";
        }
        if(aFilterObject.isbyt != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.ISBYT = ?";
        }
        if(aFilterObject.phasityrefcode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.PHASITYREFCODE = ?";
        }
        if(aFilterObject.contractdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.CONTRACTDATE = ?";
        }
        if(aFilterObject.techcondservicesrefcod != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.TECHCONDSERVICESREFCOD = ?";
        }
        if(aFilterObject.iscounterinst != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.ISCOUNTERINST = ?";
        }
        if(aFilterObject.rpcode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  RECORDPOINTWF.RPCODE = ?";
        }
         if (aFilterObject.rpname != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.rpname.indexOf('*',0) < 0 && aFilterObject.rpname.indexOf('?',0) < 0)
                 whereStr = whereStr + "  RECORDPOINTWF.RPNAME = ?";
             else
                 whereStr = whereStr + "  RECORDPOINTWF.RPNAME LIKE ?";
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
         if (aFilterObject.accountnumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.accountnumber.indexOf('*',0) < 0 && aFilterObject.accountnumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " RECORDPOINTWF.ACCOUNTNUMBER = ?";
             else
                 whereStr = whereStr + " RECORDPOINTWF.ACCOUNTNUMBER LIKE ?";

           if(aFilterObject.accountnumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.accountnumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contractnumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contractnumber.indexOf('*',0) < 0 && aFilterObject.contractnumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " RECORDPOINTWF.CONTRACTNUMBER = ?";
             else
                 whereStr = whereStr + " RECORDPOINTWF.CONTRACTNUMBER LIKE ?";

           if(aFilterObject.contractnumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contractnumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentname != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentname.indexOf('*',0) < 0 && aFilterObject.contragentname.indexOf('?',0) < 0)
                 whereStr = whereStr + " RECORDPOINTWF.CONTRAGENTNAME = ?";
             else
                 whereStr = whereStr + " RECORDPOINTWF.CONTRAGENTNAME LIKE ?";

           if(aFilterObject.contragentname != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentname);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentaddress != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentaddress.indexOf('*',0) < 0 && aFilterObject.contragentaddress.indexOf('?',0) < 0)
                 whereStr = whereStr + " RECORDPOINTWF.CONTRAGENTADDRESS = ?";
             else
                 whereStr = whereStr + " RECORDPOINTWF.CONTRAGENTADDRESS LIKE ?";

           if(aFilterObject.contragentaddress != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentaddress);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentpassport != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentpassport.indexOf('*',0) < 0 && aFilterObject.contragentpassport.indexOf('?',0) < 0)
                 whereStr = whereStr + " RECORDPOINTWF.CONTRAGENTPASSPORT = ?";
             else
                 whereStr = whereStr + " RECORDPOINTWF.CONTRAGENTPASSPORT LIKE ?";

           if(aFilterObject.contragentpassport != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentpassport);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.contragentokpo != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.contragentokpo.indexOf('*',0) < 0 && aFilterObject.contragentokpo.indexOf('?',0) < 0)
                 whereStr = whereStr + " RECORDPOINTWF.CONTRAGENTOKPO = ?";
             else
                 whereStr = whereStr + " RECORDPOINTWF.CONTRAGENTOKPO LIKE ?";

           if(aFilterObject.contragentokpo != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contragentokpo);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.cnpackcode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.cnpackcode);
         }
         if(aFilterObject.cnsubsystemtyperefcode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.cnsubsystemtyperefcode);
         }
         if(aFilterObject.rencode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.rencode);
         }
         if(aFilterObject.isbyt != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isbyt);
         }
         if(aFilterObject.phasityrefcode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.phasityrefcode);
         }
        if(aFilterObject.contractdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.contractdate.getTime()));
        }
         if(aFilterObject.techcondservicesrefcod != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.techcondservicesrefcod);
         }
         if(aFilterObject.iscounterinst != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.iscounterinst);
         }
         if(aFilterObject.rpcode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.rpcode);
         }
         if (aFilterObject.rpname != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.rpname.indexOf('*',0) < 0 && aFilterObject.rpname.indexOf('?',0) < 0)
                 whereStr = whereStr + " RECORDPOINTWF.RPNAME = ?";
             else
                 whereStr = whereStr + " RECORDPOINTWF.RPNAME LIKE ?";

           if(aFilterObject.rpname != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.rpname);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
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


   public RecordPointWF getObject(int uid) throws PersistenceException
   {
    RecordPointWF result = new RecordPointWF();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(RecordPointWF anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  RECORDPOINTWF.CODE, RECORDPOINTWF.ACCOUNTNUMBER, RECORDPOINTWF.CONTRACTNUMBER, RECORDPOINTWF.CONTRAGENTNAME, RECORDPOINTWF.CONTRAGENTADDRESS, RECORDPOINTWF.CONTRAGENTPASSPORT, RECORDPOINTWF.CONTRAGENTOKPO, RECORDPOINTWF.CNPACKCODE, RECORDPOINTWF.CNSUBSYSTEMTYPEREFCODE, RECORDPOINTWF.RENCODE, RECORDPOINTWF.ISBYT, RECORDPOINTWF.PHASITYREFCODE, RECORDPOINTWF.CONTRACTDATE, RECORDPOINTWF.TECHCONDSERVICESREFCOD, RECORDPOINTWF.ISCOUNTERINST, RECORDPOINTWF.RPCODE, RECORDPOINTWF.RPNAME "
    +" FROM RECORDPOINTWF WHERE RECORDPOINTWF.CODE = ?";

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
        anObject.accountnumber = set.getString(2);
        anObject.contractnumber = set.getString(3);
        anObject.contragentname = set.getString(4);
        anObject.contragentaddress = set.getString(5);
        anObject.contragentpassport = set.getString(6);
        anObject.contragentokpo = set.getString(7);
        anObject.cnpackcode = set.getInt(8);
        if ( set.wasNull() )
           anObject.cnpackcode = Integer.MIN_VALUE;
        anObject.cnsubsystemtyperefcode = set.getInt(9);
        if ( set.wasNull() )
           anObject.cnsubsystemtyperefcode = Integer.MIN_VALUE;
        anObject.rencode = set.getInt(10);
        if ( set.wasNull() )
           anObject.rencode = Integer.MIN_VALUE;
        anObject.isbyt = set.getInt(11);
        if ( set.wasNull() )
           anObject.isbyt = Integer.MIN_VALUE;
        anObject.phasityrefcode = set.getInt(12);
        if ( set.wasNull() )
           anObject.phasityrefcode = Integer.MIN_VALUE;
        anObject.contractdate = set.getDate(13);
        anObject.techcondservicesrefcod = set.getInt(14);
        if ( set.wasNull() )
           anObject.techcondservicesrefcod = Integer.MIN_VALUE;
        anObject.iscounterinst = set.getInt(15);
        if ( set.wasNull() )
           anObject.iscounterinst = Integer.MIN_VALUE;
        anObject.rpcode = set.getInt(16);
        if ( set.wasNull() )
           anObject.rpcode = Integer.MIN_VALUE;
        anObject.rpname = set.getString(17);
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


  public com.ksoe.energynet.valueobject.references.RecordPointWFRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.RecordPointWFRef ref = new com.ksoe.energynet.valueobject.references.RecordPointWFRef();
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

    selectStr = "DELETE FROM  RECORDPOINTWF WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    RecordPointWF object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%RecordPointWF.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(RecordPointWF.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%RecordPointWF.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(RecordPointWF.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%RecordPointWF.getObject%} access denied");

    selectStr =

    "SELECT  RECORDPOINTWF.CODE FROM  RECORDPOINTWF WHERE  RECORDPOINTWF.CODE = ?";
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
    _checkConditionToken(condition,"code","RECORDPOINTWF.CODE");
    _checkConditionToken(condition,"accountnumber","RECORDPOINTWF.ACCOUNTNUMBER");
    _checkConditionToken(condition,"contractnumber","RECORDPOINTWF.CONTRACTNUMBER");
    _checkConditionToken(condition,"contragentname","RECORDPOINTWF.CONTRAGENTNAME");
    _checkConditionToken(condition,"contragentaddress","RECORDPOINTWF.CONTRAGENTADDRESS");
    _checkConditionToken(condition,"contragentpassport","RECORDPOINTWF.CONTRAGENTPASSPORT");
    _checkConditionToken(condition,"contragentokpo","RECORDPOINTWF.CONTRAGENTOKPO");
    _checkConditionToken(condition,"cnpackcode","RECORDPOINTWF.CNPACKCODE");
    _checkConditionToken(condition,"cnsubsystemtyperefcode","RECORDPOINTWF.CNSUBSYSTEMTYPEREFCODE");
    _checkConditionToken(condition,"rencode","RECORDPOINTWF.RENCODE");
    _checkConditionToken(condition,"isbyt","RECORDPOINTWF.ISBYT");
    _checkConditionToken(condition,"phasityrefcode","RECORDPOINTWF.PHASITYREFCODE");
    _checkConditionToken(condition,"contractdate","RECORDPOINTWF.CONTRACTDATE");
    _checkConditionToken(condition,"techcondservicesrefcod","RECORDPOINTWF.TECHCONDSERVICESREFCOD");
    _checkConditionToken(condition,"iscounterinst","RECORDPOINTWF.ISCOUNTERINST");
    _checkConditionToken(condition,"rpcode","RECORDPOINTWF.RPCODE");
    _checkConditionToken(condition,"rpname","RECORDPOINTWF.RPNAME");
      // relationship conditions
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
    catch (NamingException e) {throw new EnergyproSystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
    catch (SQLException e)    {throw new EnergyproSystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
   }


   ///////////// PRIVATE SECTION ///////////////
   protected static Hashtable _sequenceTable = new Hashtable();

   private void _collectAutoIncrementFields(RecordPointWF anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("RECORDPOINTWF", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("RECORDPOINTWF", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("RECORDPOINTWF", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: RECORDPOINTWF");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of RecordPointWFDAO

