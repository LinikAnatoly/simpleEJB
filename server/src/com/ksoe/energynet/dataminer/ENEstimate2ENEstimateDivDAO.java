
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
import com.ksoe.energynet.dataminer.generated.ENEstimate2ENEstimateDivDAOGen;
import com.ksoe.energynet.valueobject.ENEstimate2ENEstimateDiv;
import com.ksoe.energynet.valueobject.brief.ENEstimate2ENEstimateDivShort;
import com.ksoe.energynet.valueobject.lists.ENEstimate2ENEstimateDivShortList;

/**
 * DAO Object for ENEstimate2ENEstimateDiv;
 *
 */

public class ENEstimate2ENEstimateDivDAO extends ENEstimate2ENEstimateDivDAOGen {

    public ENEstimate2ENEstimateDivDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENEstimate2ENEstimateDivDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public ENEstimate2ENEstimateDivShortList getScrollableFilteredList(ENEstimate2ENEstimateDiv aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENEstimate2ENEstimateDivShortList result = new ENEstimate2ENEstimateDivShortList();
     ENEstimate2ENEstimateDivShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENESTIMATE2ENESTIMATDV.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENESTIMATE2ENESTIMATDV.CODE"+
      ",ENESTIMATE2ENESTIMATDV.COUNTGEN"+

       ", e1.CODE " +
       ", e1.COUNTGEN " +
       ", e1.COUNTFACT " +
       ", e1.PRICE " +
       ", e1.COST " +
       ", e1.ISUSEVAT " +
       ", e1.DELIVERYTIME " +
       ", e1.USEWORKTIME " +
       ", e1.USERGEN " +
       ", e1.DATEEDIT " +
       ", e2.CODE " +
       ", e2.COUNTGEN " +
       ", e2.COUNTFACT " +
       ", e2.PRICE " +
       ", e2.COST " +
       ", e2.ISUSEVAT " +
       ", e2.DELIVERYTIME " +
       ", e2.USEWORKTIME " +
       ", e2.USERGEN " +
       ", e2.DATEEDIT " +
      " FROM ENESTIMATE2ENESTIMATDV " +
      ", ENESTIMATEITEM e1 " +
      ", ENESTIMATEITEM e2 " +
      //" WHERE "
 	"";
      whereStr = " e1.CODE = ENESTIMATE2ENESTIMATDV.ESTIMATEITEMINREFCODE" ; //+
       whereStr = whereStr +" AND e2.CODE = ENESTIMATE2ENESTIMATDV.ESTIMATEITEMOUTREFCODE" ; //+
 		//selectStr = selectStr + " ${s} ENESTIMATE2ENESTIMATDV.CODE IN ( SELECT ENESTIMATE2ENESTIMATDV.CODE FROM ENESTIMATE2ENESTIMATDV ";

 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENESTIMATE2ENESTIMATDV.CODE = ?";
         }
         if(aFilterObject.countGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENESTIMATE2ENESTIMATDV.COUNTGEN = ?";
         }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENESTIMATE2ENESTIMATDV.MODIFY_TIME = ?";
         }
         if(aFilterObject.estimateItemInRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENESTIMATE2ENESTIMATDV.ESTIMATEITEMINREFCODE = ? ";
         }
         if(aFilterObject.estimateItemOutRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENESTIMATE2ENESTIMATDV.ESTIMATEITEMOUTREFCODE = ? ";
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
         if(aFilterObject.countGen != null){
             number++;
             aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.countGen);
         }
         if(aFilterObject.modify_time != Long.MIN_VALUE){
             number++;
             if(aFilterObject.modify_time == Long.MIN_VALUE)
                 statement.setBigDecimal(number,null);
             else
                 statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
         }
        if(aFilterObject.estimateItemInRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.estimateItemInRef.code);
        }
        if(aFilterObject.estimateItemOutRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.estimateItemOutRef.code);
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

         anObject = new ENEstimate2ENEstimateDivShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.countGen = set.getBigDecimal(2);
         if(anObject.countGen != null)
             anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

         anObject.estimateItemInRefCode = set.getInt(3);
 		if(set.wasNull())
 		   anObject.estimateItemInRefCode = Integer.MIN_VALUE;
         anObject.estimateItemInRefCountGen = set.getBigDecimal(4);
         if(anObject.estimateItemInRefCountGen != null)
           anObject.estimateItemInRefCountGen = anObject.estimateItemInRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.estimateItemInRefCountFact = set.getBigDecimal(5);
         if(anObject.estimateItemInRefCountFact != null)
           anObject.estimateItemInRefCountFact = anObject.estimateItemInRefCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.estimateItemInRefPrice = set.getBigDecimal(6);
         if(anObject.estimateItemInRefPrice != null)
           anObject.estimateItemInRefPrice = anObject.estimateItemInRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.estimateItemInRefCost = set.getBigDecimal(7);
         if(anObject.estimateItemInRefCost != null)
           anObject.estimateItemInRefCost = anObject.estimateItemInRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.estimateItemInRefIsUseVAT = set.getInt(8);
 		if(set.wasNull())
 		   anObject.estimateItemInRefIsUseVAT = Integer.MIN_VALUE;
         anObject.estimateItemInRefDeliveryTime = set.getInt(9);
 		if(set.wasNull())
 		   anObject.estimateItemInRefDeliveryTime = Integer.MIN_VALUE;
         anObject.estimateItemInRefUseWorkTime = set.getInt(10);
 		if(set.wasNull())
 		   anObject.estimateItemInRefUseWorkTime = Integer.MIN_VALUE;
         anObject.estimateItemInRefUserGen = set.getString(11);
         anObject.estimateItemInRefDateEdit = set.getDate(12);
         anObject.estimateItemOutRefCode = set.getInt(13);
 		if(set.wasNull())
 		   anObject.estimateItemOutRefCode = Integer.MIN_VALUE;
         anObject.estimateItemOutRefCountGen = set.getBigDecimal(14);
         if(anObject.estimateItemOutRefCountGen != null)
           anObject.estimateItemOutRefCountGen = anObject.estimateItemOutRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.estimateItemOutRefCountFact = set.getBigDecimal(15);
         if(anObject.estimateItemOutRefCountFact != null)
           anObject.estimateItemOutRefCountFact = anObject.estimateItemOutRefCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.estimateItemOutRefPrice = set.getBigDecimal(16);
         if(anObject.estimateItemOutRefPrice != null)
           anObject.estimateItemOutRefPrice = anObject.estimateItemOutRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.estimateItemOutRefCost = set.getBigDecimal(17);
         if(anObject.estimateItemOutRefCost != null)
           anObject.estimateItemOutRefCost = anObject.estimateItemOutRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.estimateItemOutRefIsUseVAT = set.getInt(18);
 		if(set.wasNull())
 		   anObject.estimateItemOutRefIsUseVAT = Integer.MIN_VALUE;
         anObject.estimateItemOutRefDeliveryTime = set.getInt(19);
 		if(set.wasNull())
 		   anObject.estimateItemOutRefDeliveryTime = Integer.MIN_VALUE;
         anObject.estimateItemOutRefUseWorkTime = set.getInt(20);
 		if(set.wasNull())
 		   anObject.estimateItemOutRefUseWorkTime = Integer.MIN_VALUE;
         anObject.estimateItemOutRefUserGen = set.getString(21);
         anObject.estimateItemOutRefDateEdit = set.getDate(22);

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

} // end of ENEstimate2ENEstimateDivDAO
