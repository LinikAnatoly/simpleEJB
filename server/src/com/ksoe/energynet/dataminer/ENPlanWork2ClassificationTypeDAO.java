
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENPlanWork2ClassificationTypeDAOGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.brief.ENPlanWork2ClassificationTypeShort;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2ClassificationTypeFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2ClassificationTypeShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENPlanWork2ClassificationType;
  *
  */

public class ENPlanWork2ClassificationTypeDAO extends ENPlanWork2ClassificationTypeDAOGen {

  public ENPlanWork2ClassificationTypeDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENPlanWork2ClassificationTypeDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  @Override
  public ENPlanWork2ClassificationTypeShortList getScrollableFilteredList(ENPlanWork2ClassificationType aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector<? extends Object> aBindObjects) throws PersistenceException
  {
   ENPlanWork2ClassificationTypeShortList result = new ENPlanWork2ClassificationTypeShortList();
   ENPlanWork2ClassificationTypeShort anObject;
   result.list = new Vector<ENPlanWork2ClassificationTypeShort>();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENPLANWORK2CLASSFCTNTP.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENPLANWORK2CLASSFCTNTP.CODE"+
    ",ENPLANWORK2CLASSFCTNTP.COUNTGEN"+
    ",ENPLANWORK2CLASSFCTNTP.USERGEN"+
    ",ENPLANWORK2CLASSFCTNTP.DATEEDIT"+
    ",ENPLANWORK2CLASSFCTNTP.MACHINEHOURS"+
    ",ENPLANWORK2CLASSFCTNTP.RELOCATIONKM"+
    ",ENPLANWORK2CLASSFCTNTP.TRANSPORTATIONLOAD"+
    ",ENPLANWORK2CLASSFCTNTP.ISPRINTONKMORMH"+    //  8

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
     ", ENPLANWORK.DATEWORKORDER " +              //  20
     ", ENPLANWORK.PRICONNECTIONNUMBER " +
     ", TKCLASSIFICATIONTYPE.CODE " +
     ", TKCLASSIFICATIONTYPE.NAME " +
     ", TKCLASSIFICATIONTYPE.KOD " +

     ", ENPLANWORK2CLASSFCTNTP.COSTWORKSCONTRACTOR " +   //  25

     ",ENPLANWORK2CLASSFCTNTP.DATEGEN "+
     ",ENPLANWORK2CLASSFCTNTP.TIMESTART "+
     ",ENPLANWORK2CLASSFCTNTP.TIMEFINAL "+
     ",ENPLANWORK2CLASSFCTNTP.CODEVIRTUALBRIGADE "+
     ",ENPLANWORK2CLASSFCTNTP.ISJOBSBYTIME "+
     ",ENPLANWORK2CLASSFCTNTP.ISVISITCLIENT "+

     ", TKCLASSIFICATIONTYPE.ISGIVECOUNTER " +           // 32
     ", (select enconnectionworktype.code from enconnectionworktype where enconnectionworktype.code = enplanwork2classfctntp.connectionworktyperfcd) " +
     ", (select enconnectionworktype.name from enconnectionworktype where enconnectionworktype.code = enplanwork2classfctntp.connectionworktyperfcd) " +
     ", ENPLANWORK2CLASSFCTNTP.productionexpenssprcnt " +
     ", ENPLANWORK2CLASSFCTNTP.CALCKINDREFCODE " +
     ", ENPLANWORK2CLASSFCTNTP.ADMINISTRATVXPNSSPRCNT " +
     ", coalesce(ENPLANWORK2CLASSFCTNTP.SERVICEPAYMENTKIND,0) as SERVICEPAYMENTKIND  "+
     " FROM ENPLANWORK2CLASSFCTNTP " +
     ", ENPLANWORK " +
     ", TKCLASSIFICATIONTYPE " +

     //" WHERE "
     "";
    whereStr = " ENPLANWORK.CODE = ENPLANWORK2CLASSFCTNTP.PLANREFCODE" ; //+
     whereStr = whereStr +" AND TKCLASSIFICATIONTYPE.CODE = ENPLANWORK2CLASSFCTNTP.CLASSIFICATIONTYPERFCD" ; //+
        //selectStr = selectStr + " ${s} ENPLANWORK2CLASSFCTNTP.CODE IN ( SELECT ENPLANWORK2CLASSFCTNTP.CODE FROM ENPLANWORK2CLASSFCTNTP ";
     
     whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);
		if(whereStr.length() != 0) {
			selectStr += " WHERE " + whereStr;
		}


   selectStr = selectStr + " ORDER BY " + orderBy;

   try
    {
     statement = connection.prepareStatement(selectStr);
     int number = setParameters(aFilterObject, statement);

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

       anObject = new ENPlanWork2ClassificationTypeShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.countGen = set.getBigDecimal(2);
       if(anObject.countGen != null)
           anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.userGen = set.getString(3);
       anObject.dateEdit = set.getDate(4);
       anObject.machineHours = set.getBigDecimal(5);
       if(anObject.machineHours != null)
           anObject.machineHours = anObject.machineHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.relocationKm = set.getBigDecimal(6);
       if(anObject.relocationKm != null)
           anObject.relocationKm = anObject.relocationKm.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.transportationLoad = set.getBigDecimal(7);
       if(anObject.transportationLoad != null)
           anObject.transportationLoad = anObject.transportationLoad.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.isPrintOnKmOrMH = set.getInt(8);
       if ( set.wasNull() )
           anObject.isPrintOnKmOrMH = Integer.MIN_VALUE;


       anObject.planRefCode = set.getInt(9);
        if(set.wasNull())
        anObject.planRefCode = Integer.MIN_VALUE;
       anObject.planRefDateGen = set.getDate(10);
       anObject.planRefDateStart = set.getDate(11);
       anObject.planRefDateFinal = set.getDate(12);
       anObject.planRefYearGen = set.getInt(13);
        if(set.wasNull())
        anObject.planRefYearGen = Integer.MIN_VALUE;
       anObject.planRefMonthGen = set.getInt(14);
        if(set.wasNull())
        anObject.planRefMonthGen = Integer.MIN_VALUE;
       anObject.planRefYearOriginal = set.getInt(15);
        if(set.wasNull())
        anObject.planRefYearOriginal = Integer.MIN_VALUE;
       anObject.planRefMonthOriginal = set.getInt(16);
        if(set.wasNull())
        anObject.planRefMonthOriginal = Integer.MIN_VALUE;
       anObject.planRefUserGen = set.getString(17);
       anObject.planRefDateEdit = set.getDate(18);
       anObject.planRefWorkOrderNumber = set.getString(19);
       anObject.planRefDateWorkOrder = set.getDate(20);
       anObject.planRefPriConnectionNumber = set.getString(21);
       anObject.classificationTypeRefCode = set.getInt(22);
        if(set.wasNull())
        anObject.classificationTypeRefCode = Integer.MIN_VALUE;
       anObject.classificationTypeRefName = set.getString(23);
       anObject.classificationTypeRefKod = set.getString(24);

       anObject.costWorksContractor = set.getBigDecimal(25);
       if(anObject.costWorksContractor != null)
        anObject.costWorksContractor = anObject.costWorksContractor.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.dateGen = set.getDate(26);
       anObject.timeStart = set.getTimestamp(27);
       anObject.timeFinal = set.getTimestamp(28);
       anObject.codeVirtualBrigade = set.getInt(29);
       if ( set.wasNull() )
           anObject.codeVirtualBrigade = Integer.MIN_VALUE;
       anObject.isJobsByTime = set.getInt(30);
       if ( set.wasNull() )
           anObject.isJobsByTime = Integer.MIN_VALUE;
       anObject.isVisitClient = set.getInt(31);
       if ( set.wasNull() )
           anObject.isVisitClient = Integer.MIN_VALUE;

       anObject.isGiveCounter = set.getInt(32);
       if ( set.wasNull() )
           anObject.isGiveCounter = Integer.MIN_VALUE;

       anObject.connectionWorkTypeRefCode = set.getInt(33);
        if(set.wasNull())
        anObject.connectionWorkTypeRefCode = Integer.MIN_VALUE;
       anObject.connectionWorkTypeRefName = set.getString(34);
       anObject.productionExpensesPercent = set.getBigDecimal(35);
       anObject.calcKindRefCode = set.getInt(36);
       anObject.administrativeExpensesPercent = set.getBigDecimal(37);
       
       anObject.servicePaymentKind = set.getInt(38);
		if ( set.wasNull() ) {
			anObject.servicePaymentKind = Integer.MIN_VALUE;
		}

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
  
  public ENPlanWork2ClassificationTypeShortList getListByElementCode(int elementCode, int planKindCode) throws PersistenceException {
	  if(elementCode == Integer.MIN_VALUE) {
		  throw new java.lang.NullPointerException("Не заданий код елементу!");
	  }
	  if(planKindCode == Integer.MIN_VALUE) {
		  throw new java.lang.NullPointerException("Не заданий код виду плану!");
	  }
	  
	  if(planKindCode != ENPlanWorkKind.CALCULATION &&
			  planKindCode != ENPlanWorkKind.CALCULATION_SINGLE) {
		  ENPlanWorkKindDAO kindDao = new ENPlanWorkKindDAO(getConnection(), getUserProfile());
		  ENPlanWorkKind kindCalculation = kindDao.getObject(ENPlanWorkKind.CALCULATION);
		  ENPlanWorkKind kindCalculationSingle = kindDao.getObject(ENPlanWorkKind.CALCULATION_SINGLE);
		  if(kindCalculation != null && kindCalculationSingle != null) {
			  throw new SystemException(String.format("Вид плану повинен бути \"%s\" або \"%s\""
					  , kindCalculation.getName(), kindCalculationSingle.getName()));  
		  } else {
			  throw new SystemException("Невідомий код виду плану - " + planKindCode);
		  }
	  }
	  
	  ENPlanWorkDAO planDao = new ENPlanWorkDAO(getConnection(), getUserProfile());
	  
	  ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
	  planFilter.kind.code = planKindCode;
	  planFilter.elementRef.code = elementCode;
	  int[] planCodes = planDao.getFilteredCodeArray(planFilter, 0, -1);
	  
	  if(planCodes.length == 0) {
		  return null;
	  }
	  
	  ENPlanWork2ClassificationTypeFilter pwctFilter = new ENPlanWork2ClassificationTypeFilter();
	  pwctFilter.conditionSQL = String.format("%s in (%s)"
			  , ENPlanWork2ClassificationType.planRef_QFielld
			  , Tools.repeatSymbol("?", ",", planCodes.length));
	  
	  Vector<Integer> binded = new Vector<Integer>();
	  for(int planCode : planCodes) binded.add(planCode);
	  
	  return this.getScrollableFilteredList(pwctFilter, 0, -1, binded);
  }

	/**
	 * @throws PersistenceException
	 */
	public ENPlanWork2ClassificationTypeShortList getClassificationTypeListByPlanCode(
			int plan) throws PersistenceException {
		ENPlanWork2ClassificationTypeFilter filter = new ENPlanWork2ClassificationTypeFilter();
		filter.planRef.code = plan;
		return this.getScrollableFilteredList(filter, 0, -1);
	}


	public ENPlanWork2ClassificationType getENPlanWork2ClassificationType(
			int elementCode, int classificationTypeCode)
			throws PersistenceException {

		ENPlanWork2ClassificationTypeFilter filter = new ENPlanWork2ClassificationTypeFilter();
		filter.classificationTypeRef.code = classificationTypeCode;
		filter.conditionSQL = ENPlanWork.elementRef_QFielld + " = ? ";
		filter.conditionSQL += " AND " + ENPlanWork.kind_QFielld + " = ? ";
		filter.orderBySQL = ENPlanWork.dateStart_QFielld + " desc";

		Vector<Object> bindObjects = new Vector<Object>();
		bindObjects.add(elementCode);
		bindObjects.add(ENPlanWorkKind.CALCULATION);
		ENPlanWork2ClassificationTypeShortList list = this.getScrollableFilteredList(filter, 0, -1, bindObjects);

		if (list.totalCount == 0) {
			throw new SystemException("\n Помилка у кількості робіт за кошторисом!!! "
					+ "\n Кількість робіт: " + list.totalCount + ", код елементу: " + elementCode + ", калькуляція: " + classificationTypeCode + "."
					+ "\n Перевірте правильність складання кошторису!");
		}

		return this.getObject(list.get(0).code);
	}


  // возвращает по коду связки для План-Кошториса - код связки из Plan2ClassificationType для План-Кошториса ЕДИНИЧНОГО
  public int getCodeSingleCalcPlan2ClassificationTypeByCalcPlan2ClassificationType(int plan2classificationCodeCalc) throws PersistenceException
  {

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;

   int out = Integer.MIN_VALUE;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr =   " Select p2csign.code from enplanwork2classfctntp p2c , \n" +
                    "               enplanwork pw ,  \n" +
                    "               enplanwork pwsign ,  \n" +
                    "               enplanwork2classfctntp p2csign                 \n" +
                    " where p2c.code = ? \n" +
                    "   and p2c.planrefcode = pw.code \n" +
                    "   and pw.kindcode = ? \n" +
                    "   and pw.elementrefcode = pwsign.elementrefcode  \n" +
                    "   and pwsign.kindcode = ? \n" +
                    "   and p2csign.classificationtyperfcd = p2c.classificationtyperfcd \n" +
                    "   and pwsign.code = p2csign.planrefcode \n" +
                    "  \n"  ;


   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1, plan2classificationCodeCalc);
     statement.setInt(2, ENPlanWorkKind.CALCULATION);
     statement.setInt(3, ENPlanWorkKind.CALCULATION_SINGLE);

     set = statement.executeQuery();
     while(set.next())
      {
        out = set.getInt(1);
        if (out == Integer.MIN_VALUE){
        	out = 0;
        }
      }
     return out;
    }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return 0;
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


} // end of ENPlanWork2ClassificationTypeDAO

