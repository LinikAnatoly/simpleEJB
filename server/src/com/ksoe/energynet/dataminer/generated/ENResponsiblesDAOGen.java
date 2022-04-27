
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
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
import com.ksoe.energynet.valueobject.ENResponsibles;
import com.ksoe.energynet.valueobject.brief.ENResponsiblesShort;
import com.ksoe.energynet.valueobject.filter.ENResponsiblesFilter;
import com.ksoe.energynet.valueobject.lists.ENResponsiblesShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENResponsibles;
 *
 */

public class ENResponsiblesDAOGen extends GenericDataMiner {

   public ENResponsiblesDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENResponsiblesDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(ENResponsibles inObject) throws PersistenceException
   {
      ENResponsibles obj = new ENResponsibles();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.FIO == null && obj.FIO == null){}
	else
		if(inObject.FIO == null || obj.FIO == null) return false;
		else
			if ( ! inObject.FIO.equals(obj.FIO)){
				return false;
			}

	if(inObject.tabNumber == null && obj.tabNumber == null){}
	else
		if(inObject.tabNumber == null || obj.tabNumber == null) return false;
		else
			if ( ! inObject.tabNumber.equals(obj.tabNumber)){
				return false;
			}

	if(inObject.position == null && obj.position == null){}
	else
		if(inObject.position == null || obj.position == null) return false;
		else
			if ( ! inObject.position.equals(obj.position)){
				return false;
			}

	if(inObject.depName == null && obj.depName == null){}
	else
		if(inObject.depName == null || obj.depName == null) return false;
		else
			if ( ! inObject.depName.equals(obj.depName)){
				return false;
			}

	if(inObject.depCode == null && obj.depCode == null){}
	else
		if(inObject.depCode == null || obj.depCode == null) return false;
		else
			if ( ! inObject.depCode.equals(obj.depCode)){
				return false;
			}

	if(inObject.phone == null && obj.phone == null){}
	else
		if(inObject.phone == null || obj.phone == null) return false;
		else
			if ( ! inObject.phone.equals(obj.phone)){
				return false;
			}
     if (inObject.kindRef.code != obj.kindRef.code){
        return false;
     }
      return true;
   }

   public int add(ENResponsibles anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENResponsibles anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENRESPONSIBLES (CODE,FIO,TABNUMBER,POSITION,DEPNAME,DEPCODE,PHONE,KINDREFCODE) VALUES (?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.FIO);
      statement.setString(3,anObject.tabNumber);
      statement.setString(4,anObject.position);
      statement.setString(5,anObject.depName);
      statement.setString(6,anObject.depCode);
      statement.setString(7,anObject.phone);
      if (anObject.kindRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENResponsiblesKindDAOGen(connection,getUserProfile()).exists(anObject.kindRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENResponsibles.kindRef.code%} = {%"+anObject.kindRef.code+"%}");
        statement.setInt(8,anObject.kindRef.code);
      }
      else
        statement.setNull(8,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENResponsiblesDAOGen.add%}",e);
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

   public void save(ENResponsibles anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENResponsibles anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("FIO") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TABNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POSITION") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DEPNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DEPCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PHONE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("KINDREF") == 0)
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
        "UPDATE ENRESPONSIBLES SET  FIO = ? , TABNUMBER = ? , POSITION = ? , DEPNAME = ? , DEPCODE = ? , PHONE = ? , KINDREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENRESPONSIBLES SET ";
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
      statement.setString(1,anObject.FIO);
      statement.setString(2,anObject.tabNumber);
      statement.setString(3,anObject.position);
      statement.setString(4,anObject.depName);
      statement.setString(5,anObject.depCode);
      statement.setString(6,anObject.phone);
      if (anObject.kindRef.code != Integer.MIN_VALUE)
        statement.setInt(7,anObject.kindRef.code);
      else
        statement.setNull(7,java.sql.Types.INTEGER);
          statement.setInt(8,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("FIO".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.FIO);
                continue;
             }
            if("TABNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.tabNumber);
                continue;
             }
            if("POSITION".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.position);
                continue;
             }
            if("DEPNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.depName);
                continue;
             }
            if("DEPCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.depCode);
                continue;
             }
            if("PHONE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.phone);
                continue;
             }
            if("KINDREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.kindRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.kindRef.code);
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

   } // end of save(ENResponsibles anObject,String[] anAttributes)


 public ENResponsiblesShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENResponsibles filterObject = new ENResponsibles();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENResponsiblesShort)list.get(0);
   return null;
  }

  public ENResponsiblesShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENResponsiblesShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENResponsiblesShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENResponsiblesShortList getFilteredList(ENResponsibles filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENResponsiblesShortList getScrollableFilteredList(ENResponsibles aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENResponsiblesShortList getScrollableFilteredList(ENResponsibles aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENResponsiblesShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENResponsiblesShortList getScrollableFilteredList(ENResponsiblesFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENResponsiblesShortList getScrollableFilteredList(ENResponsiblesFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENResponsiblesShortList getScrollableFilteredList(ENResponsibles aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENResponsiblesShortList getScrollableFilteredList(ENResponsibles aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENResponsiblesShortList result = new ENResponsiblesShortList();
    ENResponsiblesShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENRESPONSIBLES.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENRESPONSIBLES.CODE"+
     ",ENRESPONSIBLES.FIO"+
     ",ENRESPONSIBLES.TABNUMBER"+
     ",ENRESPONSIBLES.POSITION"+
     ",ENRESPONSIBLES.DEPNAME"+
     ",ENRESPONSIBLES.DEPCODE"+
     ",ENRESPONSIBLES.PHONE"+

      ", ENRESPONSIBLESKIND.CODE " +
      ", ENRESPONSIBLESKIND.NAME " +
     " FROM ENRESPONSIBLES " +
     ", ENRESPONSIBLESKIND " +
     //" WHERE "
  "";
     whereStr = " ENRESPONSIBLESKIND.CODE = ENRESPONSIBLES.KINDREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENRESPONSIBLES.CODE IN ( SELECT ENRESPONSIBLES.CODE FROM ENRESPONSIBLES ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRESPONSIBLES.CODE = ?";
        }
         if (aFilterObject.FIO != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.FIO.indexOf('*',0) < 0 && aFilterObject.FIO.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENRESPONSIBLES.FIO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENRESPONSIBLES.FIO) LIKE UPPER(?)";
         }
         if (aFilterObject.tabNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENRESPONSIBLES.TABNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENRESPONSIBLES.TABNUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.position != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.position.indexOf('*',0) < 0 && aFilterObject.position.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENRESPONSIBLES.POSITION) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENRESPONSIBLES.POSITION) LIKE UPPER(?)";
         }
         if (aFilterObject.depName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.depName.indexOf('*',0) < 0 && aFilterObject.depName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENRESPONSIBLES.DEPNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENRESPONSIBLES.DEPNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.depCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.depCode.indexOf('*',0) < 0 && aFilterObject.depCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENRESPONSIBLES.DEPCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENRESPONSIBLES.DEPCODE) LIKE UPPER(?)";
         }
         if (aFilterObject.phone != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.phone.indexOf('*',0) < 0 && aFilterObject.phone.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENRESPONSIBLES.PHONE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENRESPONSIBLES.PHONE) LIKE UPPER(?)";
         }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENRESPONSIBLES.KINDREFCODE = ? ";
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

           if(aFilterObject.FIO != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.FIO);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.tabNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.tabNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.position != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.position);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.depName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.depName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.depCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.depCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.phone != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.phone);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
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

        anObject = new ENResponsiblesShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.FIO = set.getString(2);
        anObject.tabNumber = set.getString(3);
        anObject.position = set.getString(4);
        anObject.depName = set.getString(5);
        anObject.depCode = set.getString(6);
        anObject.phone = set.getString(7);

        anObject.kindRefCode = set.getInt(8);
    if(set.wasNull())
      anObject.kindRefCode = Integer.MIN_VALUE;
        anObject.kindRefName = set.getString(9);

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

  public int[] getFilteredCodeArrayOLD(ENResponsibles aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENRESPONSIBLES.CODE FROM ENRESPONSIBLES";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENRESPONSIBLES.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRESPONSIBLES.CODE = ?";
        }
         if (aFilterObject.FIO != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.FIO.indexOf('*',0) < 0 && aFilterObject.FIO.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRESPONSIBLES.FIO = ?";
             else
                 whereStr = whereStr + "  ENRESPONSIBLES.FIO LIKE ?";
         }
         if (aFilterObject.tabNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRESPONSIBLES.TABNUMBER = ?";
             else
                 whereStr = whereStr + "  ENRESPONSIBLES.TABNUMBER LIKE ?";
         }
         if (aFilterObject.position != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.position.indexOf('*',0) < 0 && aFilterObject.position.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRESPONSIBLES.POSITION = ?";
             else
                 whereStr = whereStr + "  ENRESPONSIBLES.POSITION LIKE ?";
         }
         if (aFilterObject.depName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.depName.indexOf('*',0) < 0 && aFilterObject.depName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRESPONSIBLES.DEPNAME = ?";
             else
                 whereStr = whereStr + "  ENRESPONSIBLES.DEPNAME LIKE ?";
         }
         if (aFilterObject.depCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.depCode.indexOf('*',0) < 0 && aFilterObject.depCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRESPONSIBLES.DEPCODE = ?";
             else
                 whereStr = whereStr + "  ENRESPONSIBLES.DEPCODE LIKE ?";
         }
         if (aFilterObject.phone != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.phone.indexOf('*',0) < 0 && aFilterObject.phone.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRESPONSIBLES.PHONE = ?";
             else
                 whereStr = whereStr + "  ENRESPONSIBLES.PHONE LIKE ?";
         }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRESPONSIBLES.KINDREFCODE = ? ";
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
         if (aFilterObject.FIO != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.FIO.indexOf('*',0) < 0 && aFilterObject.FIO.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRESPONSIBLES.FIO = ?";
             else
                 whereStr = whereStr + " ENRESPONSIBLES.FIO LIKE ?";

           if(aFilterObject.FIO != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.FIO);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.tabNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRESPONSIBLES.TABNUMBER = ?";
             else
                 whereStr = whereStr + " ENRESPONSIBLES.TABNUMBER LIKE ?";

           if(aFilterObject.tabNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.tabNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.position != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.position.indexOf('*',0) < 0 && aFilterObject.position.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRESPONSIBLES.POSITION = ?";
             else
                 whereStr = whereStr + " ENRESPONSIBLES.POSITION LIKE ?";

           if(aFilterObject.position != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.position);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.depName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.depName.indexOf('*',0) < 0 && aFilterObject.depName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRESPONSIBLES.DEPNAME = ?";
             else
                 whereStr = whereStr + " ENRESPONSIBLES.DEPNAME LIKE ?";

           if(aFilterObject.depName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.depName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.depCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.depCode.indexOf('*',0) < 0 && aFilterObject.depCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRESPONSIBLES.DEPCODE = ?";
             else
                 whereStr = whereStr + " ENRESPONSIBLES.DEPCODE LIKE ?";

           if(aFilterObject.depCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.depCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.phone != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.phone.indexOf('*',0) < 0 && aFilterObject.phone.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRESPONSIBLES.PHONE = ?";
             else
                 whereStr = whereStr + " ENRESPONSIBLES.PHONE LIKE ?";

           if(aFilterObject.phone != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.phone);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
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

  public int[] getFilteredCodeArray(ENResponsiblesFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENResponsibles aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENRESPONSIBLES.CODE FROM ENRESPONSIBLES";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENRESPONSIBLES.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRESPONSIBLES.CODE = ?";
        }
         if (aFilterObject.FIO != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.FIO.indexOf('*',0) < 0 && aFilterObject.FIO.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRESPONSIBLES.FIO = ?";
             else
                 whereStr = whereStr + "  ENRESPONSIBLES.FIO LIKE ?";
         }
         if (aFilterObject.tabNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRESPONSIBLES.TABNUMBER = ?";
             else
                 whereStr = whereStr + "  ENRESPONSIBLES.TABNUMBER LIKE ?";
         }
         if (aFilterObject.position != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.position.indexOf('*',0) < 0 && aFilterObject.position.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRESPONSIBLES.POSITION = ?";
             else
                 whereStr = whereStr + "  ENRESPONSIBLES.POSITION LIKE ?";
         }
         if (aFilterObject.depName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.depName.indexOf('*',0) < 0 && aFilterObject.depName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRESPONSIBLES.DEPNAME = ?";
             else
                 whereStr = whereStr + "  ENRESPONSIBLES.DEPNAME LIKE ?";
         }
         if (aFilterObject.depCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.depCode.indexOf('*',0) < 0 && aFilterObject.depCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRESPONSIBLES.DEPCODE = ?";
             else
                 whereStr = whereStr + "  ENRESPONSIBLES.DEPCODE LIKE ?";
         }
         if (aFilterObject.phone != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.phone.indexOf('*',0) < 0 && aFilterObject.phone.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRESPONSIBLES.PHONE = ?";
             else
                 whereStr = whereStr + "  ENRESPONSIBLES.PHONE LIKE ?";
         }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRESPONSIBLES.KINDREFCODE = ? ";
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
         if (aFilterObject.FIO != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.FIO.indexOf('*',0) < 0 && aFilterObject.FIO.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRESPONSIBLES.FIO = ?";
             else
                 whereStr = whereStr + " ENRESPONSIBLES.FIO LIKE ?";

           if(aFilterObject.FIO != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.FIO);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.tabNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRESPONSIBLES.TABNUMBER = ?";
             else
                 whereStr = whereStr + " ENRESPONSIBLES.TABNUMBER LIKE ?";

           if(aFilterObject.tabNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.tabNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.position != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.position.indexOf('*',0) < 0 && aFilterObject.position.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRESPONSIBLES.POSITION = ?";
             else
                 whereStr = whereStr + " ENRESPONSIBLES.POSITION LIKE ?";

           if(aFilterObject.position != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.position);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.depName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.depName.indexOf('*',0) < 0 && aFilterObject.depName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRESPONSIBLES.DEPNAME = ?";
             else
                 whereStr = whereStr + " ENRESPONSIBLES.DEPNAME LIKE ?";

           if(aFilterObject.depName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.depName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.depCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.depCode.indexOf('*',0) < 0 && aFilterObject.depCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRESPONSIBLES.DEPCODE = ?";
             else
                 whereStr = whereStr + " ENRESPONSIBLES.DEPCODE LIKE ?";

           if(aFilterObject.depCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.depCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.phone != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.phone.indexOf('*',0) < 0 && aFilterObject.phone.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRESPONSIBLES.PHONE = ?";
             else
                 whereStr = whereStr + " ENRESPONSIBLES.PHONE LIKE ?";

           if(aFilterObject.phone != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.phone);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
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


   public ENResponsibles getObject(int uid) throws PersistenceException
   {
    ENResponsibles result = new ENResponsibles();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENResponsibles anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENRESPONSIBLES.CODE, ENRESPONSIBLES.FIO, ENRESPONSIBLES.TABNUMBER, ENRESPONSIBLES.POSITION, ENRESPONSIBLES.DEPNAME, ENRESPONSIBLES.DEPCODE, ENRESPONSIBLES.PHONE, ENRESPONSIBLES.KINDREFCODE "
    +" FROM ENRESPONSIBLES WHERE ENRESPONSIBLES.CODE = ?";

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
        anObject.FIO = set.getString(2);
        anObject.tabNumber = set.getString(3);
        anObject.position = set.getString(4);
        anObject.depName = set.getString(5);
        anObject.depCode = set.getString(6);
        anObject.phone = set.getString(7);
        anObject.kindRef.code = set.getInt(8);
        if ( set.wasNull() )
            anObject.kindRef.code = Integer.MIN_VALUE;
        if(anObject.kindRef.code != Integer.MIN_VALUE)
        {
           anObject.setKindRef(
      new com.ksoe.energynet.dataminer.generated.ENResponsiblesKindDAOGen(connection,getUserProfile()).getRef(anObject.kindRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENResponsiblesRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENResponsiblesRef ref = new com.ksoe.energynet.valueobject.references.ENResponsiblesRef();
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

    selectStr = "DELETE FROM  ENRESPONSIBLES WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENResponsibles object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENResponsibles.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENResponsibles.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENResponsibles.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENResponsibles.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENResponsibles.getObject%} access denied");

    selectStr =

    "SELECT  ENRESPONSIBLES.CODE FROM  ENRESPONSIBLES WHERE  ENRESPONSIBLES.CODE = ?";
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
    _checkConditionToken(condition,"code","ENRESPONSIBLES.CODE");
    _checkConditionToken(condition,"fio","ENRESPONSIBLES.FIO");
    _checkConditionToken(condition,"tabnumber","ENRESPONSIBLES.TABNUMBER");
    _checkConditionToken(condition,"position","ENRESPONSIBLES.POSITION");
    _checkConditionToken(condition,"depname","ENRESPONSIBLES.DEPNAME");
    _checkConditionToken(condition,"depcode","ENRESPONSIBLES.DEPCODE");
    _checkConditionToken(condition,"phone","ENRESPONSIBLES.PHONE");
      // relationship conditions
    _checkConditionToken(condition,"kindref","KINDREFCODE");
    _checkConditionToken(condition,"kindref.code","KINDREFCODE");
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
    catch (NamingException e) {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
    catch (SQLException e)    {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
   }


  ///////////// PRIVATE SECTION ///////////////
  protected static Hashtable _sequenceTable = new Hashtable();

  private void _collectAutoIncrementFields(ENResponsibles anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENRESPONSIBLES", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENRESPONSIBLES", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENRESPONSIBLES", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENRESPONSIBLES");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENResponsiblesDAO
