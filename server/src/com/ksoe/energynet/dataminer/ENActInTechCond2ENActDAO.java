
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

import com.ksoe.energynet.dataminer.generated.ENActInTechCond2ENActDAOGen;
import com.ksoe.energynet.valueobject.ENActInTechCond2ENAct;
import com.ksoe.energynet.valueobject.ENActIncomeTechConditions;
import com.ksoe.energynet.valueobject.brief.ENActInTechCond2ENActShort;
import com.ksoe.energynet.valueobject.filter.ENActInTechCond2ENActFilter;
import com.ksoe.energynet.valueobject.lists.ENActInTechCond2ENActShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENActInTechCond2ENAct;
  *
  */

public class ENActInTechCond2ENActDAO extends ENActInTechCond2ENActDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENActInTechCond2ENActDAO() {super();}
  //public ENActInTechCond2ENActDAO(Connection aConnection) {super(aConnection);}
  //public ENActInTechCond2ENActDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENActInTechCond2ENActDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENActInTechCond2ENActDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  /**
   * 
   * Если расходный акт связан с доходным актам по тех. условиям, то вернет этот акт
   * 
   * @param actCode код расходного акта
   * @return доходный акт по тех. условиям или null
   * @throws PersistenceException
   */
  public ENActIncomeTechConditions getActIncomeByENActCode(int actCode) throws PersistenceException {
		ENActIncomeTechConditionsDAO actIncomeDao = new ENActIncomeTechConditionsDAO(getConnection(), getUserProfile());
		ENActInTechCond2ENActFilter filter = new ENActInTechCond2ENActFilter();
		filter.actRef.code = actCode;
		ENActInTechCond2ENActShortList list = this.getScrollableFilteredList(filter, 0, -1);
		if(list.totalCount > 0) {
			if(list.totalCount != 1) throw new SystemException("Помилка у кількості");
			return actIncomeDao.getObject(list.get(0).actIncomeRefCode);
		}
		return null;
	}

  public ENActInTechCond2ENActShortList getScrollableFilteredList(ENActInTechCond2ENAct aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENActInTechCond2ENActShortList result = new ENActInTechCond2ENActShortList();
    ENActInTechCond2ENActShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACTINTECHCOND2ENACT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENACTINTECHCOND2ENACT.CODE"+
     ",ENACTINTECHCOND2ENACT.SUMMAGEN"+

      ", ENACTINCOMETECHCONDTNS.CODE " +
      ", ENACTINCOMETECHCONDTNS.NUMBERGEN " +
      ", ENACTINCOMETECHCONDTNS.DATEGEN " +
      ", ENACTINCOMETECHCONDTNS.ACTDATESTART " +
      ", ENACTINCOMETECHCONDTNS.ACTDATEEND " +
      ", ENACTINCOMETECHCONDTNS.SUMMAGEN " +
      ", ENACTINCOMETECHCONDTNS.SUMMAVAT " +
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

     " FROM ENACTINTECHCOND2ENACT " +
     ", ENACTINCOMETECHCONDTNS " +
     ", ENACT " +

      "";

      whereStr = " ENACTINCOMETECHCONDTNS.CODE = ENACTINTECHCOND2ENACT.ACTINCOMEREFCODE" ; //+
      whereStr = whereStr +" AND ENACT.CODE = ENACTINTECHCOND2ENACT.ACTREFCODE" ; //+


      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINTECHCOND2ENACT.CODE = ?";
        }
        if(aFilterObject.summaGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINTECHCOND2ENACT.SUMMAGEN = ?";
        }
        if(aFilterObject.actIncomeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACTINTECHCOND2ENACT.ACTINCOMEREFCODE = ? ";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACTINTECHCOND2ENACT.ACTREFCODE = ? ";
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
        if(aFilterObject.summaGen != null){
            number++;
            aFilterObject.summaGen = aFilterObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summaGen);
        }
       if(aFilterObject.actIncomeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actIncomeRef.code);
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

        anObject = new ENActInTechCond2ENActShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.summaGen = set.getBigDecimal(2);
        if(anObject.summaGen != null)
            anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.actIncomeRefCode = set.getInt(3);
		if(set.wasNull())
		   anObject.actIncomeRefCode = Integer.MIN_VALUE;
        anObject.actIncomeRefNumbergen = set.getString(4);
        anObject.actIncomeRefDategen = set.getDate(5);
        anObject.actIncomeRefActDateStart = set.getDate(6);
        anObject.actIncomeRefActDateEnd = set.getDate(7);
        anObject.actIncomeRefSummaGen = set.getBigDecimal(8);
        if(anObject.actIncomeRefSummaGen != null)
          anObject.actIncomeRefSummaGen = anObject.actIncomeRefSummaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.actIncomeRefSummaVat = set.getBigDecimal(9);
        if(anObject.actIncomeRefSummaVat != null)
          anObject.actIncomeRefSummaVat = anObject.actIncomeRefSummaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.actRefCode = set.getInt(10);
		if(set.wasNull())
		   anObject.actRefCode = Integer.MIN_VALUE;
        anObject.actRefNumberGen = set.getString(11);
        anObject.actRefDateGen = set.getDate(12);
        anObject.actRefFinDocCode = set.getInt(13);
		if(set.wasNull())
		   anObject.actRefFinDocCode = Integer.MIN_VALUE;
        anObject.actRefFinDocMechanicCode = set.getInt(14);
		if(set.wasNull())
		   anObject.actRefFinDocMechanicCode = Integer.MIN_VALUE;
        anObject.actRefFinMolName = set.getString(15);
        anObject.actRefFinMechanicName = set.getString(16);
        anObject.actRefInvNumber = set.getString(17);
        anObject.actRefUserGen = set.getString(18);
        anObject.actRefDateEdit = set.getDate(19);
        anObject.actRefDateAct = set.getDate(20);

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



} // end of ENActInTechCond2ENActDAO

