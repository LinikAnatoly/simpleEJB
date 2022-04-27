
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
import com.ksoe.energynet.valueobject.ENInvestProgramItem;
import com.ksoe.energynet.valueobject.brief.ENInvestProgramItemShort;
import com.ksoe.energynet.valueobject.filter.ENInvestProgramItemFilter;
import com.ksoe.energynet.valueobject.lists.ENInvestProgramItemShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

/**
 * DAO Object for ENInvestProgramItem;
 *
 */

public class ENInvestProgramItemDAOGen extends GenericDataMiner {

  public ENInvestProgramItemDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENInvestProgramItemDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENInvestProgramItem inObject) throws PersistenceException
   {
      ENInvestProgramItem obj = new ENInvestProgramItem();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.name != obj.name){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }

     if ( ! inObject.countGen.equals(obj.countGen)){
       return false;
     }

     if ( ! inObject.price.equals(obj.price)){
       return false;
     }

     if ( ! inObject.sumGen.equals(obj.sumGen)){
       return false;
     }

     if ( ! inObject.quarter1count.equals(obj.quarter1count)){
       return false;
     }

     if ( ! inObject.quarter1sum.equals(obj.quarter1sum)){
       return false;
     }

     if ( ! inObject.quarter2count.equals(obj.quarter2count)){
       return false;
     }

     if ( ! inObject.quarter2sum.equals(obj.quarter2sum)){
       return false;
     }

     if ( ! inObject.quarter3count.equals(obj.quarter3count)){
       return false;
     }

     if ( ! inObject.quarter3sum.equals(obj.quarter3sum)){
       return false;
     }

     if ( ! inObject.quarter4count.equals(obj.quarter4count)){
       return false;
     }

     if ( ! inObject.quarter4sum.equals(obj.quarter4sum)){
       return false;
     }

     if (inObject.userAdd != obj.userAdd){
       return false;
     }

     if ( ! inObject.dateAdd.equals(obj.dateAdd)){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }
     if (inObject.investProgramRef.code != obj.investProgramRef.code){
        return false;
     }
     if (inObject.materialRef.code != obj.materialRef.code){
        return false;
     }
      return true;
   }

   public int add(ENInvestProgramItem anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENInvestProgramItem anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENINVESTPROGRAMITEM (CODE,NAME,COMMENTGEN,COUNTGEN,PRICE,SUMGEN,QUARTER1COUNT,QUARTER1SUM,QUARTER2COUNT,QUARTER2SUM,QUARTER3COUNT,QUARTER3SUM,QUARTER4COUNT,QUARTER4SUM,MODIFY_TIME,USERADD,DATEADD,USERGEN,DATEEDIT,INVESTPROGRAMREFCODE,MATERIALREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.name);
      statement.setString(3,anObject.commentGen);
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.countGen);
      if (anObject.price != null)
        anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.price);
      if (anObject.sumGen != null)
        anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.sumGen);
      if (anObject.quarter1count != null)
        anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.quarter1count);
      if (anObject.quarter1sum != null)
        anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.quarter1sum);
      if (anObject.quarter2count != null)
        anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.quarter2count);
      if (anObject.quarter2sum != null)
        anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.quarter2sum);
      if (anObject.quarter3count != null)
        anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.quarter3count);
      if (anObject.quarter3sum != null)
        anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.quarter3sum);
      if (anObject.quarter4count != null)
        anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(13,anObject.quarter4count);
      if (anObject.quarter4sum != null)
        anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(14,anObject.quarter4sum);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(15,null);
      else
        statement.setBigDecimal(15,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(16,anObject.userAdd);
      if (anObject.dateAdd == null)
        statement.setTimestamp(17,null);
      else
        statement.setTimestamp(17,new java.sql.Timestamp(anObject.dateAdd.getTime()));
      statement.setString(18,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(19,null);
      else
        statement.setTimestamp(19,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.investProgramRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENInvestProgramDAOGen(connection,getUserProfile()).exists(anObject.investProgramRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENInvestProgramItem.investProgramRef.code%} = {%"+anObject.investProgramRef.code+"%}");
        statement.setInt(20,anObject.investProgramRef.code);
      }
      else
        statement.setNull(20,java.sql.Types.INTEGER);
      if (anObject.materialRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKMaterialsDAOGen(connection,getUserProfile()).exists(anObject.materialRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENInvestProgramItem.materialRef.code%} = {%"+anObject.materialRef.code+"%}");
        statement.setInt(21,anObject.materialRef.code);
      }
      else
        statement.setNull(21,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENInvestProgramItemDAOGen.add%}",e);
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

   public void save(ENInvestProgramItem anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENInvestProgramItem anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENInvestProgramItem oldObject = new ENInvestProgramItem();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENInvestProgramItem.modify_time_Field+" FROM  ENINVESTPROGRAMITEM WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("NAME") == 0)
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
          if(fieldNameStr.compareTo("SUMGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("QUARTER1COUNT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("QUARTER1SUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("QUARTER2COUNT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("QUARTER2SUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("QUARTER3COUNT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("QUARTER3SUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("QUARTER4COUNT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("QUARTER4SUM") == 0)
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
          if(fieldNameStr.compareTo("USERADD") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEADD") == 0)
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
          if(fieldNameStr.compareTo("INVESTPROGRAMREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MATERIALREF") == 0)
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
        "UPDATE ENINVESTPROGRAMITEM SET  NAME = ? , COMMENTGEN = ? , COUNTGEN = ? , PRICE = ? , SUMGEN = ? , QUARTER1COUNT = ? , QUARTER1SUM = ? , QUARTER2COUNT = ? , QUARTER2SUM = ? , QUARTER3COUNT = ? , QUARTER3SUM = ? , QUARTER4COUNT = ? , QUARTER4SUM = ? , MODIFY_TIME = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , INVESTPROGRAMREFCODE = ? , MATERIALREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENINVESTPROGRAMITEM SET ";
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
      statement.setString(2,anObject.commentGen);
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.countGen);

      if (anObject.price != null)
        anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.price);

      if (anObject.sumGen != null)
        anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.sumGen);

      if (anObject.quarter1count != null)
        anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.quarter1count);

      if (anObject.quarter1sum != null)
        anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.quarter1sum);

      if (anObject.quarter2count != null)
        anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.quarter2count);

      if (anObject.quarter2sum != null)
        anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.quarter2sum);

      if (anObject.quarter3count != null)
        anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.quarter3count);

      if (anObject.quarter3sum != null)
        anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.quarter3sum);

      if (anObject.quarter4count != null)
        anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.quarter4count);

      if (anObject.quarter4sum != null)
        anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(13,anObject.quarter4sum);

      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(14,null);
      else
        statement.setBigDecimal(14,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(15,anObject.userAdd);
      if (anObject.dateAdd == null)
        statement.setDate(16,null);
      else
        statement.setTimestamp(16,new java.sql.Timestamp(anObject.dateAdd.getTime()));
      statement.setString(17,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(18,null);
      else
        statement.setTimestamp(18,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.investProgramRef.code != Integer.MIN_VALUE)
        statement.setInt(19,anObject.investProgramRef.code);
      else
        statement.setNull(19,java.sql.Types.INTEGER);
      if (anObject.materialRef.code != Integer.MIN_VALUE)
        statement.setInt(20,anObject.materialRef.code);
      else
        statement.setNull(20,java.sql.Types.INTEGER);
          statement.setInt(21,anObject.code);
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
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
                continue;
             }
            if("COUNTGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countGen != null)
                    anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countGen);
                continue;
             }
            if("PRICE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.price != null)
                    anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.price);
                continue;
             }
            if("SUMGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumGen != null)
                    anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumGen);
                continue;
             }
            if("QUARTER1COUNT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.quarter1count != null)
                    anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.quarter1count);
                continue;
             }
            if("QUARTER1SUM".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.quarter1sum != null)
                    anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.quarter1sum);
                continue;
             }
            if("QUARTER2COUNT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.quarter2count != null)
                    anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.quarter2count);
                continue;
             }
            if("QUARTER2SUM".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.quarter2sum != null)
                    anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.quarter2sum);
                continue;
             }
            if("QUARTER3COUNT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.quarter3count != null)
                    anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.quarter3count);
                continue;
             }
            if("QUARTER3SUM".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.quarter3sum != null)
                    anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.quarter3sum);
                continue;
             }
            if("QUARTER4COUNT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.quarter4count != null)
                    anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.quarter4count);
                continue;
             }
            if("QUARTER4SUM".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.quarter4sum != null)
                    anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.quarter4sum);
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
            if("USERADD".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.userAdd);
                continue;
             }
            if("DATEADD".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateAdd == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateAdd.getTime()));
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
            if("INVESTPROGRAMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.investProgramRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.investProgramRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("MATERIALREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.materialRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.materialRef.code);
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

   } // end of save(ENInvestProgramItem anObject,String[] anAttributes)


 public ENInvestProgramItemShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENInvestProgramItem filterObject = new ENInvestProgramItem();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENInvestProgramItemShort)list.get(0);
   return null;
  }

  public ENInvestProgramItemShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENInvestProgramItemShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENInvestProgramItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENInvestProgramItemShortList getFilteredList(ENInvestProgramItem filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENInvestProgramItemShortList getScrollableFilteredList(ENInvestProgramItem aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENInvestProgramItemShortList getScrollableFilteredList(ENInvestProgramItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENInvestProgramItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENInvestProgramItemShortList getScrollableFilteredList(ENInvestProgramItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENInvestProgramItemShortList getScrollableFilteredList(ENInvestProgramItemFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENInvestProgramItemShortList getScrollableFilteredList(ENInvestProgramItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENInvestProgramItemShortList getScrollableFilteredList(ENInvestProgramItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENInvestProgramItemShortList result = new ENInvestProgramItemShortList();
    ENInvestProgramItemShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENINVESTPROGRAMITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENINVESTPROGRAMITEM.CODE"+
     ",ENINVESTPROGRAMITEM.NAME"+
     ",ENINVESTPROGRAMITEM.COMMENTGEN"+
     ",ENINVESTPROGRAMITEM.COUNTGEN"+
     ",ENINVESTPROGRAMITEM.PRICE"+
     ",ENINVESTPROGRAMITEM.SUMGEN"+
     ",ENINVESTPROGRAMITEM.QUARTER1COUNT"+
     ",ENINVESTPROGRAMITEM.QUARTER1SUM"+
     ",ENINVESTPROGRAMITEM.QUARTER2COUNT"+
     ",ENINVESTPROGRAMITEM.QUARTER2SUM"+
     ",ENINVESTPROGRAMITEM.QUARTER3COUNT"+
     ",ENINVESTPROGRAMITEM.QUARTER3SUM"+
     ",ENINVESTPROGRAMITEM.QUARTER4COUNT"+
     ",ENINVESTPROGRAMITEM.QUARTER4SUM"+
     ",ENINVESTPROGRAMITEM.USERADD"+
     ",ENINVESTPROGRAMITEM.DATEADD"+
     ",ENINVESTPROGRAMITEM.USERGEN"+
     ",ENINVESTPROGRAMITEM.DATEEDIT"+

      ", ENINVESTPROGRAM.CODE " +
      ", ENINVESTPROGRAM.NAME " +
      ", ENINVESTPROGRAM.YEARGEN " +
      ", ENINVESTPROGRAM.COMMENTGEN " +
      ", ENINVESTPROGRAM.COUNTGEN " +
      ", ENINVESTPROGRAM.PRICE " +
      ", ENINVESTPROGRAM.SUMGEN " +
      ", ENINVESTPROGRAM.QUARTER1COUNT " +
      ", ENINVESTPROGRAM.QUARTER1SUM " +
      ", ENINVESTPROGRAM.QUARTER2COUNT " +
      ", ENINVESTPROGRAM.QUARTER2SUM " +
      ", ENINVESTPROGRAM.QUARTER3COUNT " +
      ", ENINVESTPROGRAM.QUARTER3SUM " +
      ", ENINVESTPROGRAM.QUARTER4COUNT " +
      ", ENINVESTPROGRAM.QUARTER4SUM " +
      ", ENINVESTPROGRAM.USERADD " +
      ", ENINVESTPROGRAM.DATEADD " +
      ", ENINVESTPROGRAM.USERGEN " +
      ", ENINVESTPROGRAM.DATEEDIT " +
      ", TKMATERIALS.CODE " +
      ", TKMATERIALS.NAME " +
      ", TKMATERIALS.COST " +
      ", TKMATERIALS.DELIVERYDATE " +
      ", TKMATERIALS.NUMKATALOG " +
      ", TKMATERIALS.IDENTID " +
     " FROM ENINVESTPROGRAMITEM " +
     ", ENINVESTPROGRAM " +
     ", TKMATERIALS " +
     //" WHERE "
    "";
     whereStr = " ENINVESTPROGRAM.CODE = ENINVESTPROGRAMITEM.INVESTPROGRAMREFCODE" ; //+
      whereStr = whereStr +" AND TKMATERIALS.CODE = ENINVESTPROGRAMITEM.MATERIALREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENINVESTPROGRAMITEM.CODE IN ( SELECT ENINVESTPROGRAMITEM.CODE FROM ENINVESTPROGRAMITEM ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENINVESTPROGRAMITEM.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENINVESTPROGRAMITEM.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENINVESTPROGRAMITEM.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENINVESTPROGRAMITEM.COMMENTGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.COUNTGEN = ?";
        }
        if(aFilterObject.price != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.PRICE = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.SUMGEN = ?";
        }
        if(aFilterObject.quarter1count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER1COUNT = ?";
        }
        if(aFilterObject.quarter1sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER1SUM = ?";
        }
        if(aFilterObject.quarter2count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER2COUNT = ?";
        }
        if(aFilterObject.quarter2sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER2SUM = ?";
        }
        if(aFilterObject.quarter3count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER3COUNT = ?";
        }
        if(aFilterObject.quarter3sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER3SUM = ?";
        }
        if(aFilterObject.quarter4count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER4COUNT = ?";
        }
        if(aFilterObject.quarter4sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER4SUM = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENINVESTPROGRAMITEM.USERADD) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENINVESTPROGRAMITEM.USERADD) LIKE UPPER(?)";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENINVESTPROGRAMITEM.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENINVESTPROGRAMITEM.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.DATEEDIT = ?";
        }
        if(aFilterObject.investProgramRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENINVESTPROGRAMITEM.INVESTPROGRAMREFCODE = ? ";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENINVESTPROGRAMITEM.MATERIALREFCODE = ? ";
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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.price != null){
            number++;
            aFilterObject.price = aFilterObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.price);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.quarter1count != null){
            number++;
            aFilterObject.quarter1count = aFilterObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter1count);
        }
        if(aFilterObject.quarter1sum != null){
            number++;
            aFilterObject.quarter1sum = aFilterObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter1sum);
        }
        if(aFilterObject.quarter2count != null){
            number++;
            aFilterObject.quarter2count = aFilterObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter2count);
        }
        if(aFilterObject.quarter2sum != null){
            number++;
            aFilterObject.quarter2sum = aFilterObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter2sum);
        }
        if(aFilterObject.quarter3count != null){
            number++;
            aFilterObject.quarter3count = aFilterObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter3count);
        }
        if(aFilterObject.quarter3sum != null){
            number++;
            aFilterObject.quarter3sum = aFilterObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter3sum);
        }
        if(aFilterObject.quarter4count != null){
            number++;
            aFilterObject.quarter4count = aFilterObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter4count);
        }
        if(aFilterObject.quarter4sum != null){
            number++;
            aFilterObject.quarter4sum = aFilterObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter4sum);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }

           if(aFilterObject.userAdd != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userAdd);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.dateAdd != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
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
       if(aFilterObject.investProgramRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.investProgramRef.code);
       }
       if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.materialRef.code);
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

        anObject = new ENInvestProgramItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.commentGen = set.getString(3);
        anObject.countGen = set.getBigDecimal(4);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.price = set.getBigDecimal(5);
        if(anObject.price != null)
            anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGen = set.getBigDecimal(6);
        if(anObject.sumGen != null)
            anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter1count = set.getBigDecimal(7);
        if(anObject.quarter1count != null)
            anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter1sum = set.getBigDecimal(8);
        if(anObject.quarter1sum != null)
            anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter2count = set.getBigDecimal(9);
        if(anObject.quarter2count != null)
            anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter2sum = set.getBigDecimal(10);
        if(anObject.quarter2sum != null)
            anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter3count = set.getBigDecimal(11);
        if(anObject.quarter3count != null)
            anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter3sum = set.getBigDecimal(12);
        if(anObject.quarter3sum != null)
            anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter4count = set.getBigDecimal(13);
        if(anObject.quarter4count != null)
            anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter4sum = set.getBigDecimal(14);
        if(anObject.quarter4sum != null)
            anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userAdd = set.getString(15);
        anObject.dateAdd = set.getTimestamp(16);
        anObject.userGen = set.getString(17);
        anObject.dateEdit = set.getTimestamp(18);

        anObject.investProgramRefCode = set.getInt(19);
        if(set.wasNull())
        anObject.investProgramRefCode = Integer.MIN_VALUE;
        anObject.investProgramRefName = set.getString(20);
        anObject.investProgramRefYearGen = set.getInt(21);
        if(set.wasNull())
        anObject.investProgramRefYearGen = Integer.MIN_VALUE;
        anObject.investProgramRefCommentGen = set.getString(22);
        anObject.investProgramRefCountGen = set.getBigDecimal(23);
        if(anObject.investProgramRefCountGen != null)
          anObject.investProgramRefCountGen = anObject.investProgramRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.investProgramRefPrice = set.getBigDecimal(24);
        if(anObject.investProgramRefPrice != null)
          anObject.investProgramRefPrice = anObject.investProgramRefPrice.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.investProgramRefSumGen = set.getBigDecimal(25);
        if(anObject.investProgramRefSumGen != null)
          anObject.investProgramRefSumGen = anObject.investProgramRefSumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.investProgramRefQuarter1count = set.getBigDecimal(26);
        if(anObject.investProgramRefQuarter1count != null)
          anObject.investProgramRefQuarter1count = anObject.investProgramRefQuarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.investProgramRefQuarter1sum = set.getBigDecimal(27);
        if(anObject.investProgramRefQuarter1sum != null)
          anObject.investProgramRefQuarter1sum = anObject.investProgramRefQuarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.investProgramRefQuarter2count = set.getBigDecimal(28);
        if(anObject.investProgramRefQuarter2count != null)
          anObject.investProgramRefQuarter2count = anObject.investProgramRefQuarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.investProgramRefQuarter2sum = set.getBigDecimal(29);
        if(anObject.investProgramRefQuarter2sum != null)
          anObject.investProgramRefQuarter2sum = anObject.investProgramRefQuarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.investProgramRefQuarter3count = set.getBigDecimal(30);
        if(anObject.investProgramRefQuarter3count != null)
          anObject.investProgramRefQuarter3count = anObject.investProgramRefQuarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.investProgramRefQuarter3sum = set.getBigDecimal(31);
        if(anObject.investProgramRefQuarter3sum != null)
          anObject.investProgramRefQuarter3sum = anObject.investProgramRefQuarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.investProgramRefQuarter4count = set.getBigDecimal(32);
        if(anObject.investProgramRefQuarter4count != null)
          anObject.investProgramRefQuarter4count = anObject.investProgramRefQuarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.investProgramRefQuarter4sum = set.getBigDecimal(33);
        if(anObject.investProgramRefQuarter4sum != null)
          anObject.investProgramRefQuarter4sum = anObject.investProgramRefQuarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.investProgramRefUserAdd = set.getString(34);
        anObject.investProgramRefDateAdd = set.getTimestamp(35);
        anObject.investProgramRefUserGen = set.getString(36);
        anObject.investProgramRefDateEdit = set.getTimestamp(37);
        anObject.materialRefCode = set.getInt(38);
        if(set.wasNull())
        anObject.materialRefCode = Integer.MIN_VALUE;
        anObject.materialRefName = set.getString(39);
        anObject.materialRefCost = set.getBigDecimal(40);
        if(anObject.materialRefCost != null)
          anObject.materialRefCost = anObject.materialRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.materialRefDeliveryDate = set.getInt(41);
        if(set.wasNull())
        anObject.materialRefDeliveryDate = Integer.MIN_VALUE;
        anObject.materialRefNumkatalog = set.getString(42);
        anObject.materialRefIdentid = set.getString(43);

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

  public int[] getFilteredCodeArrayOLD(ENInvestProgramItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENINVESTPROGRAMITEM.CODE FROM ENINVESTPROGRAMITEM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENINVESTPROGRAMITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAMITEM.NAME = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAMITEM.NAME LIKE ?";
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAMITEM.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAMITEM.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.COUNTGEN = ?";
        }
        if(aFilterObject.price != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.PRICE = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.SUMGEN = ?";
        }
        if(aFilterObject.quarter1count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER1COUNT = ?";
        }
        if(aFilterObject.quarter1sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER1SUM = ?";
        }
        if(aFilterObject.quarter2count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER2COUNT = ?";
        }
        if(aFilterObject.quarter2sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER2SUM = ?";
        }
        if(aFilterObject.quarter3count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER3COUNT = ?";
        }
        if(aFilterObject.quarter3sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER3SUM = ?";
        }
        if(aFilterObject.quarter4count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER4COUNT = ?";
        }
        if(aFilterObject.quarter4sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER4SUM = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAMITEM.USERADD = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAMITEM.USERADD LIKE ?";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAMITEM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAMITEM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.DATEEDIT = ?";
        }
        if(aFilterObject.investProgramRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAMITEM.INVESTPROGRAMREFCODE = ? ";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAMITEM.MATERIALREFCODE = ? ";
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
                 whereStr = whereStr + " ENINVESTPROGRAMITEM.NAME = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAMITEM.NAME LIKE ?";

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
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENINVESTPROGRAMITEM.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAMITEM.COMMENTGEN LIKE ?";

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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.price != null){
            number++;
            aFilterObject.price = aFilterObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.price);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.quarter1count != null){
            number++;
            aFilterObject.quarter1count = aFilterObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter1count);
        }
        if(aFilterObject.quarter1sum != null){
            number++;
            aFilterObject.quarter1sum = aFilterObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter1sum);
        }
        if(aFilterObject.quarter2count != null){
            number++;
            aFilterObject.quarter2count = aFilterObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter2count);
        }
        if(aFilterObject.quarter2sum != null){
            number++;
            aFilterObject.quarter2sum = aFilterObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter2sum);
        }
        if(aFilterObject.quarter3count != null){
            number++;
            aFilterObject.quarter3count = aFilterObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter3count);
        }
        if(aFilterObject.quarter3sum != null){
            number++;
            aFilterObject.quarter3sum = aFilterObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter3sum);
        }
        if(aFilterObject.quarter4count != null){
            number++;
            aFilterObject.quarter4count = aFilterObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter4count);
        }
        if(aFilterObject.quarter4sum != null){
            number++;
            aFilterObject.quarter4sum = aFilterObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter4sum);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENINVESTPROGRAMITEM.USERADD = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAMITEM.USERADD LIKE ?";

           if(aFilterObject.userAdd != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userAdd);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateAdd != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENINVESTPROGRAMITEM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAMITEM.USERGEN LIKE ?";

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
       if(aFilterObject.investProgramRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.investProgramRef.code);
       }
       if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.materialRef.code);
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

  public int[] getFilteredCodeArray(ENInvestProgramItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENInvestProgramItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENINVESTPROGRAMITEM.CODE FROM ENINVESTPROGRAMITEM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENINVESTPROGRAMITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAMITEM.NAME = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAMITEM.NAME LIKE ?";
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAMITEM.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAMITEM.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.COUNTGEN = ?";
        }
        if(aFilterObject.price != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.PRICE = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.SUMGEN = ?";
        }
        if(aFilterObject.quarter1count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER1COUNT = ?";
        }
        if(aFilterObject.quarter1sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER1SUM = ?";
        }
        if(aFilterObject.quarter2count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER2COUNT = ?";
        }
        if(aFilterObject.quarter2sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER2SUM = ?";
        }
        if(aFilterObject.quarter3count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER3COUNT = ?";
        }
        if(aFilterObject.quarter3sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER3SUM = ?";
        }
        if(aFilterObject.quarter4count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER4COUNT = ?";
        }
        if(aFilterObject.quarter4sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER4SUM = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAMITEM.USERADD = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAMITEM.USERADD LIKE ?";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAMITEM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAMITEM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAMITEM.DATEEDIT = ?";
        }
        if(aFilterObject.investProgramRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAMITEM.INVESTPROGRAMREFCODE = ? ";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAMITEM.MATERIALREFCODE = ? ";
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
                 whereStr = whereStr + " ENINVESTPROGRAMITEM.NAME = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAMITEM.NAME LIKE ?";

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
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENINVESTPROGRAMITEM.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAMITEM.COMMENTGEN LIKE ?";

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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.price != null){
            number++;
            aFilterObject.price = aFilterObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.price);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.quarter1count != null){
            number++;
            aFilterObject.quarter1count = aFilterObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter1count);
        }
        if(aFilterObject.quarter1sum != null){
            number++;
            aFilterObject.quarter1sum = aFilterObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter1sum);
        }
        if(aFilterObject.quarter2count != null){
            number++;
            aFilterObject.quarter2count = aFilterObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter2count);
        }
        if(aFilterObject.quarter2sum != null){
            number++;
            aFilterObject.quarter2sum = aFilterObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter2sum);
        }
        if(aFilterObject.quarter3count != null){
            number++;
            aFilterObject.quarter3count = aFilterObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter3count);
        }
        if(aFilterObject.quarter3sum != null){
            number++;
            aFilterObject.quarter3sum = aFilterObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter3sum);
        }
        if(aFilterObject.quarter4count != null){
            number++;
            aFilterObject.quarter4count = aFilterObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter4count);
        }
        if(aFilterObject.quarter4sum != null){
            number++;
            aFilterObject.quarter4sum = aFilterObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter4sum);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENINVESTPROGRAMITEM.USERADD = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAMITEM.USERADD LIKE ?";

           if(aFilterObject.userAdd != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userAdd);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateAdd != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENINVESTPROGRAMITEM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAMITEM.USERGEN LIKE ?";

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
       if(aFilterObject.investProgramRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.investProgramRef.code);
       }
       if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.materialRef.code);
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


   public ENInvestProgramItem getObject(int uid) throws PersistenceException
   {
    ENInvestProgramItem result = new ENInvestProgramItem();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENInvestProgramItem anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENINVESTPROGRAMITEM.CODE, ENINVESTPROGRAMITEM.NAME, ENINVESTPROGRAMITEM.COMMENTGEN, ENINVESTPROGRAMITEM.COUNTGEN, ENINVESTPROGRAMITEM.PRICE, ENINVESTPROGRAMITEM.SUMGEN, ENINVESTPROGRAMITEM.QUARTER1COUNT, ENINVESTPROGRAMITEM.QUARTER1SUM, ENINVESTPROGRAMITEM.QUARTER2COUNT, ENINVESTPROGRAMITEM.QUARTER2SUM, ENINVESTPROGRAMITEM.QUARTER3COUNT, ENINVESTPROGRAMITEM.QUARTER3SUM, ENINVESTPROGRAMITEM.QUARTER4COUNT, ENINVESTPROGRAMITEM.QUARTER4SUM, ENINVESTPROGRAMITEM.MODIFY_TIME, ENINVESTPROGRAMITEM.USERADD, ENINVESTPROGRAMITEM.DATEADD, ENINVESTPROGRAMITEM.USERGEN, ENINVESTPROGRAMITEM.DATEEDIT, ENINVESTPROGRAMITEM.INVESTPROGRAMREFCODE, ENINVESTPROGRAMITEM.MATERIALREFCODE "
    +" FROM ENINVESTPROGRAMITEM WHERE ENINVESTPROGRAMITEM.CODE = ?";

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
        anObject.commentGen = set.getString(3);
        anObject.countGen = set.getBigDecimal(4);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.price = set.getBigDecimal(5);
        if(anObject.price != null)
            anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGen = set.getBigDecimal(6);
        if(anObject.sumGen != null)
            anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter1count = set.getBigDecimal(7);
        if(anObject.quarter1count != null)
            anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter1sum = set.getBigDecimal(8);
        if(anObject.quarter1sum != null)
            anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter2count = set.getBigDecimal(9);
        if(anObject.quarter2count != null)
            anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter2sum = set.getBigDecimal(10);
        if(anObject.quarter2sum != null)
            anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter3count = set.getBigDecimal(11);
        if(anObject.quarter3count != null)
            anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter3sum = set.getBigDecimal(12);
        if(anObject.quarter3sum != null)
            anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter4count = set.getBigDecimal(13);
        if(anObject.quarter4count != null)
            anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter4sum = set.getBigDecimal(14);
        if(anObject.quarter4sum != null)
            anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.modify_time = set.getLong(15);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.userAdd = set.getString(16);
        anObject.dateAdd = set.getTimestamp(17);
        anObject.userGen = set.getString(18);
        anObject.dateEdit = set.getTimestamp(19);
        anObject.investProgramRef.code = set.getInt(20);
        if ( set.wasNull() )
            anObject.investProgramRef.code = Integer.MIN_VALUE;
        anObject.materialRef.code = set.getInt(21);
        if ( set.wasNull() )
            anObject.materialRef.code = Integer.MIN_VALUE;
        if(anObject.investProgramRef.code != Integer.MIN_VALUE)
        {
           anObject.setInvestProgramRef(
        new com.ksoe.energynet.dataminer.generated.ENInvestProgramDAOGen(connection,getUserProfile()).getRef(anObject.investProgramRef.code));
    }
        if(anObject.materialRef.code != Integer.MIN_VALUE)
        {
           anObject.setMaterialRef(
        new com.ksoe.techcard.dataminer.generated.TKMaterialsDAOGen(connection,getUserProfile()).getRef(anObject.materialRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENInvestProgramItemRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENInvestProgramItemRef ref = new com.ksoe.energynet.valueobject.references.ENInvestProgramItemRef();
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

    selectStr = "DELETE FROM  ENINVESTPROGRAMITEM WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENInvestProgramItem object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENInvestProgramItem.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENInvestProgramItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENInvestProgramItem.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENInvestProgramItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENInvestProgramItem.getObject%} access denied");

    selectStr =

    "SELECT  ENINVESTPROGRAMITEM.CODE FROM  ENINVESTPROGRAMITEM WHERE  ENINVESTPROGRAMITEM.CODE = ?";
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
    _checkConditionToken(condition,"code","ENINVESTPROGRAMITEM.CODE");
    _checkConditionToken(condition,"name","ENINVESTPROGRAMITEM.NAME");
    _checkConditionToken(condition,"commentgen","ENINVESTPROGRAMITEM.COMMENTGEN");
    _checkConditionToken(condition,"countgen","ENINVESTPROGRAMITEM.COUNTGEN");
    _checkConditionToken(condition,"price","ENINVESTPROGRAMITEM.PRICE");
    _checkConditionToken(condition,"sumgen","ENINVESTPROGRAMITEM.SUMGEN");
    _checkConditionToken(condition,"quarter1count","ENINVESTPROGRAMITEM.QUARTER1COUNT");
    _checkConditionToken(condition,"quarter1sum","ENINVESTPROGRAMITEM.QUARTER1SUM");
    _checkConditionToken(condition,"quarter2count","ENINVESTPROGRAMITEM.QUARTER2COUNT");
    _checkConditionToken(condition,"quarter2sum","ENINVESTPROGRAMITEM.QUARTER2SUM");
    _checkConditionToken(condition,"quarter3count","ENINVESTPROGRAMITEM.QUARTER3COUNT");
    _checkConditionToken(condition,"quarter3sum","ENINVESTPROGRAMITEM.QUARTER3SUM");
    _checkConditionToken(condition,"quarter4count","ENINVESTPROGRAMITEM.QUARTER4COUNT");
    _checkConditionToken(condition,"quarter4sum","ENINVESTPROGRAMITEM.QUARTER4SUM");
    _checkConditionToken(condition,"modify_time","ENINVESTPROGRAMITEM.MODIFY_TIME");
    _checkConditionToken(condition,"useradd","ENINVESTPROGRAMITEM.USERADD");
    _checkConditionToken(condition,"dateadd","ENINVESTPROGRAMITEM.DATEADD");
    _checkConditionToken(condition,"usergen","ENINVESTPROGRAMITEM.USERGEN");
    _checkConditionToken(condition,"dateedit","ENINVESTPROGRAMITEM.DATEEDIT");
      // relationship conditions
    _checkConditionToken(condition,"investprogramref","INVESTPROGRAMREFCODE");
    _checkConditionToken(condition,"investprogramref.code","INVESTPROGRAMREFCODE");
    _checkConditionToken(condition,"materialref","MATERIALREFCODE");
    _checkConditionToken(condition,"materialref.code","MATERIALREFCODE");
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

   private void _collectAutoIncrementFields(ENInvestProgramItem anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENINVESTPROGRAMITEM", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENINVESTPROGRAMITEM", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENINVESTPROGRAMITEM", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENINVESTPROGRAMITEM");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENInvestProgramItemDAO
