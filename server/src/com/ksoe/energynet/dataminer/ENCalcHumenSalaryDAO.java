
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
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENCalcHumenSalaryDAOGen;
import com.ksoe.energynet.valueobject.ENCalcHumenSalary;
import com.ksoe.energynet.valueobject.brief.ENCalcHumenSalaryShort;
import com.ksoe.energynet.valueobject.filter.ENCalcHumenSalaryFilter;
import com.ksoe.energynet.valueobject.lists.ENCalcHumenSalaryShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENCalcHumenSalary;
  *
  */

public class ENCalcHumenSalaryDAO extends ENCalcHumenSalaryDAOGen {

	public ENCalcHumenSalaryDAO(UserProfile anUserProfile,
			Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENCalcHumenSalaryDAO(Connection aConnection,
			UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}

	public BigDecimal getSalaryByPlan2ClassificationType(
			int plan2classificationCode) throws PersistenceException {

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		BigDecimal out = new BigDecimal(0);

		if (getUserProfile() == null)
			throw new PersistenceException(
					"Internal Error (User Profile Is Undefined)");

		selectStr = "select coalesce(sum(ss.salarytotal),0) from encalchumensalary ss where ss.plan2ctyperefcode = ? ";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1, plan2classificationCode);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				out = set.getBigDecimal(1);
				if (out != null) {
					out = out.setScale(2, BigDecimal.ROUND_HALF_UP);
				}
			}
			return out;
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


	public ENCalcHumenSalaryShortList getList4Calculation(
			int plan2classificationCode) throws PersistenceException {

		ENCalcHumenSalaryShortList result = new ENCalcHumenSalaryShortList();
		ENCalcHumenSalaryShort anObject;

		result.list = new Vector();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if (getUserProfile() == null)
			throw new PersistenceException(
					"Internal Error (User Profile Is Undefined)");

	    selectStr = " select tcl.kod, pos.name || case when ql.code = 0 then '' else ' ' || coalesce(pos.rank, '') || ' ' || ql.reportname end ||  " +
		 " case when coalesce(pos.departmentcategory,'') = '' then '' else ' (' || pos.departmentcategory || ')' end as name, \n" +
		 " poshist.normhoursmonth,  sum(hi.countfact) , \n" +
		 " poshist.salaryworker,  poshist.bonus " +
		 " , pos.code , poshist.salaryadditional, poshist.salarypremium, poshist.salarysurcharge \n" +
		 " from  tkclassificationtype tcl \n" +
		 "     , enplanwork p , enplanworkitem pi , enhumenitem hi, \n" +
		 "     enplanwork2classfctntp p2c , tktechcard tc, tkposition pos, tkqualificationlevel ql, tkpositionhistory poshist \n" +
		 " where \n" +
		 " p.code = pi.planrefcode and pi.countgen <> 0 \n" +
		 " and ql.code = pos.qualificationlevelcode " +
		 " and p.code = hi.planrefcode \n" +
		 " and pi.code = hi.planitemrefcode \n" +
		 " and pos.code = hi.positiongencode \n" +
		 " and p2c.planrefcode = p.code and tcl.code = p2c.classificationtyperfcd \n" +
		 " and p2c.code = ? \n" +
		 " and tc.code = pi.kartarefcode and tc.classificationtypecode = tcl.code \n" +
         " and pos.code = poshist.positioncode \n" +
         " and p.datestart between poshist.datefrom and coalesce(poshist.dateto,'31.12.9999') \n" +
		 " group by tcl.kod, pos.name, pos.rank, ql.code, pos.departmentcategory, poshist.normhoursmonth, \n" +
		  " poshist.salaryworker, poshist.bonus , pos.code, poshist.salaryadditional, poshist.salarypremium, poshist.salarysurcharge" ;

//		selectStrOld = " select tcl.kod,  pos.name || case when coalesce(pos.rank,'') = '' then '' else ' ' || pos.rank ||  ' ãð.' end ||  \n " +
//				" case when coalesce(pos.departmentcategory,'') = '' then '' else ' (' || pos.departmentcategory || ')' end as name, \n" +
//				" pos.normhoursmonth, sum(hi.countfact)  \n" +
//				" , pos.salaryworker, pos.bonus \n" +
//				" , pos.code " +
//
//				" from  tkclassificationtype tcl    \n" +
//				"      , tkposition pos , enplanwork p , enplanworkitem pi , enhumenitem hi, \n" +
//				"      enplanwork2classfctntp p2c , tktechcard tc \n" +
//				" where   \n" +
//				" p.code = pi.planrefcode and pi.countgen <> 0 \n" +
//				" and p.code = hi.planrefcode \n" +
//				" and pi.code = hi.planitemrefcode \n" +
//				" and pos.code = hi.positiongencode \n" +
//				" and p2c.planrefcode = p.code and tcl.code = p2c.classificationtyperfcd \n" +
//				" and p2c.code = ? \n" +
//				" and tc.code = pi.kartarefcode and tc.classificationtypecode = tcl.code " +
//				" group by tcl.kod, pos.name, pos.rank, pos.departmentcategory, pos.normhoursmonth, pos.salaryworker, pos.bonus, pos.code \n";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1, plan2classificationCode);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new ENCalcHumenSalaryShort();
				anObject.numberGen = i + 1;
				anObject.classificationTypeNumber = set.getString(1);
				anObject.positionName = set.getString(2);

				anObject.timeGenMonth = set.getBigDecimal(3);
				if (anObject.timeGenMonth != null) {
					anObject.timeGenMonth = anObject.timeGenMonth.setScale(2,
							BigDecimal.ROUND_HALF_UP);
				}

				anObject.timeGen = set.getBigDecimal(4);
				if (anObject.timeGen != null) {
					anObject.timeGen = anObject.timeGen.setScale(2,
							BigDecimal.ROUND_HALF_UP);
				}

				anObject.salaryMonth = set.getBigDecimal(5);
				if (anObject.salaryMonth != null) {
					anObject.salaryMonth = anObject.salaryMonth.setScale(2,
							BigDecimal.ROUND_HALF_UP);
				}

				anObject.bonusPercent = set.getBigDecimal(6);
				if (anObject.bonusPercent != null) {
					anObject.bonusPercent = anObject.bonusPercent.setScale(3,
							BigDecimal.ROUND_HALF_UP);
				}

				anObject.positionRefCode = set.getInt(7);
				if (set.wasNull())
					anObject.positionRefCode = Integer.MIN_VALUE;
				
				anObject.salaryAdditional = set.getBigDecimal(8);
				if (anObject.salaryAdditional != null) {
					anObject.salaryAdditional = anObject.salaryAdditional.setScale(3, BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryPremium = set.getBigDecimal(9);
				if (anObject.salaryPremium != null) {
					anObject.salaryPremium = anObject.salaryPremium.setScale(3, BigDecimal.ROUND_HALF_UP);
				}
				anObject.salarySurcharge = set.getBigDecimal(10);
				if (anObject.salarySurcharge != null) {
					anObject.salarySurcharge = anObject.salarySurcharge.setScale(3, BigDecimal.ROUND_HALF_UP);
				}

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


	@Override
	public ENCalcHumenSalaryShortList getScrollableFilteredList(
			ENCalcHumenSalaryFilter aFilterObject, int fromPosition,
			int quantity) throws PersistenceException {
		return getScrollableFilteredList(
				aFilterObject,
				(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL),
				(aFilterObject == null) ? (null) : (aFilterObject.orderBySQL),
				fromPosition, quantity, null);
	}
	
	public ENCalcHumenSalaryShortList getScrollableFilteredList(ENCalcHumenSalary aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENCalcHumenSalaryShortList result = new ENCalcHumenSalaryShortList();
		ENCalcHumenSalaryShort anObject;
		result.list = new Vector<ENCalcHumenSalaryShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCALCHUMENSALARY.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENCALCHUMENSALARY.CODE"+
			",ENCALCHUMENSALARY.NUMBERGEN"+
			",ENCALCHUMENSALARY.CLASSIFICATIONTYPENMBR"+
			",ENCALCHUMENSALARY.POSITIONNAME"+
			",ENCALCHUMENSALARY.TIMEGENMONTH"+
			",ENCALCHUMENSALARY.TIMEGEN"+
			",ENCALCHUMENSALARY.SALARYMONTH"+
			",ENCALCHUMENSALARY.PRICEHOUR"+
			",ENCALCHUMENSALARY.SALARYHOUR"+
			",ENCALCHUMENSALARY.SALARYBONUS"+
			",ENCALCHUMENSALARY.SALARYSURCHARGE"+
			",ENCALCHUMENSALARY.SALARYPREMIUM"+
			",ENCALCHUMENSALARY.SALARYADDITIONAL"+
			",ENCALCHUMENSALARY.SALARYTOTALBONUS"+
			",ENCALCHUMENSALARY.SALARYTOTAL"+
			
			", ENPLANWORK.CODE " +
			", ENPLANWORK.DATEGEN " +
			", ENPLANWORK.DATESTART " +
			", ENPLANWORK.DATEFINAL " +
			", ENPLANWORK.YEARGEN " +
			", ENPLANWORK.MONTHGEN " +
			", ENPLANWORK.YEARORIGINAL " +
			", ENPLANWORK.MONTHORIGINAL " +
			", ENPLANWORK.USERGEN " +
			", ENPLANWORK.DATEEDIT " +
			", ENPLANWORK.WORKORDERNUMBER " +
			", ENPLANWORK.DATEWORKORDER " +
			", ENPLANWORK.PRICONNECTIONNUMBER " +
			", ENPLANWORK.DATEENDPRICONNECTION " +
			", ENPLANWORK.INVESTWORKSDESCRIPTION " +
			", ENPLANWORK.SERVICESFSIDEFINID " +
			", ENPLANWORK.SERVICESFSIDECNNUM " +
			", ENPLANWORK.TOTALTIMEHOURS " +
			", ENPLANWORK.TOTALTIMEDAYS " +
			", ENPLANWORK.INVESTITEMNUMBER " +
			", ENPLANWORK2CLASSFCTNTP.CODE " +
			", ENPLANWORK2CLASSFCTNTP.COUNTGEN " +
			", ENPLANWORK2CLASSFCTNTP.USERGEN " +
			", ENPLANWORK2CLASSFCTNTP.DATEEDIT " +
			", ENPLANWORK2CLASSFCTNTP.MACHINEHOURS " +
			", ENPLANWORK2CLASSFCTNTP.RELOCATIONKM " +
			", ENPLANWORK2CLASSFCTNTP.TRANSPORTATIONLOAD " +
			", ENPLANWORK2CLASSFCTNTP.ISPRINTONKMORMH " +
			", ENPLANWORK2CLASSFCTNTP.COSTWORKSCONTRACTOR " +
			", ENPLANWORK2CLASSFCTNTP.DATEGEN " +
			", ENPLANWORK2CLASSFCTNTP.TIMESTART " +
			", ENPLANWORK2CLASSFCTNTP.TIMEFINAL " +
			", ENPLANWORK2CLASSFCTNTP.CODEVIRTUALBRIGADE " +
			", ENPLANWORK2CLASSFCTNTP.ISJOBSBYTIME " +
			", ENPLANWORK2CLASSFCTNTP.ISVISITCLIENT " +
			", ENPLANWORK2CLASSFCTNTP.PRODUCTIONEXPENSSPRCNT " +
			", TKPOSITION.CODE " +
			", TKPOSITION.NAME " +
			", TKPOSITION.SAFETYGROUP " +
			", TKPOSITION.RANK " +
			", TKPOSITION.SHORTNAME " +
			", ENCALCHUMENSALARY.PERCENTBONUS"+
			", ENCALCHUMENSALARY.PERCENTSURCHARGE"+
			", ENCALCHUMENSALARY.PERCENTPREMIUM"+
			", ENCALCHUMENSALARY.PERCENTADDITIONAL"+
		" FROM ENCALCHUMENSALARY " +
			", ENPLANWORK " +
			", ENPLANWORK2CLASSFCTNTP " +
			", TKPOSITION " +
		"";
		whereStr = " ENPLANWORK.CODE = ENCALCHUMENSALARY.PLANREFCODE" ; //+
		whereStr += " AND ENPLANWORK2CLASSFCTNTP.CODE = ENCALCHUMENSALARY.PLAN2CTYPEREFCODE" ; //+
		whereStr += " AND TKPOSITION.CODE = ENCALCHUMENSALARY.POSITIONREFCODE" ; //+

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);
		if(whereStr.length() != 0) {
			selectStr += " WHERE " + whereStr;
		}
		selectStr = selectStr + " ORDER BY " + orderBy;

		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;
		int number = 0;
		try {
			statement = connection.prepareStatement(selectStr);
			number = setParameters(aFilterObject, statement);
			
			if(condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);
			}

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new ENCalcHumenSalaryShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numberGen = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.numberGen = Integer.MIN_VALUE;
				}
				anObject.classificationTypeNumber = set.getString(3);
				anObject.positionName = set.getString(4);
				anObject.timeGenMonth = set.getBigDecimal(5);
				if(anObject.timeGenMonth != null) {
					anObject.timeGenMonth = anObject.timeGenMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeGen = set.getBigDecimal(6);
				if(anObject.timeGen != null) {
					anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryMonth = set.getBigDecimal(7);
				if(anObject.salaryMonth != null) {
					anObject.salaryMonth = anObject.salaryMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.priceHour = set.getBigDecimal(8);
				if(anObject.priceHour != null) {
					anObject.priceHour = anObject.priceHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryHour = set.getBigDecimal(9);
				if(anObject.salaryHour != null) {
					anObject.salaryHour = anObject.salaryHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryBonus = set.getBigDecimal(10);
				if(anObject.salaryBonus != null) {
					anObject.salaryBonus = anObject.salaryBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salarySurcharge = set.getBigDecimal(11);
				if(anObject.salarySurcharge != null) {
					anObject.salarySurcharge = anObject.salarySurcharge.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryPremium = set.getBigDecimal(12);
				if(anObject.salaryPremium != null) {
					anObject.salaryPremium = anObject.salaryPremium.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryAdditional = set.getBigDecimal(13);
				if(anObject.salaryAdditional != null) {
					anObject.salaryAdditional = anObject.salaryAdditional.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryTotalBonus = set.getBigDecimal(14);
				if(anObject.salaryTotalBonus != null) {
					anObject.salaryTotalBonus = anObject.salaryTotalBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryTotal = set.getBigDecimal(15);
				if(anObject.salaryTotal != null) {
					anObject.salaryTotal = anObject.salaryTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.planRefCode = set.getInt(16);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(17);
				anObject.planRefDateStart = set.getDate(18);
				anObject.planRefDateFinal = set.getDate(19);
				anObject.planRefYearGen = set.getInt(20);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(21);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.planRefYearOriginal = set.getInt(22);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(23);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefUserGen = set.getString(24);
				anObject.planRefDateEdit = set.getDate(25);
				anObject.planRefWorkOrderNumber = set.getString(26);
				anObject.planRefDateWorkOrder = set.getDate(27);
				anObject.planRefPriConnectionNumber = set.getString(28);
				anObject.planRefDateEndPriConnection = set.getDate(29);
				anObject.planRefInvestWorksDescription = set.getString(30);
				anObject.planRefServicesFSideFinId = set.getInt(31);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(32);
				anObject.planRefTotalTimeHours = set.getBigDecimal(33);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(34);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(35);
				anObject.plan2CTypeRefCode = set.getInt(36);
				if(set.wasNull()) {
					anObject.plan2CTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRefCountGen = set.getBigDecimal(37);
				if(anObject.plan2CTypeRefCountGen != null) {
					anObject.plan2CTypeRefCountGen = anObject.plan2CTypeRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2CTypeRefUserGen = set.getString(38);
				anObject.plan2CTypeRefDateEdit = set.getDate(39);
				anObject.plan2CTypeRefMachineHours = set.getBigDecimal(40);
				if(anObject.plan2CTypeRefMachineHours != null) {
					anObject.plan2CTypeRefMachineHours = anObject.plan2CTypeRefMachineHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2CTypeRefRelocationKm = set.getBigDecimal(41);
				if(anObject.plan2CTypeRefRelocationKm != null) {
					anObject.plan2CTypeRefRelocationKm = anObject.plan2CTypeRefRelocationKm.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2CTypeRefTransportationLoad = set.getBigDecimal(42);
				if(anObject.plan2CTypeRefTransportationLoad != null) {
					anObject.plan2CTypeRefTransportationLoad = anObject.plan2CTypeRefTransportationLoad.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2CTypeRefIsPrintOnKmOrMH = set.getInt(43);
				if(set.wasNull()) {
					anObject.plan2CTypeRefIsPrintOnKmOrMH = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRefCostWorksContractor = set.getBigDecimal(44);
				if(anObject.plan2CTypeRefCostWorksContractor != null) {
					anObject.plan2CTypeRefCostWorksContractor = anObject.plan2CTypeRefCostWorksContractor.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2CTypeRefDateGen = set.getDate(45);
				anObject.plan2CTypeRefTimeStart = set.getTimestamp(46);
				anObject.plan2CTypeRefTimeFinal = set.getTimestamp(47);
				anObject.plan2CTypeRefCodeVirtualBrigade = set.getInt(48);
				if(set.wasNull()) {
					anObject.plan2CTypeRefCodeVirtualBrigade = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRefIsJobsByTime = set.getInt(49);
				if(set.wasNull()) {
					anObject.plan2CTypeRefIsJobsByTime = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRefIsVisitClient = set.getInt(50);
				if(set.wasNull()) {
					anObject.plan2CTypeRefIsVisitClient = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRefProductionExpensesPercent = set.getBigDecimal(51);
				if(anObject.plan2CTypeRefProductionExpensesPercent != null) {
					anObject.plan2CTypeRefProductionExpensesPercent = anObject.plan2CTypeRefProductionExpensesPercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.positionRefCode = set.getInt(52);
				if(set.wasNull()) {
					anObject.positionRefCode = Integer.MIN_VALUE;
				}
				anObject.positionRefName = set.getString(53);
				anObject.positionRefSafetyGroup = set.getString(54);
				anObject.positionRefRank = set.getString(55);
				anObject.positionRefShortName = set.getString(56);
				
				anObject.percentBonus = set.getBigDecimal(57);
				if(anObject.percentBonus != null) {
					anObject.percentBonus = anObject.percentBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentSurcharge = set.getBigDecimal(58);
				if(anObject.percentSurcharge != null) {
					anObject.percentSurcharge = anObject.percentSurcharge.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentPremium = set.getBigDecimal(59);
				if(anObject.percentPremium != null) {
					anObject.percentPremium = anObject.percentPremium.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentAdditional = set.getBigDecimal(60);
				if(anObject.percentAdditional != null) {
					anObject.percentAdditional = anObject.percentAdditional.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();}             catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}
	

} // end of ENCalcHumenSalaryDAO

