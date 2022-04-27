
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

import com.ksoe.energynet.dataminer.generated.ENCalcCostDAOGen;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENCalcCost;
  *
  */

public class ENCalcCostDAO extends ENCalcCostDAOGen {


  public ENCalcCostDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENCalcCostDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}



  public BigDecimal getCostCalculationByPlan2ClassificationType(int plan2classificationCode) throws PersistenceException
  {

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;

   BigDecimal out = new BigDecimal(0);

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr =   "select coalesce(sum(ss.calculationcost),0) from encalccost ss where ss.plan2ctyperefcode = ?" ;


   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1, plan2classificationCode);

     set = statement.executeQuery();
     int i;
     for(i = 0;set.next();i++)
      {
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




} // end of ENCalcCostDAO

