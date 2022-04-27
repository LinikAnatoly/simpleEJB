
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENCalcMaterialsUsageDAOGen;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.brief.ENCalcMaterialsUsageShort;
import com.ksoe.energynet.valueobject.lists.ENCalcMaterialsUsageShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.TKReplaceCounterKind;

  /**
  *  DAO Object for ENCalcMaterialsUsage;
  *
  */

public class ENCalcMaterialsUsageDAO extends ENCalcMaterialsUsageDAOGen {


  public ENCalcMaterialsUsageDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENCalcMaterialsUsageDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public BigDecimal getCostMaterialsByPlan2ClassificationType(int plan2classificationCode) throws PersistenceException
  {

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;

   BigDecimal out = new BigDecimal(0);

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr =   "select coalesce(sum(ss.sumgen),0) from encalcmaterialsusage ss where ss.plan2ctyperefcode = ? " ;


   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1, plan2classificationCode);

     set = statement.executeQuery();
     while(set.next()) {
        out = set.getBigDecimal(1);
        if (out != null){
            out = out.setScale(2, BigDecimal.ROUND_HALF_UP);
        }
        else{
            out = new BigDecimal(0);
        }
      }
     return out;
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



  public ENCalcMaterialsUsageShortList getList4Calculation(int plan2classificationCode, boolean onlyCounter) throws PersistenceException
  {
   ENCalcMaterialsUsageShortList result = new ENCalcMaterialsUsageShortList();
   ENCalcMaterialsUsageShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;


   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = " select ct.kod, tm.name, mu.name, " +
                //" tm.costnkre, " +
                
                //" case when (tm.costnkre is null) then tm.cost else tm.costnkre end as costnkre, " +
				" case when e.accountingtyperefcode = " + TKAccountingType.COUNTERS
				+ "	or coalesce(ct.replacecounterkindcode, 0) = " + TKReplaceCounterKind.REPLACE_COUNTER + 
				"  then e.price " +
				" else " + 
				"  (case when (tm.costnkre is null) then tm.cost else tm.costnkre end) " + 
				" end as costnkre, " +                 
                
                " sum(e.countfact) " +
                " from enestimateitem e, enplanwork2classfctntp p2c, " +
                " tkclassificationtype ct, tkmaterials tm, tkmeasurement mu " +
                " , enplanworkitem pi , tktechcard tk " +
                " where " +
                " p2c.code = ? " +
                " and pi.countgen > 0 " +
                (onlyCounter ? String.format(" and e.%s = %d" , ENEstimateItem.accountingTypeRef_Field, TKAccountingType.COUNTERS) : "") +
                " and e.planrefcode = p2c.planrefcode and p2c.classificationtyperfcd = ct.code " +
                " and e.materialrefcode = tm.code and tm.measurementcode = mu.code " +

                " and pi.kartarefcode = tk.code and tk.classificationtypecode = ct.code " +
                " and e.planitemrefcode = pi.code " +

                " group by ct.kod, tm.name, mu.name, tm.costnkre, tm.cost, ct.replacecounterkindcode, e.price, e.accountingtyperefcode " +
                " order by ct.kod, tm.name, mu.name";

   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1, plan2classificationCode);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
       anObject = new ENCalcMaterialsUsageShort();
       anObject.numberGen = i + 1;
       anObject.classificationTypeNumber = set.getString(1);
       anObject.materialName = set.getString(2);
       anObject.measureUnitName = set.getString(3);
       anObject.priceGen = set.getBigDecimal(4);
       if (anObject.priceGen != null){
        anObject.priceGen = anObject.priceGen.setScale(2, BigDecimal.ROUND_HALF_UP);
       }
       anObject.countGen = set.getBigDecimal(5);
       if (anObject.countGen != null){
        anObject.countGen = anObject.countGen.setScale(6, BigDecimal.ROUND_HALF_UP);
       }

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



} // end of ENCalcMaterialsUsageDAO

