
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
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
import com.ksoe.energynet.dataminer.generated.ENCoefficientExecPlanDAOGen;
import com.ksoe.energynet.valueobject.ENCoefficientExecPlan;
import com.ksoe.energynet.valueobject.brief.ENCoefficientExecPlanShort;
import com.ksoe.energynet.valueobject.lists.ENCoefficientExecPlanShortList;

/**
 * DAO Object for ENCoefficientExecPlan;
 *
 */

public class ENCoefficientExecPlanDAO extends ENCoefficientExecPlanDAOGen {

    public ENCoefficientExecPlanDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENCoefficientExecPlanDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public ENCoefficientExecPlanShortList getScrollableFilteredList(ENCoefficientExecPlan aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENCoefficientExecPlanShortList result = new ENCoefficientExecPlanShortList();
     ENCoefficientExecPlanShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENCOEFFICIENTEXECPLAN.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENCOEFFICIENTEXECPLAN.CODE"+
      ",ENCOEFFICIENTEXECPLAN.COEFFICIENT"+
      ",ENCOEFFICIENTEXECPLAN.DATEGEN"+
      ",ENCOEFFICIENTEXECPLAN.FINPODRCODE"+
      ",ENCOEFFICIENTEXECPLAN.AXORGID"+

      " FROM ENCOEFFICIENTEXECPLAN " +
      //" WHERE "
   "";
     //selectStr = selectStr + " ${s} ENCOEFFICIENTEXECPLAN.CODE IN ( SELECT ENCOEFFICIENTEXECPLAN.CODE FROM ENCOEFFICIENTEXECPLAN ";

       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.CODE = ?";
         }
         if(aFilterObject.coefficient != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.COEFFICIENT = ?";
         }
         if(aFilterObject.dateGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.DATEGEN = ?";
         }
         if(aFilterObject.finPodrCode != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.FINPODRCODE = ?";
         }
         if (aFilterObject.axOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCOEFFICIENTEXECPLAN.AXORGID) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCOEFFICIENTEXECPLAN.AXORGID) LIKE UPPER(?)";
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
         if(aFilterObject.coefficient != null){
             number++;
             aFilterObject.coefficient = aFilterObject.coefficient.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.coefficient);
         }
         if(aFilterObject.dateGen != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateGen.getTime()));
         }
          if(aFilterObject.finPodrCode != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.finPodrCode);
          }
          if(aFilterObject.axOrgId != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.axOrgId);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
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

         anObject = new ENCoefficientExecPlanShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.coefficient = set.getBigDecimal(2);
         if(anObject.coefficient != null)
             anObject.coefficient = anObject.coefficient.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.dateGen = set.getTimestamp(3);
         anObject.finPodrCode = set.getInt(4);
         if ( set.wasNull() )
             anObject.finPodrCode = Integer.MIN_VALUE;
         anObject.axOrgId = set.getString(5);


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



} // end of ENCoefficientExecPlanDAO
