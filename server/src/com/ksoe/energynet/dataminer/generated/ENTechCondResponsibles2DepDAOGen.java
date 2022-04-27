
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
import com.ksoe.energynet.valueobject.ENTechCondResponsibles2Dep;
import com.ksoe.energynet.valueobject.brief.ENTechCondResponsibles2DepShort;
import com.ksoe.energynet.valueobject.filter.ENTechCondResponsibles2DepFilter;
import com.ksoe.energynet.valueobject.lists.ENTechCondResponsibles2DepShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENTechCondResponsibles2Dep;
 *
 */

public class ENTechCondResponsibles2DepDAOGen extends GenericDataMiner {

  public ENTechCondResponsibles2DepDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTechCondResponsibles2DepDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTechCondResponsibles2Dep inObject) throws PersistenceException
   {
      ENTechCondResponsibles2Dep obj = new ENTechCondResponsibles2Dep();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.techCondResponsiblesRef.code != obj.techCondResponsiblesRef.code){
        return false;
     }
     if (inObject.departmentRef.code != obj.departmentRef.code){
        return false;
     }
      return true;
   }

   public int add(ENTechCondResponsibles2Dep anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTechCondResponsibles2Dep anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTECHCONDRESPNSBLS2DP (CODE,TECHCONDRESPONSBLSRFCD,DEPARTMENTREFCODE) VALUES (?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.techCondResponsiblesRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTechCondResponsiblesDAOGen(connection,getUserProfile()).exists(anObject.techCondResponsiblesRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechCondResponsibles2Dep.techCondResponsiblesRef.code%} = {%"+anObject.techCondResponsiblesRef.code+"%}");
        statement.setInt(2,anObject.techCondResponsiblesRef.code);
      }
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.departmentRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.departmentRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechCondResponsibles2Dep.departmentRef.code%} = {%"+anObject.departmentRef.code+"%}");
        statement.setInt(3,anObject.departmentRef.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTechCondResponsibles2DepDAOGen.add%}",e);
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

   public void save(ENTechCondResponsibles2Dep anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTechCondResponsibles2Dep anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("TECHCONDRESPONSIBLESREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DEPARTMENTREF") == 0)
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
        "UPDATE ENTECHCONDRESPNSBLS2DP SET TECHCONDRESPONSBLSRFCD = ? , DEPARTMENTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTECHCONDRESPONSIBLES2DEP SET ";
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
      if (anObject.techCondResponsiblesRef.code != Integer.MIN_VALUE)
        statement.setInt(1,anObject.techCondResponsiblesRef.code);
      else
        statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.departmentRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.departmentRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
          statement.setInt(3,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("TECHCONDRESPONSIBLESREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.techCondResponsiblesRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.techCondResponsiblesRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("DEPARTMENTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.departmentRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.departmentRef.code);
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

   } // end of save(ENTechCondResponsibles2Dep anObject,String[] anAttributes)


 public ENTechCondResponsibles2DepShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTechCondResponsibles2Dep filterObject = new ENTechCondResponsibles2Dep();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTechCondResponsibles2DepShort)list.get(0);
   return null;
  }

  public ENTechCondResponsibles2DepShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTechCondResponsibles2DepShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTechCondResponsibles2DepShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTechCondResponsibles2DepShortList getFilteredList(ENTechCondResponsibles2Dep filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTechCondResponsibles2DepShortList getScrollableFilteredList(ENTechCondResponsibles2Dep aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTechCondResponsibles2DepShortList getScrollableFilteredList(ENTechCondResponsibles2Dep aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTechCondResponsibles2DepShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTechCondResponsibles2DepShortList getScrollableFilteredList(ENTechCondResponsibles2DepFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTechCondResponsibles2DepShortList getScrollableFilteredList(ENTechCondResponsibles2DepFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTechCondResponsibles2DepShortList getScrollableFilteredList(ENTechCondResponsibles2Dep aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTechCondResponsibles2DepShortList getScrollableFilteredList(ENTechCondResponsibles2Dep aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTechCondResponsibles2DepShortList result = new ENTechCondResponsibles2DepShortList();
    ENTechCondResponsibles2DepShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTECHCONDRESPNSBLS2DP.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTECHCONDRESPNSBLS2DP.CODE"+

      ", ENTECHCONDRESPONSIBLES.CODE " +
      ", ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO " +
      ", ENTECHCONDRESPONSIBLES.RESPONSIBLETABNUMBER " +
      ", ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION " +
      ", ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME " +
      ", ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE " +
      ", ENTECHCONDRESPONSIBLES.RESPONSIBLEPHONE " +
      ", ENTECHCONDRESPONSIBLES.POWER " +
      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
     " FROM ENTECHCONDRESPNSBLS2DP " +
     ", ENTECHCONDRESPONSIBLES " +
     ", ENDEPARTMENT " +
     //" WHERE "
    "";
     whereStr = " ENTECHCONDRESPONSIBLES.CODE = ENTECHCONDRESPNSBLS2DP.TECHCONDRESPONSBLSRFCD" ; //+
      whereStr = whereStr +" AND ENDEPARTMENT.CODE = ENTECHCONDRESPNSBLS2DP.DEPARTMENTREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENTECHCONDRESPNSBLS2DP.CODE IN ( SELECT ENTECHCONDRESPNSBLS2DP.CODE FROM ENTECHCONDRESPNSBLS2DP ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCONDRESPNSBLS2DP.CODE = ?";
        }
        if(aFilterObject.techCondResponsiblesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDRESPNSBLS2DP.TECHCONDRESPONSBLSRFCD = ? ";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTECHCONDRESPNSBLS2DP.DEPARTMENTREFCODE = ? ";
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
       if(aFilterObject.techCondResponsiblesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondResponsiblesRef.code);
       }
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.departmentRef.code);
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

        anObject = new ENTechCondResponsibles2DepShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.techCondResponsiblesRefCode = set.getInt(2);
        if(set.wasNull())
        anObject.techCondResponsiblesRefCode = Integer.MIN_VALUE;
        anObject.techCondResponsiblesRefResponsibleFIO = set.getString(3);
        anObject.techCondResponsiblesRefResponsibleTabNumber = set.getInt(4);
        if(set.wasNull())
        anObject.techCondResponsiblesRefResponsibleTabNumber = Integer.MIN_VALUE;
        anObject.techCondResponsiblesRefResponsiblePosition = set.getString(5);
        anObject.techCondResponsiblesRefResponsibleDepName = set.getString(6);
        anObject.techCondResponsiblesRefResponsibleDepCode = set.getString(7);

        anObject.techCondResponsiblesRefPower = set.getInt(9);
        if(set.wasNull())
        anObject.techCondResponsiblesRefPower = Integer.MIN_VALUE;
        anObject.departmentRefCode = set.getInt(10);
        if(set.wasNull())
        anObject.departmentRefCode = Integer.MIN_VALUE;
        anObject.departmentRefShortName = set.getString(11);
        anObject.departmentRefDateStart = set.getDate(12);
        anObject.departmentRefDateFinal = set.getDate(13);

        anObject.departmentRefShpzBalans = set.getString(15);
        anObject.departmentRefKau_table_id_1884 = set.getInt(16);
        if(set.wasNull())
        anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
        anObject.departmentRefKau_1884 = set.getString(17);
        anObject.departmentRefName_1884 = set.getString(18);

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

  public int[] getFilteredCodeArrayOLD(ENTechCondResponsibles2Dep aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTECHCONDRESPNSBLS2DP.CODE FROM ENTECHCONDRESPNSBLS2DP";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTECHCONDRESPNSBLS2DP.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCONDRESPNSBLS2DP.CODE = ?";
        }
        if(aFilterObject.techCondResponsiblesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTECHCONDRESPNSBLS2DP.TECHCONDRESPONSBLSRFCD = ? ";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTECHCONDRESPNSBLS2DP.DEPARTMENTREFCODE = ? ";
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
       if(aFilterObject.techCondResponsiblesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondResponsiblesRef.code);
       }
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.departmentRef.code);
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

  public int[] getFilteredCodeArray(ENTechCondResponsibles2DepFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTechCondResponsibles2Dep aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTECHCONDRESPNSBLS2DP.CODE FROM ENTECHCONDRESPNSBLS2DP";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTECHCONDRESPNSBLS2DP.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCONDRESPNSBLS2DP.CODE = ?";
        }
        if(aFilterObject.techCondResponsiblesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTECHCONDRESPNSBLS2DP.TECHCONDRESPONSBLSRFCD = ? ";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTECHCONDRESPNSBLS2DP.DEPARTMENTREFCODE = ? ";
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
       if(aFilterObject.techCondResponsiblesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondResponsiblesRef.code);
       }
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.departmentRef.code);
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


   public ENTechCondResponsibles2Dep getObject(int uid) throws PersistenceException
   {
    ENTechCondResponsibles2Dep result = new ENTechCondResponsibles2Dep();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTechCondResponsibles2Dep anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTECHCONDRESPNSBLS2DP.CODE, ENTECHCONDRESPNSBLS2DP.TECHCONDRESPONSBLSRFCD, ENTECHCONDRESPNSBLS2DP.DEPARTMENTREFCODE "
    +" FROM ENTECHCONDRESPNSBLS2DP WHERE ENTECHCONDRESPNSBLS2DP.CODE = ?";

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
        anObject.techCondResponsiblesRef.code = set.getInt(2);
        if ( set.wasNull() )
            anObject.techCondResponsiblesRef.code = Integer.MIN_VALUE;
        anObject.departmentRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.departmentRef.code = Integer.MIN_VALUE;
        if(anObject.techCondResponsiblesRef.code != Integer.MIN_VALUE)
        {
           anObject.setTechCondResponsiblesRef(
        new com.ksoe.energynet.dataminer.generated.ENTechCondResponsiblesDAOGen(connection,getUserProfile()).getRef(anObject.techCondResponsiblesRef.code));
    }
        if(anObject.departmentRef.code != Integer.MIN_VALUE)
        {
           anObject.setDepartmentRef(
        new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.departmentRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENTechCondResponsibles2DepRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTechCondResponsibles2DepRef ref = new com.ksoe.energynet.valueobject.references.ENTechCondResponsibles2DepRef();
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

    selectStr = "DELETE FROM  ENTECHCONDRESPNSBLS2DP WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTechCondResponsibles2Dep object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTechCondResponsibles2Dep.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTechCondResponsibles2Dep.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTechCondResponsibles2Dep.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechCondResponsibles2Dep.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTechCondResponsibles2Dep.getObject%} access denied");

    selectStr =

    "SELECT  ENTECHCONDRESPNSBLS2DP.CODE FROM  ENTECHCONDRESPNSBLS2DP WHERE  ENTECHCONDRESPNSBLS2DP.CODE = ?";
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
    _checkConditionToken(condition,"code","ENTECHCONDRESPNSBLS2DP.CODE");
      // relationship conditions
    _checkConditionToken(condition,"techcondresponsiblesref","TECHCONDRESPONSBLSRFCD");
    _checkConditionToken(condition,"techcondresponsiblesref.code","TECHCONDRESPONSBLSRFCD");
    _checkConditionToken(condition,"departmentref","DEPARTMENTREFCODE");
    _checkConditionToken(condition,"departmentref.code","DEPARTMENTREFCODE");
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

    private void _collectAutoIncrementFields(ENTechCondResponsibles2Dep anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENTECHCONDRESPNSBLS2DP", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENTECHCONDRESPNSBLS2DP", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENTECHCONDRESPNSBLS2DP", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENTECHCONDRESPNSBLS2DP");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENTechCondResponsibles2DepDAO
