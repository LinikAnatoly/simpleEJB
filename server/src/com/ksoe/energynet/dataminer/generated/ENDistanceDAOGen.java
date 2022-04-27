
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

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.valueobject.ENDistance;
import com.ksoe.energynet.valueobject.brief.ENDistanceShort;
import com.ksoe.energynet.valueobject.filter.ENDistanceFilter;
import com.ksoe.energynet.valueobject.lists.ENDistanceShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;


  /**
  *  DAO Generated for ENDistance;
  *
  */

public class ENDistanceDAOGen extends GenericDataMiner {

  public ENDistanceDAOGen() {super();}
  public ENDistanceDAOGen(Connection aConnection) {super(aConnection);}
  public ENDistanceDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENDistanceDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENDistanceDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENDistance inObject) throws PersistenceException
   {
      ENDistance obj = new ENDistance();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.distance.equals(obj.distance)){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }
     if (inObject.typeRef.code != obj.typeRef.code){
        return false;
     }
     if (inObject.roadType.code != obj.roadType.code){
        return false;
     }
     if (inObject.transportItemRef.code != obj.transportItemRef.code){
        return false;
     }
      return true;
   }

   public int add(ENDistance anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENDistance anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENDISTANCE (CODE,DISTANCE,COMMENTGEN,MODIFY_TIME,TYPEREFCODE,ROADTYPECODE,TRANSPORTITEMREFCODE) VALUES (?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.distance != null)
        anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.distance);
      statement.setString(3,anObject.commentGen);

      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(4,null);
      else
        statement.setBigDecimal(4,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.typeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDistanceTypeDAOGen(connection,getUserProfile()).exists(anObject.typeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDistance.typeRef.code%} = {%"+anObject.typeRef.code+"%}");
        statement.setInt(5,anObject.typeRef.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.roadType.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENRoadTypeDAOGen(connection,getUserProfile()).exists(anObject.roadType.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDistance.roadType.code%} = {%"+anObject.roadType.code+"%}");
        statement.setInt(6,anObject.roadType.code);
      }
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.transportItemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransportItemDAOGen(connection,getUserProfile()).exists(anObject.transportItemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDistance.transportItemRef.code%} = {%"+anObject.transportItemRef.code+"%}");
        statement.setInt(7,anObject.transportItemRef.code);
      }
      else
        statement.setNull(7,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENDistanceDAOGen.add%}",e);
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

   public void save(ENDistance anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENDistance anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENDistance oldObject = new ENDistance();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENDistance.modify_time_Field + " FROM  ENDISTANCE WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("DISTANCE") == 0)
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
          if(fieldNameStr.compareTo("ROADTYPE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRANSPORTITEMREF") == 0)
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
        "UPDATE ENDISTANCE SET  DISTANCE = ? , COMMENTGEN = ? , MODIFY_TIME = ? , TYPEREFCODE = ? , ROADTYPECODE = ? , TRANSPORTITEMREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENDISTANCE SET ";
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
      if (anObject.distance != null)
        anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.distance);
      statement.setString(2,anObject.commentGen);

      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(3,null);
      else
        statement.setBigDecimal(3,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.typeRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.typeRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.roadType.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.roadType.code);
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.transportItemRef.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.transportItemRef.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);

      statement.setInt(7,anObject.code);

         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("DISTANCE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.distance != null)
                    anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.distance);
                continue;
             }
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
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
            if("ROADTYPE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.roadType.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.roadType.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRANSPORTITEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportItemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportItemRef.code);
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

   } // end of save(ENDistance anObject,String[] anAttributes)


 public ENDistanceShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENDistance filterObject = new ENDistance();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENDistanceShort)list.get(0);
   return null;
  }

  public ENDistanceShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENDistanceShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENDistanceShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENDistanceShortList getFilteredList(ENDistance filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENDistanceShortList getScrollableFilteredList(ENDistance aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENDistanceShortList getScrollableFilteredList(ENDistance aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENDistanceShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENDistanceShortList getScrollableFilteredList(ENDistanceFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENDistanceShortList getScrollableFilteredList(ENDistanceFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENDistanceShortList getScrollableFilteredList(ENDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENDistanceShortList getScrollableFilteredList(ENDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENDistanceShortList result = new ENDistanceShortList();
    ENDistanceShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDISTANCE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENDISTANCE.CODE"+
     ",ENDISTANCE.DISTANCE"+

      ", ENDISTANCETYPE.CODE " +
      ", ENDISTANCETYPE.NAME " +
      ", ENROADTYPE.CODE " +
      ", ENROADTYPE.NAME " +
     ", ENDISTANCE.TRANSPORTITEMREFCODE" +
     " FROM ENDISTANCE " +
     ", ENDISTANCETYPE " +
     ", ENROADTYPE " +
     //" WHERE "
    "";
     whereStr = " ENDISTANCETYPE.CODE = ENDISTANCE.TYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENROADTYPE.CODE = ENDISTANCE.ROADTYPECODE" ; //+
        //selectStr = selectStr + " ${s} ENDISTANCE.CODE IN ( SELECT ENDISTANCE.CODE FROM ENDISTANCE ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDISTANCE.CODE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDISTANCE.DISTANCE = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDISTANCE.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDISTANCE.COMMENTGEN) LIKE UPPER(?)";
         }

        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDISTANCE.MODIFY_TIME = ?";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDISTANCE.TYPEREFCODE = ? ";
        }
        if(aFilterObject.roadType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDISTANCE.ROADTYPECODE = ? ";
        }
        if(aFilterObject.transportItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDISTANCE.TRANSPORTITEMREFCODE = ? ";
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
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
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
       if(aFilterObject.roadType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.roadType.code);
       }
       if(aFilterObject.transportItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportItemRef.code);
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

        anObject = new ENDistanceShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.distance = set.getBigDecimal(2);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);


        anObject.typeRefCode = set.getInt(3);

        anObject.typeRefName = set.getString(4);

        anObject.roadTypeCode = set.getInt(5);

        anObject.roadTypeName = set.getString(6);
        anObject.transportItemRefCode = set.getInt(7);

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

/*********************************/

  public int[] getFilteredCodeArray_1(ENDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDISTANCE.CODE FROM ENDISTANCE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDISTANCE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDISTANCE.CODE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDISTANCE.DISTANCE = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDISTANCE.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENDISTANCE.COMMENTGEN LIKE ?";
         }

        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDISTANCE.MODIFY_TIME = ?";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDISTANCE.TYPEREFCODE = ? ";
        }
        if(aFilterObject.roadType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDISTANCE.ROADTYPECODE = ? ";
        }
        if(aFilterObject.transportItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDISTANCE.TRANSPORTITEMREFCODE = ? ";
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
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDISTANCE.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENDISTANCE.COMMENTGEN LIKE ?";

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
       if(aFilterObject.roadType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.roadType.code);
       }
       if(aFilterObject.transportItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportItemRef.code);
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


   public ENDistance getObject(int uid) throws PersistenceException
   {
    ENDistance result = new ENDistance();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENDistance anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr =
    "SELECT  ENDISTANCE.CODE, ENDISTANCE.DISTANCE, ENDISTANCE.COMMENTGEN, ENDISTANCE.MODIFY_TIME, ENDISTANCE.TYPEREFCODE, ENDISTANCE.ROADTYPECODE, ENDISTANCE.TRANSPORTITEMREFCODE "
    +" FROM ENDISTANCE WHERE ENDISTANCE.CODE = ?";

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
        anObject.distance = set.getBigDecimal(2);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.commentGen = set.getString(3);

        anObject.modify_time = set.getLong(4);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.typeRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.typeRef.code = Integer.MIN_VALUE;
        anObject.roadType.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.roadType.code = Integer.MIN_VALUE;
        anObject.transportItemRef.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.transportItemRef.code = Integer.MIN_VALUE;
        if(anObject.typeRef.code != Integer.MIN_VALUE)
        {
           anObject.setTypeRef(
        new com.ksoe.energynet.dataminer.generated.ENDistanceTypeDAOGen(connection,getUserProfile()).getRef(anObject.typeRef.code));
    }
        if(anObject.roadType.code != Integer.MIN_VALUE)
        {
           anObject.setRoadType(
        new com.ksoe.energynet.dataminer.generated.ENRoadTypeDAOGen(connection,getUserProfile()).getObject(anObject.roadType.code));
    }
        if(anObject.transportItemRef.code != Integer.MIN_VALUE)
        {
           anObject.setTransportItemRef(
        new com.ksoe.energynet.dataminer.generated.ENTransportItemDAOGen(connection,getUserProfile()).getRef(anObject.transportItemRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENDistanceRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENDistanceRef ref = new com.ksoe.energynet.valueobject.references.ENDistanceRef();
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

    selectStr = "DELETE FROM  ENDISTANCE WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENDistance object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENDistance.getObject%} access denied");

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

    selectStr =

    "SELECT  ENDISTANCE.CODE FROM  ENDISTANCE WHERE  ENDISTANCE.CODE = ?";

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
    _checkConditionToken(condition,"code","ENDISTANCE.CODE");
    _checkConditionToken(condition,"distance","ENDISTANCE.DISTANCE");
    _checkConditionToken(condition,"commentgen","ENDISTANCE.COMMENTGEN");

    _checkConditionToken(condition,"modify_time","ENDISTANCE.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"typeref","TYPEREFCODE");
    _checkConditionToken(condition,"typeref.code","TYPEREFCODE");
    _checkConditionToken(condition,"roadtype","ROADTYPECODE");
    _checkConditionToken(condition,"roadtype.code","ROADTYPECODE");
    _checkConditionToken(condition,"transportitemref","TRANSPORTITEMREFCODE");
    _checkConditionToken(condition,"transportitemref.code","TRANSPORTITEMREFCODE");
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

   private void _collectAutoIncrementFields(ENDistance anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENDISTANCE", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENDISTANCE", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENDISTANCE", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENDISTANCE");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }

} // end of ENDistanceDAO

