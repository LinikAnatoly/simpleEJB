
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
import com.ksoe.energynet.dataminer.generated.ENReconstrModernOZ2ENactDAOGen;
import com.ksoe.energynet.valueobject.ENReconstrModernOZ2ENact;
import com.ksoe.energynet.valueobject.brief.ENReconstrModernOZ2ENactShort;
import com.ksoe.energynet.valueobject.lists.ENReconstrModernOZ2ENactShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;

  /**
  *  DAO Object for ENReconstrModernOZ2ENact;  
  * 	
  */

public class ENReconstrModernOZ2ENactDAO extends ENReconstrModernOZ2ENactDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENReconstrModernOZ2ENactDAO() {super();}
  //public ENReconstrModernOZ2ENactDAO(Connection aConnection) {super(aConnection);}
  //public ENReconstrModernOZ2ENactDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENReconstrModernOZ2ENactDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENReconstrModernOZ2ENactDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  /** Лист для вывода актов под ОЗ-2 реконструкция модернизация **/
  public ENReconstrModernOZ2ENactShortList getScrollableFilteredListForRM(ENReconstrModernOZ2ENact aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity) throws PersistenceException
  {   
   ENReconstrModernOZ2ENactShortList result = new ENReconstrModernOZ2ENactShortList();
   ENReconstrModernOZ2ENactShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);
	
   if(orderBy.length() == 0)
    orderBy = "ENRECONSTRMODERNOZ2NCT.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
   selectStr = "SELECT "+
    "ENRECONSTRMODERNOZ2NCT.CODE"+
    ",ENRECONSTRMODERNOZ2NCT.SUMGEN"+
    ",ENRECONSTRMODERNOZ2NCT.SUMNDS"+

     ", ENACT.CODE " +
     ", ENACT.NUMBERGEN " +
     ", ENACT.DATEGEN " +
     ", ENACT.FINDOCCODE " +
     ", ENACT.FINDOCMECHANICCODE " +
     ", ENACT.FINMOLNAME " +
     ", ENACT.FINMECHANICNAME " +
     ", ENACT.INVNUMBER " +
     ", ENACT.USERGEN " +
     ", ENACT.DATEEDIT " +
     ", ENACT.DATEACT " +
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
     ////
     ", ENPLANWORKSTATE.NAME " + // название типа акта 35  
     ", ENACTSTATUS.NAME " + //  название статуса акта 36
     ", ENRECONSTRMODERNOZ2NCT.ISCALCULATIONDATE " + 
    " FROM ENRECONSTRMODERNOZ2NCT " +
    ", ENACT " +
    ", ENRECONSTRMODERNOZ " +
    ", ENPLANWORKSTATE " +
    ", ENACTSTATUS " + 
	""; 
    whereStr = " ENACT.CODE = ENRECONSTRMODERNOZ2NCT.ACTREFCODE" ; 
    whereStr = whereStr +" AND ENRECONSTRMODERNOZ.CODE = ENRECONSTRMODERNOZ2NCT.ENRECONSTRMODERNOZRFCD" ;
    whereStr = whereStr +" AND ENACT.ACTTYPEREFCODE = ENPLANWORKSTATE.CODE" ;
    whereStr = whereStr +" AND ENACTSTATUS.CODE = ENACT.STATUSREFCODE" ;
     

     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENRECONSTRMODERNOZ2NCT.CODE = ?";
       }
       if(aFilterObject.sumGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENRECONSTRMODERNOZ2NCT.SUMGEN = ?";
       }
       if(aFilterObject.sumNds != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENRECONSTRMODERNOZ2NCT.SUMNDS = ?";
       }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENRECONSTRMODERNOZ2NCT.ACTREFCODE = ? ";
       }
       if(aFilterObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENRECONSTRMODERNOZ2NCT.ENRECONSTRMODERNOZRFCD = ? ";
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
       if(aFilterObject.sumGen != null){
           number++;
           aFilterObject.sumGen = aFilterObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.sumGen);
       }
       if(aFilterObject.sumNds != null){
           number++;
           aFilterObject.sumNds = aFilterObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.sumNds);
       }
      if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.actRef.code);
      }
      if(aFilterObject.ENReconstrModernOZRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.ENReconstrModernOZRef.code);
      }
     }

   //  if(condition.length() > 0 && aBindObjects != null)
   //   _bindObjectsToPreparedStatement(statement,aBindObjects,number);

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

       anObject = new ENReconstrModernOZ2ENactShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.sumGen = set.getBigDecimal(2);
       if(anObject.sumGen != null)
           anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.sumNds = set.getBigDecimal(3);
       if(anObject.sumNds != null)
           anObject.sumNds = anObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.actRefCode = set.getInt(4);
		if(set.wasNull())
		   anObject.actRefCode = Integer.MIN_VALUE;		
       anObject.actRefNumberGen = set.getString(5);
       anObject.actRefDateGen = set.getDate(6);
       anObject.actRefFinDocCode = set.getInt(7);
		if(set.wasNull())
		   anObject.actRefFinDocCode = Integer.MIN_VALUE;		
       anObject.actRefFinDocMechanicCode = set.getInt(8);
		if(set.wasNull())
		   anObject.actRefFinDocMechanicCode = Integer.MIN_VALUE;		
       anObject.actRefFinMolName = set.getString(9);
       anObject.actRefFinMechanicName = set.getString(/*10*/ 35); // сетим в поле  название типа акта
       anObject.actRefInvNumber = set.getString(11);
       anObject.actRefUserGen = set.getString(/*12*/ 36); // сетим в поле  название статуса акта 
       anObject.actRefDateEdit = set.getDate(13);
       anObject.actRefDateAct = set.getDate(14);
       anObject.ENReconstrModernOZRefCode = set.getInt(15);
		if(set.wasNull())
		   anObject.ENReconstrModernOZRefCode = Integer.MIN_VALUE;		
       anObject.ENReconstrModernOZRefNumbergen = set.getString(16);
       anObject.ENReconstrModernOZRefDateGen = set.getDate(17);
       anObject.ENReconstrModernOZRefDateEdit = set.getDate(18);
       anObject.ENReconstrModernOZRefSummaGen = set.getBigDecimal(19);
       if(anObject.ENReconstrModernOZRefSummaGen != null)
         anObject.ENReconstrModernOZRefSummaGen = anObject.ENReconstrModernOZRefSummaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.ENReconstrModernOZRefCharacteristic = set.getString(20);
       anObject.ENReconstrModernOZRefExecutedPosition = set.getString(21);
       anObject.ENReconstrModernOZRefExecutedName = set.getString(22);
       anObject.ENReconstrModernOZRefAcceptedPosition = set.getString(23);
       anObject.ENReconstrModernOZRefAcceptedName = set.getString(24);
       anObject.ENReconstrModernOZRefContractPrice = set.getBigDecimal(25);
       if(anObject.ENReconstrModernOZRefContractPrice != null)
         anObject.ENReconstrModernOZRefContractPrice = anObject.ENReconstrModernOZRefContractPrice.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.ENReconstrModernOZRefCodeMol = set.getString(26);
       anObject.ENReconstrModernOZRefCodePodr = set.getString(27);
       anObject.ENReconstrModernOZRefInvNumberOZ = set.getString(28);
       anObject.ENReconstrModernOZRefNameOZ = set.getString(29);
       anObject.ENReconstrModernOZRefFinContractNumber = set.getString(30);
       anObject.ENReconstrModernOZRefFinContractDate = set.getDate(31);
       anObject.ENReconstrModernOZRefPartnerName = set.getString(32);
       anObject.ENReconstrModernOZRefPartnerCode = set.getString(33);
       anObject.ENReconstrModernOZRefUserGen = set.getString(34);

       anObject.isCalculationDate = set.getInt(37);
		if(set.wasNull())
		   anObject.isCalculationDate = Integer.MIN_VALUE;
		
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



  public void updateIsCalculationDate(int actCode, int ozCode , int isCalculationDate) throws PersistenceException
  {
   
   Connection connection = getConnection();
   try
    {
     PreparedStatement statement = null;

     String selectStr;

     Vector fields = null;
     
     
       selectStr = 
    	   " update ENRECONSTRMODERNOZ2NCT set " +  
    	   " iscalculationdate = " + isCalculationDate + 
    	   " where actrefcode = " + actCode + 
    	   " and enreconstrmodernozrfcd = " +  ozCode ;
      
    

     statement = null;

     try
      {
       statement = connection.prepareStatement(selectStr); 
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
 
  } 

} 

