
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENAct2TransportDAOGen;
import com.ksoe.energynet.valueobject.ENAct2Transport;
import com.ksoe.energynet.valueobject.brief.ENAct2TransportShort;
import com.ksoe.energynet.valueobject.lists.ENAct2TransportShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENAct2Transport;  
  * 	
  */

public class ENAct2TransportDAO extends ENAct2TransportDAOGen {

 // public ENAct2TransportDAO() {super();}
 // public ENAct2TransportDAO(Connection aConnection) {super(aConnection);}
 // public ENAct2TransportDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENAct2TransportDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAct2TransportDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}
  
  public ENAct2TransportShortList getScrollableFilteredList(ENAct2Transport aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {   
   ENAct2TransportShortList result = new ENAct2TransportShortList();
   ENAct2TransportShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);
	
   if(orderBy.length() == 0)
    orderBy = "ENACT2TRANSPORT.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
   selectStr = "SELECT "+
    "ENACT2TRANSPORT.CODE"+
    ",ENACT2TRANSPORT.INVNUMBER"+
    ",ENACT2TRANSPORT.NAME"+
    ",ENACT2TRANSPORT.EXPENSE"+
    ",ENACT2TRANSPORT.DEPRECIATIONMONTH"+
    ",ENACT2TRANSPORT.DEPRECIATIONHOURS"+
    ",ENACT2TRANSPORT.TIMEWORK"+
    ",ENACT2TRANSPORT.PAYSWORK"+

     ", ENACT.CODE " +
     ", ENACT.NUMBERGEN " +
     ", ENACT.DATEGEN " +
     ", ENACT.FINDOCCODE " +
     ", ENACT.FINDOCMECHANICCODE " +
     ", ENACT.FINMOLNAME " +
     ", ENACT.FINMECHANICNAME " +
     ", ENACT.INVNUMBER " +
//     ", ENACT.BUHNAME " +
     ", ENACT.USERGEN " +
     ", ENACT.DATEEDIT " +
     ", ENACT2TRANSPORT.CLASSIFICATIONTYPERFCD" +
     ", ENACT2TRANSPORT.REPAIRCOSTSPERHOUR" +
    " FROM ENACT2TRANSPORT " +
    ", ENACT " +
    //" WHERE " 
	""; 
    whereStr = " ENACT.CODE = ENACT2TRANSPORT.ACTREFCODE" ; //+
		//selectStr = selectStr + " ${s} ENACT2TRANSPORT.CODE IN ( SELECT ENACT2TRANSPORT.CODE FROM ENACT2TRANSPORT ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2TRANSPORT.CODE = ?";
       }
        if (aFilterObject.invNumber != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT2TRANSPORT.INVNUMBER) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT2TRANSPORT.INVNUMBER) LIKE UPPER(?)";
        }
        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT2TRANSPORT.NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT2TRANSPORT.NAME) LIKE UPPER(?)";
        }
       if(aFilterObject.expense != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2TRANSPORT.EXPENSE = ?";
       }
       if(aFilterObject.depreciationMonth != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2TRANSPORT.DEPRECIATIONMONTH = ?";
       }
       if(aFilterObject.depreciationHours != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2TRANSPORT.DEPRECIATIONHOURS = ?";
       }
       if(aFilterObject.timeWork != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2TRANSPORT.TIMEWORK = ?";
       }
       if(aFilterObject.paysWork != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2TRANSPORT.PAYSWORK = ?";
       }

       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2TRANSPORT.MODIFY_TIME = ?";
       }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENACT2TRANSPORT.ACTREFCODE = ? ";
       }

     }


     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }
//+ " WHERE" +  сделано выше ????
    if(whereStr.length() != 0)
        selectStr = selectStr + " WHERE" + whereStr;

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

          if(aFilterObject.invNumber != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.invNumber);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
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
       if(aFilterObject.expense != null){
           number++;
           aFilterObject.expense = aFilterObject.expense.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.expense);
       }
       if(aFilterObject.depreciationMonth != null){
           number++;
           aFilterObject.depreciationMonth = aFilterObject.depreciationMonth.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.depreciationMonth);
       }
       if(aFilterObject.depreciationHours != null){
           number++;
           aFilterObject.depreciationHours = aFilterObject.depreciationHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.depreciationHours);
       }
       if(aFilterObject.timeWork != null){
           number++;
           aFilterObject.timeWork = aFilterObject.timeWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.timeWork);
       }
       if(aFilterObject.paysWork != null){
           number++;
           aFilterObject.paysWork = aFilterObject.paysWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.paysWork);
       }


       if(aFilterObject.modify_time != Long.MIN_VALUE){
           number++;
           if(aFilterObject.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
       }
      if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.actRef.code);
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

       anObject = new ENAct2TransportShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.invNumber = set.getString(2);
       anObject.name = set.getString(3);
       anObject.expense = set.getBigDecimal(4);
       if(anObject.expense != null)
           anObject.expense = anObject.expense.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.depreciationMonth = set.getBigDecimal(5);
       if(anObject.depreciationMonth != null)
           anObject.depreciationMonth = anObject.depreciationMonth.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.depreciationHours = set.getBigDecimal(6);
       if(anObject.depreciationHours != null)
           anObject.depreciationHours = anObject.depreciationHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.timeWork = set.getBigDecimal(7);
       if(anObject.timeWork != null)
           anObject.timeWork = anObject.timeWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.paysWork = set.getBigDecimal(8);
       if(anObject.paysWork != null)
           anObject.paysWork = anObject.paysWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.repairCostsPerHour = set.getBigDecimal(9);
       if(anObject.repairCostsPerHour != null)
           anObject.repairCostsPerHour = anObject.repairCostsPerHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.actRefCode = set.getInt(9);

       anObject.actRefNumberGen = set.getString(10);

       anObject.actRefDateGen = set.getDate(11);

       anObject.actRefFinDocCode = set.getInt(12);

       anObject.actRefFinDocMechanicCode = set.getInt(13);

       anObject.actRefFinMolName = set.getString(14);

       anObject.actRefFinMechanicName = set.getString(15);
/*
       anObject.actRefInvNumber = set.getString(16);

       anObject.actRefBuhName = set.getString(17);
*/
       anObject.actRefUserGen = set.getString(17);

       anObject.actRefDateEdit = set.getDate(18);
       anObject.classificationTypeRefCode = set.getInt(19);

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




} // end of ENAct2TransportDAO

