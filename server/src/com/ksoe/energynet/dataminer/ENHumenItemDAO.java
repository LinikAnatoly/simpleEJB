
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENHumenItemDAOGen;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.HumenLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.valueobject.ENHumenItem;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.brief.ENHumenItemShort;
import com.ksoe.energynet.valueobject.filter.ENDeliveryTimeFilter;
import com.ksoe.energynet.valueobject.filter.ENHumenItemFilter;
import com.ksoe.energynet.valueobject.lists.ENHumenItemShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENHumenItem;
  *
  */

public class ENHumenItemDAO extends ENHumenItemDAOGen {

	public ENHumenItemDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENHumenItemDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}


	@Override
	public int add(ENHumenItem humenItem) throws PersistenceException {

		PlanWorkLogic planLogic = new PlanWorkLogic(getConnection() , getUserProfile());
		HumenLogic humenLogic = new HumenLogic(getConnection() , getUserProfile());

		if (planLogic.isNotEditablePlan(humenItem.planRef.code)) {
			throw new EnergyproSystemException(
					"PlanWork closed or canceled, code = " + humenItem.planRef.code);
		}

		if (humenItem.finWorker != null) {
			if (humenItem.finWorker.tabNumber != null) {
				// проверим является ли воркер инвалидом
				// дата среза проверки принимаем на дату старт плана
				Date date_srez;

				ENPlanWork pw = planLogic.getPlanByCode(humenItem.planRef.code);
				date_srez = pw.getDateStart();

		   		// NET-4396 Запрещаем использовать работников ОВБ на работах других бюджетодержателей
		   		// кроме ЦОДС и СПС
		   		String depName = humenItem.finWorker.departmentName;
		   		if (depName.contains("Оперативно")) {
		   			if ((pw.budgetRef.code != ENConsts.ENBUDGET_ODG && pw.budgetRef.code != ENConsts.ENBUDGET_SPS && pw.budgetRef.code != ENConsts.ENBUDGET_ENERGOSBYT)
		   					// && (!object.finWorker.departmentCode.equals("93"))) { mDax
		   					&& (!humenItem.finWorker.departmentCode.equals("001"))) {
		   				throw new EnergyproSystemException("Цей робітник відноситься до ОДГ(ОВБ)! План повинен бути для бюджетотримача ОДГ");
		   			}
		   		}

		   		humenItem.finWorker = humenLogic.recalcChargePercent(humenItem.finWorker.tabNumber, date_srez);
			}
		}

		return add(humenItem, true);
	}



	@Override
	public void remove(int uid) throws PersistenceException {
		ENHumenItem object = getObject(uid);

	  // удалим доставку ...
	  ENDeliveryTimeDAO delDAO = new ENDeliveryTimeDAO(getConnection() , getUserProfile());
	  ENDeliveryTimeFilter delFilter = new ENDeliveryTimeFilter();
	  delFilter.humenItemRef.code = object.code;
	  int[] delArr = delDAO.getFilteredCodeArray(delFilter, null, null, 0, -1, null);
	  for (int i=0; i < delArr.length; i++){
		  delDAO.remove(delArr[i]);
	  }

	  super.remove(uid);

	  if (object.finWorker != null){
		  if ( object.finWorker.code > Integer.MIN_VALUE){
			  FINWorkerDAO wDAO = new FINWorkerDAO(getConnection() , getUserProfile());
			  wDAO.remove(object.finWorker.code);
		  }
	  }


  }


  @Override
public ENHumenItemShortList getScrollableFilteredList(ENHumenItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENHumenItemShortList result = new ENHumenItemShortList();
   ENHumenItemShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENHUMENITEM.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENHUMENITEM.CODE"+
    ",ENHUMENITEM.COUNTGEN"+
    ",ENHUMENITEM.COUNTFACT"+
    ",ENHUMENITEM.PRICE"+
    ",ENHUMENITEM.COST"+
    ",ENHUMENITEM.USERGEN"+
    ",ENHUMENITEM.DATEEDIT"+

     ", ENPLANWORK.CODE " +
     ", ENPLANWORK.DATEGEN " +
     ", ENPLANWORK.DATESTART " +
     ", ENPLANWORK.DATEFINAL " +
     ", ENPLANWORK.YEARGEN " +
     ", ENPLANWORK.MONTHGEN " +
     ", ENPLANWORK.USERGEN " +
     ", ENPLANWORK.DATEEDIT " +
     ", ENPLANWORKITEM.CODE " +
     ", ENPLANWORKITEM.COUNTGEN " +
     ", ENPLANWORKITEM.USERGEN " +
     ", ENPLANWORKITEM.DATEEDIT " +
     ", TKPOSITION.CODE " +
     ", TKPOSITION.NAME " +
     ", TKPOSITION.SAFETYGROUP " +
     ", TKPOSITION.RANK " +
     ", TKPOSITION.SHORTNAME " +
/*
     ", ENMANNINGTABLE.CODE " +
     //", ENMANNINGTABLE.NAME " +
     ", ENPOSITION.NAME " +
     ", ENMANNINGTABLE.DATESTART " +
     ", ENMANNINGTABLE.DATEFINAL " +
     ", ENWORKER.CODE " +
     ", ENWORKER.NAME " +
     ", ENWORKER.TABNUMBER " +
     ", ENWORKER.ISMOL " +
*/
     ", ENESTIMATEITEMTYPE.CODE " +
     ", ENESTIMATEITEMTYPE.NAME " +

     ", ENHUMENITEM.FINWORKERCODE "+

     ", FINWORKER.NAME "+
     ", FINWORKER.TABNUMBER "+
     ", FINWORKER.POSITIONNAME "+
     ", FINWORKER.FINCODE "+

     ", TKTECHCARD.code, TKTECHCARD.techkartnumber, TKTECHCARD.name " +

	 ", ENHUMENITEM.COUNTFACTORIGINAL " +

    " FROM ENHUMENITEM " +
    " left join FINWORKER on FINWORKER.CODE = ENHUMENITEM.FINWORKERCODE "+
//    " left join ENMANNINGTABLE on ENMANNINGTABLE.CODE = ENHUMENITEM.MANNINGTABLECODE " +
//     " left join ENWORKER on ENWORKER.CODE = ENHUMENITEM.WORKERFACTCODE " +
//    " left join ENPOSITION on ENMANNINGTABLE.POSITIONCODE = ENPOSITION.CODE" +
    ", ENPLANWORK " +
    ", ENPLANWORKITEM " +

  //  " left join TKTECHCARD kr on kr.code = ENPLANWORKITEM.kartarefcode " +

    ", TKPOSITION " +
    //", ENMANNINGTABLE " +
    //", ENWORKER " +
    ", ENESTIMATEITEMTYPE " +
    ", TKTECHCARD " +
    //" WHERE "

	"";

    whereStr = " ENPLANWORK.CODE = ENHUMENITEM.PLANREFCODE" ; //+
    whereStr = whereStr + " AND TKTECHCARD.CODE = ENPLANWORKITEM.KARTAREFCODE";
     whereStr = whereStr +" AND ENPLANWORKITEM.CODE = ENHUMENITEM.PLANITEMREFCODE" ; //+
     whereStr = whereStr +" AND TKPOSITION.CODE = ENHUMENITEM.POSITIONGENCODE" ; //+
      whereStr = whereStr + " AND ENPLANWORKITEM.PLANREFCODE = ENPLANWORK.CODE ";
     //whereStr = whereStr +" AND ENMANNINGTABLE.CODE = ENHUMENITEM.MANNINGTABLECODE" ; //+
     //whereStr = whereStr +" AND ENWORKER.CODE = ENHUMENITEM.WORKERFACTCODE" ; //+
     whereStr = whereStr +" AND ENESTIMATEITEMTYPE.CODE = ENHUMENITEM.TYPEREFCODE" ; //+
		//selectStr = selectStr + " ${s} ENHUMENITEM.CODE IN ( SELECT ENHUMENITEM.CODE FROM ENHUMENITEM ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENHUMENITEM.CODE = ?";
       }
       if(aFilterObject.countGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENHUMENITEM.COUNTGEN = ?";
       }
       if(aFilterObject.countFact != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENHUMENITEM.COUNTFACT = ?";
       }
       if(aFilterObject.price != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENHUMENITEM.PRICE = ?";
       }
       if(aFilterObject.cost != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENHUMENITEM.COST = ?";
       }
        if (aFilterObject.commentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENHUMENITEM.COMMENTGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENHUMENITEM.COMMENTGEN) LIKE UPPER(?)";
        }
        if (aFilterObject.userGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENHUMENITEM.USERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENHUMENITEM.USERGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.dateEdit != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENHUMENITEM.DATEEDIT = ?";
       }

       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENHUMENITEM.MODIFY_TIME = ?";
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENHUMENITEM.PLANREFCODE = ? ";
       }
       if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENHUMENITEM.PLANITEMREFCODE = ? ";
       }
       if(aFilterObject.positionGen.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENHUMENITEM.POSITIONGENCODE = ? ";
       }
       /*
       if(aFilterObject.manningTable.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENHUMENITEM.MANNINGTABLECODE = ? ";
       }
       if(aFilterObject.workerFact.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENHUMENITEM.WORKERFACTCODE = ? ";
       }
       */
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENHUMENITEM.TYPEREFCODE = ? ";
       }
       if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENHUMENITEM.FINWORKERCODE = ? ";
       }
       if(aFilterObject.countFactOriginal != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENHUMENITEM.COUNTFACTORIGINAL = ?";
       }
     }


     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }
//+ " WHERE" +  ??????? ???? ????
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
       if(aFilterObject.countGen != null){
           number++;
           aFilterObject.countGen = aFilterObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.countGen);
       }
       if(aFilterObject.countFact != null){
           number++;
           aFilterObject.countFact = aFilterObject.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.countFact);
       }
       if(aFilterObject.price != null){
           number++;
           aFilterObject.price = aFilterObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.price);
       }
       if(aFilterObject.cost != null){
           number++;
           aFilterObject.cost = aFilterObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.cost);
       }

          if(aFilterObject.commentGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.commentGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.userGen != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.userGen);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.dateEdit != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
       }


       if(aFilterObject.modify_time != Long.MIN_VALUE){
           number++;
           if(aFilterObject.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
       }
      if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.planRef.code);
      }
      if(aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.planItemRef.code);
      }
      if(aFilterObject.positionGen.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.positionGen.code);
      }
      /*
      if(aFilterObject.manningTable.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.manningTable.code);
      }
      if(aFilterObject.workerFact.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.workerFact.code);
      }
      */
      if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.typeRef.code);
      }
      if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.finWorker.code);
      }
      if(aFilterObject.countFactOriginal != null){
          number++;
          aFilterObject.countFactOriginal = aFilterObject.countFactOriginal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
          statement.setBigDecimal(number,aFilterObject.countFactOriginal);
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

       anObject = new ENHumenItemShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.countGen = set.getBigDecimal(2);
       if(anObject.countGen != null)
           anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.countFact = set.getBigDecimal(3);
       if(anObject.countFact != null)
           anObject.countFact = anObject.countFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.price = set.getBigDecimal(4);
       if(anObject.price != null)
           anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.cost = set.getBigDecimal(5);
       if(anObject.cost != null)
           anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.userGen = set.getString(6);
       anObject.dateEdit = set.getDate(7);


       anObject.planRefCode = set.getInt(8);
       if (set.wasNull())
    	   anObject.planRefCode = Integer.MIN_VALUE;

       anObject.planRefDateGen = set.getDate(9);

       anObject.planRefDateStart = set.getDate(10);

       anObject.planRefDateFinal = set.getDate(11);

       anObject.planRefYearGen = set.getInt(12);
       if (set.wasNull())
    	   anObject.planRefYearGen = Integer.MIN_VALUE;

       anObject.planRefMonthGen = set.getInt(13);
       if (set.wasNull())
    	   anObject.planRefMonthGen = Integer.MIN_VALUE;

       anObject.planRefUserGen = set.getString(14);

       anObject.planRefDateEdit = set.getDate(15);

       anObject.planItemRefCode = set.getInt(16);
       if (set.wasNull())
    	   anObject.planItemRefCode = Integer.MIN_VALUE;

       anObject.planItemRefCountGen = set.getBigDecimal(17);
       if(anObject.planItemRefCountGen != null)
         anObject.planItemRefCountGen = anObject.planItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.planItemRefUserGen = set.getString(18);

       anObject.planItemRefDateEdit = set.getDate(19);

       anObject.positionGenCode = set.getInt(20);
       if (set.wasNull())
    	   anObject.positionGenCode = Integer.MIN_VALUE;

       anObject.positionGenName = set.getString(21);

       anObject.positionGenSafetyGroup = set.getString(22);

       anObject.positionGenRank = set.getString(23);

       anObject.positionGenShortName = set.getString(24);
/*
       anObject.manningTableCode = set.getInt(25);

       anObject.manningTableName = set.getString(26);

       anObject.manningTableDateStart = set.getDate(27);

       anObject.manningTableDateFinal = set.getDate(28);

       anObject.workerFactCode = set.getInt(29);

       anObject.workerFactName = set.getString(30);

       anObject.workerFactTabNumber = set.getString(31);

       anObject.workerFactIsMol = set.getInt(32);
*/
       anObject.typeRefCode = set.getInt(25);
       if (set.wasNull())
    	   anObject.typeRefCode = Integer.MIN_VALUE;

       anObject.typeRefName = set.getString(26);

       anObject.finWorkerCode = set.getInt(27);
       if (set.wasNull())
    	   anObject.finWorkerCode = Integer.MIN_VALUE;

       anObject.finWorkerName = set.getString(28);
       anObject.finWorkerTabNumber = set.getString(29);

       anObject.finWorkerPositionName = set.getString(30);
       anObject.finCode = set.getInt(31);
       if (set.wasNull())
    	   anObject.finCode = Integer.MIN_VALUE;

       anObject.kartaRefCode = set.getInt(32);
       if (set.wasNull())
    	   anObject.kartaRefCode = Integer.MIN_VALUE;

       anObject.kartaNum = set.getString(33);
       anObject.kartaRefName = set.getString(34);

       anObject.countFactOriginal = set.getBigDecimal(35);
       if(anObject.countFactOriginal != null)
           anObject.countFactOriginal = anObject.countFactOriginal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

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


  public BigDecimal getDeliveryTimeByPlanCodeAndTabNumber(int tabNumber, String planCodes)  throws PersistenceException
  {
	  BigDecimal out = new BigDecimal(0);

	   String     selectStr;
	   Connection connection = getConnection();
	   PreparedStatement statement = null;
	   ResultSet  set = null;




	   if(getUserProfile() == null)
	    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	   selectStr = "select sum(d.deliverytimefact) from endeliverytime d, enhumenitem h, finworker fw where " +
	   			   " d.humenitemrefcode = h.code and h.finworkercode = fw.code and fw.tabnumber = ? " +
	   			   " and h.planrefcode in ( " + planCodes + ")";

	    try
	     {
	      statement = connection.prepareStatement(selectStr);

	      statement.setInt(1, tabNumber);

	     set = statement.executeQuery();
	     int i;
	     for(i = 0;set.next();i++)
	      {
	    	 out = set.getBigDecimal(1);
	    	 if (out != null)
	    	 {
	    		 out = out.setScale(2, BigDecimal.ROUND_HALF_UP);
	    	 }
	    	 else
	    	 {
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


	@Override
	public int[] getFilteredCodeArray(ENHumenItemFilter aFilterObject,
			int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(
				aFilterObject,
				(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL),
				(aFilterObject == null) ? (null) : (aFilterObject.orderBySQL),
				fromPosition, quantity, null);
	}

	@Override
	public int[] getFilteredCodeArray(ENHumenItem aFilterObject,
			String anCondition, String anOrderBy, int fromPosition,
			int quantity, Vector aBindObjects) throws PersistenceException {
		Vector result = new Vector();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENHUMENITEM.CODE FROM ENHUMENITEM";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if (orderBy.length() == 0)
			orderBy = "ENHUMENITEM.CODE";

		if (quantity < 0)
			quantity = Integer.MAX_VALUE / 2;

		if (getUserProfile() == null)
			throw new PersistenceException(
					"Internal Error (User Profile Is Undefined)");

		if (aFilterObject != null) {
			if (aFilterObject.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENHUMENITEM.CODE = ?";
			}
			if (aFilterObject.countGen != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENHUMENITEM.COUNTGEN = ?";
			}
			if (aFilterObject.countFact != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENHUMENITEM.COUNTFACT = ?";
			}
			if (aFilterObject.price != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENHUMENITEM.PRICE = ?";
			}
			if (aFilterObject.cost != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENHUMENITEM.COST = ?";
			}
			if (aFilterObject.commentGen != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				if (aFilterObject.commentGen.indexOf('*', 0) < 0
						&& aFilterObject.commentGen.indexOf('?', 0) < 0)
					whereStr = whereStr + "  ENHUMENITEM.COMMENTGEN = ?";
				else
					whereStr = whereStr + "  ENHUMENITEM.COMMENTGEN LIKE ?";
			}
			if (aFilterObject.userGen != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				if (aFilterObject.userGen.indexOf('*', 0) < 0
						&& aFilterObject.userGen.indexOf('?', 0) < 0)
					whereStr = whereStr + "  ENHUMENITEM.USERGEN = ?";
				else
					whereStr = whereStr + "  ENHUMENITEM.USERGEN LIKE ?";
			}
			if (aFilterObject.dateEdit != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENHUMENITEM.DATEEDIT = ?";
			}

			if (aFilterObject.modify_time != Long.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENHUMENITEM.MODIFY_TIME = ?";
			}
			if (aFilterObject.planRef.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + " ENHUMENITEM.PLANREFCODE = ? ";
			}
			if (aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + " ENHUMENITEM.PLANITEMREFCODE = ? ";
			}
			if (aFilterObject.positionGen.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + " ENHUMENITEM.POSITIONGENCODE = ? ";
			}
			if (aFilterObject.typeRef.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + " ENHUMENITEM.TYPEREFCODE = ? ";
			}

			if (aFilterObject.finWorker.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + " ENHUMENITEM.FINWORKERCODE = ? ";
			}

		}

		if (condition.length() != 0) {
			if (whereStr.length() != 0)
				whereStr = whereStr + " AND ";
			whereStr = whereStr + " (" + condition + ")";
		}

		if (whereStr.length() != 0)
			selectStr = selectStr + " WHERE" + whereStr;

		selectStr = selectStr + " ORDER BY " + orderBy;

        selectStr = selectStr + " OFFSET " + fromPosition;
        if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

		try {
			statement = connection.prepareStatement(selectStr);
			int number = 0;
			if (aFilterObject != null) {
				if (aFilterObject.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.code);
				}
				if (aFilterObject.countGen != null) {
					number++;
					aFilterObject.countGen = aFilterObject.countGen.setScale(3,
							java.math.BigDecimal.ROUND_HALF_UP);
					statement.setBigDecimal(number, aFilterObject.countGen);
				}
				if (aFilterObject.countFact != null) {
					number++;
					aFilterObject.countFact = aFilterObject.countFact.setScale(
							3, java.math.BigDecimal.ROUND_HALF_UP);
					statement.setBigDecimal(number, aFilterObject.countFact);
				}
				if (aFilterObject.price != null) {
					number++;
					aFilterObject.price = aFilterObject.price.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);
					statement.setBigDecimal(number, aFilterObject.price);
				}
				if (aFilterObject.cost != null) {
					number++;
					aFilterObject.cost = aFilterObject.cost.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);
					statement.setBigDecimal(number, aFilterObject.cost);
				}
				if (aFilterObject.commentGen != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND";
					if (aFilterObject.commentGen.indexOf('*', 0) < 0
							&& aFilterObject.commentGen.indexOf('?', 0) < 0)
						whereStr = whereStr + " ENHUMENITEM.COMMENTGEN = ?";
					else
						whereStr = whereStr + " ENHUMENITEM.COMMENTGEN LIKE ?";

					if (aFilterObject.commentGen != null) {
						number++;
						StringBuffer likeStr = new StringBuffer();
						likeStr.append(aFilterObject.commentGen);
						for (int i = 0; i < likeStr.length(); i++) {
							if (likeStr.charAt(i) == '*')
								likeStr.setCharAt(i, '%');
							if (likeStr.charAt(i) == '?')
								likeStr.setCharAt(i, '_');
						}
						statement.setString(number, likeStr.toString());
					}
				}
				if (aFilterObject.userGen != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND";
					if (aFilterObject.userGen.indexOf('*', 0) < 0
							&& aFilterObject.userGen.indexOf('?', 0) < 0)
						whereStr = whereStr + " ENHUMENITEM.USERGEN = ?";
					else
						whereStr = whereStr + " ENHUMENITEM.USERGEN LIKE ?";

					if (aFilterObject.userGen != null) {
						number++;
						StringBuffer likeStr = new StringBuffer();
						likeStr.append(aFilterObject.userGen);
						for (int i = 0; i < likeStr.length(); i++) {
							if (likeStr.charAt(i) == '*')
								likeStr.setCharAt(i, '%');
							if (likeStr.charAt(i) == '?')
								likeStr.setCharAt(i, '_');
						}
						statement.setString(number, likeStr.toString());
					}
				}
				if (aFilterObject.dateEdit != null) {
					number++;
					statement.setDate(number, new java.sql.Date(
							aFilterObject.dateEdit.getTime()));
				}

				if (aFilterObject.modify_time != Long.MIN_VALUE) {
					number++;
					if (aFilterObject.modify_time == Long.MIN_VALUE)
						statement.setBigDecimal(number, null);
					else
						statement.setBigDecimal(number,
								new java.math.BigDecimal(
										aFilterObject.modify_time));
				}
				if (aFilterObject.planRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.planRef.code);
				}
				if (aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.planItemRef.code);
				}
				if (aFilterObject.positionGen.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.positionGen.code);
				}
				if (aFilterObject.typeRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.typeRef.code);
				}

				if (aFilterObject.finWorker.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.finWorker.code);
				}
			}

			if (condition.length() > 0 && aBindObjects != null)
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
//				if (i < fromPosition)
//					continue;
//				else if (i >= fromPosition + quantity) {
//					i++;
//					break;
//				}

				result.add(new Integer(set.getInt(1)));
			}

			int[] array;

			array = new int[result.size()];
			for (int j = 0; j < result.size(); j++)
				array[j] = ((Integer) result.get(j)).intValue();

			return array;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
			return null;
		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

	} // end of getFilteredCodeArray


    public void updateCountFactOriginal(ENHumenItem anObject) throws PersistenceException
    {
        Connection connection = getConnection();

        String updHumenItem =
            " UPDATE ENHUMENITEM " +
            "    SET COUNTFACTORIGINAL = ? " +
            "  WHERE CODE = ? ";

        PreparedStatement statement = null;

        try
        {
            statement = connection.prepareStatement(updHumenItem);

            if (anObject.countFactOriginal != null)
                anObject.countFactOriginal = anObject.countFactOriginal.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(1, anObject.countFactOriginal);

            statement.setInt(2, anObject.code);

            statement.execute();
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + updHumenItem + "\n humenItem.code = " + anObject.code);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }
    }



	public ENHumenItemShortList getHumen2FinWorkerList(
			ENHumenItemFilter aFilterObject) throws PersistenceException {
		return getHumen2FinWorkerList(aFilterObject,
				(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL));
	}

	public ENHumenItemShortList getHumen2FinWorkerList(
			ENHumenItem aFilterObject, String anCondition) throws PersistenceException {

		ENHumenItemShortList result = new ENHumenItemShortList();
		ENHumenItemShort anObject;
		result.list = new Vector();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);

		if (getUserProfile() == null)
			throw new PersistenceException(
					"Internal Error (User Profile Is Undefined)");

		selectStr = "SELECT string_agg(ENHUMENITEM.CODE::text, ',') , ENPLANWORK.DATESTART, FINWORKER.TABNUMBER, FINWORKER.POSITIONNAME  "
				+ " FROM ENHUMENITEM "
				+ " left join FINWORKER on FINWORKER.CODE = ENHUMENITEM.FINWORKERCODE "
				+ ", ENPLANWORK "
				+ ", ENPLANWORKITEM "
				+ ", TKPOSITION "
				+ ", ENESTIMATEITEMTYPE "
				+ ", TKTECHCARD ";


		whereStr = " ENPLANWORK.CODE = ENHUMENITEM.PLANREFCODE";
		whereStr = whereStr + " AND TKTECHCARD.CODE = ENPLANWORKITEM.KARTAREFCODE";
		whereStr = whereStr + " AND ENPLANWORKITEM.CODE = ENHUMENITEM.PLANITEMREFCODE";
		whereStr = whereStr + " AND TKPOSITION.CODE = ENHUMENITEM.POSITIONGENCODE";
		whereStr = whereStr + " AND ENPLANWORKITEM.PLANREFCODE = ENPLANWORK.CODE";
		whereStr = whereStr + " AND ENESTIMATEITEMTYPE.CODE = ENHUMENITEM.TYPEREFCODE";


		if (aFilterObject != null) {
			if (aFilterObject.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENHUMENITEM.CODE = ?";
			}
			if (aFilterObject.countGen != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENHUMENITEM.COUNTGEN = ?";
			}
			if (aFilterObject.countFact != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENHUMENITEM.COUNTFACT = ?";
			}
			if (aFilterObject.price != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENHUMENITEM.PRICE = ?";
			}
			if (aFilterObject.cost != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENHUMENITEM.COST = ?";
			}
			if (aFilterObject.commentGen != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				if (aFilterObject.commentGen.indexOf('*', 0) < 0
						&& aFilterObject.commentGen.indexOf('?', 0) < 0)
					whereStr = whereStr
							+ "  UPPER(ENHUMENITEM.COMMENTGEN) = UPPER(?)";
				else
					whereStr = whereStr
							+ " UPPER(ENHUMENITEM.COMMENTGEN) LIKE UPPER(?)";
			}
			if (aFilterObject.userGen != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				if (aFilterObject.userGen.indexOf('*', 0) < 0
						&& aFilterObject.userGen.indexOf('?', 0) < 0)
					whereStr = whereStr
							+ "  UPPER(ENHUMENITEM.USERGEN) = UPPER(?)";
				else
					whereStr = whereStr
							+ " UPPER(ENHUMENITEM.USERGEN) LIKE UPPER(?)";
			}
			if (aFilterObject.dateEdit != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENHUMENITEM.DATEEDIT = ?";
			}

			if (aFilterObject.modify_time != Long.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENHUMENITEM.MODIFY_TIME = ?";
			}
			if (aFilterObject.planRef.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "ENHUMENITEM.PLANREFCODE = ? ";
			}
			if (aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "ENHUMENITEM.PLANITEMREFCODE = ? ";
			}
			if (aFilterObject.positionGen.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "ENHUMENITEM.POSITIONGENCODE = ? ";
			}

			if (aFilterObject.typeRef.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "ENHUMENITEM.TYPEREFCODE = ? ";
			}
			if (aFilterObject.finWorker.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "ENHUMENITEM.FINWORKERCODE = ? ";
			}
			if (aFilterObject.countFactOriginal != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENHUMENITEM.COUNTFACTORIGINAL = ?";
			}
		}

		if (condition.length() != 0) {
			if (whereStr.length() != 0)
				whereStr = whereStr + " AND ";

			whereStr = whereStr + " (" + condition + ")";
		}

		if (whereStr.length() != 0)
			selectStr = selectStr + " WHERE" + whereStr;

		selectStr = selectStr
				+ " GROUP BY ENPLANWORK.DATESTART, FINWORKER.TABNUMBER , FINWORKER.POSITIONNAME";

		try {
			statement = connection.prepareStatement(selectStr);
			int number = 0;
			if (aFilterObject != null) {
				if (aFilterObject.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.code);
				}
				if (aFilterObject.countGen != null) {
					number++;
					aFilterObject.countGen = aFilterObject.countGen.setScale(3,
							java.math.BigDecimal.ROUND_HALF_UP);
					statement.setBigDecimal(number, aFilterObject.countGen);
				}
				if (aFilterObject.countFact != null) {
					number++;
					aFilterObject.countFact = aFilterObject.countFact.setScale(
							3, java.math.BigDecimal.ROUND_HALF_UP);
					statement.setBigDecimal(number, aFilterObject.countFact);
				}
				if (aFilterObject.price != null) {
					number++;
					aFilterObject.price = aFilterObject.price.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);
					statement.setBigDecimal(number, aFilterObject.price);
				}
				if (aFilterObject.cost != null) {
					number++;
					aFilterObject.cost = aFilterObject.cost.setScale(2,
							java.math.BigDecimal.ROUND_HALF_UP);
					statement.setBigDecimal(number, aFilterObject.cost);
				}

				if (aFilterObject.commentGen != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.commentGen);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}

				if (aFilterObject.userGen != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.userGen);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}
				if (aFilterObject.dateEdit != null) {
					number++;
					statement.setDate(number, new java.sql.Date(
							aFilterObject.dateEdit.getTime()));
				}

				if (aFilterObject.modify_time != Long.MIN_VALUE) {
					number++;
					if (aFilterObject.modify_time == Long.MIN_VALUE)
						statement.setBigDecimal(number, null);
					else
						statement.setBigDecimal(number,
								new java.math.BigDecimal(
										aFilterObject.modify_time));
				}
				if (aFilterObject.planRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.planRef.code);
				}
				if (aFilterObject.planItemRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.planItemRef.code);
				}
				if (aFilterObject.positionGen.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.positionGen.code);
				}

				if (aFilterObject.typeRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.typeRef.code);
				}
				if (aFilterObject.finWorker.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.finWorker.code);
				}
				if (aFilterObject.countFactOriginal != null) {
					number++;
					aFilterObject.countFactOriginal = aFilterObject.countFactOriginal
							.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					statement.setBigDecimal(number,
							aFilterObject.countFactOriginal);
				}
			}


			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {

				anObject = new ENHumenItemShort();

				anObject.humenItemCodesStr = set.getString(1);
				anObject.planRefDateStart = set.getDate(2);
				anObject.finWorkerTabNumber = set.getString(3);
				anObject.finWorkerPositionName = set.getString(4);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
			return null;
		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

} // end of ENHumenItemDAO

