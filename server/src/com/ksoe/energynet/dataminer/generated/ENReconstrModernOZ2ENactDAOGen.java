
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
import com.ksoe.energynet.valueobject.ENReconstrModernOZ2ENact;
import com.ksoe.energynet.valueobject.brief.ENReconstrModernOZ2ENactShort;
import com.ksoe.energynet.valueobject.filter.ENReconstrModernOZ2ENactFilter;
import com.ksoe.energynet.valueobject.lists.ENReconstrModernOZ2ENactShortList;
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
  *  DAO Generated for ENReconstrModernOZ2ENact;
  *
  */

public class ENReconstrModernOZ2ENactDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENReconstrModernOZ2ENactDAOGen() {super();}
  //public ENReconstrModernOZ2ENactDAOGen(Connection aConnection) {super(aConnection);}
  //public ENReconstrModernOZ2ENactDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENReconstrModernOZ2ENactDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENReconstrModernOZ2ENactDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENReconstrModernOZ2ENact inObject) throws PersistenceException
   {
      ENReconstrModernOZ2ENact obj = new ENReconstrModernOZ2ENact();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.sumGen.equals(obj.sumGen)){
       return false;
     }

     if ( ! inObject.sumNds.equals(obj.sumNds)){
       return false;
     }

     if (inObject.isCalculationDate != obj.isCalculationDate){
       return false;
     }
     if (inObject.actRef.code != obj.actRef.code){
        return false;
     }
     if (inObject.ENReconstrModernOZRef.code != obj.ENReconstrModernOZRef.code){
        return false;
     }
      return true;
   }

   public int add(ENReconstrModernOZ2ENact anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENReconstrModernOZ2ENact anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENRECONSTRMODERNOZ2NCT (CODE,SUMGEN,SUMNDS,ISCALCULATIONDATE,ACTREFCODE,ENRECONSTRMODERNOZRFCD) VALUES (?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.sumGen != null)
        anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.sumGen);
      if (anObject.sumNds != null)
        anObject.sumNds = anObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.sumNds);
      if (anObject.isCalculationDate != Integer.MIN_VALUE )
         statement.setInt(4,anObject.isCalculationDate);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.actRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).exists(anObject.actRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENReconstrModernOZ2ENact.actRef.code%} = {%"+anObject.actRef.code+"%}");
        statement.setInt(5,anObject.actRef.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENReconstrModernOZDAOGen(connection,getUserProfile()).exists(anObject.ENReconstrModernOZRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENReconstrModernOZ2ENact.ENReconstrModernOZRef.code%} = {%"+anObject.ENReconstrModernOZRef.code+"%}");
        statement.setInt(6,anObject.ENReconstrModernOZRef.code);
      }
      else
        statement.setNull(6,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENReconstrModernOZ2ENactDAOGen.add%}",e);
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

   public void save(ENReconstrModernOZ2ENact anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENReconstrModernOZ2ENact anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("SUMGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMNDS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ISCALCULATIONDATE") == 0)
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
        "UPDATE ENRECONSTRMODERNOZ2NCT SET  SUMGEN = ? , SUMNDS = ? , ISCALCULATIONDATE = ? , ACTREFCODE = ? , ENRECONSTRMODERNOZRFCD = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENRECONSTRMODERNOZ2ENACT SET ";
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
      if (anObject.sumGen != null)
        anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.sumGen);

      if (anObject.sumNds != null)
        anObject.sumNds = anObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.sumNds);

      if (anObject.isCalculationDate != Integer.MIN_VALUE )
         statement.setInt(3,anObject.isCalculationDate);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.actRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.actRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.ENReconstrModernOZRef.code);
      else
        statement.setNull(5,java.sql.Types.INTEGER);
          statement.setInt(6,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("SUMGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumGen != null)
                    anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumGen);
                continue;
             }
            if("SUMNDS".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumNds != null)
                    anObject.sumNds = anObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumNds);
                continue;
             }
            if("ISCALCULATIONDATE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.isCalculationDate);
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

   } // end of save(ENReconstrModernOZ2ENact anObject,String[] anAttributes)


 public ENReconstrModernOZ2ENactShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENReconstrModernOZ2ENact filterObject = new ENReconstrModernOZ2ENact();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENReconstrModernOZ2ENactShort)list.get(0);
   return null;
  }

  public ENReconstrModernOZ2ENactShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENReconstrModernOZ2ENactShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENReconstrModernOZ2ENactShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENReconstrModernOZ2ENactShortList getFilteredList(ENReconstrModernOZ2ENact filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENReconstrModernOZ2ENactShortList getScrollableFilteredList(ENReconstrModernOZ2ENact aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENReconstrModernOZ2ENactShortList getScrollableFilteredList(ENReconstrModernOZ2ENact aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENReconstrModernOZ2ENactShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENReconstrModernOZ2ENactShortList getScrollableFilteredList(ENReconstrModernOZ2ENactFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENReconstrModernOZ2ENactShortList getScrollableFilteredList(ENReconstrModernOZ2ENactFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENReconstrModernOZ2ENactShortList getScrollableFilteredList(ENReconstrModernOZ2ENact aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENReconstrModernOZ2ENactShortList getScrollableFilteredList(ENReconstrModernOZ2ENact aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENReconstrModernOZ2ENactShortList result = new ENReconstrModernOZ2ENactShortList();
    ENReconstrModernOZ2ENactShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENRECONSTRMODERNOZ2NCT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENRECONSTRMODERNOZ2NCT.CODE"+
     ",ENRECONSTRMODERNOZ2NCT.SUMGEN"+
     ",ENRECONSTRMODERNOZ2NCT.SUMNDS"+
     ",ENRECONSTRMODERNOZ2NCT.ISCALCULATIONDATE"+

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
     " FROM ENRECONSTRMODERNOZ2NCT " +
     ", ENACT " +
     ", ENRECONSTRMODERNOZ " +
     //" WHERE "
    "";
     whereStr = " ENACT.CODE = ENRECONSTRMODERNOZ2NCT.ACTREFCODE" ; //+
      whereStr = whereStr +" AND ENRECONSTRMODERNOZ.CODE = ENRECONSTRMODERNOZ2NCT.ENRECONSTRMODERNOZRFCD" ; //+
        //selectStr = selectStr + " ${s} ENRECONSTRMODERNOZ2NCT.CODE IN ( SELECT ENRECONSTRMODERNOZ2NCT.CODE FROM ENRECONSTRMODERNOZ2NCT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERNOZ2NCT.CODE = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERNOZ2NCT.SUMGEN = ?";
        }
        if(aFilterObject.sumNds != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERNOZ2NCT.SUMNDS = ?";
        }
        if(aFilterObject.isCalculationDate != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERNOZ2NCT.ISCALCULATIONDATE = ?";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENRECONSTRMODERNOZ2NCT.ACTREFCODE = ? ";
        }
        if(aFilterObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENRECONSTRMODERNOZ2NCT.ENRECONSTRMODERNOZRFCD = ? ";
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
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.sumNds != null){
            number++;
            aFilterObject.sumNds = aFilterObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumNds);
        }
         if(aFilterObject.isCalculationDate != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isCalculationDate);
         }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actRef.code);
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

        anObject = new ENReconstrModernOZ2ENactShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.sumGen = set.getBigDecimal(2);
        if(anObject.sumGen != null)
            anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumNds = set.getBigDecimal(3);
        if(anObject.sumNds != null)
            anObject.sumNds = anObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.isCalculationDate = set.getInt(4);
        if ( set.wasNull() )
            anObject.isCalculationDate = Integer.MIN_VALUE;

        anObject.actRefCode = set.getInt(5);
        if(set.wasNull())
        anObject.actRefCode = Integer.MIN_VALUE;
        anObject.actRefNumberGen = set.getString(6);
        anObject.actRefDateGen = set.getDate(7);
        anObject.actRefFinDocCode = set.getInt(8);
        if(set.wasNull())
        anObject.actRefFinDocCode = Integer.MIN_VALUE;
        anObject.actRefFinDocMechanicCode = set.getInt(9);
        if(set.wasNull())
        anObject.actRefFinDocMechanicCode = Integer.MIN_VALUE;
        anObject.actRefFinMolName = set.getString(10);
        anObject.actRefFinMechanicName = set.getString(11);
        anObject.actRefInvNumber = set.getString(12);
        anObject.actRefUserGen = set.getString(13);
        anObject.actRefDateEdit = set.getDate(14);
        anObject.actRefDateAct = set.getDate(15);
        anObject.ENReconstrModernOZRefCode = set.getInt(16);
        if(set.wasNull())
        anObject.ENReconstrModernOZRefCode = Integer.MIN_VALUE;
        anObject.ENReconstrModernOZRefNumbergen = set.getString(17);
        anObject.ENReconstrModernOZRefDateGen = set.getDate(18);
        anObject.ENReconstrModernOZRefDateEdit = set.getDate(19);
        anObject.ENReconstrModernOZRefSummaGen = set.getBigDecimal(20);
        if(anObject.ENReconstrModernOZRefSummaGen != null)
          anObject.ENReconstrModernOZRefSummaGen = anObject.ENReconstrModernOZRefSummaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ENReconstrModernOZRefSummaNDS = set.getBigDecimal(21);
        if(anObject.ENReconstrModernOZRefSummaNDS != null)
          anObject.ENReconstrModernOZRefSummaNDS = anObject.ENReconstrModernOZRefSummaNDS.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ENReconstrModernOZRefCharacteristic = set.getString(22);
        anObject.ENReconstrModernOZRefExecutedPosition = set.getString(23);
        anObject.ENReconstrModernOZRefExecutedName = set.getString(24);
        anObject.ENReconstrModernOZRefAcceptedPosition = set.getString(25);
        anObject.ENReconstrModernOZRefAcceptedName = set.getString(26);
        anObject.ENReconstrModernOZRefContractPrice = set.getBigDecimal(27);
        if(anObject.ENReconstrModernOZRefContractPrice != null)
          anObject.ENReconstrModernOZRefContractPrice = anObject.ENReconstrModernOZRefContractPrice.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ENReconstrModernOZRefCodeMol = set.getString(28);
        anObject.ENReconstrModernOZRefCodePodr = set.getString(29);
        anObject.ENReconstrModernOZRefInvNumberOZ = set.getString(30);
        anObject.ENReconstrModernOZRefNameOZ = set.getString(31);
        anObject.ENReconstrModernOZRefFinContractNumber = set.getString(32);
        anObject.ENReconstrModernOZRefFinContractDate = set.getDate(33);
        anObject.ENReconstrModernOZRefPartnerName = set.getString(34);
        anObject.ENReconstrModernOZRefPartnerCode = set.getString(35);
        anObject.ENReconstrModernOZRefCharacteristicOS = set.getString(36);
        anObject.ENReconstrModernOZRefIsInvestProgram = set.getInt(37);
        if(set.wasNull())
        anObject.ENReconstrModernOZRefIsInvestProgram = Integer.MIN_VALUE;
        anObject.ENReconstrModernOZRefYearInvestProgram = set.getString(38);
        anObject.ENReconstrModernOZRefItemInvestProgram = set.getString(39);
        anObject.ENReconstrModernOZRefTypeRM = set.getInt(40);
        if(set.wasNull())
        anObject.ENReconstrModernOZRefTypeRM = Integer.MIN_VALUE;
        anObject.ENReconstrModernOZRefUserGen = set.getString(41);

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

  public int[] getFilteredCodeArrayOLD(ENReconstrModernOZ2ENact aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENRECONSTRMODERNOZ2NCT.CODE FROM ENRECONSTRMODERNOZ2NCT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENRECONSTRMODERNOZ2NCT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERNOZ2NCT.CODE = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERNOZ2NCT.SUMGEN = ?";
        }
        if(aFilterObject.sumNds != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERNOZ2NCT.SUMNDS = ?";
        }
        if(aFilterObject.isCalculationDate != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERNOZ2NCT.ISCALCULATIONDATE = ?";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRECONSTRMODERNOZ2NCT.ACTREFCODE = ? ";
        }
        if(aFilterObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRECONSTRMODERNOZ2NCT.ENRECONSTRMODERNOZRFCD = ? ";
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
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.sumNds != null){
            number++;
            aFilterObject.sumNds = aFilterObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumNds);
        }
         if(aFilterObject.isCalculationDate != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isCalculationDate);
         }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actRef.code);
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

  public int[] getFilteredCodeArray(ENReconstrModernOZ2ENactFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENReconstrModernOZ2ENact aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENRECONSTRMODERNOZ2NCT.CODE FROM ENRECONSTRMODERNOZ2NCT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENRECONSTRMODERNOZ2NCT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERNOZ2NCT.CODE = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERNOZ2NCT.SUMGEN = ?";
        }
        if(aFilterObject.sumNds != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERNOZ2NCT.SUMNDS = ?";
        }
        if(aFilterObject.isCalculationDate != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERNOZ2NCT.ISCALCULATIONDATE = ?";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRECONSTRMODERNOZ2NCT.ACTREFCODE = ? ";
        }
        if(aFilterObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRECONSTRMODERNOZ2NCT.ENRECONSTRMODERNOZRFCD = ? ";
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
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.sumNds != null){
            number++;
            aFilterObject.sumNds = aFilterObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumNds);
        }
         if(aFilterObject.isCalculationDate != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isCalculationDate);
         }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actRef.code);
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


   public ENReconstrModernOZ2ENact getObject(int uid) throws PersistenceException
   {
    ENReconstrModernOZ2ENact result = new ENReconstrModernOZ2ENact();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENReconstrModernOZ2ENact anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENRECONSTRMODERNOZ2NCT.CODE, ENRECONSTRMODERNOZ2NCT.SUMGEN, ENRECONSTRMODERNOZ2NCT.SUMNDS, ENRECONSTRMODERNOZ2NCT.ISCALCULATIONDATE, ENRECONSTRMODERNOZ2NCT.ACTREFCODE, ENRECONSTRMODERNOZ2NCT.ENRECONSTRMODERNOZRFCD "
    +" FROM ENRECONSTRMODERNOZ2NCT WHERE ENRECONSTRMODERNOZ2NCT.CODE = ?";

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
        anObject.sumGen = set.getBigDecimal(2);
        if(anObject.sumGen != null)
            anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumNds = set.getBigDecimal(3);
        if(anObject.sumNds != null)
            anObject.sumNds = anObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.isCalculationDate = set.getInt(4);
        if ( set.wasNull() )
           anObject.isCalculationDate = Integer.MIN_VALUE;
        anObject.actRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.actRef.code = Integer.MIN_VALUE;
        anObject.ENReconstrModernOZRef.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.ENReconstrModernOZRef.code = Integer.MIN_VALUE;
        if(anObject.actRef.code != Integer.MIN_VALUE)
        {
           anObject.setActRef(
        new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).getRef(anObject.actRef.code));
    }
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


  public com.ksoe.energynet.valueobject.references.ENReconstrModernOZ2ENactRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENReconstrModernOZ2ENactRef ref = new com.ksoe.energynet.valueobject.references.ENReconstrModernOZ2ENactRef();
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

    selectStr = "DELETE FROM  ENRECONSTRMODERNOZ2NCT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENReconstrModernOZ2ENact object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENReconstrModernOZ2ENact.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENReconstrModernOZ2ENact.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENReconstrModernOZ2ENact.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENReconstrModernOZ2ENact.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENReconstrModernOZ2ENact.getObject%} access denied");

    selectStr =

    "SELECT  ENRECONSTRMODERNOZ2NCT.CODE FROM  ENRECONSTRMODERNOZ2NCT WHERE  ENRECONSTRMODERNOZ2NCT.CODE = ?";
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
    _checkConditionToken(condition,"code","ENRECONSTRMODERNOZ2NCT.CODE");
    _checkConditionToken(condition,"sumgen","ENRECONSTRMODERNOZ2NCT.SUMGEN");
    _checkConditionToken(condition,"sumnds","ENRECONSTRMODERNOZ2NCT.SUMNDS");
    _checkConditionToken(condition,"iscalculationdate","ENRECONSTRMODERNOZ2NCT.ISCALCULATIONDATE");
      // relationship conditions
    _checkConditionToken(condition,"actref","ACTREFCODE");
    _checkConditionToken(condition,"actref.code","ACTREFCODE");
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

   private void _collectAutoIncrementFields(ENReconstrModernOZ2ENact anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENRECONSTRMODERNOZ2NCT", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENRECONSTRMODERNOZ2NCT", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENRECONSTRMODERNOZ2NCT", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENRECONSTRMODERNOZ2NCT");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENReconstrModernOZ2ENactDAO

