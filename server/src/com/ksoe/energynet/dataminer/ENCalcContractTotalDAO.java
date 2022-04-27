
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

import com.ksoe.energynet.dataminer.generated.ENCalcContractTotalDAOGen;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENCalcContractTotal;
  *
  */

public class ENCalcContractTotalDAO extends ENCalcContractTotalDAOGen {


  public ENCalcContractTotalDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENCalcContractTotalDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public BigDecimal getCostByPlan(int planCode, boolean isVat) throws PersistenceException
  {

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;

   BigDecimal out = new BigDecimal(0);

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr =   "select coalesce(sum(" + (isVat ? "ss.costvat" : "ss.costwithoutvat") + "),0) from encalctotalcost ss where ss.planrefcode = ? " ;


   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1, planCode);

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




} // end of ENCalcContractTotalDAO

