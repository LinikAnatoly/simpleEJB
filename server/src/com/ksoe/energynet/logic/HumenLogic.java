package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.docflow.dataminer.DFDoc2FINWorkerDAO;
import com.ksoe.docflow.valueobject.DFDoc2FINWorker;
import com.ksoe.docflow.valueobject.filter.DFDoc2FINWorkerFilter;
import com.ksoe.energynet.dataminer.ENAct2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENBonusListItemDAO;
import com.ksoe.energynet.dataminer.ENDeliveryTimeDAO;
import com.ksoe.energynet.dataminer.ENDeliveryTimePlanDAO;
import com.ksoe.energynet.dataminer.ENDepartmentDAO;
import com.ksoe.energynet.dataminer.ENHumenItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderBytItemDAO;
import com.ksoe.energynet.dataminer.FINChargeHistoryDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.logic.AuthLogic.FinConnectionData;
import com.ksoe.energynet.reports.common.mDaxScriptlet;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2ENPlanWork;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENBonusList;
import com.ksoe.energynet.valueobject.ENBonusListItem;
import com.ksoe.energynet.valueobject.ENBonusListItemStatus;
import com.ksoe.energynet.valueobject.ENDeliveryKind;
import com.ksoe.energynet.valueobject.ENDeliveryTime;
import com.ksoe.energynet.valueobject.ENDeliveryTimePlan;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItemType;
import com.ksoe.energynet.valueobject.ENHumenItem;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENServicesContractType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.FINChargeType;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.FINWorkerKind;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENBonusListItemFilter;
import com.ksoe.energynet.valueobject.filter.ENDeliveryTimeFilter;
import com.ksoe.energynet.valueobject.filter.ENDeliveryTimePlanFilter;
import com.ksoe.energynet.valueobject.filter.ENHumenItemFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItemFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytItemFilter;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENHumenItemShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItemShortList;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytItemShortList;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energynet.valueobject.lists.workerListFromKadryShortListAX;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.dataminer.TKElement2TechCardDAO;
import com.ksoe.techcard.dataminer.TKPositionDAO;
import com.ksoe.techcard.dataminer.TKTechCardDAO;
import com.ksoe.techcard.logic.TechCardLogic;
import com.ksoe.techcard.valueobject.TKElementType;
import com.ksoe.techcard.valueobject.TKPosition;
import com.ksoe.techcard.valueobject.TKPositionHistory;
import com.ksoe.techcard.valueobject.TKTechCard;
import com.ksoe.techcard.valueobject.TKTimeDivisionType;
import com.ksoe.techcard.valueobject.brief.TKElement2TechCardShort;
import com.ksoe.techcard.valueobject.filter.TKElement2TechCardFilter;
import com.ksoe.techcard.valueobject.filter.TKPositionFilter;
import com.ksoe.techcard.valueobject.lists.TKElement2TechCardShortList;
import com.ksoe.techcard.valueobject.lists.TKPositionShortList;


public class HumenLogic extends LogicModule{
	
	private java.sql.Connection docConnection = null;

	protected java.sql.Connection getDOCConnection() throws DatasourceConnectException {
		try {
			if (docConnection != null && !docConnection.isClosed()) {
				return docConnection;
			}

			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource) initialContext
					.lookup(com.ksoe.authorization.util.AuthorizationJNDINames.DOCFLOW_DATASOURCE);
			docConnection = dataSource.getConnection();
			return docConnection;
		} catch (NamingException e) {
			throw new DatasourceConnectException(com.ksoe.authorization.util.AuthorizationJNDINames.DOCFLOW_DATASOURCE,
					e);
		} catch (SQLException e) {
			throw new DatasourceConnectException(com.ksoe.authorization.util.AuthorizationJNDINames.DOCFLOW_DATASOURCE,
					e);
		}
	}
	
	public void closeDOCConnection() {
		try {
			if (docConnection != null && !docConnection.isClosed()) {
				docConnection.close();
				docConnection = null;
			}
		} catch (SQLException e) {
		}
	}

	public HumenLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}

	protected java.sql.Connection getLocalConnection(String dataSourceName)
			throws DatasourceConnectException {
		Connection conn = null;
		try {

			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource) initialContext.lookup(dataSourceName);
			conn = dataSource.getConnection();
			return conn;
		} catch (NamingException e) {
			throw new DatasourceConnectException(dataSourceName, e);
		} catch (SQLException e) {
			throw new DatasourceConnectException(dataSourceName, e);
		}
	}

	  public void validateTimeGenByActCode(int actCode) throws PersistenceException
	  {
		  ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(connection, userProfile);
		  ENHumenItemDAO hDAO = new ENHumenItemDAO(connection, userProfile);

		  ENPlanWorkItemFilter f = new ENPlanWorkItemFilter();
		  f.conditionSQL = "enplanworkitem.planrefcode in (select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = "+ actCode + ")";
		  ENPlanWorkItemShortList l = planItemDAO.getScrollableFilteredList(f,0,-1);
		  for (int i=0; i<l.totalCount; i++ ){
			  ENHumenItemFilter hF = new ENHumenItemFilter();
			  hF.planItemRef.code = l.get(i).code;
			  hF.conditionSQL = "enhumenitem.finworkercode is not null";
			  ENHumenItemShortList hList = hDAO.getScrollableFilteredList(hF,0,-1);
			  BigDecimal times = new BigDecimal(0);
			  for (int j=0; j<hList.totalCount; j++){
				  times = times.add(hList.get(j).countFact).setScale(2,BigDecimal.ROUND_HALF_UP);
			  }
			  if  (Math.abs( times.doubleValue() - l.get(i).timeGen.doubleValue() ) > 0.001){
				  throw new EnergyproSystemException("Час у роботі("+l.get(i).timeGen+") не співпадає з часом для персонала("+times+") ... робота " + l.get(i).kartaNum + " " + l.get(i).kartaRefName + ", код Акту = " + actCode);
			  }
		  }
	  }

	  public void validateTimeGenByActCodeForServices(int actCode) throws PersistenceException
	  {
		  ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(connection, userProfile);
		  ENHumenItemDAO hDAO = new ENHumenItemDAO(connection, userProfile);

		  boolean needs2ndCheck = false;

		  ENPlanWorkItemFilter f = new ENPlanWorkItemFilter();
		  f.conditionSQL = "enplanworkitem.planrefcode in (select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = "+ actCode + ")";
		  ENPlanWorkItemShortList l = planItemDAO.getScrollableFilteredList(f,0,-1);
		  for (int i=0; i<l.totalCount; i++ ){
			  ENHumenItemFilter hF = new ENHumenItemFilter();
			  hF.planItemRef.code = l.get(i).code;
			  hF.conditionSQL = "enhumenitem.finworkercode is not null";
			  ENHumenItemShortList hList = hDAO.getScrollableFilteredList(hF,0,-1);
			  BigDecimal times = new BigDecimal(0);
			  for (int j=0; j<hList.totalCount; j++){
				  times = times.add(hList.get(j).countFact).setScale(2,BigDecimal.ROUND_HALF_UP);
			  }
			  if  (Math.abs( times.doubleValue() - l.get(i).timeGen.doubleValue() ) > 0.001){
				  //throw new EnergyproSystemException("Час у роботі("+l.get(i).timeGen+") не співпадає з часом для персонала("+times+") ... робота " + l.get(i).kartaNum + " " + l.get(i).kartaRefName + ", код Акту = " + actCode);
				  needs2ndCheck = true;
				  break;
			  }
		  }

		  if ( ! needs2ndCheck)
		  {
			  return;
		  }


		  TKTechCardDAO tcDAO = new TKTechCardDAO(connection, userProfile);

		  ResultSet  resultSet = null;
		  PreparedStatement statement = null;

		  String selectStr =
			  " select p.datestart, pi.kartarefcode, pi.timegen, sum(hi.countfact) as humantime,  \n" +
	    	  "        coalesce(cast(pi.timegen - sum(hi.countfact) as numeric(15,2)), 0) as dif \n" +
	    	  " from enact a, enact2enplanwork a2p, enplanwork p, enplanworkitem pi, enhumenitem hi \n" +
	    	  " where a2p.actrefcode = a.code and a.code = ? \n" +
	    	  "   and a2p.plancode = p.code  \n" +
	    	  "   and pi.planrefcode = p.code \n" +
	    	  "   and hi.planitemrefcode = pi.code \n" +
	    	  "   and hi.planrefcode = p.code \n" +
	    	  "   and hi.finworkercode is not null \n" +
	    	  "   and pi.countgen > 0 \n" +
	    	  " group by p.datestart, pi.kartarefcode, pi.timegen ";

		   try
		   {
			   statement = connection.prepareStatement(selectStr);

			   statement.setInt(1, actCode);

			   resultSet = statement.executeQuery();

			   while (resultSet.next())
			   {
				   BigDecimal dif = resultSet.getBigDecimal(5);

				   if (dif.doubleValue() != 0)
				   {
					   int tcCode = resultSet.getInt(2);
					   BigDecimal timeGen = resultSet.getBigDecimal(3).setScale(2, java.math.BigDecimal.ROUND_HALF_UP);;
					   BigDecimal humanTime = resultSet.getBigDecimal(4).setScale(2, java.math.BigDecimal.ROUND_HALF_UP);;

					   TKTechCard tcObj = tcDAO.getObject(tcCode);

					   throw new EnergyproSystemException("\n\nSUPP-4874 SUPP-4896 Час у роботі (" + timeGen +
							   ") не співпадає з часом для персонала (" + humanTime + ") ... робота " +
							   tcObj.techKartNumber + " " + tcObj.name + ", код Акту = " + actCode);

				   }
			   }

			} catch (Exception e) {

				throw new EnergyproSystemException(e.getMessage());

			} finally {

				 try {if (resultSet != null) resultSet.close();} catch (SQLException e) {}
			     try {if (statement != null) statement.close();} catch (SQLException e) {}

			}

	  }

	  public boolean checkPriceByPositionCode(int positionCode, boolean isException) throws PersistenceException
	  {
		  boolean out = true;

		  TKPositionDAO pDAO = new TKPositionDAO(connection, userProfile);
		  TKPosition position = pDAO.getObject(positionCode);

		  TechCardLogic tcLogic = new TechCardLogic(connection, userProfile);

		  TKPositionHistory ph = tcLogic.getCurrentPositionHistory(positionCode, null);

		  // переделал на историю должностей
		  if (ph == null || ph.salaryworker == null)
		  {
			  if (isException)
			  {
				  throw new EnergyproSystemException("\n\n"
				  		+ "Не знайдено базову з/п для нормативного працівника \"" + position.name + "\" у калькуляції! код посади " + position.code);
			  }
			  return false;
		  }
		  else if (ph == null || ph.salaryworker.doubleValue() <= 0)
		  {
			  if (isException)
			  {
				  throw new EnergyproSystemException("\n\n"
				  		+ "Не знайдено базову з/п для нормативного працівника \"" + position.name + "\" у калькуляції!");
			  }
			  return false;
		  }

		  return out;
	  }


		public void recalcHumenItemsByPlanItemCode(int planItemCode, boolean isCalcCost) throws PersistenceException
		{
			ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(connection, userProfile);
			ENPlanWorkItem planItemObj = planItemDAO.getObject(planItemCode);

			// на старых Работах иожет НЕ быть времни с учетом Коэф ...
			if (planItemObj.timeGen == null){
				new PlanWorkItemLogic(connection, userProfile).updateCoef(planItemCode);
				planItemObj = planItemDAO.getObject(planItemCode);
			}

			TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);
			TKTechCard cartObj = kDao.getObject(planItemObj.kartaRef.code);

			if (cartObj.timeDivisionTypeRef.code == TKTimeDivisionType.DIVIDE_BY_HUMENS){
				recalcHumenItemsByPlanItemByHumens(planItemObj, isCalcCost);
			}
			else
			if (cartObj.timeDivisionTypeRef.code == TKTimeDivisionType.DIVIDE_BY_POSITIONS){
				recalcHumenItemsByPlanItemByPositions(planItemObj, isCalcCost);
			}
			else{
				throw new EnergyproSystemException("Error in TKTimeDivisionType code");
			}

		}

		public void recalcHumenItemsByPlanItemCode(int planItemCode) throws PersistenceException
		{
			recalcHumenItemsByPlanItemCode(planItemCode, false);
		}

		public void recalcHumenItemsByPlanItemByPositions(ENPlanWorkItem planWorkItemObj, boolean isCalcCost) throws PersistenceException
		{
			//ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(connection, userProfile);
			//ENPlanWorkItem planWorkItemObj = planItemDAO.getObject(planItemCode);

			// на старых Работах иожет НЕ быть времни с учетом Коэф ...
			//if (planWorkItemObj.timeGen == null){
			//	new PlanWorkItemLogic(connection, userProfile).updateCoef(planItemCode);
			//	planWorkItemObj = planItemDAO.getObject(planItemCode);
			//}


			ENHumenItemFilter f = new ENHumenItemFilter();
			f.planItemRef.code = planWorkItemObj.code ;
			f.conditionSQL = " enhumenitem.finworkercode is not null";

			PlanWorkItemLogic planItemLogic = new PlanWorkItemLogic(connection, userProfile);
			
			PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
			ENPlanWork planObj = planLogic.getPlanByCode(planWorkItemObj.planRef.code); 
			
			BigDecimal coeff =  planItemLogic.calcCoef(planWorkItemObj.code);

			ENHumenItemDAO eDao = new ENHumenItemDAO(connection, userProfile);
			TechCardLogic tkLogic = new TechCardLogic(connection, userProfile);

			int[] arr = eDao.getFilteredCodeArray(f,f.conditionSQL, null, 0, -1 , null);
			int[] tmpArr;
			int workerCount = 0;
			workerCount = arr.length;//l.totalCount;
			int workerCountAll = arr.length;
			double workTime = 0;
			double normTime = planWorkItemObj.timeGen.doubleValue() ; //planWorkItemObj.countGen.multiply(kObj.normOfTime).setScale(2,java.math.BigDecimal.ROUND_HALF_UP).doubleValue();
			int i;
			// подсчитаем кол-во реальных людей ...
			//и будет расчитывать нормы только на реальных ... нормативным обнулять ...
			for (i=0; i < arr.length; i++){
				ENHumenItem hObj = eDao.getObject(arr[i]);

				if (isCalcCost)
				{
					checkPriceByPositionCode(hObj.positionGen.code, true);
				}

				f.positionGen.code = hObj.positionGen.code;
				tmpArr = eDao.getFilteredCodeArray(f, f.conditionSQL, null, 0, -1, null);

				///// 11.06.14 SUPP-18399 Будем фильтровать еще и по времени на должности
				//TKElement2TechCardShortList posList = tkLogic.getTimeGenByTechCardAndPosition(planWorkItemObj.kartaRef.code, hObj.positionGen.code, false);
				TKElement2TechCardShortList posList = tkLogic.getTimeGenByTechCardAndPosition(planWorkItemObj.kartaRef.code, hObj.positionGen.code, false, hObj.countFactOriginal);
				/////

				// нету ТАКОЙ должности
				if (posList == null)
				{
					/*
					throw new EnergyproSystemException("\n\n"
							+ "Нормативна посада відсутня в технологічній карті!!!\n\n" + 
							"[techcardCode: " + planWorkItemObj.kartaRef.code + "," + 
							" positionCode: " + hObj.positionGen.code + "," + 
							" countFactOriginal: " + hObj.countFactOriginal + "]");
					*/
					posList = new TKElement2TechCardShortList();
					posList.list.add(new TKElement2TechCardShort());
					posList.totalCount = 1;
				}

				// типа нету ВООБЩЕ персонала ...
				if ((posList.totalCount == 1) && (posList.get(0).elementCode == Integer.MIN_VALUE )){
					// поделим время на ПОКА нормативных воркеров
					if ( i < arr.length - 1 ){
					    hObj.countFact = new BigDecimal(normTime / workerCount).setScale(2, BigDecimal.ROUND_HALF_UP) ;

					    workTime = workTime + hObj.countFact.doubleValue();
					}
					else
					{
						hObj.countFact = new BigDecimal(normTime - workTime).setScale(2, BigDecimal.ROUND_HALF_UP);
					}

					hObj.countGen = planWorkItemObj.timeGen ;
					eDao.save(hObj);
				}
				else
				{
					// есть такие должности .. разделим время ...
					ENHumenItemFilter hFilter = new ENHumenItemFilter();
					hFilter.planItemRef.code = planWorkItemObj.code;
					hFilter.positionGen.code = hObj.positionGen.code;
					///// 11.06.14 SUPP-18399 Будем фильтровать еще и по времени на должности
					// (в том хитром случае, когда в техкарте есть несколько одинаковых должностей с разным временем -
					// данный случай определяем по признаку isWithSamePositions = 1)
					if (posList.get(0).isWithSamePositions == 1)
					{
						hFilter.countFactOriginal = hObj.countFactOriginal;
					}
					/////
					hFilter.conditionSQL = f.conditionSQL;
					ENHumenItemShortList hList = eDao.getScrollableFilteredList(hFilter, 0, -1);
					BigDecimal nTime = posList.get(0).timeGen.multiply(coeff).setScale(2, BigDecimal.ROUND_HALF_UP)
										.multiply(planWorkItemObj.countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
					workTime = 0;
					for (int j = 0; j < hList.totalCount; j++){
						ENHumenItem hObj1 = eDao.getObject(hList.get(j).code);
						if (j < hList.totalCount -1){
							BigDecimal hCount = hList.totalCount > posList.get(0).kolvo.intValue() ? new BigDecimal(hList.totalCount) : posList.get(0).kolvo ;
							hObj1.countFact = nTime.divide(hCount, 2, BigDecimal.ROUND_HALF_UP);
							workTime = workTime + hObj1.countFact.doubleValue();
						}
						else
						{
							hObj1.countFact = new BigDecimal(nTime.doubleValue() - workTime).setScale(2, BigDecimal.ROUND_HALF_UP) ;
						}

						hObj1.countGen = planWorkItemObj.timeGen ;
						eDao.save(hObj1);
					}
				}



				//hObj.countGen = planWorkItemObj.timeGen ; //planWorkItemObj.countGen.multiply(kObj.normOfTime).setScale(2,java.math.BigDecimal.ROUND_HALF_UP) ;

				//eDao.save(hObj);
			}

			// обнулим нормы для НЕРАЗВЯЗАННЫХ ... если ЭТО обьект не ЦПП
			//if (eType != ENElementType.PREPRODUCTION_OBJECT)

				f = null;
				f = new ENHumenItemFilter();
				f.planItemRef.code = planWorkItemObj.code ;
				f.conditionSQL = " enhumenitem.finworkercode is null";

				workTime = 0;

				//ENHumenItemShortList l1 = eDao.getScrollableFilteredList(f,0,-1);
				int[] arr1 = eDao.getFilteredCodeArray(f,f.conditionSQL, null, 0, -1, null);
				workerCountAll = workerCountAll + arr1.length;
				workerCount = arr1.length;

				// если нет ВООБЩЕ никого - создадим ...
				if (workerCountAll == 0 ){
					createHumenItemsByPositions(planWorkItemObj, isCalcCost);
				}
				else
				if (arr.length == 0 ){
					removeHumenItemsByPlanItemCode(planWorkItemObj.code);
					createHumenItemsByPositions(planWorkItemObj, isCalcCost);
				}

				else
				{
					for (i=0; i < arr1.length; i++){
						ENHumenItem hObj = eDao.getObject(arr1[i]);
						hObj.countFact = new BigDecimal(0);

						hObj.countGen = planWorkItemObj.timeGen ;//planWorkItemObj.countGen.multiply(kObj.normOfTime).setScale(2,java.math.BigDecimal.ROUND_HALF_UP) ;
						eDao.save(hObj); 
						
						   
					}
				}


			// расчитаем ВРЕМЯ на доставку ... а ЦППшники ездят куданить?? ;)
			//if (eType != ENElementType.PREPRODUCTION_OBJECT)
				createDeliveryTime(planWorkItemObj.planRef.code);
		}

		public void recalcHumenItemsByPlanItemByPositions__(ENPlanWorkItem planWorkItemObj) throws PersistenceException
		{
			recalcHumenItemsByPlanItemByPositions(planWorkItemObj, false);
		}

		public void recalcHumenItemsByPlanItemByHumens(ENPlanWorkItem planWorkItemObj, boolean isCalcCost) throws PersistenceException{
			//ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(connection, userProfile);
			//ENPlanWorkItem planWorkItemObj = planItemDAO.getObject(planItemCode);

			// на старых Работах иожет НЕ быть времни с учетом Коэф ...
			//if (planWorkItemObj.timeGen == null){
			//	new PlanWorkItemLogic(connection, userProfile).updateCoef(planItemCode);
			//	planWorkItemObj = planItemDAO.getObject(planItemCode);
			//}


		     // НЕ пересчитывать для ЦПП .. они типа сами разделят ...
		     //ElementLogic elLogic = new ElementLogic(connection, userProfile);
		     //int eType = elLogic.getElementTypeByPlanCode(planWorkItemObj.planRef.code);
		     //if (eType != ENElementType.PREPRODUCTION_OBJECT){
			PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
			ENPlanWork planObj = planLogic.getPlanByCode(planWorkItemObj.planRef.code); 

			ENHumenItemFilter f = new ENHumenItemFilter();
			f.planItemRef.code = planWorkItemObj.code ;
			//if (eType == ENElementType.PREPRODUCTION_OBJECT){

			//}
			//else{
				f.conditionSQL = " enhumenitem.finworkercode is not null";
			//}

			ENHumenItemDAO eDao = new ENHumenItemDAO(connection, userProfile);

			//TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);
			//TKTechCard kObj = kDao.getObject(planWorkItemObj.kartaRef.code);

			//FINWorkerDAO finWorkerDAO = new FINWorkerDAO(connection, userProfile);

			//ENHumenItemShortList l = eDao.getScrollableFilteredList(f,0,-1);
			int[] arr = eDao.getFilteredCodeArray(f,f.conditionSQL, null, 0, -1 , null);

			int workerCount = 0;
			workerCount = arr.length;//l.totalCount;
			int workerCountAll = arr.length;
			double workTime = 0;
			double normTime = planWorkItemObj.timeGen.doubleValue() ; //planWorkItemObj.countGen.multiply(kObj.normOfTime).setScale(2,java.math.BigDecimal.ROUND_HALF_UP).doubleValue();
			int i;
			// подсчитаем кол-во реальных людей ...
			//и будет расчитывать нормы только на реальных ... нормативным обнулять ...
			for (i=0; i < arr.length; i++){
				ENHumenItem hObj = eDao.getObject(arr[i]);

				if (isCalcCost)
				{
					checkPriceByPositionCode(hObj.positionGen.code, true);
				}

				// поделим время на ПОКА нормативных воркеров
				if ( i < arr.length - 1 ){
				    hObj.countFact = new BigDecimal(normTime / workerCount).setScale(2, BigDecimal.ROUND_HALF_UP) ;

				    workTime = workTime + hObj.countFact.doubleValue();
				}
				else
				{
					hObj.countFact = new BigDecimal(normTime - workTime).setScale(2, BigDecimal.ROUND_HALF_UP);
				}

/* шо за нах??
				if (hObj.typeRef.code == ENEstimateItemType.AUTO){
				   hObj.countGen = planWorkItemObj.countGen.multiply(kObj.normOfTime).setScale(2,java.math.BigDecimal.ROUND_HALF_UP) ;
				   //hObj.countFact = hObj.countGen;
				}
				else
				if (hObj.typeRef.code == ENEstimateItemType.CORRECTED){
					hObj.countGen = planWorkItemObj.countGen.multiply(kObj.normOfTime).setScale(2,java.math.BigDecimal.ROUND_HALF_UP) ;
				}
*/
				hObj.countGen = planWorkItemObj.timeGen ; //planWorkItemObj.countGen.multiply(kObj.normOfTime).setScale(2,java.math.BigDecimal.ROUND_HALF_UP) ;

				eDao.save(hObj);
				 
					    
			}

			// обнулим нормы для НЕРАЗВЯЗАННЫХ ... если ЭТО обьект не ЦПП
			//if (eType != ENElementType.PREPRODUCTION_OBJECT)
			{
				f = null;
				f = new ENHumenItemFilter();
				f.planItemRef.code = planWorkItemObj.code ;
				f.conditionSQL = " enhumenitem.finworkercode is null";

				workTime = 0;

				//ENHumenItemShortList l1 = eDao.getScrollableFilteredList(f,0,-1);
				int[] arr1 = eDao.getFilteredCodeArray(f,f.conditionSQL, null, 0, -1, null);
				workerCountAll = workerCountAll + arr1.length;
				workerCount = arr1.length;

				for (i=0; i < arr1.length; i++){
					ENHumenItem hObj = eDao.getObject(arr1[i]);

					if (isCalcCost)
					{
						checkPriceByPositionCode(hObj.positionGen.code, true);
					}

					// типа развязанных НЕТУ ... посчитаем время для НЕНОРМАТИВНЫХ ..
					if (arr.length == 0 ){
						if ( i < arr1.length - 1 ){
						    hObj.countFact = new BigDecimal(normTime / workerCount).setScale(2, BigDecimal.ROUND_HALF_UP) ;

						    workTime = workTime + hObj.countFact.doubleValue();
						}
						else
						{
							hObj.countFact = new BigDecimal(normTime - workTime).setScale(2, BigDecimal.ROUND_HALF_UP);
						}
					}
					else{
						hObj.countFact = new BigDecimal(0);
					}

					hObj.countGen = planWorkItemObj.timeGen ;//planWorkItemObj.countGen.multiply(kObj.normOfTime).setScale(2,java.math.BigDecimal.ROUND_HALF_UP) ;
					eDao.save(hObj);
				}
			}

			// если нет ВООБЩЕ никого - создадим ...
			if (workerCountAll == 0 ){
				createHumenItemsByHumens(planWorkItemObj, isCalcCost);
			}

			// расчитаем ВРЕМЯ на доставку ... а ЦППшники ездят куданить?? ;)
			//if (eType != ENElementType.PREPRODUCTION_OBJECT)
				createDeliveryTime(planWorkItemObj.planRef.code);
		}

		public void recalcHumenItemsByPlanItemByHumens__(ENPlanWorkItem planWorkItemObj) throws PersistenceException
		{
			recalcHumenItemsByPlanItemByHumens(planWorkItemObj, false);
		}

		public void removeHumenItemsByPlanItemCode(int planItemCode) throws PersistenceException{
			ENHumenItemFilter f = new ENHumenItemFilter();
			f.planItemRef.code = planItemCode ;
			ENHumenItemDAO eDao = new ENHumenItemDAO(connection, userProfile);

			ENDeliveryTimeDAO delDAO = new ENDeliveryTimeDAO(connection, userProfile);

		   // запомним коды финворкеров ...eDao и удалим ИХ ...
		// удаляеться в ДАО Хумена !!!!

		//	Vector finWorkerCodes = new Vector();
			int[] arr = eDao.getFilteredCodeArray(f, null, null, 0, -1, null);
			//ENHumenItemShortList l = eDao.getScrollableFilteredList(f,0,-1);
			for (int i=0; i < arr.length; i++){
				//if (l.get(i).finWorkerCode > Integer.MIN_VALUE ){
				//	finWorkerCodes.add(new Integer(l.get(i).finWorkerCode));
				//}

				// удалим доставку для каждого Хъюмена ...
				ENDeliveryTimeFilter delFilter = new ENDeliveryTimeFilter();
				delFilter.humenItemRef.code = arr[i];
				int[] delArr = delDAO.getFilteredCodeArray(delFilter, null, null, 0, -1, null);
				for ( int j=0 ; j < delArr.length; j++){
					delDAO.remove(delArr[j]);
				}

				eDao.remove(arr[i]);
			}

			// удалим уже ;) неиспользуемых  ФИНВОРКЕРОВ ... они УДАЛИЛИСЬ в ДАО !!!!
			//FINWorkerDAO finWorkerDAO = new FINWorkerDAO(connection, userProfile);
			//for ( int j = 0; j < finWorkerCodes.size(); j++ ){
			//	finWorkerDAO.remove(  ((Integer)(finWorkerCodes.get(j))).intValue() );
			//}
		}


		public void calculateHumenItem_(int humenItemCode) throws PersistenceException{
			ENHumenItemDAO eDao = new ENHumenItemDAO(connection, userProfile);
			ENHumenItem eObj = eDao.getObject(humenItemCode);

			if (eObj.planItemRef.code == Integer.MIN_VALUE){
				return;
			}

			ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(connection, userProfile);
			ENPlanWorkItem planWorkItemObj = planItemDAO.getObject(eObj.planItemRef.code);

			//TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);

			TKElement2TechCardDAO ecDAO = new TKElement2TechCardDAO(connection, userProfile);
			TKElement2TechCardFilter ecFilter = new TKElement2TechCardFilter();
			ecFilter.techKart.code = planWorkItemObj.kartaRef.code;

			// тормоза БД
			ecFilter.conditionSQL = " TKELEMENT2TECHCARD.ELEMENTCODE in (select TKELEMENT.CODE from TKELEMENT where TKELEMENT.ELEMENTTYPECODE = "+ TKElementType.TKWORKERS +") ";
			TKElement2TechCardShortList ecList = ecDAO.getScrollableFilteredList(ecFilter,0,-1);

			TKPositionDAO positionDAO = new TKPositionDAO(connection, userProfile);

			for (int i=0; i<ecList.totalCount; i++){
				TKPositionFilter pFilter = new TKPositionFilter();
				pFilter.element.code = ecList.get(i).elementCode;

				TKPositionShortList tkList = positionDAO.getScrollableFilteredList(pFilter,0,-1);

				if ( tkList.totalCount > 1 ) {
					throw new EnergyproSystemException("normative position for cart != 1");
				}

				if ( tkList.totalCount == 0) {
					throw new EnergyproSystemException("normative position not found by element code =" + pFilter.element.code);
				}
			    //for (int j=0; j < tkList.totalCount; j++){
				eObj.positionGen.code = tkList.get(0).code;

				eObj.countGen = ecList.get(i).kolvo ; //data[i].materialCount.multiply(planItemObj.countGen).setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

				//eItem.price = new BigDecimal(0);
				//eItem.cost = new BigDecimal(0);

				//eItem.countFact = eItem.countGen;

				// найти реальных людей ...
				//eItem.manningTable.code = Integer.MIN_VALUE;
				//eItem.workerFact.code = Integer.MIN_VALUE;

				//eObj.typeRef.code = 1; // auto ...

				eObj.dateEdit = new Date();
				eObj.userGen = userProfile.userName;

				eDao.save(eObj);
			    //}
			}


		}

		public void createHumenItems(int planItemCode, boolean isCalcCost) throws PersistenceException{
			ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
			ENPlanWorkItem planItemObj = dao.getObject(planItemCode);

			if (planItemObj.timeGen == null){
				new PlanWorkItemLogic(connection, userProfile).updateCoef(planItemCode);
				planItemObj = dao.getObject(planItemCode);
			}

			TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);
			TKTechCard cartObj = kDao.getObject(planItemObj.kartaRef.code);

			if (cartObj.timeDivisionTypeRef.code == TKTimeDivisionType.DIVIDE_BY_HUMENS){
				createHumenItemsByHumens(planItemObj, isCalcCost);
			}
			else
			if (cartObj.timeDivisionTypeRef.code == TKTimeDivisionType.DIVIDE_BY_POSITIONS){
					createHumenItemsByPositions(planItemObj, isCalcCost);
			}
			else{
				throw new EnergyproSystemException("Error in TKTimeDivisionType code");
			}
		}

		public void createHumenItems(int planItemCode) throws PersistenceException
		{
			createHumenItems(planItemCode, false);
		}

		public void createHumenItemsByPositions(ENPlanWorkItem planItemObj, boolean isCalcCost) throws PersistenceException{

			//ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
			ENHumenItemDAO eDao = new ENHumenItemDAO(connection, userProfile);


			//ENPlanWorkItem planItemObj = dao.getObject(planItemCode);

			PlanWorkItemLogic planItemLogic = new PlanWorkItemLogic(connection, userProfile);

			// на старых Работах иожет НЕ быть времни с учетом Коэф ...
			//if (planItemObj.timeGen == null){
			//	new PlanWorkItemLogic(connection, userProfile).updateCoef(planItemCode);
			//	planItemObj = dao.getObject(planItemCode);
			//}

			//TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);
			//TKTechCard cartObj = kDao.getObject(planItemObj.kartaRef.code);

			TKElement2TechCardDAO ecDAO = new TKElement2TechCardDAO(connection, userProfile);
			TKElement2TechCardFilter ecFilter = new TKElement2TechCardFilter();
			ecFilter.techKart.code = planItemObj.kartaRef.code;
			// тормоза БД
			ecFilter.conditionSQL = " TKELEMENT2TECHCARD.ELEMENTCODE in (select TKELEMENT.CODE from TKELEMENT where TKELEMENT.ELEMENTTYPECODE = "+ TKElementType.TKWORKERS +") ";
			TKElement2TechCardShortList ecList = ecDAO.getScrollableFilteredList(ecFilter,0,-1);

			TKPositionDAO positionDAO = new TKPositionDAO(connection, userProfile);
			int workerCount = 0;
			double workTime = 0;
			double workTimeAll =  planItemObj.timeGen.doubleValue() ; // расчет по КОЭФ cartObj.normOfTime.multiply(planItemObj.countGen).setScale(2,java.math.BigDecimal.ROUND_HALF_UP).doubleValue();
			int workerCountAll = 0;

			BigDecimal coeff =  planItemLogic.calcCoef(planItemObj.code);

			for (int i=0; i<ecList.totalCount; i++){
				TKPositionFilter pFilter = new TKPositionFilter();
				pFilter.element.code = ecList.get(i).elementCode;

				TKPositionShortList tkList = positionDAO.getScrollableFilteredList(pFilter,0,-1);

				if ( tkList.totalCount != 1 ) {
					throw new EnergyproSystemException("normative position for cart != 1");
				}

				if (isCalcCost)
				{
					this.checkPriceByPositionCode(tkList.get(0).code, true);
				}

				workTimeAll = ecList.get(i).timeGen.multiply(coeff).setScale(2, BigDecimal.ROUND_HALF_UP)
				                            .multiply(planItemObj.countGen).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();

				workerCountAll = ecList.get(i).kolvo.intValue();
				workTime = 0.0;

				for (int q=0; q < ecList.get(i).kolvo.intValue(); q++) {
					ENHumenItem eItem = new ENHumenItem();
					eItem.planItemRef.code = planItemObj.code;
					eItem.planRef.code = planItemObj.planRef.code;

					eItem.positionGen.code = tkList.get(0).code;

					eItem.countGen = planItemObj.timeGen; //new BigDecimal(workTimeAll);//cartObj.normOfTime.multiply(planItemObj.countGen).setScale(2,java.math.BigDecimal.ROUND_HALF_UP) ; //ecList.get(i).kolvo.multiply(planItemObj.countGen).setScale(3,java.math.BigDecimal.ROUND_HALF_UP) ; //data[i].materialCount.multiply(planItemObj.countGen).setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

					eItem.price = new BigDecimal(0);
					eItem.cost = new BigDecimal(0);

					workerCount++;
					// поделим время на ПОКА нормативных воркеров
					if ( q <  ecList.get(i).kolvo.intValue() - 1 ){
					    eItem.countFact = new BigDecimal( workTimeAll / workerCountAll).setScale(2, BigDecimal.ROUND_HALF_UP) ;

					    workTime = workTime + eItem.countFact.doubleValue();
					}
					else
					{
						eItem.countFact = new BigDecimal(workTimeAll - workTime).setScale(2, BigDecimal.ROUND_HALF_UP);
					}




					// найти реальных людей ...
					//eItem.manningTable.code = Integer.MIN_VALUE;
					//eItem.workerFact.code = Integer.MIN_VALUE;
					eItem.finWorker.code = Integer.MIN_VALUE;

					eItem.typeRef.code = ENEstimateItemType.AUTO; // auto ...
					eItem.dateEdit = new Date();
					eItem.userGen = userProfile.userName;
					eDao.add(eItem);
				}
			}

		}


		public void createHumenItemsByPositions(ENPlanWorkItem planItemObj) throws PersistenceException
		{
			createHumenItemsByPositions(planItemObj, false);
		}


		public void createHumenItemsByHumens(ENPlanWorkItem planItemObj, boolean isCalcCost) throws PersistenceException{
			ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
			ENHumenItemDAO eDao = new ENHumenItemDAO(connection, userProfile);


			//ENPlanWorkItem planItemObj = dao.getObject(planItemCode);

			// на старых Работах иожет НЕ быть времни с учетом Коэф ...
			//if (planItemObj.timeGen == null){
			//	new PlanWorkItemLogic(connection, userProfile).updateCoef(planItemCode);
			//	planItemObj = dao.getObject(planItemCode);
			//}

			//TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);
			//TKTechCard cartObj = kDao.getObject(planItemObj.kartaRef.code);

			TKElement2TechCardDAO ecDAO = new TKElement2TechCardDAO(connection, userProfile);
			TKElement2TechCardFilter ecFilter = new TKElement2TechCardFilter();
			ecFilter.techKart.code = planItemObj.kartaRef.code;
			// тормоза БД
			ecFilter.conditionSQL = " TKELEMENT2TECHCARD.ELEMENTCODE in (select TKELEMENT.CODE from TKELEMENT where TKELEMENT.ELEMENTTYPECODE = "+ TKElementType.TKWORKERS +") ";
			TKElement2TechCardShortList ecList = ecDAO.getScrollableFilteredList(ecFilter,0,-1);

			TKPositionDAO positionDAO = new TKPositionDAO(connection, userProfile);
			int workerCount = 0;
			double workTime = 0;
			double workTimeAll =  planItemObj.timeGen.doubleValue() ; // расчет по КОЭФ cartObj.normOfTime.multiply(planItemObj.countGen).setScale(2,java.math.BigDecimal.ROUND_HALF_UP).doubleValue();
			int workerCountAll = 0;

			for (int i=0; i<ecList.totalCount; i++){
				workerCountAll = workerCountAll + ecList.get(i).kolvo.intValue();
			}

			for (int i=0; i<ecList.totalCount; i++){
				TKPositionFilter pFilter = new TKPositionFilter();
				pFilter.element.code = ecList.get(i).elementCode;

				TKPositionShortList tkList = positionDAO.getScrollableFilteredList(pFilter,0,-1);

				if ( tkList.totalCount != 1 ) {
					// throw new EnergyproSystemException("normative position for cart != 1");
				}

				if (isCalcCost)
				{
					this.checkPriceByPositionCode(tkList.get(0).code, true);
				}

				for (int q=0; q < ecList.get(i).kolvo.intValue(); q++) {
					ENHumenItem eItem = new ENHumenItem();
					eItem.planItemRef.code = planItemObj.code;
					eItem.planRef.code = planItemObj.planRef.code;

					eItem.positionGen.code = tkList.get(0).code;

					eItem.countGen = new BigDecimal(workTimeAll);//cartObj.normOfTime.multiply(planItemObj.countGen).setScale(2,java.math.BigDecimal.ROUND_HALF_UP) ; //ecList.get(i).kolvo.multiply(planItemObj.countGen).setScale(3,java.math.BigDecimal.ROUND_HALF_UP) ; //data[i].materialCount.multiply(planItemObj.countGen).setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

					eItem.price = new BigDecimal(0);
					eItem.cost = new BigDecimal(0);

					workerCount++;
					// поделим время на ПОКА нормативных воркеров
					if ( workerCount < workerCountAll ){
					    eItem.countFact = new BigDecimal( workTimeAll / workerCountAll).setScale(2, BigDecimal.ROUND_HALF_UP) ;

					    workTime = workTime + eItem.countFact.doubleValue();
					}
					else
					{
						eItem.countFact = new BigDecimal(workTimeAll - workTime).setScale(2, BigDecimal.ROUND_HALF_UP);
					}




					// найти реальных людей ...
					//eItem.manningTable.code = Integer.MIN_VALUE;
					//eItem.workerFact.code = Integer.MIN_VALUE;
					eItem.finWorker.code = Integer.MIN_VALUE;

					eItem.typeRef.code = ENEstimateItemType.AUTO; // auto ...
					eItem.dateEdit = new Date();
					eItem.userGen = userProfile.userName;
					eDao.add(eItem);
				}
			}

		}

		public void createHumenItemsByHumens(ENPlanWorkItem planItemObj) throws PersistenceException{
			createHumenItemsByHumens(planItemObj, false);
		}

		public int countHumenItemInPlan(int planCode) throws PersistenceException{
			ENHumenItemDAO eDao = new ENHumenItemDAO(connection, userProfile);
			ENHumenItemFilter filter = new ENHumenItemFilter();
			filter.planRef.code = planCode;
			//filter.typeRef.code = ENEstimateItemType.AUTO;
			//ENHumenItemShortList list = eDao.getScrollableFilteredList(filter,0,-1);
			int[] arr = eDao.getFilteredCodeArray(filter, null, null, 0, -1, null);
			return arr.length;
		}


		public void createDeliveryTime(int planCode) throws PersistenceException
		{

			ENDeliveryTimePlanDAO delPlanDAO = new ENDeliveryTimePlanDAO(connection, userProfile);
			//ENDeliveryTimePlan delPlan = delPlanDAO.getObject(planCode);
			//if (delPlan == null){
				//new TransportLogic(connection, userProfile).createDeliveryTimeForPlan(planCode);

			    ENDeliveryTimePlan delPlan = null;

				ENDeliveryTimePlanFilter delF = new ENDeliveryTimePlanFilter();
				delF.planWorkRef.code = planCode;
				int[] delArr = delPlanDAO.getFilteredCodeArray(delF, null, null, 0, -1, null);
				if (delArr.length > 1){
					throw new EnergyproSystemException("Ошибка в количестве времЁн доставки на плане("+ delArr.length +"), код=" + planCode);
				}

				if (delArr.length == 1){
				delPlan = delPlanDAO.getObject(delArr[0]);
				}

				if (delPlan == null){
					new TransportLogic(connection, userProfile).createDeliveryTimeForPlan(planCode);
				}

				delF.planWorkRef.code = planCode;
				delArr = delPlanDAO.getFilteredCodeArray(delF, null, null, 0, -1, null);


				if (delArr.length != 1){
					throw new EnergyproSystemException("Ошибка в количестве времЁн доставки на плане("+ delArr.length +"), код=" + planCode);
				}

				delPlan = delPlanDAO.getObject(delArr[0]);

			//}

			ENHumenItemDAO hDAO = new ENHumenItemDAO(connection, userProfile);
			ENHumenItemFilter hFilter = new ENHumenItemFilter();
			hFilter.planRef.code = planCode;
			hFilter.conditionSQL = "enhumenitem.countgen<>0 and "+
			             "enhumenitem.planitemrefcode in (select enplanworkitem.code from enplanworkitem where enplanworkitem.planrefcode="+ planCode +
			             " and enplanworkitem.countgen <> 0 )" +
			             // NET-2264 Не учитываем тех хуменов которые весят на техкартах с признаком "Не расчитывать доставку"
			             " and  enhumenitem.code not in ( select hi.code from enhumenitem hi , enplanworkitem pi  , tktechcard tk " +
                         " where hi.planitemrefcode = pi.code " +
                         " and pi.kartarefcode = tk.code " +
                         " and pi.planrefcode = " + planCode +
                         " and coalesce(tk.isnotcalculdelivery,0) = 1  ) "
                         // end NET-2264
                         ;

			int humenNormArr[] = hDAO.getFilteredCodeArray(hFilter, hFilter.conditionSQL, null, 0, -1, null);
			int allNormHumens = humenNormArr.length;

			BigDecimal deliveryNormTime = new BigDecimal(0);
			BigDecimal deliveryRealTime = new BigDecimal(0);
			BigDecimal deliveryNormTimeOne = new BigDecimal(0);
			int realHumens = 0;
			int normHumens = 0;

			if (delPlan.deliveryTimePlan.doubleValue() != 0.0){
				// для Нормативных людей ...
				ENPlanWorkItemDAO piDAO = new ENPlanWorkItemDAO(connection, userProfile);
				ENPlanWorkItemShortList piList = piDAO.getMaxNormHumenCount(planCode);


				if (piList.totalCount > 0)
				{
					if ( piList.get(0).countGen != null ){
						normHumens = piList.get(0).countGen.intValue();
					}
				}

				// для Реальных ....

				piList = piDAO.getRealHumenCount(planCode);
				if (piList.totalCount > 0){
					if ( piList.get(0).countGen != null ){
					    realHumens = piList.get(0).countGen.intValue();
					}
				}


				if (allNormHumens != 0){

					if ( normHumens == 0 ){
						normHumens = allNormHumens;
					}


					deliveryNormTime = delPlan.deliveryTimePlan.multiply(new BigDecimal(normHumens)).divide(new BigDecimal(allNormHumens), 2 , BigDecimal.ROUND_HALF_UP);
					//deliveryNormTimeOne = deliveryNormTime.divide(new BigDecimal(normHumens), 2, BigDecimal.ROUND_HALF_UP);
					deliveryRealTime = delPlan.deliveryTimePlan.multiply(new BigDecimal(realHumens)).divide(new BigDecimal(allNormHumens), 2, BigDecimal.ROUND_HALF_UP);
				}
			}
			else
				// deliveryTime = 0
			{
				deliveryNormTime = deliveryRealTime = new BigDecimal(0);
			}

			ENDeliveryTimeDAO dtDAO = new ENDeliveryTimeDAO(connection, userProfile);
			BigDecimal allTime = new BigDecimal(0);
			for (int i=0; i<allNormHumens; i++){
				ENDeliveryTimeFilter dtFilter = new ENDeliveryTimeFilter();
				dtFilter.humenItemRef.code = humenNormArr[i];
				dtFilter.deliveryKind.code = ENDeliveryKind.TRANSPORT_HOE;
				int dtArray[] = dtDAO.getFilteredCodeArray(dtFilter, null, null, 0, 1, null);
				ENDeliveryTime dt;
				if (dtArray.length > 0)
					dt = dtDAO.getObject(dtArray[0]);
				else
				{
					dt = new ENDeliveryTime();
					dt.deliveryKind.code = ENDeliveryKind.TRANSPORT_HOE;
					dt.humenItemRef.code = humenNormArr[i];
				}

				if ( i < allNormHumens -1 ){
					dt.deliveryTimePlan = deliveryNormTime;
					allTime = allTime.add(deliveryNormTime).setScale(2, BigDecimal.ROUND_HALF_UP);
				}
				else{
					dt.deliveryTimePlan = delPlan.deliveryTimePlan.multiply(new BigDecimal(normHumens)).setScale(2, BigDecimal.ROUND_HALF_UP)
										 .subtract(allTime).setScale(2, BigDecimal.ROUND_HALF_UP);
				}


				dt.deliveryTimeFact = new BigDecimal(0);

				if (dt.code == Integer.MIN_VALUE)
					dtDAO.add(dt);
				else
					dtDAO.save(dt);

			}

			// обнулим время на обнуленных работах ...
			ENDeliveryTimeFilter dtFilter = new ENDeliveryTimeFilter();
			dtFilter.deliveryKind.code = ENDeliveryKind.TRANSPORT_HOE;
			dtFilter.conditionSQL = "ENDELIVERYTIME.HUMENITEMREFCODE in (" +
				"select enhumenitem.code from enhumenitem where  "+
                "enhumenitem.planitemrefcode in (select enplanworkitem.code from enplanworkitem where enplanworkitem.planrefcode="+ planCode +
                " and enplanworkitem.countgen = 0 )"+
                ")";


			int dtArray[] = dtDAO.getFilteredCodeArray(dtFilter, dtFilter.conditionSQL, null, 0, -1, null);
			for (int i=0; i < dtArray.length; i++){
				dtDAO.remove(dtArray[i]);
			}



			// NET-2264 Обнулим время без ремува для работ с признаком на техкартах  "Не расчитывать доставку"
			dtFilter = new ENDeliveryTimeFilter();
			dtFilter.deliveryKind.code = ENDeliveryKind.TRANSPORT_HOE;
			dtFilter.conditionSQL = "ENDELIVERYTIME.HUMENITEMREFCODE in ( select hi.code from enhumenitem hi , enplanworkitem pi  , tktechcard tk " +
            " where hi.planitemrefcode = pi.code " +
            " and pi.kartarefcode = tk.code " +
            " and pi.planrefcode = " + planCode +
            " and coalesce(tk.isnotcalculdelivery,0) = 1  ) " ;

			int dtArray2[] = dtDAO.getFilteredCodeArray(dtFilter, dtFilter.conditionSQL, null, 0, -1, null);
			for (int i=0; i < dtArray2.length; i++){
				ENDeliveryTime delivTimeObj = dtDAO.getObject(dtArray2[i]);
				delivTimeObj.deliveryTimePlan = new BigDecimal(0);
				delivTimeObj.deliveryTimeFact = new BigDecimal(0);

				dtDAO.save(delivTimeObj);
			}





			// расчет для РЕАЛЬНЫХ людей ....

			FINWorkerDAO fwDAO = new FINWorkerDAO(connection, userProfile);




			String finWorkerCondition = " finworker.code in ( " +
			" select enhumenitem.finworkercode  " +
			" from enhumenitem , enplanworkitem  , tktechcard tk  " +
			"  where " +
			"  enplanworkitem.planrefcode = " + planCode +
			"  and enhumenitem.planitemrefcode = enplanworkitem.code  " +
			"  and enhumenitem.countfact<>0   " +
			"  and enplanworkitem.countgen <> 0 " +
			"  and enplanworkitem.kartarefcode = tk.code " + // YMP
			"  and coalesce(tk.isnotcalculdelivery,0) <> 1   " + // YMP
			"  ) " ;

			FINWorkerShortList finWorkerList = fwDAO.getGroupedListByTabNumber(null, finWorkerCondition, "FINWORKER.NAME", 0, -1, null);
			for (int i=0; i<finWorkerList.totalCount; i++){
				ENHumenItemFilter humenFilter = new ENHumenItemFilter();
				humenFilter.conditionSQL = "enhumenitem.code in (" +
				" select hu1.code  " +
				" from enhumenitem as hu1 , enplanworkitem as pi1 , finworker as fi1 , tktechcard as tk1  " +
				"  where " +
				"  pi1.planrefcode = " + planCode +
				"  and hu1.planitemrefcode = pi1.code  " +
				"  and hu1.countfact<>0   " +
				"  and pi1.countgen <> 0 " +
				"  and hu1.finworkercode = fi1.code" +
				"  and pi1.kartarefcode = tk1.code " + // YMP
				"  and coalesce(tk1.isnotcalculdelivery,0) <> 1   " + // YMP
				"  and fi1.tabnumber = '" + finWorkerList.get(i).tabNumber + "'" +
				")";

				//ENHumenItemShortList humenList = hDAO.getScrollableFilteredList(humenFilter, 0, -1);
				int[] arr = hDAO.getFilteredCodeArray(humenFilter, humenFilter.conditionSQL, null, 0, -1, null);
				allTime = new BigDecimal(0);
				for (int j=0; j < arr.length; j++){
					dtFilter = new ENDeliveryTimeFilter();
					dtFilter.humenItemRef.code = arr[j];
					dtFilter.deliveryKind.code = ENDeliveryKind.TRANSPORT_HOE;
					dtArray = dtDAO.getFilteredCodeArray(dtFilter, null, null, 0, 1, null);

					ENDeliveryTime dt;
					if (dtArray.length > 0)
						dt = dtDAO.getObject(dtArray[0]);
					else
					{
						dt = new ENDeliveryTime();
						dt.deliveryKind.code = ENDeliveryKind.TRANSPORT_HOE;
						dt.humenItemRef.code = arr[j];
						dt.deliveryTimePlan = new BigDecimal(0);
					}

					if (j < arr.length - 1){
						dt.deliveryTimeFact = delPlan.deliveryTimeFact.divide(new BigDecimal(arr.length), 2, BigDecimal.ROUND_HALF_UP).setScale(2, BigDecimal.ROUND_HALF_UP);
						allTime = allTime.add(dt.deliveryTimeFact);
					}
					else{
						dt.deliveryTimeFact =  delPlan.deliveryTimeFact.subtract(allTime).setScale(2, BigDecimal.ROUND_HALF_UP);
					}




						if (dt.code == Integer.MIN_VALUE){
						if ( Math.abs( dt.deliveryTimeFact.doubleValue() ) > 0.0001 )
							dtDAO.add(dt);
					    }
				    	else
						    dtDAO.save(dt);

				}


			}

			// // NET-2264 по хуменам плана которые сидят на работе с приизнаком "не рсчитывать доставку " создадим нулевую доставку если нету а если есть то обнулим

			// ENHumenItemDAO hDAO = new ENHumenItemDAO(connection, userProfile);
			hFilter = new ENHumenItemFilter();
			hFilter.planRef.code = planCode;
			hFilter.conditionSQL = " enhumenitem.code in ( select hi.code from enhumenitem hi , enplanworkitem pi  , tktechcard tk " +
                         " where hi.planitemrefcode = pi.code " +
                         " and pi.kartarefcode = tk.code " +
                         " and pi.planrefcode = " + planCode +
                         " and coalesce(tk.isnotcalculdelivery,0) = 1  ) ";
			int humen[] = hDAO.getFilteredCodeArray(hFilter, hFilter.conditionSQL, null, 0, -1, null);

			for (int j=0; j < humen.length; j++){

			dtFilter = new ENDeliveryTimeFilter();
			dtFilter.humenItemRef.code = humen[j];
			dtFilter.deliveryKind.code = ENDeliveryKind.TRANSPORT_HOE;
			ENDeliveryTime dtobj = null;
			int[] dtArray3  = dtDAO.getFilteredCodeArray(dtFilter, dtFilter.conditionSQL, null, 0, -1, null);
			if (dtArray3.length != 0 ) {
			  dtobj = dtDAO.getObject(dtArray3[0]);
			 dtobj.deliveryTimePlan = new BigDecimal(0);
			 dtobj.deliveryTimeFact = new BigDecimal(0);
			 dtDAO.save(dtobj);

			} else
			 {
				dtobj = new ENDeliveryTime();
				dtobj.deliveryKind.code = ENDeliveryKind.TRANSPORT_HOE;
				dtobj.humenItemRef.code = humen[j];
				dtobj.deliveryTimePlan = new BigDecimal(0);
				dtobj.deliveryTimeFact = new BigDecimal(0);
				dtDAO.add(dtobj);
			 }

			}

/*
			for (int i=0; i<allNormHumens; i++){
				ENDeliveryTimeFilter dtFilter = new ENDeliveryTimeFilter();
				dtFilter.humenItemRef.code = humenNormArr[i];
				dtFilter.deliveryKind.code = ENDeliveryKind.TRANSPORT_HOE;
				int dtArray[] = dtDAO.getFilteredCodeArray(dtFilter, null, null, 0, -1, null);
				ENDeliveryTime dt;
				if (dtArray.length > 0)
					dt = dtDAO.getObject(dtArray[0]);
				else
				{
					dt = new ENDeliveryTime();
					dt.deliveryKind.code = ENDeliveryKind.TRANSPORT_HOE;
					dt.humenItemRef.code = humenNormArr[i];
				}


				// для реальных проверить сколько их еще висят на хюменах в этом плане ...
				ENHumenItem h = hDAO.getObject(humenNormArr[i]);
				if (h.finWorker.code != Integer.MIN_VALUE){
				   ENHumenItemFilter rHF = new ENHumenItemFilter();
				   rHF.planRef.code = planCode;
				   rHF.conditionSQL = " enhumenitem.countfact<>0 and enhumenitem.finworkercode in "+
				       "(select finworker.code from finworker where finworker.tabnumber = "+h.finWorker.tabNumber+")";
				   int[] hr = hDAO.getFilteredCodeArray(rHF, rHF.conditionSQL , null, 0, -1, null);
				   if (hr.length == 0){
					   deliveryRealTime = new BigDecimal(0);
				   }
				   else{
				       deliveryRealTime = delPlan.deliveryTimePlan.divide(new BigDecimal(hr.length), 2, BigDecimal.ROUND_HALF_UP);
				   }
				}

				dt.deliveryTimePlan = deliveryNormTime;
				dt.deliveryTimeFact = deliveryRealTime;

				if (dt.code == Integer.MIN_VALUE)
					dtDAO.add(dt);
				else
					dtDAO.save(dt);
			}
*/
		}

		public BigDecimal getChargePercentByDate(int typeCharge, Date dateSrez) throws PersistenceException
		  {
	       FINChargeHistoryDAO chargeHistoryDao = new FINChargeHistoryDAO(connection,userProfile);
	       return chargeHistoryDao.getChargePercentByDate(typeCharge, dateSrez);

		}

	public void createHumenItemsByChangePlanWorkItem(int planItemCode,
			boolean isCalcCost) throws PersistenceException {
		ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);

		new PlanWorkItemLogic(connection, userProfile).updateCoef(planItemCode);
		ENPlanWorkItem planItemObj = dao.getObject(planItemCode);

		TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);
		TKTechCard cartObj = kDao.getObject(planItemObj.kartaRef.code);

		if (cartObj.timeDivisionTypeRef.code == TKTimeDivisionType.DIVIDE_BY_HUMENS) {
			createHumenItemsByHumens(planItemObj, isCalcCost);
		} else if (cartObj.timeDivisionTypeRef.code == TKTimeDivisionType.DIVIDE_BY_POSITIONS) {
			createHumenItemsByPositions(planItemObj, isCalcCost);
		} else {
			throw new EnergyproSystemException(
					"Error in TKTimeDivisionType code");
		}
	}

    public void updateCountFactOriginal(ENHumenItem anObject) throws PersistenceException
    {
    	ENHumenItemDAO humenItemDAO = new ENHumenItemDAO(connection, userProfile);
    	humenItemDAO.updateCountFactOriginal(anObject);
    }

    /**
     * - генерация строк ведомотсти для премии
     *
     * */

    public void generateBonusListItemByPersonalFromMDAX_old(ENBonusList bonusObj)
    		throws PersistenceException {

    	ENDepartmentDAO depDAO = new ENDepartmentDAO(connection, userProfile);
    	ENBonusListItemDAO blItemDAO = new ENBonusListItemDAO(connection, userProfile);
		ENDepartment depObj = depDAO.getObject(bonusObj.department.code);

		String dateSart = "01."+ bonusObj.monthGen +"."+bonusObj.yearGen;
		String dateFinal = new SimpleDateFormat("dd.MM.yyyy").format(Tools.getLastDayOfMonth(Tools.convertStringToDate( "01."+ bonusObj.monthGen +"."+bonusObj.yearGen) ) );

		ResultSet  resultSet = null;
		PreparedStatement statement = null;

		mDaxScriptlet mdxScriptlet =  new mDaxScriptlet();
		try {
			workerListFromKadryShortListAX workerList = null;
			if (bonusObj.kindRef.code == FINWorkerKind.PROM ){
			workerList = mdxScriptlet.getWorkerListFromAX(
					"01."+ bonusObj.monthGen +"."+bonusObj.yearGen ,
			 new SimpleDateFormat("dd.MM.yyyy").format(Tools.getLastDayOfMonth(Tools.convertStringToDate( "01."+ bonusObj.monthGen +"."+bonusObj.yearGen) ) )  ,
			 depObj.hrmorganizationid , FINWorkerKind.PROM , true);
			}
			if (bonusObj.kindRef.code == FINWorkerKind.ESBYT ){
				workerList = mdxScriptlet.getWorkerListFromAX(
						"01."+ bonusObj.monthGen +"."+bonusObj.yearGen ,
				 new SimpleDateFormat("dd.MM.yyyy").format(Tools.getLastDayOfMonth(Tools.convertStringToDate( "01."+ bonusObj.monthGen +"."+bonusObj.yearGen) ) )  ,
				 depObj.hrmorganizationid , FINWorkerKind.ESBYT , true);
			}

			ArrayList<WorkerListFromKadryShortCompare> arraylistSort = new ArrayList<WorkerListFromKadryShortCompare>();

			 for (int f=0; f < workerList.totalCount; f++){

				 boolean ixistTabnFromSortList = false;
				 for (int i = 0; i < arraylistSort.size(); i++) {

					   String finWorkerList = workerList.get(f).tabn;
					   String finWorkerListSort =  arraylistSort.get(i).tabn;

					   if (finWorkerList.equals(finWorkerListSort))  {
						   ixistTabnFromSortList = true;
						   arraylistSort.set(i, new WorkerListFromKadryShortCompare(
									 workerList.get(f).tabn ,
									 workerList.get(f).podr_nazv ,
									 workerList.get(f).podr_id ,
									 workerList.get(f).fio,
									 workerList.get(f).post_fin,
									 workerList.get(f).tradecategoryid,
									 workerList.get(f).norma_vrem_hours.add(arraylistSort.get(i).norma_vrem_hours),
									 workerList.get(f).sumhoursotpusk.add(arraylistSort.get(i).sumhoursotpusk) ,
									 workerList.get(f).main_podr_id ,
									 workerList.get(f).podr_nazv_main,
									 workerList.get(f).fact_workdays.add(arraylistSort.get(i).fact_workdays)  ));
					   }

					}

				    if (!ixistTabnFromSortList) {
						 arraylistSort.add(new WorkerListFromKadryShortCompare(
						 workerList.get(f).tabn ,
						 workerList.get(f).podr_nazv ,
						 workerList.get(f).podr_id ,
						 workerList.get(f).fio,
						 workerList.get(f).post_fin,
						 workerList.get(f).tradecategoryid,
						 workerList.get(f).norma_vrem_hours,
						 workerList.get(f).sumhoursotpusk ,
						 workerList.get(f).main_podr_id ,
						 workerList.get(f).podr_nazv_main ,
						 workerList.get(f).fact_workdays ));
				    }
			 }

			 Collections.sort(arraylistSort);

			 for(WorkerListFromKadryShortCompare str: arraylistSort){
					System.out.println(str);
			   }

			 for (int s = 0; s < arraylistSort.size(); s++) {
				/*HashMap hashMap = new HashMap();

		     	hashMap.put(axPremiumsWorkerDS.TABN, arraylistSort.get(s).tabn);
		     	hashMap.put(axPremiumsWorkerDS.PODR_NAZV, arraylistSort.get(s).podr_nazv);
		     	hashMap.put(axPremiumsWorkerDS.PODR_ID, arraylistSort.get(s).podr_id);
		     	hashMap.put(axPremiumsWorkerDS.FIO, arraylistSort.get(s).fio);
		     	hashMap.put(axPremiumsWorkerDS.POST_FIN, arraylistSort.get(s).post_fin);
				hashMap.put(axPremiumsWorkerDS.NORMA_VREM_HOURS, arraylistSort.get(s).norma_vrem_hours);
				hashMap.put(axPremiumsWorkerDS.SUMHOURSOTPUSK , arraylistSort.get(s).sumhoursotpusk);
				hashMap.put(axPremiumsWorkerDS.MAIN_PODR_ID , arraylistSort.get(s).main_podr_id);
				hashMap.put(axPremiumsWorkerDS.PODR_NAZV_MAIN , arraylistSort.get(s).podr_nazv_main);
				hashMap.put(axPremiumsWorkerDS.FACT_WORKDAYS , arraylistSort.get(s).fact_workdays);

		        rows.add(hashMap); */

				ENBonusListItem blItem = new ENBonusListItem();
				blItem.code = Integer.MIN_VALUE;
				blItem.podrId = arraylistSort.get(s).podr_id;
				blItem.podrName = arraylistSort.get(s).podr_nazv;
				blItem.fio = arraylistSort.get(s).fio;
				blItem.tabNumber = arraylistSort.get(s).tabn;
				blItem.positionName = arraylistSort.get(s).post_fin;
				blItem.fundWorkTime = arraylistSort.get(s).norma_vrem_hours;
				blItem.workTimeFact = arraylistSort.get(s).norma_vrem_hours.subtract(arraylistSort.get(s).sumhoursotpusk);
				blItem.hoursWorkedWithStaff = blItem.workTimeFact.multiply(new BigDecimal(0.05)).setScale(2,BigDecimal.ROUND_HALF_UP);
				blItem.timeDelivery = new BigDecimal(0);
				blItem.hoursWorkedPlan = new BigDecimal(0);
				blItem.hoursWorkedNotPlan = new BigDecimal(0);
				blItem.hoursWorkedSum = new BigDecimal(0);
				blItem.percentLoadWork = new BigDecimal(0);
				blItem.percentLoadByPlanWork = new BigDecimal(0);
				blItem.percentLoadByNotPlanWork = new BigDecimal(0);
				blItem.percentBonus = new BigDecimal(0);
				blItem.coefficient = new BigDecimal(0);
				blItem.percentBonusForCharging = new BigDecimal(0);
				blItem.countFactWorkedDays = arraylistSort.get(s).fact_workdays;
				blItem.bonusList.code = bonusObj.code;
				blItem.userAdd = userProfile.userName;
				blItem.dateAdd = new Date();
				blItem.userGen = userProfile.userName;
				blItem.dateEdit = new Date();
				blItemDAO.add(blItem);
			 }

			 // заполняем данными по отработанному времени из планов по работнику за период



			 ENBonusListItemFilter listFilter = new ENBonusListItemFilter();
			 listFilter.bonusList.code = bonusObj.code;

			 int[] listArr = blItemDAO.getFilteredCodeArray(listFilter, 0, -1);

			 for (int l = 0; l < listArr.length; l++) {
					ENBonusListItem bonListItemObj  = blItemDAO.getObject(listArr[l]);

					 /*sql для  тех персонала */
					 String sql_for_tech = " select \n" +
							 " fio_worker , /*1*/ \n" +
							 " name_position_fin , /*2*/ \n" +
							 " sum(work_plan) as work_plan , /*3*/ \n" +
							 " sum(work_not_plan) as work_not_plan , /*4*/ \n" +
							 " sum(coalesce(delivery_all_work , 0)) as delivery_all_work , /*5*/ \n" +
							 " coalesce((select COALESCE(q.coefficient,1) from ENCOEFFICIENTEXECPLAN q \n" +
							 "         where q.axorgid = '"+ bonListItemObj.podrId +"' \n" +
							 "         and q.dategen = first_day(to_date('01."+ bonusObj.monthGen + "." + bonusObj.yearGen +"','dd.mm.yyyy')) \n" +
							 " ),1) as coefficient /*6*/ \n" +
							 " From ( \n" +
							 "  select '"+ bonListItemObj.fio.replace("'", "`") +"'::text as fio_worker , \n" +
							 "  '"+ bonListItemObj.positionName.replace("'", "`") +"'::text  as name_position_fin  , \n" +
							 "  sum(work_plan) as work_plan , \n" +
							 "  sum(work_not_plan) as work_not_plan , \n" +
							 "  sum(delivery_all_work)  as delivery_all_work \n" +
							 " from ( \n" +
							 " select \n" +
							 " baz_sel.fio_worker , baz_sel.positionname , \n" +
							 " /* плановые работы */    case when baz_sel.enp_formrefcode = 1 then coalesce(baz_sel.countfact,0) else 0 end as work_plan , \n" +
							 " /* не плановые работы */ case when baz_sel.enp_formrefcode = 2 then coalesce(baz_sel.countfact,0) else 0 end as work_not_plan , \n" +
							 " /*доставка на все работы  */coalesce(baz_sel.deliverytimefact,0)  as delivery_all_work , \n" +
							 " baz_sel.countfact as fact_zagr_all_work , \n" +
							 " baz_sel.deliverytimefact , \n" +
							 " baz_sel.humanitemcode \n" +
							 "  							From ( \n" +
							 "                                         SELECT \n" +
							 "                                         enhumenitem.countfact , \n" +
							 "                                         enplanwork.typerefcode as enp_typerefcode , \n" +
							 "                                         enplanwork.staterefcode , \n" +
							 "                                         enelement.typerefcode as element_typerefcode , \n" +
							 "                                         finworker.name as fio_worker , \n" +
							 "                                         finworker.positionname , \n" +
							 "                                         sum( endeliverytime.deliverytimefact ) as deliverytimefact  , \n" +
							 "                                         enhumenitem.code as humanitemcode  , \n" +
							 "                                         enplanwork.datestart , \n" +
							 "                                         enplanwork.formrefcode as enp_formrefcode \n" +
							 "                                         from enhumenitem   left join endeliverytime on (endeliverytime.humenitemrefcode = enhumenitem.code  ) \n" +
							 "                                         , enplanworkitem , finworker , enplanwork \n" +
							 "                                         ,  enelement , tkposition \n" +
							 "                                         Where  enhumenitem.planitemrefcode = enplanworkitem.code \n" +
							 "                                         and  enplanworkitem.planrefcode = enplanwork.code \n" +
							 "                                         and  coalesce(enhumenitem.countfact  , 0 ) <> 0 \n" +
							 "                                         and  enhumenitem.finworkercode = finworker.code \n" +
							 "                                         and  enplanwork.datestart between to_date('"+dateSart+"','dd.mm.yyyy') and to_date('"+dateFinal+"','dd.mm.yyyy') \n" +
							 "                                         and  enplanwork.statuscode NOT IN (2,6) \n" +
							 "                                         and  enplanwork.kindcode = 4   /* задание факт */ \n" +
							 "                                         and  enplanwork.elementrefcode = enelement.code \n" +
							 "                                         and  enplanworkitem.countgen <> 0 \n" +
							 "                                         and  finworker.tabnumber = '"+bonListItemObj.tabNumber+"' \n" +
							 "                                         and  case when /*{planworkstatus}*/ 0 = 3/*проведенные*/ then enplanwork.statuscode in(3,8) else 1 = 1 end \n" +
							 "                                         and  enhumenitem.positiongencode = tkposition.code \n" +
							 "                                         and  finworker.kindrefcode = 1 \n" +
							 "                                         group by enhumenitem.countfact , \n" +
							 "                                         enplanwork.typerefcode  , \n" +
							 "                                         enplanwork.staterefcode , \n" +
							 "                                         enelement.typerefcode , \n" +
							 "                                         finworker.name  , \n" +
							 "                                         finworker.positionname , \n" +
							 "                                         enhumenitem.code , \n" +
							 "                                         enplanwork.datestart , \n" +
							 "                                         enplanwork.formrefcode \n" +
							 "  \n" +
							 " 							) baz_sel \n" +
							 " ) baz_sum \n" +
							 " group by baz_sum.fio_worker , baz_sum.positionname \n" +
							 " ) sel_zag \n" +
							 " group by fio_worker , name_position_fin \n" +
							 "  \n" ;

					 String sql_for_zbyt = " select \n" +
							 " fio_worker , /*1*/  \n" +
							 " name_position_fin , /*2*/  \n" +
							 " sum(work_epr) as work_plan , /*3*/  \n" +
							 " sum(work_enr) as work_not_plan , /*4*/  \n" +
							 " sum(coalesce(deliverytimefact , 0)) as delivery_all_work , /*5*/  \n" +
							 " coalesce((select COALESCE(q.coefficient,1) from ENCOEFFICIENTEXECPLAN q \n" +
							 "         where q.axorgid = '"+ bonListItemObj.podrId +"' \n" +
							 "         and q.dategen = first_day(to_date('01."+ bonusObj.monthGen + "." + bonusObj.yearGen +"','dd.mm.yyyy')) \n" +
							 " ),1) as coefficient /*6*/  \n" +
							 "       From ( \n" +
							 " select  \n" +
							 "   '"+ bonListItemObj.fio.replace("'", "`") +"'::text  as fio_worker , \n" +
							 "   '"+ bonListItemObj.positionName.replace("'", "`") +"'::text as name_position_fin  , \n" +
							 "    sum(work_epr) as work_epr , \n" +
							 "    sum(work_enr) as work_enr , \n" +
							 "    sum(deliverytimefact) as deliverytimefact \n" +
							 " From ( \n" +
							 " Select \n" +
							 " baz_sel.fio_worker , baz_sel.positionname , \n" +
							 " -------------------- работы в энергозбыте плановые и не плановые работы  ------------------------------------------ \n" +
							 " /*колонка 14  */ case When baz_sel.formrefcode = 1 /* плановые работы  енергозбыт */ \n" +
							 "                        Then coalesce(baz_sel.countfact,0 ) else 0 end as work_epr , \n" +
							 " /*колонка 15 */  case When baz_sel.formrefcode = 2   /* неплановые  работы енергозбыт */ \n" +
							 "                        Then coalesce(baz_sel.countfact,0 ) else 0 end as work_enr \n" +
							 "  ,  baz_sel.deliverytimefact \n" +
							 "  From ( \n" +
							 " SELECT  enplanwork.code , \n" +
							 "         enhumenitem.countfact , \n" +
							 "         enplanwork.typerefcode as enp_typerefcode , \n" +
							 "         enplanwork.staterefcode , \n" +
							 "         finworker.name as fio_worker , \n" +
							 "         finworker.positionname , \n" +
							 "         sum( endeliverytime.deliverytimefact) as deliverytimefact , \n" +
							 "         enhumenitem.code as humanitemcode , \n" +
							 "         enplanwork.formrefcode \n" +
							 "           from enhumenitem  left join endeliverytime on (endeliverytime.humenitemrefcode = enhumenitem.code  ) \n" +
							 "               , enplanworkitem , finworker , enplanwork \n" +
							 "                    Where  enhumenitem.planitemrefcode = enplanworkitem.code \n" +
							 "                      and  enplanworkitem.planrefcode = enplanwork.code \n" +
							 "                      and  coalesce(enhumenitem.countfact  , 0 ) <> 0 \n" +
							 "                      and  enhumenitem.finworkercode = finworker.code \n" +
							 "                      and  enplanwork.datestart between to_date('"+dateSart+"','dd.mm.yyyy') and to_date('"+dateFinal+"','dd.mm.yyyy') \n" +
							 "                      and  enplanwork.statuscode NOT IN (2,6) \n" +
							 "                      and  enplanwork.kindcode = 4 \n" +
							 "                      and  enplanworkitem.countgen <> 0 \n" +
							 "                      and  enhumenitem.planrefcode = enplanwork.code \n" +
							 "                      and  finworker.tabnumber = '"+bonListItemObj.tabNumber+"' \n" +
							 "                      and  finworker.kindrefcode = 2 /*Енергозбутовий  персонал*/ \n" +
							 " and  ( finworker.departmentcode = '"+bonListItemObj.podrId+"' \n" +
	                         " or \n" +
	                         "    finworker.departmentcode in ( select q.fkorgid from axorgid2fkorgid q \n" +
	                         "                                                   where q.axorgid = '"+bonListItemObj.podrId+"'  ) \n" +
	                         "  ) \n" +
							 " group by enplanwork.code , \n" +
							 "          enhumenitem.countfact , \n" +
							 "          enplanwork.typerefcode , \n" +
							 "          enplanwork.staterefcode , \n" +
							 "          finworker.name , \n" +
							 "          finworker.positionname , \n" +
							 "          enhumenitem.code  , \n" +
							 "          enplanwork.formrefcode \n" +
							 " ) baz_sel \n" +
							 " ) baz_sum \n" +
							 " group by baz_sum.fio_worker , baz_sum.positionname \n" +
							 " ) sel_zag \n" +
							 " group by fio_worker , name_position_fin \n" +
							 " order by fio_worker , name_position_fin \n" +
							 "  \n"  ;

                      if (bonusObj.kindRef.code == FINWorkerKind.PROM ) {
					    statement = connection.prepareStatement(sql_for_tech);
                      } else if
                      (bonusObj.kindRef.code == FINWorkerKind.ESBYT ) {
                        statement = connection.prepareStatement(sql_for_zbyt);
                      }


                      resultSet = statement.executeQuery();
					  int i;
					  for(i = 0;resultSet.next();i++)    {

						  bonListItemObj.timeDelivery =  resultSet.getBigDecimal(5);
						if(bonListItemObj.timeDelivery != null)
							bonListItemObj.timeDelivery = bonListItemObj.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

						bonListItemObj.hoursWorkedPlan  = resultSet.getBigDecimal(3);
						if(bonListItemObj.hoursWorkedPlan != null)
							bonListItemObj.hoursWorkedPlan = bonListItemObj.hoursWorkedPlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

						bonListItemObj.hoursWorkedNotPlan  = resultSet.getBigDecimal(4);
						if(bonListItemObj.hoursWorkedNotPlan != null)
							bonListItemObj.hoursWorkedNotPlan = bonListItemObj.hoursWorkedNotPlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

						/*работа с перс + проезд + план работы + неплан работы */
						bonListItemObj.hoursWorkedSum  = bonListItemObj.hoursWorkedWithStaff.add(bonListItemObj.timeDelivery).add(bonListItemObj.hoursWorkedPlan).add(bonListItemObj.hoursWorkedNotPlan);

						if (bonListItemObj.workTimeFact.compareTo(new BigDecimal(0)) == 1  ) {
						bonListItemObj.percentLoadWork = (bonListItemObj.hoursWorkedSum.divide(bonListItemObj.workTimeFact,6,BigDecimal.ROUND_HALF_UP)).multiply(new BigDecimal(100)).setScale(2,BigDecimal.ROUND_HALF_UP);

						bonListItemObj.percentLoadByPlanWork = bonListItemObj.hoursWorkedPlan.divide(bonListItemObj.workTimeFact,6, BigDecimal.ROUND_HALF_UP).multiply(new BigDecimal(100)).setScale(2, BigDecimal.ROUND_HALF_UP);

						bonListItemObj.percentLoadByNotPlanWork = bonListItemObj.hoursWorkedNotPlan.divide(bonListItemObj.workTimeFact,6, BigDecimal.ROUND_HALF_UP).multiply(new BigDecimal(100)).setScale(2, BigDecimal.ROUND_HALF_UP);
						} else {
							bonListItemObj.percentLoadWork = new BigDecimal(0);
							bonListItemObj.percentLoadByPlanWork = new BigDecimal(0);
							bonListItemObj.percentLoadByNotPlanWork = new BigDecimal(0);

						}

						bonListItemObj.percentBonus =     bonListItemObj.percentLoadWork.compareTo(new BigDecimal(100)) == 1 ? new BigDecimal(50) :
									((bonListItemObj.percentLoadWork.compareTo(new BigDecimal(98)) == 1 || bonListItemObj.percentLoadWork.compareTo(new BigDecimal(98)) == 0) && bonListItemObj.percentLoadWork.compareTo(new BigDecimal(100)) == -1) ? new BigDecimal(45) :
									((bonListItemObj.percentLoadWork.compareTo(new BigDecimal(96)) == 1 || bonListItemObj.percentLoadWork.compareTo(new BigDecimal(96)) == 0) && bonListItemObj.percentLoadWork.compareTo(new BigDecimal(98)) == -1) ? new BigDecimal(35) :
									((bonListItemObj.percentLoadWork.compareTo(new BigDecimal(94)) == 1 || bonListItemObj.percentLoadWork.compareTo(new BigDecimal(94)) == 0) && bonListItemObj.percentLoadWork.compareTo(new BigDecimal(96)) == -1) ? new BigDecimal(30) :
									((bonListItemObj.percentLoadWork.compareTo(new BigDecimal(92)) == 1 || bonListItemObj.percentLoadWork.compareTo(new BigDecimal(92)) == 0) && bonListItemObj.percentLoadWork.compareTo(new BigDecimal(94)) == -1) ? new BigDecimal(25) :
									((bonListItemObj.percentLoadWork.compareTo(new BigDecimal(90)) == 1 || bonListItemObj.percentLoadWork.compareTo(new BigDecimal(90)) == 0) && bonListItemObj.percentLoadWork.compareTo(new BigDecimal(92)) == -1) ? new BigDecimal(20) :
									  bonListItemObj.percentLoadWork.compareTo(new BigDecimal(90)) == -1 ? new BigDecimal(0) : new BigDecimal(0) ;
						bonListItemObj.coefficient = resultSet.getBigDecimal(6);
						bonListItemObj.percentBonusForCharging = bonListItemObj.percentBonus.multiply(bonListItemObj.coefficient).setScale(2, BigDecimal.ROUND_HALF_UP);

						blItemDAO.save(bonListItemObj);
					  }
			 }



		} catch (SQLException e) {
			throw new EnergyproSystemException(e.getMessage());
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e.getMessage());
		}
		finally {

			 try {if (resultSet != null) resultSet.close();} catch (SQLException e) {}
		     try {if (statement != null) statement.close();} catch (SQLException e) {}

		}


	}



    public class WorkerListFromKadryShortCompare implements Comparable  {

        public String tabn ;
        public String podr_nazv;
        public String podr_id ;
        public String fio;
        public String post_fin;
        public String tradecategoryid;
        public BigDecimal norma_vrem_hours;
        public BigDecimal sumhoursotpusk;
        public String main_podr_id ;
        public String podr_nazv_main;
        public BigDecimal fact_workdays;


        public WorkerListFromKadryShortCompare(String tabn, String podr_nazv, String podr_id , String fio ,
        		String post_fin , String tradecategoryid ,  BigDecimal norma_vrem_hours ,
        		BigDecimal sumhoursotpusk  , String main_podr_id , String podr_nazv_main ,BigDecimal fact_workdays
        		) {
            this.tabn = tabn;
            this.podr_nazv = podr_nazv;
            this.podr_id = podr_id;
            this.fio= fio;
            this.post_fin = post_fin;
            this.tradecategoryid = tradecategoryid;
            this.norma_vrem_hours = norma_vrem_hours ;
            this.sumhoursotpusk = sumhoursotpusk ;
            this.main_podr_id = main_podr_id;
            this.podr_nazv_main = podr_nazv_main ;
            this.fact_workdays = fact_workdays;

        }

        public void setTabn(String aValue){
           tabn = aValue;
        }

        public String getTabn(){
           return tabn;
        }
        public void setPodr_nazv(String aValue){
           podr_nazv = aValue;
        }

        public String getPodr_nazv(){
           return podr_nazv;
        }
        public void setPodr_id(String aValue){
           podr_id = aValue;
        }

        public String getPodr_id(){
           return podr_id;
        }
        public void setFio(String aValue){
           fio = aValue;
        }

        public String getFio(){
           return fio;
        }
        public void setPost_fin(String aValue){
           post_fin = aValue;
        }

        public String getPost_fin(){
           return post_fin;
        }
        public void setTradecategoryid(String aValue){
        	tradecategoryid = aValue;
         }

         public String getTradecategoryid(){
            return tradecategoryid;
         }

        public void setNorma_vrem_hours(BigDecimal aValue){
           norma_vrem_hours = aValue;
        }

        public BigDecimal getNorma_vrem_hours(){
           return norma_vrem_hours;
        }

        public void setSumhoursotpusk(BigDecimal aValue){
           sumhoursotpusk = aValue;
        }

        public BigDecimal getSumhoursotpusk(){
           return sumhoursotpusk;
        }
        public void setMain_podr_id(String aValue){
           main_podr_id = aValue;
        }

        public String getMain_podr_id(){
           return main_podr_id;
        }
        public void setPodr_nazv_main(String aValue){
           podr_nazv_main = aValue;
        }

        public String getPodr_nazv_main(){
           return podr_nazv_main;
        }

        public void setFact_workdays(BigDecimal aValue){
        	fact_workdays = aValue;
         }

         public BigDecimal getFact_workdays(){
            return fact_workdays;
         }



        @Override
        public int compareTo(Object compareWork) {

    		//String compareTabn=((WorkerListFromKadryShortCompare)compareWork).getTabn();
        	String comparePodrId=((WorkerListFromKadryShortCompare)compareWork).getPodr_id();
            /* For Ascending order*/
            return this.podr_id.compareTo(comparePodrId) ;

    	}

    	@Override
    	public String toString() {
            return "[ tabn=" + tabn+ ", podr_nazv =" + podr_nazv +
            ",podr_id =" +podr_id +
            ",fio=" + fio +
            ",post_fin =" + post_fin+
            ",tradecategoryid =" + tradecategoryid+
            ",norma_vrem_hours =" + norma_vrem_hours +
            ",sumhoursotpusk =" + sumhoursotpusk +
            ",main_podr_id =" + main_podr_id+
            ",podr_nazv_main =" + podr_nazv_main +
            ",fact_workdays =" + fact_workdays + "]";
        }


    }

    public void generateBonusListItemByPersonalFromMDAX(ENBonusList bonusObj)
    		throws PersistenceException {

    	ENDepartmentDAO depDAO = new ENDepartmentDAO(connection, userProfile);
    	ENBonusListItemDAO blItemDAO = new ENBonusListItemDAO(connection, userProfile);
		ENDepartment depObj = depDAO.getObject(bonusObj.department.code);

		String dateSart = "01."+ bonusObj.monthGen +"."+bonusObj.yearGen;
		String dateFinal = new SimpleDateFormat("dd.MM.yyyy").format(Tools.getLastDayOfMonth(Tools.convertStringToDate( "01."+ bonusObj.monthGen +"."+bonusObj.yearGen) ) );

		ResultSet  resultSet = null;
		PreparedStatement statement = null;

		mDaxScriptlet mdxScriptlet =  new mDaxScriptlet();
		try {
			workerListFromKadryShortListAX workerList = null;
			if (bonusObj.kindRef.code == FINWorkerKind.PROM ){
			workerList = mdxScriptlet.getWorkerListFromAX(
					dateSart ,
					dateFinal  ,
			 depObj.hrmorganizationid , FINWorkerKind.PROM , true);
			}
			if (bonusObj.kindRef.code == FINWorkerKind.ESBYT ){
				workerList = mdxScriptlet.getWorkerListFromAX(
						dateSart ,
						dateFinal  ,
				 depObj.hrmorganizationid , FINWorkerKind.ESBYT , true);
			}	
			if (bonusObj.kindRef.code == FINWorkerKind.FINWORKER_KIND_ESBYT_CONTROLLER ){
				workerList = mdxScriptlet.getWorkerListFromAX(
						dateSart ,
						dateFinal  ,
				 depObj.hrmorganizationid , FINWorkerKind.FINWORKER_KIND_ESBYT_CONTROLLER , true);	
			}
			if (bonusObj.kindRef.code == FINWorkerKind.FINWORKER_KIND_ESBYT_INSPEKTOR ){
				workerList = mdxScriptlet.getWorkerListFromAX(
						dateSart ,
						dateFinal  ,
				 depObj.hrmorganizationid , FINWorkerKind.FINWORKER_KIND_ESBYT_INSPEKTOR , true);
			}

			//ArrayList<WorkerListFromKadryShortCompare> arraylistSort = new ArrayList<WorkerListFromKadryShortCompare>();


			 for (int f=0; f < workerList.totalCount; f++){

				 System.out.print( " tabn === " + workerList.get(f).tabn  );

				 ENBonusListItemFilter blItemFilter = new ENBonusListItemFilter();
				 blItemFilter.tabNumber = workerList.get(f).tabn;
				 blItemFilter.podrId = workerList.get(f).podr_id;
				 blItemFilter.positionId = workerList.get(f).positionid;
				 //blItemFilter.tradeCategoryId = workerList.get(f).tradecategoryid;
				 blItemFilter.bonusList.code = bonusObj.code;

				 blItemFilter.conditionSQL = " enbonuslistitem.datestart <  '"
				  + new SimpleDateFormat("dd.MM.yyyy").format( workerList.get(f).datestart )  + "'" ;

				 blItemFilter.orderBySQL = " enbonuslistitem.datestart desc ";
				 int[] blItemArr = blItemDAO.getFilteredCodeArray(blItemFilter, 0, -1);



				 if(blItemArr.length == 0){

					 ENBonusListItem blItem = new ENBonusListItem();
						blItem.code = Integer.MIN_VALUE;
						blItem.podrId = workerList.get(f).podr_id;
						blItem.podrName = workerList.get(f).podr_nazv ;
						blItem.fio = workerList.get(f).fio;
						blItem.tabNumber = workerList.get(f).tabn;
						blItem.positionId = workerList.get(f).positionid;
						blItem.positionName = workerList.get(f).post_fin;
						blItem.tradeCategoryId = workerList.get(f).tradecategoryid;
						blItem.fundWorkTime = workerList.get(f).norma_vrem_hours;
						blItem.noWayOutFromPeriod = workerList.get(f).sumhoursotpusk;
						blItem.workTimeFact = workerList.get(f).norma_vrem_hours.subtract(blItem.noWayOutFromPeriod);
						blItem.hoursWorkedWithStaff = blItem.workTimeFact.multiply(new BigDecimal(0.05)).setScale(2,BigDecimal.ROUND_HALF_UP);
						blItem.timeDelivery = new BigDecimal(0);
						blItem.hoursWorkedPlan = new BigDecimal(0);
						blItem.hoursWorkedNotPlan = new BigDecimal(0);
						blItem.hoursWorkedSum = new BigDecimal(0);
						blItem.percentLoadWork = new BigDecimal(0);
						blItem.percentLoadByPlanWork = new BigDecimal(0);
						blItem.percentLoadByNotPlanWork = new BigDecimal(0);
						blItem.percentBonus = new BigDecimal(0);
						blItem.coefficient = new BigDecimal(0);
						blItem.percentBonusForCharging = new BigDecimal(0);
						blItem.countFactWorkedDays = workerList.get(f).fact_workdays;
						blItem.bonusList.code = bonusObj.code;
						blItem.userAdd = userProfile.userName;
						blItem.dateAdd = new Date();
						blItem.userGen = userProfile.userName;
						blItem.dateEdit = new Date();
						blItem.dateStart = workerList.get(f).datestart;
						blItem.dateFinal = workerList.get(f).datefinal; //  Tools.getLastDayOfMonth(Tools.convertStringToDate( "01."+ bonusObj.monthGen +"."+bonusObj.yearGen) ); // на конец месяца
						blItem.status.code = ENBonusListItemStatus.VALID; // статус строки - действительный
						int insblItemCode = blItemDAO.add(blItem);

						// если есть запись по человеку раньше даты начала периода текущей записи , то проапдейтить дату окончания для предыдущей записи по человеку
						 blItemFilter = new ENBonusListItemFilter();
						 blItemFilter.tabNumber = workerList.get(f).tabn;
						 blItemFilter.bonusList.code = bonusObj.code;

						 blItemFilter.conditionSQL = " enbonuslistitem.datestart <  '" + new SimpleDateFormat("dd.MM.yyyy").format( workerList.get(f).datestart )  + "'"  ;

						 blItemFilter.orderBySQL = " enbonuslistitem.datestart desc ";
						 blItemArr = blItemDAO.getFilteredCodeArray(blItemFilter, 0, -1);

						 if(blItemArr.length > 0){
							 ENBonusListItem blItem2 = blItemDAO.getObject(blItemArr[0]);
							 blItem2.dateFinal= Tools.addDays(workerList.get(f).datestart, -1);
							 blItemDAO.save(blItem2);
						 }

				 }else{
					 ENBonusListItem blItem = blItemDAO.getObject(blItemArr[0]);
					 blItem.fundWorkTime = blItem.fundWorkTime.add( workerList.get(f).norma_vrem_hours);
					 blItem.noWayOutFromPeriod = blItem.noWayOutFromPeriod.add( workerList.get(f).sumhoursotpusk);
					 blItem.workTimeFact = blItem.fundWorkTime.subtract(blItem.noWayOutFromPeriod);
					 blItem.hoursWorkedWithStaff = blItem.workTimeFact.multiply(new BigDecimal(0.05)).setScale(2,BigDecimal.ROUND_HALF_UP);
					 blItem.countFactWorkedDays =  blItem.countFactWorkedDays.add(workerList.get(f).fact_workdays);



					 blItem.dateFinal= workerList.get(f).datefinal;


					 blItemDAO.save(blItem);
				 }



			 }


			 // заполняем данными по отработанному времени из планов по работнику за период


			 ENBonusListItemFilter listFilter = new ENBonusListItemFilter();
			 listFilter.bonusList.code = bonusObj.code;
			 listFilter.orderBySQL = " enbonuslistitem.tabnumber  ";

			 int[] listArr = blItemDAO.getFilteredCodeArray(listFilter, 0, -1);

			 for (int l = 0; l < listArr.length; l++) {
					ENBonusListItem bonListItemObj  = blItemDAO.getObject(listArr[l]);

					 /*sql для  тех персонала */
					 String sql_for_tech = " select \n" +
							 " fio_worker , /*1*/ \n" +
							 " name_position_fin , /*2*/ \n" +
							 " sum(work_plan) as work_plan , /*3*/ \n" +
							 " sum(work_not_plan) as work_not_plan , /*4*/ \n" +
							 " sum(coalesce(delivery_all_work , 0)) as delivery_all_work , /*5*/ \n" +
							 " coalesce((select COALESCE(q.coefficient,1) from ENCOEFFICIENTEXECPLAN q \n" +
							 "         where q.axorgid = '"+ bonListItemObj.podrId +"' \n" +
							 "         and q.dategen = first_day(to_date('01."+ bonusObj.monthGen + "." + bonusObj.yearGen +"','dd.mm.yyyy')) \n" +
							 " ),1) as coefficient /*6*/ \n" +
							 ", (select COALESCE(q.summa,0) from encoefficintqltstndrds q , endepartment dep \n" +     
								"        where q.axorgid =  dep.hrmorganizationid  \n" +
								"        and dep.code = "+ bonusObj.department.code + 
								"        and q.dategen = first_day(to_date('01."+ bonusObj.monthGen + "." + bonusObj.yearGen +"','dd.mm.yyyy')) \n" + 
								" ) as summacompensation \n" + /*7*/
								", (select COALESCE(q.coefficient,1) from encoefficintqltstndrds q , endepartment dep \n" +     
								"        where q.axorgid =  dep.hrmorganizationid  \n" +
								"        and dep.code = "+ bonusObj.department.code + 
								"        and q.dategen = first_day(to_date('01."+ bonusObj.monthGen + "." + bonusObj.yearGen +"','dd.mm.yyyy')) \n" + 
								" ) as coefficient \n" + /*8*/
							 " From ( \n" +
							 "  select '"+ bonListItemObj.fio.replace("'", "`") +"'::text as fio_worker , \n" +
							 "  '"+ bonListItemObj.positionName.replace("'", "`") +"'::text  as name_position_fin  , \n" +
							 "  sum(work_plan) as work_plan , \n" +
							 "  sum(work_not_plan) as work_not_plan , \n" +
							 "  sum(delivery_all_work)  as delivery_all_work \n" +
							 " from ( \n" +
							 " select \n" +
							 " baz_sel.fio_worker , baz_sel.positionname , \n" +
							 " /* плановые работы */    case when baz_sel.enp_formrefcode = 1 then coalesce(baz_sel.countfact,0) else 0 end as work_plan , \n" +
							 " /* не плановые работы */ case when baz_sel.enp_formrefcode = 2 then coalesce(baz_sel.countfact,0) else 0 end as work_not_plan , \n" +
							 " /*доставка на все работы  */coalesce(baz_sel.deliverytimefact,0)  as delivery_all_work , \n" +
							 " baz_sel.countfact as fact_zagr_all_work , \n" +
							 " baz_sel.deliverytimefact , \n" +
							 " baz_sel.humanitemcode \n" +
							 "  							From ( \n" +
							 "                                         SELECT \n" +
							 "                                         enhumenitem.countfact , \n" +
							 "                                         enplanwork.typerefcode as enp_typerefcode , \n" +
							 "                                         enplanwork.staterefcode , \n" +
							 "                                         enelement.typerefcode as element_typerefcode , \n" +
							 "                                         finworker.name as fio_worker , \n" +
							 "                                         finworker.positionname , \n" +
							 "                                         sum( endeliverytime.deliverytimefact ) as deliverytimefact  , \n" +
							 "                                         enhumenitem.code as humanitemcode  , \n" +
							 "                                         enplanwork.datestart , \n" +
							 "                                         enplanwork.formrefcode as enp_formrefcode \n" +
							 "                                         from enhumenitem   left join endeliverytime on (endeliverytime.humenitemrefcode = enhumenitem.code  ) \n" +
							 "                                         , enplanworkitem , finworker , enplanwork \n" +
							 "                                         ,  enelement , tkposition \n" +
							 "                                         Where  enhumenitem.planitemrefcode = enplanworkitem.code \n" +
							 "                                         and  enplanworkitem.planrefcode = enplanwork.code \n" +
							 "                                         and  coalesce(enhumenitem.countfact  , 0 ) <> 0 \n" +
							 "                                         and  enhumenitem.finworkercode = finworker.code \n" +
							 "                                         and  enplanwork.datestart between to_date('"+ new SimpleDateFormat("dd.MM.yyyy").format(bonListItemObj.dateStart)  +"','dd.mm.yyyy') and to_date('"+new SimpleDateFormat("dd.MM.yyyy").format(bonListItemObj.dateFinal)+"','dd.mm.yyyy') \n" +
							 "                                         and  enplanwork.statuscode NOT IN (2,6) \n" +
							 "                                         and  enplanwork.kindcode = 4   /* задание факт */ \n" +
							 "                                         and  enplanwork.elementrefcode = enelement.code \n" +
							 "                                         and  enplanworkitem.countgen <> 0 \n" +
							 "                                         and  finworker.tabnumber = '"+bonListItemObj.tabNumber+"' \n" +
							 "                                         and  case when /*{planworkstatus}*/ 0 = 3/*проведенные*/ then enplanwork.statuscode in(3,8) else 1 = 1 end \n" +
							 "                                         and  enhumenitem.positiongencode = tkposition.code \n" +
							 "                                         and  finworker.kindrefcode = 1 \n" +
							 "                                         group by enhumenitem.countfact , \n" +
							 "                                         enplanwork.typerefcode  , \n" +
							 "                                         enplanwork.staterefcode , \n" +
							 "                                         enelement.typerefcode , \n" +
							 "                                         finworker.name  , \n" +
							 "                                         finworker.positionname , \n" +
							 "                                         enhumenitem.code , \n" +
							 "                                         enplanwork.datestart , \n" +
							 "                                         enplanwork.formrefcode \n" +
							 "  \n" +
							 " 							) baz_sel \n" +
							 " ) baz_sum \n" +
							 " group by baz_sum.fio_worker , baz_sum.positionname \n" +
							 " ) sel_zag \n" +
							 " group by fio_worker , name_position_fin \n" +
							 "  \n" ;

					 String sql_for_zbyt = " select \n" +
							 " fio_worker , /*1*/  \n" +
							 " name_position_fin , /*2*/  \n" +
							 " sum(work_epr) as work_plan , /*3*/  \n" +
							 " sum(work_enr) as work_not_plan , /*4*/  \n" +
							 " sum(coalesce(deliverytimefact , 0)) as delivery_all_work , /*5*/  \n" +
							 " coalesce((select COALESCE(q.coefficient,1) from ENCOEFFICIENTEXECPLAN q \n" +
							 "         where q.axorgid = '"+ bonListItemObj.podrId +"' \n" +
							 "         and q.dategen = first_day(to_date('01."+ bonusObj.monthGen + "." + bonusObj.yearGen +"','dd.mm.yyyy')) \n" +
							 " ),1) as coefficient /*6*/  \n" +
							", coalesce((select COALESCE(q.summa,0) from encoefficintqltstndrds q , endepartment dep \n" +     
							"        where q.axorgid =  dep.hrmorganizationid  \n" +
							"        and dep.code = "+ bonusObj.department.code + 
							"        and q.dategen = first_day(to_date('01."+ bonusObj.monthGen + "." + bonusObj.yearGen +"','dd.mm.yyyy')) \n" + 
							" ),0) as summacompensation \n" + /*7*/
							", coalesce((select COALESCE(q.coefficient,1) from encoefficintqltstndrds q , endepartment dep \n" +     
							"        where q.axorgid =  dep.hrmorganizationid  \n" +
							"        and dep.code = "+ bonusObj.department.code + 
							"        and q.dategen = first_day(to_date('01."+ bonusObj.monthGen + "." + bonusObj.yearGen +"','dd.mm.yyyy')) \n" + 
							" ),1) as coefficient \n" + /*8*/

							 "       From ( \n" +
							 " select  \n" +
							 "   '"+ bonListItemObj.fio.replace("'", "`") +"'::text  as fio_worker , \n" +
							 "   '"+ bonListItemObj.positionName.replace("'", "`") +"'::text as name_position_fin  , \n" +
							 "    sum(work_epr) as work_epr , \n" +
							 "    sum(work_enr) as work_enr , \n" +
							 "    sum(deliverytimefact) as deliverytimefact \n" +
							 " From ( \n" +
							 " Select \n" +
							 " baz_sel.fio_worker , baz_sel.positionname , \n" +
							 " -------------------- работы в энергозбыте плановые и не плановые работы  ------------------------------------------ \n" +
							 " /*колонка 14  */ case When baz_sel.formrefcode = 1 /* плановые работы  енергозбыт */ \n" +
							 "                        Then coalesce(baz_sel.countfact,0 ) else 0 end as work_epr , \n" +
							 " /*колонка 15 */  case When baz_sel.formrefcode = 2   /* неплановые  работы енергозбыт */ \n" +
							 "                        Then coalesce(baz_sel.countfact,0 ) else 0 end as work_enr \n" +
							 "  ,  baz_sel.deliverytimefact \n" +
							 "  From ( \n" +
							 " SELECT  enplanwork.code , \n" +
							 "         enhumenitem.countfact , \n" +
							 "         enplanwork.typerefcode as enp_typerefcode , \n" +
							 "         enplanwork.staterefcode , \n" +
							 "         finworker.name as fio_worker , \n" +
							 "         finworker.positionname , \n" +
							 "         sum( endeliverytime.deliverytimefact) as deliverytimefact , \n" +
							 "         enhumenitem.code as humanitemcode , \n" +
							 "         enplanwork.formrefcode \n" +
							 "           from enhumenitem  left join endeliverytime on (endeliverytime.humenitemrefcode = enhumenitem.code  ) \n" +
							 "               , enplanworkitem , finworker , enplanwork \n" +
							 "                    Where  enhumenitem.planitemrefcode = enplanworkitem.code \n" +
							 "                      and  enplanworkitem.planrefcode = enplanwork.code \n" +
							 "                      and  coalesce(enhumenitem.countfact  , 0 ) <> 0 \n" +
							 "                      and  enhumenitem.finworkercode = finworker.code \n" +
							 "                      and  enplanwork.datestart between to_date('"+new SimpleDateFormat("dd.MM.yyyy").format(bonListItemObj.dateStart)+"','dd.mm.yyyy') and to_date('"+new SimpleDateFormat("dd.MM.yyyy").format(bonListItemObj.dateFinal)+"','dd.mm.yyyy') \n" +
							 "                      and  enplanwork.statuscode NOT IN (2,6) \n" +
							 "                      and  enplanwork.kindcode = 4 \n" +
							 "                      and  enplanworkitem.countgen <> 0 \n" +
							 "                      and  enhumenitem.planrefcode = enplanwork.code \n" +
							 "                      and  finworker.tabnumber = '"+bonListItemObj.tabNumber+"' \n" +
							 "                      and  finworker.kindrefcode = 2 /*Енергозбутовий  персонал*/ \n" +
							 " and  ( finworker.departmentcode = '"+bonListItemObj.podrId+"' \n" +
	                         " or \n" +
	                         "    finworker.departmentcode in ( select q.fkorgid from axorgid2fkorgid q \n" +
	                         "                                                   where q.axorgid = '"+bonListItemObj.podrId+"'  ) \n" +
	                         "  ) \n" +
							 " group by enplanwork.code , \n" +
							 "          enhumenitem.countfact , \n" +
							 "          enplanwork.typerefcode , \n" +
							 "          enplanwork.staterefcode , \n" +
							 "          finworker.name , \n" +
							 "          finworker.positionname , \n" +
							 "          enhumenitem.code  , \n" +
							 "          enplanwork.formrefcode \n" +
							 " ) baz_sel \n" +
							 " ) baz_sum \n" +
							 " group by baz_sum.fio_worker , baz_sum.positionname \n" +
							 " ) sel_zag \n" +
							 " group by fio_worker , name_position_fin \n" +
							 " order by fio_worker , name_position_fin \n" +
							 "  \n"  ;

                      if (bonusObj.kindRef.code == FINWorkerKind.PROM ) {
					    statement = connection.prepareStatement(sql_for_tech);
                      } else if
                      (bonusObj.kindRef.code == FINWorkerKind.ESBYT || 
                       bonusObj.kindRef.code == FINWorkerKind.FINWORKER_KIND_ESBYT_CONTROLLER ||  
                       bonusObj.kindRef.code == FINWorkerKind.FINWORKER_KIND_ESBYT_INSPEKTOR ) {
                       statement = connection.prepareStatement(sql_for_zbyt);
                      }


                      resultSet = statement.executeQuery();
					  int i;
					  for(i = 0;resultSet.next();i++)    {

						  bonListItemObj.timeDelivery =  resultSet.getBigDecimal(5);
						if(bonListItemObj.timeDelivery != null)
							bonListItemObj.timeDelivery = bonListItemObj.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

						bonListItemObj.hoursWorkedPlan  = resultSet.getBigDecimal(3);
						if(bonListItemObj.hoursWorkedPlan != null)
							bonListItemObj.hoursWorkedPlan = bonListItemObj.hoursWorkedPlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

						bonListItemObj.hoursWorkedNotPlan  = resultSet.getBigDecimal(4);
						if(bonListItemObj.hoursWorkedNotPlan != null)
							bonListItemObj.hoursWorkedNotPlan = bonListItemObj.hoursWorkedNotPlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

						/*работа с перс + проезд + план работы + неплан работы */
						bonListItemObj.hoursWorkedSum  = bonListItemObj.hoursWorkedWithStaff.add(bonListItemObj.timeDelivery).add(bonListItemObj.hoursWorkedPlan).add(bonListItemObj.hoursWorkedNotPlan);

						if (bonListItemObj.workTimeFact.compareTo(new BigDecimal(0)) == 1  ) {
						bonListItemObj.percentLoadWork = (bonListItemObj.hoursWorkedSum.divide(bonListItemObj.workTimeFact,6,BigDecimal.ROUND_HALF_UP)).multiply(new BigDecimal(100)).setScale(2,BigDecimal.ROUND_HALF_UP);

						bonListItemObj.percentLoadByPlanWork = bonListItemObj.hoursWorkedPlan.divide(bonListItemObj.workTimeFact,6, BigDecimal.ROUND_HALF_UP).multiply(new BigDecimal(100)).setScale(2, BigDecimal.ROUND_HALF_UP);

						bonListItemObj.percentLoadByNotPlanWork = bonListItemObj.hoursWorkedNotPlan.divide(bonListItemObj.workTimeFact,6, BigDecimal.ROUND_HALF_UP).multiply(new BigDecimal(100)).setScale(2, BigDecimal.ROUND_HALF_UP);
						} else {
							bonListItemObj.percentLoadWork = new BigDecimal(0);
							bonListItemObj.percentLoadByPlanWork = new BigDecimal(0);
							bonListItemObj.percentLoadByNotPlanWork = new BigDecimal(0);

						}

						/* old bonListItemObj.percentBonus =     bonListItemObj.percentLoadWork.compareTo(new BigDecimal(100)) == 1 ? new BigDecimal(50) :
									((bonListItemObj.percentLoadWork.compareTo(new BigDecimal(98)) == 1 || bonListItemObj.percentLoadWork.compareTo(new BigDecimal(98)) == 0) && (bonListItemObj.percentLoadWork.compareTo(new BigDecimal(100)) == -1 || bonListItemObj.percentLoadWork.compareTo(new BigDecimal(100)) == 0 )   ) ? new BigDecimal(45) :
									((bonListItemObj.percentLoadWork.compareTo(new BigDecimal(96)) == 1 || bonListItemObj.percentLoadWork.compareTo(new BigDecimal(96)) == 0) && (bonListItemObj.percentLoadWork.compareTo(new BigDecimal(98)) == -1  || bonListItemObj.percentLoadWork.compareTo(new BigDecimal(98)) == 0 )   ) ? new BigDecimal(35) :
									((bonListItemObj.percentLoadWork.compareTo(new BigDecimal(94)) == 1 || bonListItemObj.percentLoadWork.compareTo(new BigDecimal(94)) == 0) && (bonListItemObj.percentLoadWork.compareTo(new BigDecimal(96)) == -1  || bonListItemObj.percentLoadWork.compareTo(new BigDecimal(96)) == 0 )   ) ? new BigDecimal(30) :
									((bonListItemObj.percentLoadWork.compareTo(new BigDecimal(92)) == 1 || bonListItemObj.percentLoadWork.compareTo(new BigDecimal(92)) == 0) && (bonListItemObj.percentLoadWork.compareTo(new BigDecimal(94)) == -1  || bonListItemObj.percentLoadWork.compareTo(new BigDecimal(94)) == 0 )   ) ? new BigDecimal(25) :
									((bonListItemObj.percentLoadWork.compareTo(new BigDecimal(90)) == 1 || bonListItemObj.percentLoadWork.compareTo(new BigDecimal(90)) == 0) && (bonListItemObj.percentLoadWork.compareTo(new BigDecimal(92)) == -1  || bonListItemObj.percentLoadWork.compareTo(new BigDecimal(92)) == 0 )   ) ? new BigDecimal(20) :
									  bonListItemObj.percentLoadWork.compareTo(new BigDecimal(90)) == -1 ? new BigDecimal(0) : new BigDecimal(0) ;
	*/ 	
		    bonListItemObj.percentBonus =  bonListItemObj.percentLoadWork.compareTo(new BigDecimal(100)) == 1 ? new BigDecimal(50) :
		    	(bonListItemObj.percentLoadWork.doubleValue() > 98 && bonListItemObj.percentLoadWork.doubleValue() <= 99.9 ) ? new BigDecimal(45) :
		    	(bonListItemObj.percentLoadWork.doubleValue() > 96 && bonListItemObj.percentLoadWork.doubleValue() <= 98 ) ? new BigDecimal(35) :
		    	(bonListItemObj.percentLoadWork.doubleValue() > 94 && bonListItemObj.percentLoadWork.doubleValue() <= 96 ) ? new BigDecimal(30) :
		    	(bonListItemObj.percentLoadWork.doubleValue() > 92 && bonListItemObj.percentLoadWork.doubleValue() <= 94 ) ? new BigDecimal(25) :
		    	(bonListItemObj.percentLoadWork.doubleValue() > 80 && bonListItemObj.percentLoadWork.doubleValue() <= 92 ) ? new BigDecimal(20) :
		    		new BigDecimal(0);
		    	
					
					    bonListItemObj.coefficient = resultSet.getBigDecimal(6);
						
						
						bonListItemObj.summaCompensation = resultSet.getBigDecimal(7); // new! 
						
						bonListItemObj.coefficientQuality = resultSet.getBigDecimal(8); // new!
						
						if (bonListItemObj.coefficientQuality ==  null ){
							bonListItemObj.coefficientQuality = new BigDecimal(1);
						//	throw new EnergyproSystemException(
							//		"\n По підрозділу не вказаний коефіцієнт (Кст) \n (Довідники/Структурні/Коефіцієнт дотримання гарантованих стандартів якості надання послуг)");
						}
						
						
						
						bonListItemObj.percentBonusForCharging = (bonListItemObj.percentBonus.multiply(bonListItemObj.coefficient).multiply(bonListItemObj.coefficientQuality)).setScale(2, BigDecimal.ROUND_HALF_UP);

						
						
						
						blItemDAO.save(bonListItemObj);
					  }
			 }



		} catch (SQLException e) {
			throw new EnergyproSystemException(e.getMessage());
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e.getMessage());
		}
		finally {

			 try {if (resultSet != null) resultSet.close();} catch (SQLException e) {}
		     try {if (statement != null) statement.close();} catch (SQLException e) {}

		}


	}


	public void save(ENHumenItem object, boolean isFromWorkOrderByt) {
		Connection finConn = null;

		try {
			/////
	   		AuthLogic l = new AuthLogic(connection, userProfile);
	   		FinConnectionData finConnectionData = l.getFinConnectionData();
			/////

		    //finConn = getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			finConn = getLocalConnection(finConnectionData.connectionString);

			object.dateEdit = new Date();
			object.userGen = userProfile.userName;

			if (object.planRef.code == Integer.MIN_VALUE) {
				new EnergyproSystemException("planRef not found");
			}

			//AuthLogic l = new AuthLogic(enConn, getUserProfile());
			if (!l.checkPermission4PlanItems(object.planRef.code)) {
				throw new EnergyproSystemException(
						"Acces denied for method addBy... from method ENHumenItem.save()");
			}

			PlanWorkLogic logic = new PlanWorkLogic(connection, userProfile);
			if (logic.isNotEditablePlan(object.planRef.code)) {
				throw new EnergyproSystemException(
						"PlanWork closed or canceled, code = " + object.planRef.code);
			}


		    /**
		     * 05.11.2012... NET-3536 +++ проверка статуса акта
		     * после расчета и подписания акта меняют персонал в факте!!!!!!!
		     *
		     */

			ENAct2ENPlanWork act2plan = new ENAct2ENPlanWork();
			ENAct2ENPlanWorkDAO act2planDao = new ENAct2ENPlanWorkDAO(connection, userProfile);
			ENAct2ENPlanWorkFilter act2planFilter = new ENAct2ENPlanWorkFilter();
			act2planFilter.plan.code = object.planRef.code;
			ENAct2ENPlanWorkShortList act2planList = act2planDao.getScrollableFilteredList(act2planFilter, 0, -1);

			if (act2planList.totalCount > 0) {
				act2plan = act2planDao.getObject(act2planList.get(0).code);

		        ENAct act = new ENActDAO(connection, userProfile).getObject(act2plan.actRef.code);
		        if (act.statusRef.code != ENActStatus.GOOD) {
		        	throw new EnergyproSystemException(
		        			 "\n \n NET-3536..." +
		        			 "\n Акт НЕ ЧЕРНОВИЙ... Відмініть підписання, або проведеня акту!!!", userProfile);
		        }
		    }

			if (!isFromWorkOrderByt) {
				ENWorkOrderBytItemFilter itemFilter = new ENWorkOrderBytItemFilter();
				itemFilter.humenItemRef.code = object.code;
				ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(userProfile, connection);
				ENWorkOrderBytItemShortList itemList = workOrderBytItemDAO.getScrollableFilteredList(itemFilter, 0, -1);

				if (itemList.totalCount > 0) {
					throw new SystemException("\n\nNET-4350 Цього працівника вже включено в змінне завдання № " +
     	                               itemList.get(0).workOrderBytRefNumberGen + " від " +
     	                               new SimpleDateFormat("dd.MM.yyyy").format(itemList.get(0).workOrderBytRefDateGen) +
     	                               " (код: " + itemList.get(0).workOrderBytRefCode + ") !" +
     	                               "\n\nРедагування дозволяється тільки зі змінного завдання!");
				}
			}


			if (object.finWorker != null) {
				if (object.finWorker.tabNumber != null) {
					// проверим является ли воркер инвалидом
					// дата среза проверки принимаем на дату старт плана
					Date date_srez;

					ENPlanWork pw = logic.getPlanByCode(object.planRef.code);
					date_srez = pw.getDateStart();

			   		// NET-4396 Запрещаем использовать работников ОВБ на работах других бюджетодержателей
			   		// кроме ЦОДС и СПС
			   		String depName = object.finWorker.departmentName;
			   		if (depName.contains("Оперативно")) {
			   			if ((pw.budgetRef.code != ENConsts.ENBUDGET_ODG && pw.budgetRef.code != ENConsts.ENBUDGET_SPS && pw.budgetRef.code != ENConsts.ENBUDGET_ENERGOSBYT)
			   					// && (!object.finWorker.departmentCode.equals("93"))) { mDax
			   					&& (!object.finWorker.departmentCode.equals("001"))) {
			   				throw new EnergyproSystemException("Цей робітник відноситься до ОДГ(ОВБ)! План повинен бути для бюджетотримача ОДГ");
			   			}
			   		}

			   		object.finWorker = this.recalcChargePercent(object.finWorker.tabNumber, date_srez);
			   		
			        
				}
			}




			//////////
			// 12.06.14 SUPP-18399 Проапдейтим countFactOriginal для всех humenItem'ов на работе
			// при подвязке первого из них
			ENHumenItemFilter hiFilter = new ENHumenItemFilter();
			hiFilter.planRef.code = object.planRef.code;
			hiFilter.planItemRef.code = object.planItemRef.code;

			ENHumenItemDAO hiDAO = new ENHumenItemDAO(userProfile, connection);
			int[] hiArr = hiDAO.getFilteredCodeArray(hiFilter, 0, -1);

			boolean mustUpdate = true;

			for (int i = 0; i < hiArr.length; i++) {
				ENHumenItem hiObj = hiDAO.getObject(hiArr[i]);

				// Если уже есть привязка (т.е. привязываем не первого работника), то апдейтить ничего не надо
				if (hiObj.finWorker != null) {
					if (hiObj.finWorker.code != Integer.MIN_VALUE) {
						mustUpdate = false;
						break;
					}
				}
			}

			if (mustUpdate) {
				for (int i = 0; i < hiArr.length; i++) {
					// Сохраняем первоначальное состояние поля countFact (до всяких перерасчетов)
					// для каждого humenItem'а из текущей редактируемой работы
					ENHumenItem hiObj = hiDAO.getObject(hiArr[i]);
					hiObj.countFactOriginal = hiObj.countFact;
					updateCountFactOriginal(hiObj);

					// Чтобы ниже при вызове save не перетерлось!!!
					if (hiObj.code == object.code) {
						object.countFactOriginal = hiObj.countFactOriginal;
					}
				}
			}
			//////////


			hiDAO.save(object);

			// пересчитаем время ... + там же доствка + ЦПП
			// HumenLogic hLogic = new HumenLogic(getConnection(AuthorizationJNDINames.ENERGY_DATASOURCE), getUserProfile());
			// для ЦПП ниче пересчитывать не надо ... проверим при заливке акта
			// типа уже не надо ... в техКартах поделили ...

			new TransportLogic(connection, userProfile).createDeliveryTimeForPlan(object.planRef.code);

			this.recalcHumenItemsByPlanItemCode(object.planItemRef.code);

			// System.out.println("#######################  add ENHumenItem Ok!!!!");

		   
			
			// проверка что бы на работу не привязывали 1 реального сотрудника под несколько нормативных должностей работы   
			if (!isFromWorkOrderByt)  
				{
				  this.checkBindingFinworkerToWork(object);				
				}

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENHumenItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			try {
				if (finConn != null && !finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}



	public FINWorker recalcChargePercent(String tabNumber, Date date_srez) {
		Connection finConn = null;
		FINWorker finWorker = new FINWorker();

		try {

	   		AuthLogic l = new AuthLogic(connection, userProfile);
	   		FinConnectionData finConnectionData = l.getFinConnectionData();

			finConn = getLocalConnection(finConnectionData.connectionString);

			FINWorkerDAO wDao = new FINWorkerDAO(userProfile, connection);
			FINLogic fLogicFin = new FINLogic(finConn, userProfile);
			FINWorkerDAO finWorkerDao = new FINWorkerDAO(userProfile, finConn);

			FINWorker w = new FINWorker();

			FINWorkerFilter ff = new FINWorkerFilter();
			ff.tabNumber = tabNumber;

			FINWorkerShortList fList = finWorkerDao.getFINWorkerList(ff, 0, -1, date_srez, true);
			if (fList.totalCount > 0) {
				w.categor = fList.get(0).categor;
				w.departmentCode = fList.get(0).departmentCode;
				w.departmentName = fList.get(0).departmentName;
				w.finCode = fList.get(0).finCode;
	            w.kindRef.code = (fList.get(0).categor == Integer.MIN_VALUE) ? FINWorkerKind.OTHER : fList.get(0).categor;
	            w.name = fList.get(0).name;
	            w.positionCode = fList.get(0).positionCode;
	            w.positionName = fList.get(0).positionName;
	            w.priceGen = fList.get(0).priceGen;
	            w.tabNumber = fList.get(0).tabNumber;
	            /////
	            w.categorId = fList.get(0).categorId;
	            w.categorName = fList.get(0).categorName;
	            w.workTimeId = fList.get(0).workTimeId;
	            /////
	            // MDAX-441
	            w.positionId = fList.get(0).positionId;

	            w.code = Integer.MIN_VALUE;

	     		///// 07.12.11 Убираем признак "Командировочный" вообще, потому что с ним неправильно рассчитывается з/п
	     		//w.isSentAssignment = object.finWorker.isSentAssignment;
	     		w.isSentAssignment = 0;
	     		/////

	     	    // если инвалид тогда проставляем в финворкер процент отчислений со справочника FINCHARGEHISTORY и тип отчислений FINChargeType = 2
	     		// иначе процент отчислений также берем со справочника но только для обычных работников  FINChargeType = 1

				if (fLogicFin.getCheckIsInvalid(tabNumber, date_srez) > 0) {
					// если инвалид
					w.chargePercent =  getChargePercentByDate(FINChargeType.IS_INVALID,date_srez );
					w.chargeRef.code = FINChargeType.IS_INVALID;
				} else {
					// если НЕ инвалид
					w.chargePercent =  getChargePercentByDate(FINChargeType.IS_NOT_INVALID,date_srez );
					w.chargeRef.code = FINChargeType.IS_NOT_INVALID;
				}

				finWorker.code = wDao.add(w);

			} else {

				finWorker = new FINWorker();
			}


			return finWorker;


		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (finConn != null && !finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}
	
	/**
	 * Проверка рабочих часов по работникам из наряд-задания (Задание-план или Задание-факт) за день  
	 */
	public void checkFinworkerCountfactWorkDay( int planCode , String tabn) 
	  {
		 
		
		ResultSet  resultSet = null;
		PreparedStatement statement = null;
		ResultSet  resultSet2 = null;
		PreparedStatement statement2 = null;
		
	 try
	   {
		docConnection = getDOCConnection();
		 
     	DFDoc2FINWorkerDAO df2fwDAO = new DFDoc2FINWorkerDAO(docConnection, userProfile);
     	PlanWorkLogic planLogic = new PlanWorkLogic(connection,userProfile);
     	ENPlanWork planObj = planLogic.getPlanByCode(planCode); 
     	ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);
     	
     	// пропускаем , потом додумать как быть ... SUPP-106788 
     	if(planObj.budgetRef.code == ENConsts.ENBUDGET_ENERGOSBYT && planObj.typeRef.code == ENPlanWorkType.EZ_RAID ) {
     		return;
     	}

     	/////// 31.12.2021 Для охрины не проверяем (у них по 186 часов в день на человека ;))
     	ElementLogic elementLogic = new ElementLogic(connection, userProfile);
     	ENElement element = elementLogic.getElementByCode(planObj.elementRef.code);
     	if (element == null) {
     		throw new SystemException("\n\nНе знайдено елемент з кодом " + planObj.elementRef.code);
     	}

     	if (element.typeRef.code == ENElementType.SERVICES_OBJECT) {
     		ServicesLogic servicesLogic = new ServicesLogic(connection, userProfile);
     		ENServicesObject servicesObject = servicesLogic.getServicesObjectByElementCode(element.code);
     		if (servicesObject.contractTypeRef.code == ENServicesContractType.OHRINA) {
     			return;
     		}
     	}
     	////////

     	BigDecimal workingHoursStandard = new BigDecimal(0);
     	 workingHoursStandard = settingsLogic.getBigDecimalValue(ENSettingsKeysConsts.WORKING_HOURS_STANDARD
				, planObj.dateStart).setScale(2, BigDecimal.ROUND_HALF_UP);
     	if (workingHoursStandard.equals(new BigDecimal(0))   ) {
     		throw new EnergyproSystemException(  "\n   Не вказано довідникових даних про кількість робочих годин на день!!! " );
     	}
		
		String selectStr = " select f.tabnumber, f.name, sum(hi.countfact) , p.datestart , \n" + 
		        " string_agg(distinct p.code::text , ',') as pcodes \n" +
				" from  finworker f \n" + 
				" inner join  enhumenitem hi on (hi.countfact > 0  and hi.finworkercode = f.code) \n" +
				" inner join enplanwork p on (p.datestart = ( select datestart from enplanwork pp where pp.code = "+planCode+" ) \n" +
				" and  p.kindcode = ( select pp.kindcode from enplanwork pp where pp.code = "+ planCode +" )  and hi.planrefcode = p.code) \n" +
				" and f.tabnumber in ( select  distinct f.tabnumber from  finworker f \n" +
				"		  inner join  enhumenitem hi on (hi.finworkercode = f.code and hi.planrefcode =  "+ planCode +" )  ) " +
				new String(tabn.equals("") ? " and 1 = 1" :  " and f.tabnumber = '"+tabn+"'  ") + 
				" and  lower(f.positionname) not like lower('%Електромонтер оперативно-виїзної бригади%') /*SUPP-107754*/" +  
                " and lower(f.positionid) not like lower('%Ел.монтер ОВБ%')  /*SUPP-107754*/ " +  
				" group by f.tabnumber, f.name ,  p.datestart  " + " having sum(hi.countfact) > " + workingHoursStandard.toString() ;
		
		
			   statement = connection.prepareStatement(selectStr);

			    
			   resultSet = statement.executeQuery();
               String exceptString = new String(""); 
			   while (resultSet.next())
			   {
    			   BigDecimal prolongationTime = new BigDecimal(0);
				   DFDoc2FINWorkerFilter df2fwFil = new DFDoc2FINWorkerFilter();
			       df2fwFil.tabNumber = resultSet.getString(1);
			       df2fwFil.dateOvertimeWork = planObj.dateStart;
			       //df2fwFil.conditionSQL = " ";
			       int[] df2fwArr = df2fwDAO.getFilteredCodeArray(df2fwFil, 0, -1); 
			       if(df2fwArr.length>0) {
			    	   DFDoc2FINWorker df2fw = df2fwDAO.getObject(df2fwArr[0]); 
			    	   prolongationTime = df2fw.overtimeWorkHours; 
			       }
			       
				       BigDecimal countfact = resultSet.getBigDecimal(3).setScale(2, java.math.BigDecimal.ROUND_HALF_UP);;
				       countfact = countfact.subtract(prolongationTime);
				       
				       if(countfact.doubleValue() > workingHoursStandard.doubleValue() )
                       {

					       exceptString = exceptString + new String(exceptString.equals("") ? "\n Перевищено час робочого дня "+ new SimpleDateFormat("dd.MM.yyyy").format( resultSet.getDate(4) )  +" по наступним працівникам: \n  " +
								   resultSet.getString(2) + "(" + resultSet.getString(1)  + ") = " + countfact.setScale(2,BigDecimal.ROUND_HALF_UP) + "год." + new String(prolongationTime.doubleValue()>0 ? "( з урахуванням подовження робочого дня на " + prolongationTime.setScale(2,BigDecimal.ROUND_HALF_UP) + "год.)" : "") 
								   : "\n " + 
						   resultSet.getString(2) + "(" + resultSet.getString(1)  + ") = " + countfact + "год." + new String(prolongationTime.doubleValue()>0 ? "( з урахуванням подовження робочого дня на " + prolongationTime.setScale(2,BigDecimal.ROUND_HALF_UP) + "год.)" : "")  ) ;
						   
						   // Перечень часов в разрезе планов 
						   String selectStrPl = " select  distinct hi.planrefcode , f.tabnumber , sum( hi.countfact) from  finworker f \n " + 
	                                            " inner join  enhumenitem hi on (hi.countfact > 0 and hi.finworkercode = f.code  \n "  
	                                            + "and hi.planrefcode in ("+ resultSet.getString(5) +") and f.tabnumber = '" + resultSet.getString(1)  + "')  \n " + 
	                                            " group by hi.planrefcode , f.tabnumber " ; 
						   statement2 = connection.prepareStatement(selectStrPl);
						    
						   resultSet2 = statement2.executeQuery();
						   String pl = new String("");
						   while (resultSet2.next())
						   {
							   pl = pl + " код пл.=" + resultSet2.getInt(1) + "=" +  resultSet2.getBigDecimal(3).setScale(2,BigDecimal.ROUND_HALF_UP)+"год.";
						   }						   
						   exceptString = exceptString + "\n"+pl ;
					   
				       }
			   } 
				   if (!exceptString.equals("") ) {
					   throw new EnergyproSystemException(exceptString + "\n  Вам необхідно застосувати Коригуючий коефіцієнт до норми часу. " 
				   // + "\n Для довідок звертайтесь до ВІДДІЛУ ОРГАНІЗАЦІЇ ПРАЦІ ТА ЗАРОБІТНОЇ ПЛАТИ(12-62)" 
							   );
				   }

			}   catch (SQLException e) {
				throw new EnergyproSystemException(e.getMessage(), e);
			}  catch (DatasourceConnectException e) {
				throw new EnergyproSystemException(e.getMessage(), e);
			}  catch (PersistenceException e) {
				throw new EnergyproSystemException(e.getMessage(), e);
			}  finally {

				 try {if (resultSet != null) resultSet.close();} catch (SQLException e) {}
			     try {if (statement != null) statement.close();} catch (SQLException e) {}
			     try {if (resultSet2 != null) resultSet2.close();} catch (SQLException e) {}
			     try {if (statement2 != null) statement2.close();} catch (SQLException e) {}
			     closeDOCConnection();
			}
		
	  }
	
	/*
	 * проверка что бы на работу не привязывали 1 реального сотрудника под несколько нормативных должностей работы*/
	
	public void checkBindingFinworkerToWork(ENHumenItem  humenItemObj ) throws PersistenceException{
		 

		ENHumenItemFilter f = new ENHumenItemFilter();
		f.planItemRef.code = humenItemObj.planItemRef.code;
		f.conditionSQL = " enhumenitem.finworkercode is not null and  enhumenitem.code <>  " + humenItemObj.code  ;
		ENHumenItemDAO hiDao = new ENHumenItemDAO(connection, userProfile);
		ENHumenItemShortList hiList = hiDao.getScrollableFilteredList(f, 0, -1);
		
		FINWorkerDAO fDao = new FINWorkerDAO(connection, userProfile);
		FINWorkerFilter fFil = new FINWorkerFilter();
		fFil.code = humenItemObj.finWorker.code;
		int[] fArr = fDao.getFilteredCodeArray(fFil, 0, -1);
		FINWorker fObj = null;
		if (fArr.length>0 ) {
			fObj = fDao.getObject(fArr[0]); // finworker from humenitem add or save 
			
			for (int i = 0; i < hiList.totalCount; i++) {
				 
				FINWorker fObj2 = fDao.getObject(hiList.get(i).finWorkerCode); // finworker from humenitem in plan
				if (fObj.tabNumber.equals(fObj2.tabNumber) ) {
					
					ENPlanWorkItemDAO piDao = new ENPlanWorkItemDAO(connection, userProfile);
					ENPlanWorkItem piobj = piDao.getObject(humenItemObj.planItemRef.code);
					TechCardLogic tkLogic = new TechCardLogic(connection, userProfile);
					TKTechCard tkObj =  tkLogic.getTechCardByCode(piobj.kartaRef.code);
					
					throw new EnergyproSystemException(" Працівник " + fObj2.tabNumber + " " + fObj2.name + " вже прив'язаний до нормативної посади по роботі \"" + tkObj.name +"\" Оберіть іншого працівника !!!"
							);
				}
			}
		}
		
		
		
		 
	}

}


