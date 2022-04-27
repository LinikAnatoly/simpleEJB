
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
import com.ksoe.energynet.valueobject.ENActProj2OZ2;
import com.ksoe.energynet.valueobject.brief.ENActProj2OZ2Short;
import com.ksoe.energynet.valueobject.filter.ENActProj2OZ2Filter;
import com.ksoe.energynet.valueobject.lists.ENActProj2OZ2ShortList;
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
  *  DAO Generated for ENActProj2OZ2;
  *
  */

public class ENActProj2OZ2DAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENActProj2OZ2DAOGen() {super();}
  //public ENActProj2OZ2DAOGen(Connection aConnection) {super(aConnection);}
  //public ENActProj2OZ2DAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENActProj2OZ2DAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENActProj2OZ2DAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENActProj2OZ2 inObject) throws PersistenceException
   {
      ENActProj2OZ2 obj = new ENActProj2OZ2();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.numberGen != obj.numberGen){
       return false;
     }

     if ( ! inObject.dateGen.equals(obj.dateGen)){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }

     if ( ! inObject.summaGen.equals(obj.summaGen)){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }
     if (inObject.ENReconstrModernOZRef.code != obj.ENReconstrModernOZRef.code){
        return false;
     }
      return true;
   }

   public int add(ENActProj2OZ2 anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENActProj2OZ2 anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENACTPROJ2OZ2 (CODE,NUMBERGEN,DATEGEN,COMMENTGEN,SUMMAGEN,USERGEN,DATEEDIT,MODIFY_TIME,ENRECONSTRMODERNOZRFCD) VALUES (?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.numberGen);
      if (anObject.dateGen == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.dateGen.getTime()));
      statement.setString(4,anObject.commentGen);
      if (anObject.summaGen != null)
        anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.summaGen);
      statement.setString(6,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(7,null);
      else
        statement.setDate(7,new java.sql.Date(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(8,null);
      else
        statement.setBigDecimal(8,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENReconstrModernOZDAOGen(connection,getUserProfile()).exists(anObject.ENReconstrModernOZRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActProj2OZ2.ENReconstrModernOZRef.code%} = {%"+anObject.ENReconstrModernOZRef.code+"%}");
        statement.setInt(9,anObject.ENReconstrModernOZRef.code);
      }
      else
        statement.setNull(9,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENActProj2OZ2DAOGen.add%}",e);
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

   public void save(ENActProj2OZ2 anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENActProj2OZ2 anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENActProj2OZ2 oldObject = new ENActProj2OZ2();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENActProj2OZ2.modify_time_Field+" FROM  ENACTPROJ2OZ2 WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("SUMMAGEN") == 0)
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
          if(fieldNameStr.compareTo("ENRECONSTRMODERNOZREF") == 0)
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
        "UPDATE ENACTPROJ2OZ2 SET  NUMBERGEN = ? , DATEGEN = ? , COMMENTGEN = ? , SUMMAGEN = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , ENRECONSTRMODERNOZRFCD = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENACTPROJ2OZ2 SET ";
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
      statement.setString(1,anObject.numberGen);
      if (anObject.dateGen == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.dateGen.getTime()));
      statement.setString(3,anObject.commentGen);
      if (anObject.summaGen != null)
        anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.summaGen);

      statement.setString(5,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(6,null);
      else
        statement.setDate(6,new java.sql.Date(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(7,null);
      else
        statement.setBigDecimal(7,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE)
        statement.setInt(8,anObject.ENReconstrModernOZRef.code);
      else
        statement.setNull(8,java.sql.Types.INTEGER);
          statement.setInt(9,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("NUMBERGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.numberGen);
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
            if("SUMMAGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.summaGen != null)
                    anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.summaGen);
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
            if("ENRECONSTRMODERNOZREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.ENReconstrModernOZRef.code);
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

   } // end of save(ENActProj2OZ2 anObject,String[] anAttributes)


 public ENActProj2OZ2Short getShortObject(int anObjectCode) throws PersistenceException
  {
   ENActProj2OZ2 filterObject = new ENActProj2OZ2();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENActProj2OZ2Short)list.get(0);
   return null;
  }

  public ENActProj2OZ2ShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENActProj2OZ2ShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENActProj2OZ2ShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENActProj2OZ2ShortList getFilteredList(ENActProj2OZ2 filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENActProj2OZ2ShortList getScrollableFilteredList(ENActProj2OZ2 aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENActProj2OZ2ShortList getScrollableFilteredList(ENActProj2OZ2 aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENActProj2OZ2ShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENActProj2OZ2ShortList getScrollableFilteredList(ENActProj2OZ2Filter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENActProj2OZ2ShortList getScrollableFilteredList(ENActProj2OZ2Filter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENActProj2OZ2ShortList getScrollableFilteredList(ENActProj2OZ2 aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENActProj2OZ2ShortList getScrollableFilteredList(ENActProj2OZ2 aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENActProj2OZ2ShortList result = new ENActProj2OZ2ShortList();
    ENActProj2OZ2Short anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACTPROJ2OZ2.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENACTPROJ2OZ2.CODE"+
     ",ENACTPROJ2OZ2.NUMBERGEN"+
     ",ENACTPROJ2OZ2.DATEGEN"+
     ",ENACTPROJ2OZ2.SUMMAGEN"+
     ",ENACTPROJ2OZ2.USERGEN"+
     ",ENACTPROJ2OZ2.DATEEDIT"+

      ", ENRECONSTRMODERNOZ.CODE " +
      ", ENRECONSTRMODERNOZ.NUMBERGEN " +
      ", ENRECONSTRMODERNOZ.DATEGEN " +
      ", ENRECONSTRMODERNOZ.DATEEDIT " +
      ", ENRECONSTRMODERNOZ.SUMMAGEN " +
      ", ENRECONSTRMODERNOZ.SUMMANDS " +
      ", ENRECONSTRMODERNOZ.CHARACTERISTIC " +
      ", ENRECONSTRMODERNOZ.EXECUTEDPOSITION " +
      ", ENRECONSTRMODERNOZ.EXECUTEDNAME " +
      ", ENRECONSTRMODERNOZ.ACCEPTEDPOSITION " +
      ", ENRECONSTRMODERNOZ.ACCEPTEDNAME " +
      ", ENRECONSTRMODERNOZ.CONTRACTPRICE " +
      ", ENRECONSTRMODERNOZ.CODEMOL " +
      ", ENRECONSTRMODERNOZ.CODEPODR " +
      ", ENRECONSTRMODERNOZ.INVNUMBEROZ " +
      ", ENRECONSTRMODERNOZ.NAMEOZ " +
      ", ENRECONSTRMODERNOZ.FINCONTRACTNUMBER " +
      ", ENRECONSTRMODERNOZ.FINCONTRACTDATE " +
      ", ENRECONSTRMODERNOZ.PARTNERNAME " +
      ", ENRECONSTRMODERNOZ.PARTNERCODE " +
      ", ENRECONSTRMODERNOZ.CHARACTERISTICOS " +
      ", ENRECONSTRMODERNOZ.ISINVESTPROGRAM " +
      ", ENRECONSTRMODERNOZ.YEARINVESTPROGRAM " +
      ", ENRECONSTRMODERNOZ.ITEMINVESTPROGRAM " +
      ", ENRECONSTRMODERNOZ.TYPERM " +
      ", ENRECONSTRMODERNOZ.USERGEN " +
     " FROM ENACTPROJ2OZ2 " +
     ", ENRECONSTRMODERNOZ " +
     //" WHERE "
    "";
     whereStr = " ENRECONSTRMODERNOZ.CODE = ENACTPROJ2OZ2.ENRECONSTRMODERNOZRFCD" ; //+
        //selectStr = selectStr + " ${s} ENACTPROJ2OZ2.CODE IN ( SELECT ENACTPROJ2OZ2.CODE FROM ENACTPROJ2OZ2 ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2.CODE = ?";
        }
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACTPROJ2OZ2.NUMBERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACTPROJ2OZ2.NUMBERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2.DATEGEN = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACTPROJ2OZ2.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACTPROJ2OZ2.COMMENTGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.summaGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2.SUMMAGEN = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACTPROJ2OZ2.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACTPROJ2OZ2.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2.MODIFY_TIME = ?";
        }
        if(aFilterObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACTPROJ2OZ2.ENRECONSTRMODERNOZRFCD = ? ";
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

           if(aFilterObject.numberGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numberGen);
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
        if(aFilterObject.summaGen != null){
            number++;
            aFilterObject.summaGen = aFilterObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summaGen);
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
       if(aFilterObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ENReconstrModernOZRef.code);
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

        anObject = new ENActProj2OZ2Short();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.numberGen = set.getString(2);
        anObject.dateGen = set.getDate(3);
        anObject.summaGen = set.getBigDecimal(4);
        if(anObject.summaGen != null)
            anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(5);
        anObject.dateEdit = set.getDate(6);

        anObject.ENReconstrModernOZRefCode = set.getInt(7);
        if(set.wasNull())
        anObject.ENReconstrModernOZRefCode = Integer.MIN_VALUE;
        anObject.ENReconstrModernOZRefNumbergen = set.getString(8);
        anObject.ENReconstrModernOZRefDateGen = set.getDate(9);
        anObject.ENReconstrModernOZRefDateEdit = set.getDate(10);
        anObject.ENReconstrModernOZRefSummaGen = set.getBigDecimal(11);
        if(anObject.ENReconstrModernOZRefSummaGen != null)
          anObject.ENReconstrModernOZRefSummaGen = anObject.ENReconstrModernOZRefSummaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ENReconstrModernOZRefSummaNDS = set.getBigDecimal(12);
        if(anObject.ENReconstrModernOZRefSummaNDS != null)
          anObject.ENReconstrModernOZRefSummaNDS = anObject.ENReconstrModernOZRefSummaNDS.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ENReconstrModernOZRefCharacteristic = set.getString(13);
        anObject.ENReconstrModernOZRefExecutedPosition = set.getString(14);
        anObject.ENReconstrModernOZRefExecutedName = set.getString(15);
        anObject.ENReconstrModernOZRefAcceptedPosition = set.getString(16);
        anObject.ENReconstrModernOZRefAcceptedName = set.getString(17);
        anObject.ENReconstrModernOZRefContractPrice = set.getBigDecimal(18);
        if(anObject.ENReconstrModernOZRefContractPrice != null)
          anObject.ENReconstrModernOZRefContractPrice = anObject.ENReconstrModernOZRefContractPrice.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ENReconstrModernOZRefCodeMol = set.getString(19);
        anObject.ENReconstrModernOZRefCodePodr = set.getString(20);
        anObject.ENReconstrModernOZRefInvNumberOZ = set.getString(21);
        anObject.ENReconstrModernOZRefNameOZ = set.getString(22);
        anObject.ENReconstrModernOZRefFinContractNumber = set.getString(23);
        anObject.ENReconstrModernOZRefFinContractDate = set.getDate(24);
        anObject.ENReconstrModernOZRefPartnerName = set.getString(25);
        anObject.ENReconstrModernOZRefPartnerCode = set.getString(26);
        anObject.ENReconstrModernOZRefCharacteristicOS = set.getString(27);
        anObject.ENReconstrModernOZRefIsInvestProgram = set.getInt(28);
        if(set.wasNull())
        anObject.ENReconstrModernOZRefIsInvestProgram = Integer.MIN_VALUE;
        anObject.ENReconstrModernOZRefYearInvestProgram = set.getString(29);
        anObject.ENReconstrModernOZRefItemInvestProgram = set.getString(30);
        anObject.ENReconstrModernOZRefTypeRM = set.getInt(31);
        if(set.wasNull())
        anObject.ENReconstrModernOZRefTypeRM = Integer.MIN_VALUE;
        anObject.ENReconstrModernOZRefUserGen = set.getString(32);

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

  public int[] getFilteredCodeArrayOLD(ENActProj2OZ2 aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENACTPROJ2OZ2.CODE FROM ENACTPROJ2OZ2";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACTPROJ2OZ2.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2.CODE = ?";
        }
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACTPROJ2OZ2.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENACTPROJ2OZ2.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2.DATEGEN = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACTPROJ2OZ2.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENACTPROJ2OZ2.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.summaGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2.SUMMAGEN = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACTPROJ2OZ2.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENACTPROJ2OZ2.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2.MODIFY_TIME = ?";
        }
        if(aFilterObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACTPROJ2OZ2.ENRECONSTRMODERNOZRFCD = ? ";
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
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACTPROJ2OZ2.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENACTPROJ2OZ2.NUMBERGEN LIKE ?";

           if(aFilterObject.numberGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numberGen);
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
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACTPROJ2OZ2.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENACTPROJ2OZ2.COMMENTGEN LIKE ?";

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
        if(aFilterObject.summaGen != null){
            number++;
            aFilterObject.summaGen = aFilterObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summaGen);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACTPROJ2OZ2.USERGEN = ?";
             else
                 whereStr = whereStr + " ENACTPROJ2OZ2.USERGEN LIKE ?";

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
       if(aFilterObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ENReconstrModernOZRef.code);
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

  public int[] getFilteredCodeArray(ENActProj2OZ2Filter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENActProj2OZ2 aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENACTPROJ2OZ2.CODE FROM ENACTPROJ2OZ2";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACTPROJ2OZ2.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2.CODE = ?";
        }
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACTPROJ2OZ2.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENACTPROJ2OZ2.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2.DATEGEN = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACTPROJ2OZ2.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENACTPROJ2OZ2.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.summaGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2.SUMMAGEN = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACTPROJ2OZ2.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENACTPROJ2OZ2.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2.MODIFY_TIME = ?";
        }
        if(aFilterObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACTPROJ2OZ2.ENRECONSTRMODERNOZRFCD = ? ";
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
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACTPROJ2OZ2.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENACTPROJ2OZ2.NUMBERGEN LIKE ?";

           if(aFilterObject.numberGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numberGen);
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
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACTPROJ2OZ2.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENACTPROJ2OZ2.COMMENTGEN LIKE ?";

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
        if(aFilterObject.summaGen != null){
            number++;
            aFilterObject.summaGen = aFilterObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summaGen);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACTPROJ2OZ2.USERGEN = ?";
             else
                 whereStr = whereStr + " ENACTPROJ2OZ2.USERGEN LIKE ?";

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
       if(aFilterObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ENReconstrModernOZRef.code);
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


   public ENActProj2OZ2 getObject(int uid) throws PersistenceException
   {
    ENActProj2OZ2 result = new ENActProj2OZ2();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENActProj2OZ2 anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENACTPROJ2OZ2.CODE, ENACTPROJ2OZ2.NUMBERGEN, ENACTPROJ2OZ2.DATEGEN, ENACTPROJ2OZ2.COMMENTGEN, ENACTPROJ2OZ2.SUMMAGEN, ENACTPROJ2OZ2.USERGEN, ENACTPROJ2OZ2.DATEEDIT, ENACTPROJ2OZ2.MODIFY_TIME, ENACTPROJ2OZ2.ENRECONSTRMODERNOZRFCD "
    +" FROM ENACTPROJ2OZ2 WHERE ENACTPROJ2OZ2.CODE = ?";

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
        anObject.numberGen = set.getString(2);
        anObject.dateGen = set.getDate(3);
        anObject.commentGen = set.getString(4);
        anObject.summaGen = set.getBigDecimal(5);
        if(anObject.summaGen != null)
            anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(6);
        anObject.dateEdit = set.getDate(7);
        anObject.modify_time = set.getLong(8);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.ENReconstrModernOZRef.code = set.getInt(9);
        if ( set.wasNull() )
            anObject.ENReconstrModernOZRef.code = Integer.MIN_VALUE;
        if(anObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE)
        {
           anObject.setENReconstrModernOZRef(
        new com.ksoe.energynet.dataminer.generated.ENReconstrModernOZDAOGen(connection,getUserProfile()).getRef(anObject.ENReconstrModernOZRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENActProj2OZ2Ref getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENActProj2OZ2Ref ref = new com.ksoe.energynet.valueobject.references.ENActProj2OZ2Ref();
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

    selectStr = "DELETE FROM  ENACTPROJ2OZ2 WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENActProj2OZ2 object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENActProj2OZ2.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENActProj2OZ2.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENActProj2OZ2.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActProj2OZ2.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENActProj2OZ2.getObject%} access denied");

    selectStr =

    "SELECT  ENACTPROJ2OZ2.CODE FROM  ENACTPROJ2OZ2 WHERE  ENACTPROJ2OZ2.CODE = ?";
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
    _checkConditionToken(condition,"code","ENACTPROJ2OZ2.CODE");
    _checkConditionToken(condition,"numbergen","ENACTPROJ2OZ2.NUMBERGEN");
    _checkConditionToken(condition,"dategen","ENACTPROJ2OZ2.DATEGEN");
    _checkConditionToken(condition,"commentgen","ENACTPROJ2OZ2.COMMENTGEN");
    _checkConditionToken(condition,"summagen","ENACTPROJ2OZ2.SUMMAGEN");
    _checkConditionToken(condition,"usergen","ENACTPROJ2OZ2.USERGEN");
    _checkConditionToken(condition,"dateedit","ENACTPROJ2OZ2.DATEEDIT");
    _checkConditionToken(condition,"modify_time","ENACTPROJ2OZ2.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"enreconstrmodernozref","ENRECONSTRMODERNOZRFCD");
    _checkConditionToken(condition,"enreconstrmodernozref.code","ENRECONSTRMODERNOZRFCD");
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

   private void _collectAutoIncrementFields(ENActProj2OZ2 anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENACTPROJ2OZ2", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENACTPROJ2OZ2", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENACTPROJ2OZ2", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENACTPROJ2OZ2");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENActProj2OZ2DAO

