
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENResponsibles2FINContractsDAOGen;
import com.ksoe.energynet.valueobject.ENResponsibles2FINContracts;
import com.ksoe.energynet.valueobject.brief.ENResponsibles2FINContractsShort;
import com.ksoe.energynet.valueobject.lists.ENResponsibles2FINContractsShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;

  /**
  *  DAO Object for ENResponsibles2FINContracts;  
  * 	
  */

public class ENResponsibles2FINContractsDAO extends ENResponsibles2FINContractsDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENResponsibles2FINContractsDAO() {super();}
  //public ENResponsibles2FINContractsDAO(Connection aConnection) {super(aConnection);}
  //public ENResponsibles2FINContractsDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENResponsibles2FINContractsDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENResponsibles2FINContractsDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  
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
   _checkConditionToken(condition,"code","ENRESPONSBLS2FNCNTRCTS.CODE");
     // relationship conditions
   //_checkConditionToken(condition,"responsiblesref","RESPONSIBLESREFCODE");
   _checkConditionToken(condition,"responsiblesref.code","RESPONSIBLESREFCODE");
   //_checkConditionToken(condition,"fincontracts","FINCONTRACTSCODE");
   _checkConditionToken(condition,"fincontracts.code","FINCONTRACTSCODE");
   return condition.toString();
  }  
  
  public ENResponsibles2FINContractsShortList getScrollableFilteredList(ENResponsibles2FINContracts aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {   
   ENResponsibles2FINContractsShortList result = new ENResponsibles2FINContractsShortList();
   ENResponsibles2FINContractsShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);
	
   if(orderBy.length() == 0)
    orderBy = "ENRESPONSBLS2FNCNTRCTS.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
   selectStr = "SELECT "+
    "ENRESPONSBLS2FNCNTRCTS.CODE"+

     ", ENRESPONSIBLES.CODE " +
     ", ENRESPONSIBLES.FIO " +
     ", ENRESPONSIBLES.TABNUMBER " +
     ", ENRESPONSIBLES.POSITION " +
     ", ENRESPONSIBLES.DEPNAME " +
     ", ENRESPONSIBLES.DEPCODE " +
     ", ENRESPONSIBLES.PHONE " +
     ", FINCONTRACTS.CODE " +
     ", FINCONTRACTS.CONTRACTNUMBER " +
     ", FINCONTRACTS.CONTRACTDATE " +
     ", FINCONTRACTS.FINDOCCODE " +
     ", FINCONTRACTS.FINDOCID " +
     ", FINCONTRACTS.ORGCODE " +
     ", (SELECT RQORG.NAME FROM RQORG WHERE RQORG.CODE = FINCONTRACTS.ORGCODE) AS ORGNAME " +
    " FROM ENRESPONSBLS2FNCNTRCTS " +
    ", ENRESPONSIBLES " +
    ", FINCONTRACTS " +
    //" WHERE " 
	""; 
    whereStr = " ENRESPONSIBLES.CODE = ENRESPONSBLS2FNCNTRCTS.RESPONSIBLESREFCODE" ; //+
     whereStr = whereStr +" AND FINCONTRACTS.CODE = ENRESPONSBLS2FNCNTRCTS.FINCONTRACTSCODE" ; //+
		//selectStr = selectStr + " ${s} ENRESPONSBLS2FNCNTRCTS.CODE IN ( SELECT ENRESPONSBLS2FNCNTRCTS.CODE FROM ENRESPONSBLS2FNCNTRCTS ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENRESPONSBLS2FNCNTRCTS.CODE = ?";
       }
       if(aFilterObject.responsiblesRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENRESPONSBLS2FNCNTRCTS.RESPONSIBLESREFCODE = ? ";
       }
       if(aFilterObject.finContracts.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENRESPONSBLS2FNCNTRCTS.FINCONTRACTSCODE = ? ";
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
      if(aFilterObject.responsiblesRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.responsiblesRef.code);
      }
      if(aFilterObject.finContracts.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.finContracts.code);
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

       anObject = new ENResponsibles2FINContractsShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;

       anObject.responsiblesRefCode = set.getInt(2);
		if(set.wasNull())
		   anObject.responsiblesRefCode = Integer.MIN_VALUE;		
       anObject.responsiblesRefFIO = set.getString(3);
       anObject.responsiblesRefTabNumber = set.getInt(4);
		if(set.wasNull())
		   anObject.responsiblesRefTabNumber = Integer.MIN_VALUE;		
       anObject.responsiblesRefPosition = set.getString(5);
       anObject.responsiblesRefDepName = set.getString(6);
       anObject.responsiblesRefDepCode = set.getString(7);
       anObject.responsiblesRefPhone = set.getString(8);
       anObject.finContractsCode = set.getInt(9);
		if(set.wasNull())
		   anObject.finContractsCode = Integer.MIN_VALUE;		
       anObject.finContractsContractNumber = set.getString(10);
       anObject.finContractsContractDate = set.getDate(11);
       anObject.finContractsFinDocCode = set.getString(12);
       anObject.finContractsFinDocID = set.getInt(13);
		if(set.wasNull())
		   anObject.finContractsFinDocID = Integer.MIN_VALUE;		

	   anObject.finContractsOrgCode = set.getInt(14);
	   if(set.wasNull())
		 anObject.finContractsOrgCode = Integer.MIN_VALUE;		
	   anObject.finContractsOrgName = set.getString(15);
		
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




} // end of ENResponsibles2FINContractsDAO

