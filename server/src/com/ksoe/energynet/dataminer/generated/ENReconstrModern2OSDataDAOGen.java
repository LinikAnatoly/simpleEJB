
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
import com.ksoe.energynet.valueobject.ENReconstrModern2OSData;
import com.ksoe.energynet.valueobject.brief.ENReconstrModern2OSDataShort;
import com.ksoe.energynet.valueobject.filter.ENReconstrModern2OSDataFilter;
import com.ksoe.energynet.valueobject.lists.ENReconstrModern2OSDataShortList;
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
  *  DAO Generated for ENReconstrModern2OSData;
  *
  */

public class ENReconstrModern2OSDataDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENReconstrModern2OSDataDAOGen() {super();}
  //public ENReconstrModern2OSDataDAOGen(Connection aConnection) {super(aConnection);}
  //public ENReconstrModern2OSDataDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENReconstrModern2OSDataDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENReconstrModern2OSDataDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENReconstrModern2OSData inObject) throws PersistenceException
   {
      ENReconstrModern2OSData obj = new ENReconstrModern2OSData();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.num_un != obj.num_un){
       return false;
     }

     if (inObject.num_dovvod != obj.num_dovvod){
       return false;
     }

     if ( ! inObject.date_dovvod.equals(obj.date_dovvod)){
       return false;
     }

     if (inObject.kod_inv != obj.kod_inv){
       return false;
     }

     if (inObject.kod_ist != obj.kod_ist){
       return false;
     }

     if (inObject.name_ist != obj.name_ist){
       return false;
     }

     if ( ! inObject.sum_dovvod_n.equals(obj.sum_dovvod_n)){
       return false;
     }

     if ( ! inObject.sum_dovvod_b.equals(obj.sum_dovvod_b)){
       return false;
     }

     if ( ! inObject.sum_nds.equals(obj.sum_nds)){
       return false;
     }

     if ( ! inObject.sum_dovvod_nds_b.equals(obj.sum_dovvod_nds_b)){
       return false;
     }

     if ( ! inObject.sum_dovvod_izn_n.equals(obj.sum_dovvod_izn_n)){
       return false;
     }

     if ( ! inObject.sum_dovvod_izn_b.equals(obj.sum_dovvod_izn_b)){
       return false;
     }

     if (inObject.name_dovvod != obj.name_dovvod){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }

     if (inObject.kod_nakl != obj.kod_nakl){
       return false;
     }

     if ( ! inObject.dt_nakl.equals(obj.dt_nakl)){
       return false;
     }

     if (inObject.kod_nal_nakl != obj.kod_nal_nakl){
       return false;
     }

     if (inObject.kod_postav != obj.kod_postav){
       return false;
     }

     if (inObject.kod_dogovor != obj.kod_dogovor){
       return false;
     }

     if ( ! inObject.dateBuh.equals(obj.dateBuh)){
       return false;
     }
     if (inObject.ENReconstrModernOZRef.code != obj.ENReconstrModernOZRef.code){
        return false;
     }
      return true;
   }

   public int add(ENReconstrModern2OSData anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENReconstrModern2OSData anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENRECONSTRMODERN2OSDAT (CODE,NUM_UN,NUM_DOVVOD,DATE_DOVVOD,KOD_INV,KOD_IST,NAME_IST,SUM_DOVVOD_N,SUM_DOVVOD_B,SUM_NDS,SUM_DOVVOD_NDS_B,SUM_DOVVOD_IZN_N,SUM_DOVVOD_IZN_B,NAME_DOVVOD,USERGEN,DATEEDIT,KOD_NAKL,DT_NAKL,KOD_NAL_NAKL,KOD_POSTAV,KOD_DOGOVOR,DATEBUH,MODIFY_TIME,ENRECONSTRMODERNOZRFCD) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.num_un != Integer.MIN_VALUE )
         statement.setInt(2,anObject.num_un);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.num_dovvod != Integer.MIN_VALUE )
         statement.setInt(3,anObject.num_dovvod);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.date_dovvod == null)
        statement.setDate(4,null);
      else
        statement.setDate(4,new java.sql.Date(anObject.date_dovvod.getTime()));
      statement.setString(5,anObject.kod_inv);
      statement.setString(6,anObject.kod_ist);
      statement.setString(7,anObject.name_ist);
      if (anObject.sum_dovvod_n != null)
        anObject.sum_dovvod_n = anObject.sum_dovvod_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.sum_dovvod_n);
      if (anObject.sum_dovvod_b != null)
        anObject.sum_dovvod_b = anObject.sum_dovvod_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.sum_dovvod_b);
      if (anObject.sum_nds != null)
        anObject.sum_nds = anObject.sum_nds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.sum_nds);
      if (anObject.sum_dovvod_nds_b != null)
        anObject.sum_dovvod_nds_b = anObject.sum_dovvod_nds_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.sum_dovvod_nds_b);
      if (anObject.sum_dovvod_izn_n != null)
        anObject.sum_dovvod_izn_n = anObject.sum_dovvod_izn_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.sum_dovvod_izn_n);
      if (anObject.sum_dovvod_izn_b != null)
        anObject.sum_dovvod_izn_b = anObject.sum_dovvod_izn_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(13,anObject.sum_dovvod_izn_b);
      statement.setString(14,anObject.name_dovvod);
      statement.setString(15,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(16,null);
      else
        statement.setTimestamp(16,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      statement.setString(17,anObject.kod_nakl);
      if (anObject.dt_nakl == null)
        statement.setTimestamp(18,null);
      else
        statement.setTimestamp(18,new java.sql.Timestamp(anObject.dt_nakl.getTime()));
      statement.setString(19,anObject.kod_nal_nakl);
      statement.setString(20,anObject.kod_postav);
      statement.setString(21,anObject.kod_dogovor);
      if (anObject.dateBuh == null)
        statement.setTimestamp(22,null);
      else
        statement.setTimestamp(22,new java.sql.Timestamp(anObject.dateBuh.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(23,null);
      else
        statement.setBigDecimal(23,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENReconstrModernOZDAOGen(connection,getUserProfile()).exists(anObject.ENReconstrModernOZRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENReconstrModern2OSData.ENReconstrModernOZRef.code%} = {%"+anObject.ENReconstrModernOZRef.code+"%}");
        statement.setInt(24,anObject.ENReconstrModernOZRef.code);
      }
      else
        statement.setNull(24,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENReconstrModern2OSDataDAOGen.add%}",e);
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

   public void save(ENReconstrModern2OSData anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENReconstrModern2OSData anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENReconstrModern2OSData oldObject = new ENReconstrModern2OSData();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENReconstrModern2OSData.modify_time_Field+" FROM  ENRECONSTRMODERN2OSDAT WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("NUM_UN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NUM_DOVVOD") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATE_DOVVOD") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("KOD_INV") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("KOD_IST") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NAME_IST") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM_DOVVOD_N") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM_DOVVOD_B") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM_NDS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM_DOVVOD_NDS_B") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM_DOVVOD_IZN_N") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUM_DOVVOD_IZN_B") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NAME_DOVVOD") == 0)
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
          if(fieldNameStr.compareTo("KOD_NAKL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DT_NAKL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("KOD_NAL_NAKL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("KOD_POSTAV") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("KOD_DOGOVOR") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEBUH") == 0)
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
        "UPDATE ENRECONSTRMODERN2OSDAT SET  NUM_UN = ? , NUM_DOVVOD = ? , DATE_DOVVOD = ? , KOD_INV = ? , KOD_IST = ? , NAME_IST = ? , SUM_DOVVOD_N = ? , SUM_DOVVOD_B = ? , SUM_NDS = ? , SUM_DOVVOD_NDS_B = ? , SUM_DOVVOD_IZN_N = ? , SUM_DOVVOD_IZN_B = ? , NAME_DOVVOD = ? , USERGEN = ? , DATEEDIT = ? , KOD_NAKL = ? , DT_NAKL = ? , KOD_NAL_NAKL = ? , KOD_POSTAV = ? , KOD_DOGOVOR = ? , DATEBUH = ? , MODIFY_TIME = ? , ENRECONSTRMODERNOZRFCD = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENRECONSTRMODERN2OSDATA SET ";
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
      if (anObject.num_un != Integer.MIN_VALUE )
         statement.setInt(1,anObject.num_un);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.num_dovvod != Integer.MIN_VALUE )
         statement.setInt(2,anObject.num_dovvod);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.date_dovvod == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.date_dovvod.getTime()));
      statement.setString(4,anObject.kod_inv);
      statement.setString(5,anObject.kod_ist);
      statement.setString(6,anObject.name_ist);
      if (anObject.sum_dovvod_n != null)
        anObject.sum_dovvod_n = anObject.sum_dovvod_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.sum_dovvod_n);

      if (anObject.sum_dovvod_b != null)
        anObject.sum_dovvod_b = anObject.sum_dovvod_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.sum_dovvod_b);

      if (anObject.sum_nds != null)
        anObject.sum_nds = anObject.sum_nds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.sum_nds);

      if (anObject.sum_dovvod_nds_b != null)
        anObject.sum_dovvod_nds_b = anObject.sum_dovvod_nds_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.sum_dovvod_nds_b);

      if (anObject.sum_dovvod_izn_n != null)
        anObject.sum_dovvod_izn_n = anObject.sum_dovvod_izn_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.sum_dovvod_izn_n);

      if (anObject.sum_dovvod_izn_b != null)
        anObject.sum_dovvod_izn_b = anObject.sum_dovvod_izn_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.sum_dovvod_izn_b);

      statement.setString(13,anObject.name_dovvod);
      statement.setString(14,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(15,null);
      else
        statement.setTimestamp(15,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      statement.setString(16,anObject.kod_nakl);
      if (anObject.dt_nakl == null)
        statement.setDate(17,null);
      else
        statement.setTimestamp(17,new java.sql.Timestamp(anObject.dt_nakl.getTime()));
      statement.setString(18,anObject.kod_nal_nakl);
      statement.setString(19,anObject.kod_postav);
      statement.setString(20,anObject.kod_dogovor);
      if (anObject.dateBuh == null)
        statement.setDate(21,null);
      else
        statement.setTimestamp(21,new java.sql.Timestamp(anObject.dateBuh.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(22,null);
      else
        statement.setBigDecimal(22,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE)
        statement.setInt(23,anObject.ENReconstrModernOZRef.code);
      else
        statement.setNull(23,java.sql.Types.INTEGER);
          statement.setInt(24,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("NUM_UN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.num_un);
                continue;
             }
            if("NUM_DOVVOD".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.num_dovvod);
                continue;
             }
            if("DATE_DOVVOD".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.date_dovvod == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.date_dovvod.getTime()));
                continue;
             }
            if("KOD_INV".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.kod_inv);
                continue;
             }
            if("KOD_IST".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.kod_ist);
                continue;
             }
            if("NAME_IST".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.name_ist);
                continue;
             }
            if("SUM_DOVVOD_N".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum_dovvod_n != null)
                    anObject.sum_dovvod_n = anObject.sum_dovvod_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum_dovvod_n);
                continue;
             }
            if("SUM_DOVVOD_B".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum_dovvod_b != null)
                    anObject.sum_dovvod_b = anObject.sum_dovvod_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum_dovvod_b);
                continue;
             }
            if("SUM_NDS".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum_nds != null)
                    anObject.sum_nds = anObject.sum_nds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum_nds);
                continue;
             }
            if("SUM_DOVVOD_NDS_B".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum_dovvod_nds_b != null)
                    anObject.sum_dovvod_nds_b = anObject.sum_dovvod_nds_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum_dovvod_nds_b);
                continue;
             }
            if("SUM_DOVVOD_IZN_N".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum_dovvod_izn_n != null)
                    anObject.sum_dovvod_izn_n = anObject.sum_dovvod_izn_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum_dovvod_izn_n);
                continue;
             }
            if("SUM_DOVVOD_IZN_B".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sum_dovvod_izn_b != null)
                    anObject.sum_dovvod_izn_b = anObject.sum_dovvod_izn_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sum_dovvod_izn_b);
                continue;
             }
            if("NAME_DOVVOD".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.name_dovvod);
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
            if("KOD_NAKL".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.kod_nakl);
                continue;
             }
            if("DT_NAKL".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dt_nakl == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dt_nakl.getTime()));
                continue;
             }
            if("KOD_NAL_NAKL".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.kod_nal_nakl);
                continue;
             }
            if("KOD_POSTAV".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.kod_postav);
                continue;
             }
            if("KOD_DOGOVOR".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.kod_dogovor);
                continue;
             }
            if("DATEBUH".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateBuh == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateBuh.getTime()));
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

   } // end of save(ENReconstrModern2OSData anObject,String[] anAttributes)


 public ENReconstrModern2OSDataShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENReconstrModern2OSData filterObject = new ENReconstrModern2OSData();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENReconstrModern2OSDataShort)list.get(0);
   return null;
  }

  public ENReconstrModern2OSDataShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENReconstrModern2OSDataShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENReconstrModern2OSDataShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENReconstrModern2OSDataShortList getFilteredList(ENReconstrModern2OSData filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENReconstrModern2OSDataShortList getScrollableFilteredList(ENReconstrModern2OSData aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENReconstrModern2OSDataShortList getScrollableFilteredList(ENReconstrModern2OSData aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENReconstrModern2OSDataShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENReconstrModern2OSDataShortList getScrollableFilteredList(ENReconstrModern2OSDataFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENReconstrModern2OSDataShortList getScrollableFilteredList(ENReconstrModern2OSDataFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENReconstrModern2OSDataShortList getScrollableFilteredList(ENReconstrModern2OSData aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENReconstrModern2OSDataShortList getScrollableFilteredList(ENReconstrModern2OSData aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENReconstrModern2OSDataShortList result = new ENReconstrModern2OSDataShortList();
    ENReconstrModern2OSDataShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENRECONSTRMODERN2OSDAT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENRECONSTRMODERN2OSDAT.CODE"+
     ",ENRECONSTRMODERN2OSDAT.NUM_UN"+
     ",ENRECONSTRMODERN2OSDAT.NUM_DOVVOD"+
     ",ENRECONSTRMODERN2OSDAT.DATE_DOVVOD"+
     ",ENRECONSTRMODERN2OSDAT.KOD_INV"+
     ",ENRECONSTRMODERN2OSDAT.KOD_IST"+
     ",ENRECONSTRMODERN2OSDAT.NAME_IST"+
     ",ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_N"+
     ",ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_B"+
     ",ENRECONSTRMODERN2OSDAT.SUM_NDS"+
     ",ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_NDS_B"+
     ",ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_IZN_N"+
     ",ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_IZN_B"+
     ",ENRECONSTRMODERN2OSDAT.NAME_DOVVOD"+
     ",ENRECONSTRMODERN2OSDAT.USERGEN"+
     ",ENRECONSTRMODERN2OSDAT.DATEEDIT"+
     ",ENRECONSTRMODERN2OSDAT.KOD_NAKL"+
     ",ENRECONSTRMODERN2OSDAT.DT_NAKL"+
     ",ENRECONSTRMODERN2OSDAT.KOD_NAL_NAKL"+
     ",ENRECONSTRMODERN2OSDAT.KOD_POSTAV"+
     ",ENRECONSTRMODERN2OSDAT.KOD_DOGOVOR"+
     ",ENRECONSTRMODERN2OSDAT.DATEBUH"+

      ", ENRECONSTRMODERNOZ.CODE " +
      ", ENRECONSTRMODERNOZ.NUMBERGEN " +
      ", ENRECONSTRMODERNOZ.DATEGEN " +
      ", ENRECONSTRMODERNOZ.DATEEDIT " +
      ", ENRECONSTRMODERNOZ.SUMMAGEN " +
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
      ", ENRECONSTRMODERNOZ.USERGEN " +
     " FROM ENRECONSTRMODERN2OSDAT " +
     ", ENRECONSTRMODERNOZ " +
     //" WHERE "
    "";
     whereStr = " ENRECONSTRMODERNOZ.CODE = ENRECONSTRMODERN2OSDAT.ENRECONSTRMODERNOZRFCD" ; //+
        //selectStr = selectStr + " ${s} ENRECONSTRMODERN2OSDAT.CODE IN ( SELECT ENRECONSTRMODERN2OSDAT.CODE FROM ENRECONSTRMODERN2OSDAT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.CODE = ?";
        }
        if(aFilterObject.num_un != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.NUM_UN = ?";
        }
        if(aFilterObject.num_dovvod != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.NUM_DOVVOD = ?";
        }
        if(aFilterObject.date_dovvod != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.DATE_DOVVOD = ?";
        }
         if (aFilterObject.kod_inv != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_inv.indexOf('*',0) < 0 && aFilterObject.kod_inv.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENRECONSTRMODERN2OSDAT.KOD_INV) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENRECONSTRMODERN2OSDAT.KOD_INV) LIKE UPPER(?)";
         }
         if (aFilterObject.kod_ist != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_ist.indexOf('*',0) < 0 && aFilterObject.kod_ist.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENRECONSTRMODERN2OSDAT.KOD_IST) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENRECONSTRMODERN2OSDAT.KOD_IST) LIKE UPPER(?)";
         }
         if (aFilterObject.name_ist != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name_ist.indexOf('*',0) < 0 && aFilterObject.name_ist.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENRECONSTRMODERN2OSDAT.NAME_IST) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENRECONSTRMODERN2OSDAT.NAME_IST) LIKE UPPER(?)";
         }
        if(aFilterObject.sum_dovvod_n != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_N = ?";
        }
        if(aFilterObject.sum_dovvod_b != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_B = ?";
        }
        if(aFilterObject.sum_nds != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_NDS = ?";
        }
        if(aFilterObject.sum_dovvod_nds_b != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_NDS_B = ?";
        }
        if(aFilterObject.sum_dovvod_izn_n != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_IZN_N = ?";
        }
        if(aFilterObject.sum_dovvod_izn_b != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_IZN_B = ?";
        }
         if (aFilterObject.name_dovvod != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name_dovvod.indexOf('*',0) < 0 && aFilterObject.name_dovvod.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENRECONSTRMODERN2OSDAT.NAME_DOVVOD) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENRECONSTRMODERN2OSDAT.NAME_DOVVOD) LIKE UPPER(?)";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENRECONSTRMODERN2OSDAT.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENRECONSTRMODERN2OSDAT.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.DATEEDIT = ?";
        }
         if (aFilterObject.kod_nakl != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_nakl.indexOf('*',0) < 0 && aFilterObject.kod_nakl.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENRECONSTRMODERN2OSDAT.KOD_NAKL) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENRECONSTRMODERN2OSDAT.KOD_NAKL) LIKE UPPER(?)";
         }
        if(aFilterObject.dt_nakl != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.DT_NAKL = ?";
        }
         if (aFilterObject.kod_nal_nakl != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_nal_nakl.indexOf('*',0) < 0 && aFilterObject.kod_nal_nakl.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENRECONSTRMODERN2OSDAT.KOD_NAL_NAKL) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENRECONSTRMODERN2OSDAT.KOD_NAL_NAKL) LIKE UPPER(?)";
         }
         if (aFilterObject.kod_postav != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_postav.indexOf('*',0) < 0 && aFilterObject.kod_postav.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENRECONSTRMODERN2OSDAT.KOD_POSTAV) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENRECONSTRMODERN2OSDAT.KOD_POSTAV) LIKE UPPER(?)";
         }
         if (aFilterObject.kod_dogovor != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_dogovor.indexOf('*',0) < 0 && aFilterObject.kod_dogovor.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENRECONSTRMODERN2OSDAT.KOD_DOGOVOR) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENRECONSTRMODERN2OSDAT.KOD_DOGOVOR) LIKE UPPER(?)";
         }
        if(aFilterObject.dateBuh != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.DATEBUH = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.MODIFY_TIME = ?";
        }
        if(aFilterObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENRECONSTRMODERN2OSDAT.ENRECONSTRMODERNOZRFCD = ? ";
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
         if(aFilterObject.num_un != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.num_un);
         }
         if(aFilterObject.num_dovvod != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.num_dovvod);
         }
        if(aFilterObject.date_dovvod != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_dovvod.getTime()));
        }

           if(aFilterObject.kod_inv != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_inv);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.kod_ist != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_ist);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.name_ist != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name_ist);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.sum_dovvod_n != null){
            number++;
            aFilterObject.sum_dovvod_n = aFilterObject.sum_dovvod_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_dovvod_n);
        }
        if(aFilterObject.sum_dovvod_b != null){
            number++;
            aFilterObject.sum_dovvod_b = aFilterObject.sum_dovvod_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_dovvod_b);
        }
        if(aFilterObject.sum_nds != null){
            number++;
            aFilterObject.sum_nds = aFilterObject.sum_nds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_nds);
        }
        if(aFilterObject.sum_dovvod_nds_b != null){
            number++;
            aFilterObject.sum_dovvod_nds_b = aFilterObject.sum_dovvod_nds_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_dovvod_nds_b);
        }
        if(aFilterObject.sum_dovvod_izn_n != null){
            number++;
            aFilterObject.sum_dovvod_izn_n = aFilterObject.sum_dovvod_izn_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_dovvod_izn_n);
        }
        if(aFilterObject.sum_dovvod_izn_b != null){
            number++;
            aFilterObject.sum_dovvod_izn_b = aFilterObject.sum_dovvod_izn_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_dovvod_izn_b);
        }

           if(aFilterObject.name_dovvod != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name_dovvod);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
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

           if(aFilterObject.kod_nakl != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_nakl);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.dt_nakl != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dt_nakl.getTime()));
        }

           if(aFilterObject.kod_nal_nakl != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_nal_nakl);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.kod_postav != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_postav);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.kod_dogovor != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_dogovor);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.dateBuh != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateBuh.getTime()));
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

        anObject = new ENReconstrModern2OSDataShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.num_un = set.getInt(2);
        if ( set.wasNull() )
            anObject.num_un = Integer.MIN_VALUE;
        anObject.num_dovvod = set.getInt(3);
        if ( set.wasNull() )
            anObject.num_dovvod = Integer.MIN_VALUE;
        anObject.date_dovvod = set.getDate(4);
        anObject.kod_inv = set.getString(5);
        anObject.kod_ist = set.getString(6);
        anObject.name_ist = set.getString(7);
        anObject.sum_dovvod_n = set.getBigDecimal(8);
        if(anObject.sum_dovvod_n != null)
            anObject.sum_dovvod_n = anObject.sum_dovvod_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum_dovvod_b = set.getBigDecimal(9);
        if(anObject.sum_dovvod_b != null)
            anObject.sum_dovvod_b = anObject.sum_dovvod_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum_nds = set.getBigDecimal(10);
        if(anObject.sum_nds != null)
            anObject.sum_nds = anObject.sum_nds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum_dovvod_nds_b = set.getBigDecimal(11);
        if(anObject.sum_dovvod_nds_b != null)
            anObject.sum_dovvod_nds_b = anObject.sum_dovvod_nds_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum_dovvod_izn_n = set.getBigDecimal(12);
        if(anObject.sum_dovvod_izn_n != null)
            anObject.sum_dovvod_izn_n = anObject.sum_dovvod_izn_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum_dovvod_izn_b = set.getBigDecimal(13);
        if(anObject.sum_dovvod_izn_b != null)
            anObject.sum_dovvod_izn_b = anObject.sum_dovvod_izn_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.name_dovvod = set.getString(14);
        anObject.userGen = set.getString(15);
        anObject.dateEdit = set.getTimestamp(16);
        anObject.kod_nakl = set.getString(17);
        anObject.dt_nakl = set.getTimestamp(18);
        anObject.kod_nal_nakl = set.getString(19);
        anObject.kod_postav = set.getString(20);
        anObject.kod_dogovor = set.getString(21);
        anObject.dateBuh = set.getTimestamp(22);

        anObject.ENReconstrModernOZRefCode = set.getInt(23);
        if(set.wasNull())
        anObject.ENReconstrModernOZRefCode = Integer.MIN_VALUE;
        anObject.ENReconstrModernOZRefNumbergen = set.getString(24);
        anObject.ENReconstrModernOZRefDateGen = set.getDate(25);
        anObject.ENReconstrModernOZRefDateEdit = set.getDate(26);
        anObject.ENReconstrModernOZRefSummaGen = set.getBigDecimal(27);
        if(anObject.ENReconstrModernOZRefSummaGen != null)
          anObject.ENReconstrModernOZRefSummaGen = anObject.ENReconstrModernOZRefSummaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ENReconstrModernOZRefCharacteristic = set.getString(28);
        anObject.ENReconstrModernOZRefExecutedPosition = set.getString(29);
        anObject.ENReconstrModernOZRefExecutedName = set.getString(30);
        anObject.ENReconstrModernOZRefAcceptedPosition = set.getString(31);
        anObject.ENReconstrModernOZRefAcceptedName = set.getString(32);
        anObject.ENReconstrModernOZRefContractPrice = set.getBigDecimal(33);
        if(anObject.ENReconstrModernOZRefContractPrice != null)
          anObject.ENReconstrModernOZRefContractPrice = anObject.ENReconstrModernOZRefContractPrice.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ENReconstrModernOZRefCodeMol = set.getString(34);
        anObject.ENReconstrModernOZRefCodePodr = set.getString(35);
        anObject.ENReconstrModernOZRefInvNumberOZ = set.getString(36);
        anObject.ENReconstrModernOZRefNameOZ = set.getString(37);
        anObject.ENReconstrModernOZRefFinContractNumber = set.getString(38);
        anObject.ENReconstrModernOZRefFinContractDate = set.getDate(39);
        anObject.ENReconstrModernOZRefPartnerName = set.getString(40);
        anObject.ENReconstrModernOZRefPartnerCode = set.getString(41);
        anObject.ENReconstrModernOZRefUserGen = set.getString(42);

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

  public int[] getFilteredCodeArrayOLD(ENReconstrModern2OSData aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENRECONSTRMODERN2OSDAT.CODE FROM ENRECONSTRMODERN2OSDAT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENRECONSTRMODERN2OSDAT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.CODE = ?";
        }
        if(aFilterObject.num_un != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.NUM_UN = ?";
        }
        if(aFilterObject.num_dovvod != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.NUM_DOVVOD = ?";
        }
        if(aFilterObject.date_dovvod != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.DATE_DOVVOD = ?";
        }
         if (aFilterObject.kod_inv != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_inv.indexOf('*',0) < 0 && aFilterObject.kod_inv.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_INV = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_INV LIKE ?";
         }
         if (aFilterObject.kod_ist != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_ist.indexOf('*',0) < 0 && aFilterObject.kod_ist.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_IST = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_IST LIKE ?";
         }
         if (aFilterObject.name_ist != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name_ist.indexOf('*',0) < 0 && aFilterObject.name_ist.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.NAME_IST = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.NAME_IST LIKE ?";
         }
        if(aFilterObject.sum_dovvod_n != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_N = ?";
        }
        if(aFilterObject.sum_dovvod_b != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_B = ?";
        }
        if(aFilterObject.sum_nds != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_NDS = ?";
        }
        if(aFilterObject.sum_dovvod_nds_b != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_NDS_B = ?";
        }
        if(aFilterObject.sum_dovvod_izn_n != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_IZN_N = ?";
        }
        if(aFilterObject.sum_dovvod_izn_b != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_IZN_B = ?";
        }
         if (aFilterObject.name_dovvod != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name_dovvod.indexOf('*',0) < 0 && aFilterObject.name_dovvod.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.NAME_DOVVOD = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.NAME_DOVVOD LIKE ?";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.DATEEDIT = ?";
        }
         if (aFilterObject.kod_nakl != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_nakl.indexOf('*',0) < 0 && aFilterObject.kod_nakl.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_NAKL = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_NAKL LIKE ?";
         }
        if(aFilterObject.dt_nakl != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.DT_NAKL = ?";
        }
         if (aFilterObject.kod_nal_nakl != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_nal_nakl.indexOf('*',0) < 0 && aFilterObject.kod_nal_nakl.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_NAL_NAKL = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_NAL_NAKL LIKE ?";
         }
         if (aFilterObject.kod_postav != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_postav.indexOf('*',0) < 0 && aFilterObject.kod_postav.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_POSTAV = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_POSTAV LIKE ?";
         }
         if (aFilterObject.kod_dogovor != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_dogovor.indexOf('*',0) < 0 && aFilterObject.kod_dogovor.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_DOGOVOR = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_DOGOVOR LIKE ?";
         }
        if(aFilterObject.dateBuh != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.DATEBUH = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.MODIFY_TIME = ?";
        }
        if(aFilterObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.ENRECONSTRMODERNOZRFCD = ? ";
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
         if(aFilterObject.num_un != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.num_un);
         }
         if(aFilterObject.num_dovvod != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.num_dovvod);
         }
        if(aFilterObject.date_dovvod != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_dovvod.getTime()));
        }
         if (aFilterObject.kod_inv != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.kod_inv.indexOf('*',0) < 0 && aFilterObject.kod_inv.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_INV = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_INV LIKE ?";

           if(aFilterObject.kod_inv != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_inv);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.kod_ist != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.kod_ist.indexOf('*',0) < 0 && aFilterObject.kod_ist.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_IST = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_IST LIKE ?";

           if(aFilterObject.kod_ist != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_ist);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.name_ist != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name_ist.indexOf('*',0) < 0 && aFilterObject.name_ist.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.NAME_IST = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.NAME_IST LIKE ?";

           if(aFilterObject.name_ist != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name_ist);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.sum_dovvod_n != null){
            number++;
            aFilterObject.sum_dovvod_n = aFilterObject.sum_dovvod_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_dovvod_n);
        }
        if(aFilterObject.sum_dovvod_b != null){
            number++;
            aFilterObject.sum_dovvod_b = aFilterObject.sum_dovvod_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_dovvod_b);
        }
        if(aFilterObject.sum_nds != null){
            number++;
            aFilterObject.sum_nds = aFilterObject.sum_nds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_nds);
        }
        if(aFilterObject.sum_dovvod_nds_b != null){
            number++;
            aFilterObject.sum_dovvod_nds_b = aFilterObject.sum_dovvod_nds_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_dovvod_nds_b);
        }
        if(aFilterObject.sum_dovvod_izn_n != null){
            number++;
            aFilterObject.sum_dovvod_izn_n = aFilterObject.sum_dovvod_izn_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_dovvod_izn_n);
        }
        if(aFilterObject.sum_dovvod_izn_b != null){
            number++;
            aFilterObject.sum_dovvod_izn_b = aFilterObject.sum_dovvod_izn_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_dovvod_izn_b);
        }
         if (aFilterObject.name_dovvod != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name_dovvod.indexOf('*',0) < 0 && aFilterObject.name_dovvod.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.NAME_DOVVOD = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.NAME_DOVVOD LIKE ?";

           if(aFilterObject.name_dovvod != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name_dovvod);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.USERGEN = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.USERGEN LIKE ?";

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
         if (aFilterObject.kod_nakl != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.kod_nakl.indexOf('*',0) < 0 && aFilterObject.kod_nakl.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_NAKL = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_NAKL LIKE ?";

           if(aFilterObject.kod_nakl != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_nakl);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dt_nakl != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dt_nakl.getTime()));
        }
         if (aFilterObject.kod_nal_nakl != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.kod_nal_nakl.indexOf('*',0) < 0 && aFilterObject.kod_nal_nakl.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_NAL_NAKL = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_NAL_NAKL LIKE ?";

           if(aFilterObject.kod_nal_nakl != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_nal_nakl);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.kod_postav != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.kod_postav.indexOf('*',0) < 0 && aFilterObject.kod_postav.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_POSTAV = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_POSTAV LIKE ?";

           if(aFilterObject.kod_postav != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_postav);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.kod_dogovor != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.kod_dogovor.indexOf('*',0) < 0 && aFilterObject.kod_dogovor.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_DOGOVOR = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_DOGOVOR LIKE ?";

           if(aFilterObject.kod_dogovor != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_dogovor);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateBuh != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateBuh.getTime()));
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

  public int[] getFilteredCodeArray(ENReconstrModern2OSDataFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENReconstrModern2OSData aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENRECONSTRMODERN2OSDAT.CODE FROM ENRECONSTRMODERN2OSDAT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENRECONSTRMODERN2OSDAT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.CODE = ?";
        }
        if(aFilterObject.num_un != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.NUM_UN = ?";
        }
        if(aFilterObject.num_dovvod != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.NUM_DOVVOD = ?";
        }
        if(aFilterObject.date_dovvod != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.DATE_DOVVOD = ?";
        }
         if (aFilterObject.kod_inv != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_inv.indexOf('*',0) < 0 && aFilterObject.kod_inv.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_INV = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_INV LIKE ?";
         }
         if (aFilterObject.kod_ist != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_ist.indexOf('*',0) < 0 && aFilterObject.kod_ist.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_IST = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_IST LIKE ?";
         }
         if (aFilterObject.name_ist != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name_ist.indexOf('*',0) < 0 && aFilterObject.name_ist.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.NAME_IST = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.NAME_IST LIKE ?";
         }
        if(aFilterObject.sum_dovvod_n != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_N = ?";
        }
        if(aFilterObject.sum_dovvod_b != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_B = ?";
        }
        if(aFilterObject.sum_nds != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_NDS = ?";
        }
        if(aFilterObject.sum_dovvod_nds_b != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_NDS_B = ?";
        }
        if(aFilterObject.sum_dovvod_izn_n != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_IZN_N = ?";
        }
        if(aFilterObject.sum_dovvod_izn_b != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_IZN_B = ?";
        }
         if (aFilterObject.name_dovvod != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name_dovvod.indexOf('*',0) < 0 && aFilterObject.name_dovvod.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.NAME_DOVVOD = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.NAME_DOVVOD LIKE ?";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.DATEEDIT = ?";
        }
         if (aFilterObject.kod_nakl != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_nakl.indexOf('*',0) < 0 && aFilterObject.kod_nakl.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_NAKL = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_NAKL LIKE ?";
         }
        if(aFilterObject.dt_nakl != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.DT_NAKL = ?";
        }
         if (aFilterObject.kod_nal_nakl != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_nal_nakl.indexOf('*',0) < 0 && aFilterObject.kod_nal_nakl.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_NAL_NAKL = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_NAL_NAKL LIKE ?";
         }
         if (aFilterObject.kod_postav != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_postav.indexOf('*',0) < 0 && aFilterObject.kod_postav.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_POSTAV = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_POSTAV LIKE ?";
         }
         if (aFilterObject.kod_dogovor != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.kod_dogovor.indexOf('*',0) < 0 && aFilterObject.kod_dogovor.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_DOGOVOR = ?";
             else
                 whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.KOD_DOGOVOR LIKE ?";
         }
        if(aFilterObject.dateBuh != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.DATEBUH = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRECONSTRMODERN2OSDAT.MODIFY_TIME = ?";
        }
        if(aFilterObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.ENRECONSTRMODERNOZRFCD = ? ";
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
         if(aFilterObject.num_un != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.num_un);
         }
         if(aFilterObject.num_dovvod != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.num_dovvod);
         }
        if(aFilterObject.date_dovvod != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_dovvod.getTime()));
        }
         if (aFilterObject.kod_inv != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.kod_inv.indexOf('*',0) < 0 && aFilterObject.kod_inv.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_INV = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_INV LIKE ?";

           if(aFilterObject.kod_inv != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_inv);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.kod_ist != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.kod_ist.indexOf('*',0) < 0 && aFilterObject.kod_ist.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_IST = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_IST LIKE ?";

           if(aFilterObject.kod_ist != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_ist);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.name_ist != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name_ist.indexOf('*',0) < 0 && aFilterObject.name_ist.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.NAME_IST = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.NAME_IST LIKE ?";

           if(aFilterObject.name_ist != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name_ist);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.sum_dovvod_n != null){
            number++;
            aFilterObject.sum_dovvod_n = aFilterObject.sum_dovvod_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_dovvod_n);
        }
        if(aFilterObject.sum_dovvod_b != null){
            number++;
            aFilterObject.sum_dovvod_b = aFilterObject.sum_dovvod_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_dovvod_b);
        }
        if(aFilterObject.sum_nds != null){
            number++;
            aFilterObject.sum_nds = aFilterObject.sum_nds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_nds);
        }
        if(aFilterObject.sum_dovvod_nds_b != null){
            number++;
            aFilterObject.sum_dovvod_nds_b = aFilterObject.sum_dovvod_nds_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_dovvod_nds_b);
        }
        if(aFilterObject.sum_dovvod_izn_n != null){
            number++;
            aFilterObject.sum_dovvod_izn_n = aFilterObject.sum_dovvod_izn_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_dovvod_izn_n);
        }
        if(aFilterObject.sum_dovvod_izn_b != null){
            number++;
            aFilterObject.sum_dovvod_izn_b = aFilterObject.sum_dovvod_izn_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum_dovvod_izn_b);
        }
         if (aFilterObject.name_dovvod != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name_dovvod.indexOf('*',0) < 0 && aFilterObject.name_dovvod.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.NAME_DOVVOD = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.NAME_DOVVOD LIKE ?";

           if(aFilterObject.name_dovvod != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name_dovvod);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.USERGEN = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.USERGEN LIKE ?";

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
         if (aFilterObject.kod_nakl != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.kod_nakl.indexOf('*',0) < 0 && aFilterObject.kod_nakl.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_NAKL = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_NAKL LIKE ?";

           if(aFilterObject.kod_nakl != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_nakl);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dt_nakl != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dt_nakl.getTime()));
        }
         if (aFilterObject.kod_nal_nakl != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.kod_nal_nakl.indexOf('*',0) < 0 && aFilterObject.kod_nal_nakl.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_NAL_NAKL = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_NAL_NAKL LIKE ?";

           if(aFilterObject.kod_nal_nakl != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_nal_nakl);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.kod_postav != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.kod_postav.indexOf('*',0) < 0 && aFilterObject.kod_postav.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_POSTAV = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_POSTAV LIKE ?";

           if(aFilterObject.kod_postav != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_postav);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.kod_dogovor != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.kod_dogovor.indexOf('*',0) < 0 && aFilterObject.kod_dogovor.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_DOGOVOR = ?";
             else
                 whereStr = whereStr + " ENRECONSTRMODERN2OSDAT.KOD_DOGOVOR LIKE ?";

           if(aFilterObject.kod_dogovor != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.kod_dogovor);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateBuh != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateBuh.getTime()));
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


   public ENReconstrModern2OSData getObject(int uid) throws PersistenceException
   {
    ENReconstrModern2OSData result = new ENReconstrModern2OSData();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENReconstrModern2OSData anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENRECONSTRMODERN2OSDAT.CODE, ENRECONSTRMODERN2OSDAT.NUM_UN, ENRECONSTRMODERN2OSDAT.NUM_DOVVOD, ENRECONSTRMODERN2OSDAT.DATE_DOVVOD, ENRECONSTRMODERN2OSDAT.KOD_INV, ENRECONSTRMODERN2OSDAT.KOD_IST, ENRECONSTRMODERN2OSDAT.NAME_IST, ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_N, ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_B, ENRECONSTRMODERN2OSDAT.SUM_NDS, ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_NDS_B, ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_IZN_N, ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_IZN_B, ENRECONSTRMODERN2OSDAT.NAME_DOVVOD, ENRECONSTRMODERN2OSDAT.USERGEN, ENRECONSTRMODERN2OSDAT.DATEEDIT, ENRECONSTRMODERN2OSDAT.KOD_NAKL, ENRECONSTRMODERN2OSDAT.DT_NAKL, ENRECONSTRMODERN2OSDAT.KOD_NAL_NAKL, ENRECONSTRMODERN2OSDAT.KOD_POSTAV, ENRECONSTRMODERN2OSDAT.KOD_DOGOVOR, ENRECONSTRMODERN2OSDAT.DATEBUH, ENRECONSTRMODERN2OSDAT.MODIFY_TIME, ENRECONSTRMODERN2OSDAT.ENRECONSTRMODERNOZRFCD "
    +" FROM ENRECONSTRMODERN2OSDAT WHERE ENRECONSTRMODERN2OSDAT.CODE = ?";

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
        anObject.num_un = set.getInt(2);
        if ( set.wasNull() )
           anObject.num_un = Integer.MIN_VALUE;
        anObject.num_dovvod = set.getInt(3);
        if ( set.wasNull() )
           anObject.num_dovvod = Integer.MIN_VALUE;
        anObject.date_dovvod = set.getDate(4);
        anObject.kod_inv = set.getString(5);
        anObject.kod_ist = set.getString(6);
        anObject.name_ist = set.getString(7);
        anObject.sum_dovvod_n = set.getBigDecimal(8);
        if(anObject.sum_dovvod_n != null)
            anObject.sum_dovvod_n = anObject.sum_dovvod_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum_dovvod_b = set.getBigDecimal(9);
        if(anObject.sum_dovvod_b != null)
            anObject.sum_dovvod_b = anObject.sum_dovvod_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum_nds = set.getBigDecimal(10);
        if(anObject.sum_nds != null)
            anObject.sum_nds = anObject.sum_nds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum_dovvod_nds_b = set.getBigDecimal(11);
        if(anObject.sum_dovvod_nds_b != null)
            anObject.sum_dovvod_nds_b = anObject.sum_dovvod_nds_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum_dovvod_izn_n = set.getBigDecimal(12);
        if(anObject.sum_dovvod_izn_n != null)
            anObject.sum_dovvod_izn_n = anObject.sum_dovvod_izn_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum_dovvod_izn_b = set.getBigDecimal(13);
        if(anObject.sum_dovvod_izn_b != null)
            anObject.sum_dovvod_izn_b = anObject.sum_dovvod_izn_b.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.name_dovvod = set.getString(14);
        anObject.userGen = set.getString(15);
        anObject.dateEdit = set.getTimestamp(16);
        anObject.kod_nakl = set.getString(17);
        anObject.dt_nakl = set.getTimestamp(18);
        anObject.kod_nal_nakl = set.getString(19);
        anObject.kod_postav = set.getString(20);
        anObject.kod_dogovor = set.getString(21);
        anObject.dateBuh = set.getTimestamp(22);
        anObject.modify_time = set.getLong(23);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.ENReconstrModernOZRef.code = set.getInt(24);
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


  public com.ksoe.energynet.valueobject.references.ENReconstrModern2OSDataRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENReconstrModern2OSDataRef ref = new com.ksoe.energynet.valueobject.references.ENReconstrModern2OSDataRef();
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

    selectStr = "DELETE FROM  ENRECONSTRMODERN2OSDAT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENReconstrModern2OSData object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENReconstrModern2OSData.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENReconstrModern2OSData.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENReconstrModern2OSData.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENReconstrModern2OSData.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENReconstrModern2OSData.getObject%} access denied");

    selectStr =

    "SELECT  ENRECONSTRMODERN2OSDAT.CODE FROM  ENRECONSTRMODERN2OSDAT WHERE  ENRECONSTRMODERN2OSDAT.CODE = ?";
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
    _checkConditionToken(condition,"code","ENRECONSTRMODERN2OSDAT.CODE");
    _checkConditionToken(condition,"num_un","ENRECONSTRMODERN2OSDAT.NUM_UN");
    _checkConditionToken(condition,"num_dovvod","ENRECONSTRMODERN2OSDAT.NUM_DOVVOD");
    _checkConditionToken(condition,"date_dovvod","ENRECONSTRMODERN2OSDAT.DATE_DOVVOD");
    _checkConditionToken(condition,"kod_inv","ENRECONSTRMODERN2OSDAT.KOD_INV");
    _checkConditionToken(condition,"kod_ist","ENRECONSTRMODERN2OSDAT.KOD_IST");
    _checkConditionToken(condition,"name_ist","ENRECONSTRMODERN2OSDAT.NAME_IST");
    _checkConditionToken(condition,"sum_dovvod_n","ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_N");
    _checkConditionToken(condition,"sum_dovvod_b","ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_B");
    _checkConditionToken(condition,"sum_nds","ENRECONSTRMODERN2OSDAT.SUM_NDS");
    _checkConditionToken(condition,"sum_dovvod_nds_b","ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_NDS_B");
    _checkConditionToken(condition,"sum_dovvod_izn_n","ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_IZN_N");
    _checkConditionToken(condition,"sum_dovvod_izn_b","ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_IZN_B");
    _checkConditionToken(condition,"name_dovvod","ENRECONSTRMODERN2OSDAT.NAME_DOVVOD");
    _checkConditionToken(condition,"usergen","ENRECONSTRMODERN2OSDAT.USERGEN");
    _checkConditionToken(condition,"dateedit","ENRECONSTRMODERN2OSDAT.DATEEDIT");
    _checkConditionToken(condition,"kod_nakl","ENRECONSTRMODERN2OSDAT.KOD_NAKL");
    _checkConditionToken(condition,"dt_nakl","ENRECONSTRMODERN2OSDAT.DT_NAKL");
    _checkConditionToken(condition,"kod_nal_nakl","ENRECONSTRMODERN2OSDAT.KOD_NAL_NAKL");
    _checkConditionToken(condition,"kod_postav","ENRECONSTRMODERN2OSDAT.KOD_POSTAV");
    _checkConditionToken(condition,"kod_dogovor","ENRECONSTRMODERN2OSDAT.KOD_DOGOVOR");
    _checkConditionToken(condition,"datebuh","ENRECONSTRMODERN2OSDAT.DATEBUH");
    _checkConditionToken(condition,"modify_time","ENRECONSTRMODERN2OSDAT.MODIFY_TIME");
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

   private void _collectAutoIncrementFields(ENReconstrModern2OSData anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENRECONSTRMODERN2OSDAT", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENRECONSTRMODERN2OSDAT", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENRECONSTRMODERN2OSDAT", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENRECONSTRMODERN2OSDAT");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENReconstrModern2OSDataDAO

