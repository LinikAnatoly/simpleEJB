
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENDepartment2CCExecutorDAOGen;
import com.ksoe.energynet.valueobject.ENDepartment2CCExecutor;
import com.ksoe.energynet.valueobject.brief.ENDepartment2CCExecutorShort;
import com.ksoe.energynet.valueobject.lists.ENDepartment2CCExecutorShortList;

/**
 * DAO Object for ENDepartment2CCExecutor;
 *
 */

public class ENDepartment2CCExecutorDAO extends ENDepartment2CCExecutorDAOGen {

    public ENDepartment2CCExecutorDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDepartment2CCExecutorDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public ENDepartment2CCExecutorShortList getScrollableFilteredList(ENDepartment2CCExecutor aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENDepartment2CCExecutorShortList result = new ENDepartment2CCExecutorShortList();
     ENDepartment2CCExecutorShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENDEPARTMENT2CCEXECUTR.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENDEPARTMENT2CCEXECUTR.CODE"+

       ", BUDGET.CODE " +
       ", BUDGET.SHORTNAME " +
       ", BUDGET.DATESTART " +
       ", BUDGET.DATEFINAL " +
       ", BUDGET.RENCODE " +
       ", BUDGET.SHPZBALANS " +
       ", BUDGET.KAU_TABLE_ID_1884 " +
       ", BUDGET.KAU_1884 " +
       ", BUDGET.NAME_1884 " +
       ", RESPONSIBILITY.CODE " +
       ", RESPONSIBILITY.SHORTNAME " +
       ", RESPONSIBILITY.DATESTART " +
       ", RESPONSIBILITY.DATEFINAL " +
       ", RESPONSIBILITY.RENCODE " +
       ", RESPONSIBILITY.SHPZBALANS " +
       ", RESPONSIBILITY.KAU_TABLE_ID_1884 " +
       ", RESPONSIBILITY.KAU_1884 " +
       ", RESPONSIBILITY.NAME_1884 " +
      " FROM ENDEPARTMENT2CCEXECUTR " +
      ", ENDEPARTMENT BUDGET" +
      ", ENDEPARTMENT RESPONSIBILITY" +
      //" WHERE "
 	"";
      whereStr = " BUDGET.CODE = ENDEPARTMENT2CCEXECUTR.BUDGETREFCODE" ; //+
       whereStr = whereStr +" AND RESPONSIBILITY.CODE = ENDEPARTMENT2CCEXECUTR.RESPONSIBILITYREFCODE" ; //+
 		//selectStr = selectStr + " ${s} ENDEPARTMENT2CCEXECUTR.CODE IN ( SELECT ENDEPARTMENT2CCEXECUTR.CODE FROM ENDEPARTMENT2CCEXECUTR ";

 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDEPARTMENT2CCEXECUTR.CODE = ?";
         }
         if(aFilterObject.ccExecutorCode != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDEPARTMENT2CCEXECUTR.CCEXECUTORCODE = ?";
         }
         if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENDEPARTMENT2CCEXECUTR.BUDGETREFCODE = ? ";
         }
         if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENDEPARTMENT2CCEXECUTR.RESPONSIBILITYREFCODE = ? ";
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
          if(aFilterObject.ccExecutorCode != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.ccExecutorCode);
          }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.budgetRef.code);
        }
        if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.responsibilityRef.code);
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

         anObject = new ENDepartment2CCExecutorShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;

         anObject.budgetRefCode = set.getInt(2);
 		if(set.wasNull())
 		   anObject.budgetRefCode = Integer.MIN_VALUE;
         anObject.budgetRefShortName = set.getString(3);
         anObject.budgetRefDateStart = set.getDate(4);
         anObject.budgetRefDateFinal = set.getDate(5);
         anObject.budgetRefRenCode = set.getInt(6);
 		if(set.wasNull())
 		   anObject.budgetRefRenCode = Integer.MIN_VALUE;
         anObject.budgetRefShpzBalans = set.getString(7);
         anObject.budgetRefKau_table_id_1884 = set.getInt(8);
 		if(set.wasNull())
 		   anObject.budgetRefKau_table_id_1884 = Integer.MIN_VALUE;
         anObject.budgetRefKau_1884 = set.getString(9);
         anObject.budgetRefName_1884 = set.getString(10);
         anObject.responsibilityRefCode = set.getInt(11);
 		if(set.wasNull())
 		   anObject.responsibilityRefCode = Integer.MIN_VALUE;
         anObject.responsibilityRefShortName = set.getString(12);
         anObject.responsibilityRefDateStart = set.getDate(13);
         anObject.responsibilityRefDateFinal = set.getDate(14);
         anObject.responsibilityRefRenCode = set.getInt(15);
 		if(set.wasNull())
 		   anObject.responsibilityRefRenCode = Integer.MIN_VALUE;
         anObject.responsibilityRefShpzBalans = set.getString(16);
         anObject.responsibilityRefKau_table_id_1884 = set.getInt(17);
 		if(set.wasNull())
 		   anObject.responsibilityRefKau_table_id_1884 = Integer.MIN_VALUE;
         anObject.responsibilityRefKau_1884 = set.getString(18);
         anObject.responsibilityRefName_1884 = set.getString(19);

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

    
} // end of ENDepartment2CCExecutorDAO
