
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ksoe.energynet.dataminer.generated.FINDoc2Act2WorkOrderDAOGen;
import com.ksoe.energynet.valueobject.FINDoc2Act2WorkOrder;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for FINDoc2Act2WorkOrder;
  *
  */

public class FINDoc2Act2WorkOrderDAO extends FINDoc2Act2WorkOrderDAOGen {


  public FINDoc2Act2WorkOrderDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public FINDoc2Act2WorkOrderDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public int addNOSEGR(FINDoc2Act2WorkOrder anObject) throws PersistenceException
  {
   return addNOSEGR(anObject,true);
  }

  public int addNOSEGR(FINDoc2Act2WorkOrder anObject, boolean aUseSequential) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

   if(aUseSequential)
    _collectAutoIncrementFields(anObject,connection);


   selectStr = "INSERT INTO FINDOC2ACT2WORKORDER (CODE,FINDOCCODE300,AXJOURNALID,MODIFY_TIME,ACTREFCODE,WORKORDERREFCODE) VALUES (?,?,?,?,?,?)";

   try
    {
     statement = connection.prepareStatement(selectStr);
     if (anObject.code != Integer.MIN_VALUE )
        statement.setInt(1,anObject.code);
     else
        statement.setNull(1,java.sql.Types.INTEGER);
     if (anObject.finDocCode300 != Integer.MIN_VALUE )
        statement.setInt(2,anObject.finDocCode300);
     else
        statement.setNull(2,java.sql.Types.INTEGER);
     statement.setString(3,anObject.axJournalId);
     
     if (anObject.modify_time == Long.MIN_VALUE)
       statement.setBigDecimal(4,null);
     else
       statement.setBigDecimal(4,new java.math.BigDecimal(anObject.modify_time));
     
     if (anObject.actRef.code != Integer.MIN_VALUE){
       if( ! new com.ksoe.energynet.dataminer.ENActDAO(connection,getUserProfile()).existsNOSEGR(anObject.actRef.code))
          throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINDoc2Act2WorkOrder.actRef.code%} = {%"+anObject.actRef.code+"%}");
       statement.setInt(5,anObject.actRef.code);
     }
     else
       statement.setNull(5,java.sql.Types.INTEGER);
     
     if (anObject.workOrderRef.code != Integer.MIN_VALUE){
       if( ! new com.ksoe.energynet.dataminer.ENWorkOrderDAO(connection,getUserProfile()).existsNOSEGR(anObject.workOrderRef.code))
          throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINDoc2Act2WorkOrder.workOrderRef.code%} = {%"+anObject.workOrderRef.code+"%}");
       statement.setInt(6,anObject.workOrderRef.code);
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
     throw new PersistenceException("Error in method {%FINDoc2Act2WorkOrderDAO.add%}",e);
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

  public void removeNOSEGR(int uid) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();

   selectStr = "DELETE FROM  FINDOC2ACT2WORKORDER WHERE CODE = ?";

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   FINDoc2Act2WorkOrder object = getObject(uid);

   if(object == null)
    throw new PersistenceException("{%FINDoc2Act2WorkOrder.getObject%} access denied");

   /*
   if(new SegregationProcessor().getSegregationInfoForDataAccess(FINDoc2Act2WorkOrder.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
    throw new PersistenceException("{%FINDoc2Act2WorkOrder.remove%} access denied");
   */

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



} // end of FINDoc2Act2WorkOrderDAO

