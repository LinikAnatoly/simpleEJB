package com.ksoe.energynet.logic;

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.List;
import java.util.Set;
import java.util.Vector;
import java.util.concurrent.TimeUnit;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.dataminer.DomainDAO;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.Domain;
import com.ksoe.authorization.valueobject.filter.DomainFilter;
import com.ksoe.energynet.dataminer.ENCalcContractTotalDAO;
import com.ksoe.energynet.dataminer.ENDepartment2EPRenDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENGiveCounterDAO;
import com.ksoe.energynet.dataminer.ENHumenItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWork2ClassificationTypeDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItem2TKKoefDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENPurchasesNoObjectDAO;
import com.ksoe.energynet.dataminer.ENServices2PlanDAO;
import com.ksoe.energynet.dataminer.ENServicesCostDAO;
import com.ksoe.energynet.dataminer.ENServicesMaterialsDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENServicesTransportDAO;
import com.ksoe.energynet.dataminer.ENTimeLineDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItem2TransportItemDAO;
import com.ksoe.energynet.dataminer.FINMaterialsDAO;
import com.ksoe.energynet.dataminer.SCCounterDAO;
import com.ksoe.energynet.ejb.ENEstimateItemController;
import com.ksoe.energynet.ejb.ENEstimateItemControllerHome;
import com.ksoe.energynet.ejb.ENServicesObjectController;
import com.ksoe.energynet.ejb.ENServicesObjectControllerHome;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENBasisType;
import com.ksoe.energynet.valueobject.ENConnectionWorkType;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENEstimateItemType;
import com.ksoe.energynet.valueobject.ENHumenItem;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType;
import com.ksoe.energynet.valueobject.ENPlanWorkForm;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkItem2TKKoef;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkSource;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENPurchasesNoObjectType;
import com.ksoe.energynet.valueobject.ENServices2Plan;
import com.ksoe.energynet.valueobject.ENServicesContractKind;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesContractType;
import com.ksoe.energynet.valueobject.ENServicesContragentType;
import com.ksoe.energynet.valueobject.ENServicesCost;
import com.ksoe.energynet.valueobject.ENServicesMaterials;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObjectCalcType;
import com.ksoe.energynet.valueobject.ENServicesTransport;
import com.ksoe.energynet.valueobject.ENSettleType;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.FINMaterialsStatus;
import com.ksoe.energynet.valueobject.brief.ENMetrologyCounterShort;
import com.ksoe.energynet.valueobject.brief.ENServicesCostShort;
import com.ksoe.energynet.valueobject.brief.ENServicesMaterialsShort;
import com.ksoe.energynet.valueobject.filter.ENCalcContractTotalFilter;
import com.ksoe.energynet.valueobject.filter.ENDepartment2EPRenFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENHumenItemFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2ClassificationTypeFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItem2TKKoefFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItemFilter;
import com.ksoe.energynet.valueobject.filter.ENPurchasesNoObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENServices2PlanFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesMaterialsFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.filter.ENTimeLineFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energynet.valueobject.lists.ENCalcContractTotalShortList;
import com.ksoe.energynet.valueobject.lists.ENDepartment2EPRenShortList;
import com.ksoe.energynet.valueobject.lists.ENGiveCounterShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2ClassificationTypeShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItem2TKKoefShortList;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkShortList;
import com.ksoe.energynet.valueobject.lists.ENPurchasesNoObjectShortList;
import com.ksoe.energynet.valueobject.lists.ENServicesMaterialsShortList;
import com.ksoe.energynet.valueobject.lists.ENTimeLineShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.dataminer.RQOrderItemDAO;
import com.ksoe.rqorder.valueobject.RQOrderItem;
import com.ksoe.rqorder.valueobject.brief.RQApprovedCostShort;
import com.ksoe.techcard.dataminer.TKCalcCostDAO;
import com.ksoe.techcard.dataminer.TKClassificationTypeDAO;
import com.ksoe.techcard.dataminer.TKMaterials2TKMaterialsDAO;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.dataminer.TKTechCardDAO;
import com.ksoe.techcard.logic.TechCardLogic;
import com.ksoe.techcard.valueobject.TKCalcCost;
import com.ksoe.techcard.valueobject.TKCalcMaterials;
import com.ksoe.techcard.valueobject.TKClassificationType;
import com.ksoe.techcard.valueobject.TKClassificationTypeParamsOnDate;
import com.ksoe.techcard.valueobject.TKMaterials;
import com.ksoe.techcard.valueobject.TKReplaceCounterKind;
import com.ksoe.techcard.valueobject.TKTechCard;
import com.ksoe.techcard.valueobject.TKTechCardSource;
import com.ksoe.techcard.valueobject.brief.TKCalcMaterialsShort;
import com.ksoe.techcard.valueobject.brief.TKMaterials2TKMaterialsShort;
import com.ksoe.techcard.valueobject.filter.TKClassificationTypeFilter;
import com.ksoe.techcard.valueobject.filter.TKTechCardFilter;
import com.ksoe.techcard.valueobject.lists.TKCalcMaterialsShortList;
import com.ksoe.techcard.valueobject.lists.TKClassificationTypeShortList;

public class PlanWorkItemLogic extends LogicModule{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;



	public BigDecimal calcCoef(int planItemCode) throws PersistenceException
	{
		BigDecimal out = new BigDecimal(1);
		//BigDecimal coef = new BigDecimal(1);

		ENPlanWorkItem2TKKoefDAO koefDAO = new ENPlanWorkItem2TKKoefDAO(connection, userProfile);
		ENPlanWorkItem2TKKoefFilter f = new ENPlanWorkItem2TKKoefFilter();
		f.planWorkItemRef.code = planItemCode;
		ENPlanWorkItem2TKKoefShortList list = koefDAO.getScrollableFilteredList(f, 0, -1);
		for (int i=0; i < list.totalCount; i++){
			// коэф надо ПЕРЕМНОЖАТЬ а НЕ среднее арифим ...
			//coef = coef.add( list.get(i).sourceKoefKoef);
			out = out.multiply(list.get(i).sourceKoefKoef).setScale(2, BigDecimal.ROUND_HALF_UP);
		}

		//if (list.totalCount != 0){
		//	out = coef.divide( new BigDecimal(list.totalCount), 2, BigDecimal.ROUND_HALF_UP);
		//}

		return out;
	}

	/**
	 *
	 * Удаляет записей с таблицы enplanworkitem2tkkoef (коэффициенты загрузки персонала по работе) по коду работы
	 *
	 * @param code код работы
	 */
	public void deleteTKKoefByPlanWorkItemCode(int code) throws PersistenceException
	{
	      /*Удаление коэффициентов загрузки персонала в работе*/
	      ENPlanWorkItem2TKKoefDAO planworkItem2TKKoefDAO = new ENPlanWorkItem2TKKoefDAO(connection, userProfile);
	      ENPlanWorkItem2TKKoefFilter koefFilter = new ENPlanWorkItem2TKKoefFilter();
	      koefFilter.planWorkItemRef.code = code;
	      int[] planworkItem2TKKoefCodes = planworkItem2TKKoefDAO.getFilteredCodeArray(koefFilter,null,null,0,-1,null);
	      for(int z = 0; z < planworkItem2TKKoefCodes.length; z++){planworkItem2TKKoefDAO.remove(planworkItem2TKKoefCodes[z]);}

	}


	public void updateCoef(int planItemCode) throws PersistenceException {

		ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
		ENPlanWorkItem obj = dao.getObject(planItemCode);

		TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);
		TKTechCard cartObj = kDao.getObject(obj.kartaRef.code);

		ENPlanWorkDAO pDao = new ENPlanWorkDAO(connection, userProfile);
		ENPlanWork plan = pDao.getObjectNoRefNoSegr(obj.planRef.code);

		if (cartObj.normOfTime == null && plan.typeRef.code != ENPlanWorkType.SIZ) {
			throw new EnergyproSystemException(
					"Відсутні норми часу на роботи : " + cartObj.techKartNumber + " " + cartObj.name);
		}

		double normOfTime;
		double coef;
		double count_;

		if (plan.typeRef.code == ENPlanWorkType.SIZ) {
			normOfTime = 0;
			coef = 0;
			count_ = 0;
		} else {
			normOfTime = cartObj.normOfTime.doubleValue();
			coef = calcCoef(obj.code).doubleValue();
			count_ = obj.countGen.doubleValue();
		}

		obj.timeGen = new BigDecimal(normOfTime * coef * count_).setScale(2, BigDecimal.ROUND_HALF_UP);
/*
		String comment_ = new String(obj.commentGen + " норм.врем норма*коэф*кол : " + normOfTime + "*" + coef + "*" + count_);

		if (comment_.length() > 241){
			comment_ = comment_.substring(0,240);
		}

		obj.commentGen = comment_;
*/
		dao.save(obj);

		///// 05.09.12 NET-2800 При изменении коэффициентов на работах нужно пересчитывать время для всего плана и для исполнителей
		PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
		planLogic.recalcTotalTime(plan.code);
		/////

	}


	public void zeroWorkByPlanCode(int planCode)  throws PersistenceException
	{

		ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
        ENHumenItemDAO hDAO = new ENHumenItemDAO(connection, userProfile);
        ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
        FINMaterialsDAO fDAO = new FINMaterialsDAO(connection, userProfile);
		SCCounterDAO sDAO = new SCCounterDAO(connection, userProfile);
		ENTransportItemDAO tDAO = new ENTransportItemDAO(connection, userProfile);
		ENTravelSheetItem2TransportItemDAO t2tDAO = new ENTravelSheetItem2TransportItemDAO(connection, userProfile);

		ENPlanWorkItemFilter filter = new ENPlanWorkItemFilter();
		filter.planRef.code = planCode;

		filter.conditionSQL = " code in (select pi.code from enplanworkitem pi, tktechcard t " +
                              " where pi.planrefcode = " + planCode  +
                              " and pi.kartarefcode = t.code " +
                              " and t.iszerowork = 1)";

		int[] piArr = dao.getFilteredCodeArray(filter, 0, -1);

		for (int b=0;b<piArr.length;b++)
		{
			ENHumenItemFilter hFilter = new ENHumenItemFilter();
			hFilter.planItemRef.code = piArr[b];
			int[] hiArr = hDAO.getFilteredCodeArray(hFilter, 0, -1);
			if (hiArr.length > 0) {
			    for (int n=0;n<hiArr.length;n++) {
					ENHumenItem hi =  hDAO.getObject(hiArr[n]);
					hi.countFact = new BigDecimal(0);
					hi.finWorker.code = Integer.MIN_VALUE;
					hDAO.save(hi);
				}
			}

			ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
			eFilter.planItemRef.code = piArr[b];
			int[] eArr = eDAO.getFilteredCodeArray(eFilter, 0, -1);
			if (eArr.length > 0) {
				for (int m=0;m<eArr.length;m++) {
					FINMaterialsFilter finFilter = new FINMaterialsFilter();
					finFilter.estimateItemRef.code = eArr[m];
					finFilter.statusRef.code = FINMaterialsStatus.GOOD;
					int[] fArr = fDAO.getFilteredCodeArray(finFilter, 0, -1);
					if (fArr.length > 0) {
						throw new SystemException("Есть привязка материалов на работах, которые отмечены как обнуляемые при включении в акт! Код плана - "  + planCode + " Код работы - " + piArr[b]);
					}

					SCCounterFilter scFilter = new SCCounterFilter();
					scFilter.estimateItemRef.code = eArr[m];
					int[] sArr = sDAO.getFilteredCodeArray(scFilter, 0, -1);
					if (sArr.length > 0) {
						throw new SystemException("Есть счетчик на работах, которые отмечены как обнуляемые при включении в акт! Код плана - "  + planCode + " Код работы - " + piArr[b]);
					}

					ENEstimateItem e = eDAO.getObject(eArr[m]);
					e.countFact = new BigDecimal(0);
					eDAO.save(e);
				}
			}

			ENTransportItemFilter tFilter = new ENTransportItemFilter();
			tFilter.planItemRef.code = piArr[b];
			int[] tArr = tDAO.getFilteredCodeArray(tFilter, 0, -1);
			if (tArr.length>0) {
				for (int z=0;z<tArr.length;z++) {
					ENTravelSheetItem2TransportItemFilter t2tFilter = new ENTravelSheetItem2TransportItemFilter();
					t2tFilter.transportItemRef.code = tArr[z];
					int[] t2tArr = t2tDAO.getFilteredCodeArray(t2tFilter, 0, -1);
					if (t2tArr.length>0) {
						throw new SystemException("Есть транспорт в путевых листах на работах, которые отмечены как обнуляемые при включении в акт! Код плана - "  + planCode + " Код работы - " + piArr[b]);
					}

			        ENTransportItem t = tDAO.getObject(tArr[z]);
					t.countWorkFact = new BigDecimal(0);
					tDAO.save(t);
				}
			}

			ENPlanWorkItem pi = dao.getObject(piArr[b]);
			pi.countGen = new BigDecimal(0);
			pi.timeGen = new BigDecimal(0);
			dao.save(pi);
		}

	}

	/**
	 * Метод для проверки, заполнены ли комментарии на работах в плане (необходимо для планов технарей)
	 *
	 * @param plan - план
	 *
	 * @return true - если комментарии заполнены (а также для тех планов, где они не требуются), иначе false
	 *
	 * @throws PersistenceException
	 */
	public boolean checkCommentsForPlanWorkItems(ENPlanWork plan) throws PersistenceException
	{
		if (plan == null)
		{
			throw new SystemException("\n\nNET-4503 Не задано план!");
		}

		if (plan.code == Integer.MIN_VALUE)
		{
			throw new SystemException("\n\nNET-4503 Не задано код плану!");
		}

		if (plan.kind.code != ENPlanWorkKind.FACT)
		{
			return true;
		}

		if (plan.budgetRef.code != ENConsts.ENBUDGET_SRS &&
			plan.budgetRef.code != ENConsts.ENBUDGET_SPS &&
		    plan.budgetRef.code != ENConsts.ENBUDGET_SKEM &&
		    plan.budgetRef.code != ENConsts.ENBUDGET_SVES &&
		    plan.budgetRef.code != ENConsts.ENBUDGET_RZA &&
		    plan.budgetRef.code != ENConsts.ENBUDGET_IZOLATION)
		{
			return true;
		}

		ENPlanWorkItemFilter planItemFilter = new ENPlanWorkItemFilter();
		planItemFilter.planRef.code = plan.code;
		planItemFilter.conditionSQL = "ENPLANWORKITEM.COUNTGEN > 0";

		ENPlanWorkItemDAO planItemDAO = new ENPlanWorkItemDAO(connection, userProfile);

		int[] planItemArr = planItemDAO.getFilteredCodeArray(planItemFilter, 0, -1);

		for (int i = 0; i < planItemArr.length; i++)
		{
			ENPlanWorkItem planItem = planItemDAO.getObject(planItemArr[i]);

			if (planItem.commentGen == null)
			{
				return false;
			}

			if (planItem.commentGen.trim().equals(""))
			{
				return false;
			}

			if (planItem.commentGen.replace('\n', ' ').replace('\r', ' ').replace('\t', ' ').trim().equals(""))
			{
				return false;
			}
		}

		return true;
	}

	/**
	   * Создает план для перемещения работы с одного плана в абстрактный
	   *
	   * @param object объект ENPlanWork
	   */
	  public int createAbstractPlanForMoveWork(ENPlanWork object)
	  {
		  try
		  {
				ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection,userProfile);
                ENPlanWorkFilter planFilter = new ENPlanWorkFilter();

				/// сначала поищем план с нужными нам параметрами, если есть такой же
				/// не закрытый, то закинем эту работу туда
                planFilter.monthGen = object.monthGen;
                planFilter.yearGen = object.yearGen;
				planFilter.kind.code = ENPlanWorkKind.CURRENT;
				planFilter.status.code = ENPlanWorkStatus.GOOD;
				planFilter.typeRef.code = object.typeRef.code;
				planFilter.stateRef.code = object.stateRef.code;
				planFilter.departmentRef.code = object.departmentRef.code;
				planFilter.budgetRef.code = object.budgetRef.code;
				planFilter.responsibilityRef.code = object.responsibilityRef.code;
                planFilter.elementRef.code = getAbstractObjectForMoveWork(object);
                planFilter.formRef.code = ENPlanWorkForm.NOPLANNED;

                ENPlanWorkShortList planList = planDAO.getScrollableFilteredList(planFilter, 0, -1);

                if (planList.totalCount > 0) {
                	return planList.get(0).code;
                } else

                {
					ENPlanWork plan = new ENPlanWork();
					plan.code = Integer.MIN_VALUE;
					plan.dateStart = object.dateStart;
					plan.dateFinal = object.dateStart;
					plan.monthGen = object.monthGen;
					plan.yearGen = object.yearGen;
					plan.domain_info = userProfile.domainInfo.domain;
					plan.kind.code = ENPlanWorkKind.CURRENT;
					plan.status.code = ENPlanWorkStatus.GOOD;
					plan.typeRef.code = object.typeRef.code;
					plan.stateRef.code = object.stateRef.code;
					plan.departmentRef.code = object.departmentRef.code;
					plan.budgetRef.code = object.budgetRef.code;
	                plan.responsibilityRef.code = object.responsibilityRef.code;
					plan.elementRef.code = getAbstractObjectForMoveWork(object);
					plan.renRef.code = new Integer(0);
					plan.formRef.code = ENPlanWorkForm.NOPLANNED;
					plan.sourceRef.code = ENPlanWorkSource.MANUAL;

					plan.commentGen = "План для переміщення робіт з об'єктних планів ";

					int planCode = planDAO.add(plan);

					return planCode;
                }

		  } catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		  }
		  finally
		  {

		  }

	  }



		/**
		   * Ищет объект для плана перемещения работ
		   *
		   * @param object объект ENPlanWork
		   */
		  public int getAbstractObjectForMoveWork(ENPlanWork object)
		  {
			  try
			  {

					ENPurchasesNoObjectFilter pnoFilter = new ENPurchasesNoObjectFilter();
					pnoFilter.typeRef.code = ENPurchasesNoObjectType.MOVED_WORKS;
					pnoFilter.budget.code = object.budgetRef.code;

					ENPurchasesNoObjectDAO pnoDAO = new ENPurchasesNoObjectDAO(connection, userProfile);
					ENPurchasesNoObjectShortList pnoList = pnoDAO.getScrollableFilteredList(pnoFilter, 0, -1);

					if (pnoList.totalCount == 0)
					{
						throw new EnergyproSystemException("\n\n Для бюджетотримача з кодом " + object.budgetRef.code +
								" не знайдено об'єкт для переміщення робіт з одного місячного у інший!");
					}

					if (pnoList.totalCount > 1)
					{
						throw new EnergyproSystemException("\n\n Для бюджетотримача з кодом " + object.budgetRef.code +
								" знайдено декілька (" + pnoList.totalCount + ") об'єктів для переміщення робіт з одного місячного у інший!!");
					}

					if (pnoList.get(0).elementCode == Integer.MIN_VALUE)
					{
						throw new EnergyproSystemException("\n\n Для бюджетотримача з кодом " + object.budgetRef.code +
								" не знайдено об'єкт для переміщення робіт з одного місячного у інший! [elementCode is null]");
					}

					return pnoList.get(0).elementCode;

			} catch (PersistenceException e) {
				throw new EnergyproSystemException(e);
			  }
			  finally
			  {

			  }

		  }


		  public void moveWorkToAbstractPlan(int planItemCode)  throws PersistenceException
			{

				ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
				ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
		        ENHumenItemDAO hDAO = new ENHumenItemDAO(connection, userProfile);
		        ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
				ENTransportItemDAO tDAO = new ENTransportItemDAO(connection, userProfile);

				ENPlanWorkItem planItem = dao.getObject(planItemCode);
				ENPlanWork oldPlan = planDao.getObject(planItem.planRef.code);

				if (planItem.oldPlanRef.code != Integer.MIN_VALUE) {
					throw new SystemException("Ця робота вже була перенесена з іншого плану!\n  Повернення до початковогу плану неможливе!");
				}

				if (oldPlan.kind.code != ENPlanWorkKind.CURRENT) {
					throw new SystemException("План повинен бути \"Місячним\"");
				}

				if (oldPlan.status.code != ENPlanWorkStatus.GOOD &&
						oldPlan.status.code != ENPlanWorkStatus.PRECONFIRMED ) {
					throw new SystemException("План вже затвердженний/виконаний або відмінений!");
					}

				int newPlanCode = createAbstractPlanForMoveWork(oldPlan);


					ENHumenItemFilter hFilter = new ENHumenItemFilter();
					hFilter.planItemRef.code = planItemCode;
					int[] hiArr = hDAO.getFilteredCodeArray(hFilter, 0, -1);
					if (hiArr.length > 0) {
					    for (int n=0;n<hiArr.length;n++) {
							ENHumenItem hi =  hDAO.getObject(hiArr[n]);
							hi.planRef.code = newPlanCode;
							hDAO.save(hi);
						}
					}

					ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
					eFilter.planItemRef.code = planItemCode;
					int[] eArr = eDAO.getFilteredCodeArray(eFilter, 0, -1);
					if (eArr.length > 0) {
						for (int m=0;m<eArr.length;m++) {
							ENEstimateItem e = eDAO.getObject(eArr[m]);
							e.planRef.code = newPlanCode;
							if (e.statusRef.code == ENEstimateItemStatus.PLANNED)
								e.statusRef.code = ENEstimateItemStatus.UNUSED;
							eDAO.save(e,null);
						}
					}

					ENTransportItemFilter tFilter = new ENTransportItemFilter();
					tFilter.planItemRef.code = planItemCode;
					int[] tArr = tDAO.getFilteredCodeArray(tFilter, 0, -1);
					if (tArr.length>0) {
						for (int z=0;z<tArr.length;z++) {
					        ENTransportItem t = tDAO.getObject(tArr[z]);
							t.planRef.code = newPlanCode;
							tDAO.save(t);
						}
					}


					planItem.planRef.code = newPlanCode;
					planItem.oldPlanRef.code = oldPlan.code;
					dao.save(planItem);


			}


	 public void moveWorkFromAbstractPlan(int planItemCode) throws PersistenceException {

				ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
				ENPlanWorkDAO pdao = new ENPlanWorkDAO(connection, userProfile);
				ENHumenItemDAO hDAO = new ENHumenItemDAO(connection, userProfile);
		        ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
				ENTransportItemDAO tDAO = new ENTransportItemDAO(connection, userProfile);

				ENPlanWorkItem planItem = dao.getObject(planItemCode);

				if (planItem.oldPlanRef.code == Integer.MIN_VALUE) {
					throw new SystemException("Ця робота не була перенесена з іншого плану!\n  Повернення до початковогу плану неможливе!");
				}

				ENPlanWork oldPlan = pdao.getObject(planItem.oldPlanRef.code);
				ENPlanWork currPlan = pdao.getObject(planItem.planRef.code);


				if (oldPlan.status.code != ENPlanWorkStatus.GOOD &&
						oldPlan.status.code != ENPlanWorkStatus.PRECONFIRMED ) {
					throw new SystemException("План на який повинна повернутися ця робота вже затвердженний! Код плану - " + oldPlan.code);
				}

				if (currPlan.status.code != ENPlanWorkStatus.GOOD &&
						currPlan.status.code != ENPlanWorkStatus.PRECONFIRMED ) {
					throw new SystemException("Цей план вже затвердженний/виконаний або відмінений!");
				}


					ENHumenItemFilter hFilter = new ENHumenItemFilter();
					hFilter.planItemRef.code = planItemCode;
					int[] hiArr = hDAO.getFilteredCodeArray(hFilter, 0, -1);
					if (hiArr.length > 0) {
					    for (int n=0;n<hiArr.length;n++) {
							ENHumenItem hi =  hDAO.getObject(hiArr[n]);
							hi.planRef.code = planItem.oldPlanRef.code;
							hDAO.save(hi);
						}
					}

					ENEstimateItemFilter eFilter = new ENEstimateItemFilter();
					eFilter.planItemRef.code = planItemCode;
					int[] eArr = eDAO.getFilteredCodeArray(eFilter, 0, -1);
					if (eArr.length > 0) {
						for (int m=0;m<eArr.length;m++) {
							ENEstimateItem e = eDAO.getObject(eArr[m]);
							e.planRef.code = planItem.oldPlanRef.code;
							eDAO.save(e,null);
						}
					}

					ENTransportItemFilter tFilter = new ENTransportItemFilter();
					tFilter.planItemRef.code = planItemCode;
					int[] tArr = tDAO.getFilteredCodeArray(tFilter, 0, -1);
					if (tArr.length>0) {
						for (int z=0;z<tArr.length;z++) {
					        ENTransportItem t = tDAO.getObject(tArr[z]);
							t.planRef.code = planItem.oldPlanRef.code;
							tDAO.save(t);
						}
					}

					planItem.planRef.code = planItem.oldPlanRef.code;
					planItem.oldPlanRef.code = Integer.MIN_VALUE;
					dao.save(planItem);

			}


			public void moveTransportToSelectedWork(int planItemFromCode,
					int planItemToCode) throws PersistenceException {

				ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
				ENPlanWorkDAO pdao = new ENPlanWorkDAO(connection, userProfile);
				ENTransportItemDAO tDAO = new ENTransportItemDAO(connection, userProfile);

				ENPlanWorkItem planItem = dao.getObject(planItemFromCode);

				ENPlanWork currPlan = pdao.getObject(planItem.planRef.code);

				if (currPlan.kind.code != ENPlanWorkKind.FACT) {
					throw new SystemException("Ця функція працює тільки для фактів!");
				}

				if (currPlan.status.code != ENPlanWorkStatus.GOOD &&
						currPlan.status.code != ENPlanWorkStatus.PRECONFIRMED ) {
					throw new SystemException("Цей план вже затвердженний/виконаний або відмінений!");
				}

					ENTransportItemFilter tFilter = new ENTransportItemFilter();
					tFilter.planItemRef.code = planItemFromCode;
					int[] tArr = tDAO.getFilteredCodeArray(tFilter, 0, -1);
					if (tArr.length>0) {
						for (int z=0;z<tArr.length;z++) {
					        ENTransportItem t = tDAO.getObject(tArr[z]);
							t.planItemRef.code = planItemToCode;
							tDAO.save(t);
						}
					}

			}


	public PlanWorkItemLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}



	public int addPlanWorkItemsByClassificationTypeForCalculation2(
			ENPlanWork2ClassificationType planWork2ClassificationType, BigDecimal contractServicesDistance, int codeRem,
			boolean priconnections, Date customPlanDate) {

		return addPlanWorkItemsByClassificationTypeForCalculation2(planWork2ClassificationType,
				contractServicesDistance, codeRem, false, false, null, false, Integer.MIN_VALUE, false, null);
	}

	public int addPlanWorkItemsByClassificationTypeForCalculation2(ENPlanWork2ClassificationType object,
			BigDecimal distance, int codeRem, boolean priconnections, ENServicesObject tempObject,
			boolean docFlowCustomerServices) {

		return addPlanWorkItemsByClassificationTypeForCalculation2(object, distance, codeRem, priconnections, false,
				tempObject, docFlowCustomerServices, Integer.MIN_VALUE, false, null);
	}


	public int addPlanWorkItemsByClassificationTypeForCalculation2(ENPlanWork2ClassificationType object,
			BigDecimal distance, int codeRem, boolean priconnections, ENServicesObject tempObject,
			boolean docFlowCustomerServices, int counterZoneType) {

		return addPlanWorkItemsByClassificationTypeForCalculation2(object, distance, codeRem, priconnections,
				tempObject, docFlowCustomerServices, counterZoneType, false, null);
	}


	public int addPlanWorkItemsByClassificationTypeForCalculation2(ENPlanWork2ClassificationType object,
			BigDecimal distance, int codeRem, boolean priconnections, ENServicesObject tempObject,
			boolean docFlowCustomerServices, int counterZoneType, boolean relaxation, Date customPlanDate) {

		return addPlanWorkItemsByClassificationTypeForCalculation2(object, distance, codeRem, priconnections, false,
				tempObject, docFlowCustomerServices, counterZoneType, relaxation, customPlanDate);
	}


	public int addPlanWorkItemsByClassificationTypeForCalculation2(ENPlanWork2ClassificationType object,
			BigDecimal distance, int codeRem, boolean priconnections, boolean addTU, ENServicesObject tempObject,
			boolean docFlowCustomerServices, int counterZoneType, boolean relaxation, Date customPlanDate) {
		try {

			int soCode = Integer.MIN_VALUE;

			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(connection, userProfile);
			ServicesLogic soLogic = new ServicesLogic(connection, userProfile);
			TKClassificationTypeDAO classDao = new TKClassificationTypeDAO(connection, userProfile);
			RQOrderItemDAO oiDAO = new RQOrderItemDAO(connection, userProfile);
			ENPlanWork2ClassificationTypeDAO pw2cltDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
			ENPlanWorkDAO plDAO = new ENPlanWorkDAO(connection, userProfile);
			ENDepartment2EPRenDAO d2pDAO = new ENDepartment2EPRenDAO(connection, userProfile);

			TKClassificationType tklObj = classDao.getObject(object.classificationTypeRef.code);

			ENMetrologyCounterShort counterFromRestShort = null;
			RQApprovedCostShort counterFromApprovedCost = null;
			int newCreateOrder = Integer.MIN_VALUE;

			this.checkCurrentUserCanAddCalculationsFromTestSources(tklObj.code, tklObj.techcardsource.code);

	        // в объекте передадим цену счетчика при замене многотарифного учета  далее в процедуры создания кошториса
			TKMaterials2TKMaterialsShort m2mShort = null; // new TKMaterials2TKMaterialsShort();
			if (tklObj.replaceCounterKind.code > 0) {
				if (!docFlowCustomerServices) {
					/* 03.03.2020 УБИРАЕМ ВООБЩЕ, ПОТОМУ ЧТО НУЖНО ДЕЛАТЬ ТАКУЮ ЖЕ УСЛУГУ ДЛЯ ЮРИКОВ
					// 07.11.2019 Нужно дать возможность сделать разовый договор для "Укрзалізниці"
					if (! userProfile.getUserName().equalsIgnoreCase("energynet")) {
		        		throw new EnergyproSystemException("\n\nNET-4443 " +
		        				"\n Для укладання договору про встановлення або параметризацію багатотарифного лічильника використовуйте пункт меню " +
		        				"\n \"Документообіг -> Канц-Док -> Журнал реєстрації заяв побутових споживачів\"");
					}
					*/
	        	}
	        }


			// 15.11.2018 сравним customPlanDate с текущей датой сервера , если customPlanDate меньше тольгда переприсвоим в customPlanDate текущей датой сервера
			// ибо вылез бок когда дата на клиентских компьютерах сбивается
			// входящий параметр customPlanDate убрать нельзя т.к она используется для создания тестовых калькуляций
			if (customPlanDate == null) {
				customPlanDate = new Date();
			}

			long diffDate = Tools.getDaysDiff(new Date(), customPlanDate, TimeUnit.DAYS);
			if (diffDate < 0) {
				customPlanDate = new Date();
			}


	        /* SUPP-53893 добавлено условие, что только для калькуляций где счетчик не передается в РЭС, т.к. если
	         * передается, то не надо находить этот счетчик на остатках предприятия */
			if (tklObj.replaceCounterKind.code == TKReplaceCounterKind.REPLACE_COUNTER && tklObj.isGiveCounter <= 0) {

				m2mShort = new TKMaterials2TKMaterialsShort();

				if (counterZoneType == Integer.MIN_VALUE) {
					throw new EnergyproSystemException("\n\nNET-4443 Не вказано зонність лічильника!");
				}

	            // поиск на остатках
	        	counterFromRestShort = soLogic.getParametrizedCounterForServiceObject(tklObj, counterZoneType, codeRem);

	        	// если на остатке счетчика не нашли подходящего, тогда ищем в авто заявке сформированной ранее
				if (counterFromRestShort == null) {
					counterFromApprovedCost = soLogic.getApprovedCost(tklObj.code);

	        		// если  не нашли в какую заявку дописать счетчик то создаем автоматическую  заявку и выходим из процедуры создания договора
	        		if (counterFromApprovedCost == null ) {

	        			newCreateOrder = soLogic.generateAutoOrderByCountersServices(tklObj.code , counterZoneType);

	        			System.out.println("$$$$$ REPLACE_COUNTER: RQOrder created, code: " + newCreateOrder + " $$$$$");

	        			return Integer.MIN_VALUE;
	        		} else // если нашли свободную строку заявки для счетчика то цену и материал берем оттуда
	        		{
	        			RQOrderItem oiObj = oiDAO.getObject(counterFromApprovedCost.rqOrderItemRefCode);
	        			m2mShort.tkmaterialsOutRefCode =  oiObj.material.code; // реальный счетчик  из остатка
	            		m2mShort.tkmaterialsOutRefCost = counterFromApprovedCost.priceWithoutNds; // цена счетчика из утвержденно заявки

	            		System.out.println("$$$$$ REPLACE_COUNTER: Found approved cost, code: " + counterFromApprovedCost.code + " $$$$$");
	        		}

	        	} else //если нашли на остатках
	        	{
	        		System.out.println("$$$$$ REPLACE_COUNTER: Found counter in SC: №" + counterFromRestShort.invNumber + " $$$$$");

	        		m2mShort.tkmaterialsOutRefCode = counterFromRestShort.materialcode;// реальный счетчик  из остатка
	        		m2mShort.tkmaterialsOutRefCost = counterFromRestShort.sum_without_parametrizac; // цена счетчика без параметризации
	        	}
	        }

			// SUPP-92261 SUPP-92129 если работа не по замене многотарифа, то все равно проверяется привязка реального счетчик
			// и если находится, то в кошторис должна взяться стоимость реального типа счетчика
			if(tklObj.replaceCounterKind.code == Integer.MIN_VALUE && m2mShort == null) {
				TKMaterials2TKMaterialsDAO matMatDao = new TKMaterials2TKMaterialsDAO(connection, userProfile);
				m2mShort = matMatDao.getCounterInClassification(tklObj);
			}



			//SUPP-50044. Учитывая разъяснения НКРЭ КП касательно необходимости возмещения
			//заказчиком затрат электропередающей организации на разработку Технических Условий
			//и договора присоединения к электрическим сетям строительных токоприёмников,
			//временных (сезонных) или удалённых географически объектов, в EnergyNet и
			//EnergyWorkflow предусмотрена возможность формирования договора подготовки ТУ,
			// +++ 01.06.2016 г. снят запрет создания договоров подготовки ТУ от 17.04.2013 г.

	        //if (!priconnections) {
	        //    int WorkArr[] = TKClassificationType.PREPARED_TU;
	        //    for (int i = 0; i < WorkArr.length; i++) {
	        //        if (WorkArr[i] == object.classificationTypeRef.code) {
	        //            throw new EnergyproSystemException("\n " +
	        //                    "\n Заборонено укладання договорів на підготовку ТУ!!!" +
	        //                    "\n Для укладення договору про приєднання використовуйте пункт меню :" +
	        //                    "\n Послуги на сторону > Приєднання (нова Методика)...");}}}

	        ENServicesObject soObj = new ENServicesObject();
	        if (priconnections) {
	            if (object.planRef.code != Integer.MIN_VALUE) {
	                soObj = soLogic.getServicesObjectByPlanCode(object.planRef.code);
	                if (soObj.code != Integer.MIN_VALUE) {
	                    soCode = soObj.code;
	                    object.planRef.code = Integer.MIN_VALUE;
	                }
	            }
	        }

	        /** SUPP-8217... 16.10.2013 +++ до особого распоряжения запрещена работа с данными калькуляциями...  */
	        /** SUPP-8217... 17.10.2013 +++ разрешили делать со стороны NET-а...
	         *  запрет для договор, на которых есть код пакета (типа договор поставки из CN-a)...
	         */
	        if (soCode != Integer.MIN_VALUE && soObj.code != Integer.MIN_VALUE) {
	            if (soObj.cnPackCode != Integer.MIN_VALUE) {
	                int notUseWorkArr[] = TKClassificationType.DONT_USE;
	                for (int n = 0; n < notUseWorkArr.length; n++) {
	                    if (notUseWorkArr[n] == object.classificationTypeRef.code) {
	                        throw new EnergyproSystemException("\n " +
	                                "\n SUPP-8217..." +
	                                "\n Для договорів про постачання ЕЕ заборонено використання обраної калькулії!!!" +
	                                "\n № = 2.2.050201, 2.2.050202, 2.2.060201, 2.2.060201.02, 2.2.060201.03...");
	                    }
	                }
	            }
	        }


	        if (object.planRef.code != Integer.MIN_VALUE) {

	            ENPlanWork2ClassificationTypeFilter pw2cltFilter = new ENPlanWork2ClassificationTypeFilter();
	            pw2cltFilter.planRef.code = object.planRef.code;
	            ENPlanWork2ClassificationTypeShortList pw2cltList = pw2cltDAO.getScrollableFilteredList(pw2cltFilter,0,-1);

	            for (int i=0; i < pw2cltList.totalCount ; i++) {
	                int isJobsByTimeForList = pw2cltList.get(i).isJobsByTime;
	                int isJobsByTimeForObject =  object.isJobsByTime;
	                if (isJobsByTimeForList == Integer.MIN_VALUE )
	                    isJobsByTimeForList = 0;
	                if (isJobsByTimeForObject == Integer.MIN_VALUE )
	                    isJobsByTimeForObject = 0;

	                if ( isJobsByTimeForList != isJobsByTimeForObject ) {
	                    throw new EnergyproSystemException("\n\n"
	                    		+ "У калькуляції, що додається, признак резервування часу не співпадає з признаком тих калькуляцій, що вже включені у цей кошторис!!! ");
	                }
	            }
	        }


	        // по умолчанию проставим тип оплаты не определено
	        if(tklObj.servicePaymentKind == Integer.MIN_VALUE ){
	          object.servicePaymentKind=ENConsts.SERVICEPAYMENTKIND_INDEFINITE;
	        } else{
	          object.servicePaymentKind=tklObj.servicePaymentKind;
	        }


			if (docFlowCustomerServices && (tempObject != null && tempObject.code != Integer.MIN_VALUE)) {
				soCode = tempObject.code;
			}

			/// аццкый бред
			ENPlanWorkFilter plFilter = new ENPlanWorkFilter();
			// найдем уже созданные планы, что бы не апдейтить их подразделение
			String pricPlanCodes = "";
			if (priconnections) {

				if (soObj.element.code != Integer.MIN_VALUE) {

					plFilter.elementRef.code = soObj.element.code;
					plFilter.conditionSQL = " KINDCODE in ( " + ENPlanWorkKind.CALCULATION + " , " + ENPlanWorkKind.CALCULATION_SINGLE + ")";
					int[] plArr = plDAO.getFilteredCodeArrayNOSEGR(plFilter, 0, -1);

					for (int p = 0; p < plArr.length; p++) {
						if (pricPlanCodes.length() == 0)
							pricPlanCodes = plArr[p] + "";
						else
							pricPlanCodes = pricPlanCodes + ", " + plArr[p] + "";
					}
				}
			}
			///


	        int result = Integer.MIN_VALUE;
	        result = addPlanWorkItemsByClassificationTypeForCalculation(object, distance, priconnections, soCode, m2mShort, customPlanDate);


	        // апдейт департмент на договоре и планах кошторис и кошторис единичый
			plFilter = new ENPlanWorkFilter();
			ENPlanWork2ClassificationType pw2clObj = pw2cltDAO.getObject(result);

			/**
	         *  SUPP-11965 +++ проверка на совпадение кодировок услуг (SS) в договоре!!!
	         */
			ENPlanWork2ClassificationTypeFilter pla2siFilter = new ENPlanWork2ClassificationTypeFilter();
			pla2siFilter.planRef.code = pw2clObj.planRef.code;
			ENPlanWork2ClassificationTypeShortList pla2siList = pw2cltDAO.getScrollableFilteredList(pla2siFilter, 0, -1);

			String classCodesStr = "";

			if (pla2siList.totalCount == 0)
				throw new EnergyproSystemException("\n\n"
						+ "Помилка у кількості калькуляцій");



			for (int i = 0; i < pla2siList.totalCount; i++) {
				if (classCodesStr.length() == 0)
					classCodesStr = pla2siList.get(i).classificationTypeRefCode + "";
				else
					classCodesStr = classCodesStr + ", " + pla2siList.get(i).classificationTypeRefCode + "";

				 //SUPP-88252 Признак "платные/безоплатные работы" на калькуляции , проверим что бы не добавляли с разными типами
				if(object.servicePaymentKind != Integer.MIN_VALUE || object.servicePaymentKind != ENConsts.SERVICEPAYMENTKIND_INDEFINITE ){ // Ознака оплати калькуляції не проставлена или неопределена
					if(object.servicePaymentKind == ENConsts.SERVICEPAYMENTKIND_PAID && pla2siList.get(i).servicePaymentKind != ENConsts.SERVICEPAYMENTKIND_PAID ){
						throw new EnergyproSystemException(
                                "\n Ознака оплати по калькуляціям не співпадає!!!: \n Калькуляція що додається = " +
						       "("+new String(classDao.getObject(object.classificationTypeRef.code).kod)+ ")" + " з ознакою Платно \n" +
								" Калькуляція яка вже додана у договір ("+ new String(classDao.getObject(pla2siList.get(i).classificationTypeRefCode).kod)+ ")" + " з ознакою " +
								new String(pla2siList.get(i).servicePaymentKind == ENConsts.SERVICEPAYMENTKIND_INDEFINITE ? "\" Невизначено \"" :
								pla2siList.get(i).servicePaymentKind == ENConsts.SERVICEPAYMENTKIND_PAID  ? "\"Платно\"" :
							    pla2siList.get(i).servicePaymentKind == ENConsts.SERVICEPAYMENTKIND_FREE_WORK  ? "\"Безоплатно\"":"")

						);
					}

					if(object.servicePaymentKind == ENConsts.SERVICEPAYMENTKIND_FREE_WORK && pla2siList.get(i).servicePaymentKind != ENConsts.SERVICEPAYMENTKIND_FREE_WORK ){
						throw new EnergyproSystemException(
                                "\n Ознака оплати по калькуляціям не співпадає!!!: \n Калькуляція що додається = " +
						       "("+new String(classDao.getObject(object.classificationTypeRef.code).kod)+ ")" + " з ознакою Безоплатно \n" +
								" Калькуляція яка вже додана у договір ("+ new String(classDao.getObject(pla2siList.get(i).classificationTypeRefCode).kod)+ ")" + " з ознакою " +
								new String(pla2siList.get(i).servicePaymentKind == ENConsts.SERVICEPAYMENTKIND_INDEFINITE ? "\" Невизначено \"" :
								pla2siList.get(i).servicePaymentKind == ENConsts.SERVICEPAYMENTKIND_PAID  ? "\"Платно\"" :
							    pla2siList.get(i).servicePaymentKind == ENConsts.SERVICEPAYMENTKIND_FREE_WORK  ? "\"Безоплатно\"":"")

						);
					}

					if(object.servicePaymentKind == ENConsts.SERVICEPAYMENTKIND_INDEFINITE && pla2siList.get(i).servicePaymentKind != ENConsts.SERVICEPAYMENTKIND_INDEFINITE ){
						throw new EnergyproSystemException(
                                "\n Ознака оплати по калькуляціям не співпадає!!!: \n Калькуляція що додається = " +
						       "("+new String(classDao.getObject(object.classificationTypeRef.code).kod)+ ")" + " з ознакою Невизначено \n" +
								" Калькуляція яка вже додана у договір ("+ new String(classDao.getObject(pla2siList.get(i).classificationTypeRefCode).kod)+ ")" + " з ознакою " +
								new String(pla2siList.get(i).servicePaymentKind == ENConsts.SERVICEPAYMENTKIND_INDEFINITE ? "\" Невизначено \"" :
								pla2siList.get(i).servicePaymentKind == ENConsts.SERVICEPAYMENTKIND_PAID  ? "\"Платно\"" :
							    pla2siList.get(i).servicePaymentKind == ENConsts.SERVICEPAYMENTKIND_FREE_WORK  ? "\"Безоплатно\"":"")

						);
					}
				}
			}


			TKClassificationTypeFilter classFilter = new TKClassificationTypeFilter();
			classFilter.conditionSQL = " tk.code in (" + classCodesStr + ")";
	        TKClassificationTypeShortList classList = classDao.getScrollableFilteredList(classFilter, 0, -1);

			if (classList.totalCount == 0)
				throw new EnergyproSystemException("\n\n"
						+ "Помилка у кількості калькуляцій");

			// Нахождение кода услуг из системы документооборота
			int servicesList2Code = Integer.MIN_VALUE;

			servicesList2Code = classList.get(0).servicesList2Code;
			//	if (servicesListCode == Integer.MIN_VALUE)
			//		return Integer.MIN_VALUE;



			if (classList.totalCount > 1) {
				for (int i = 1; i < classList.totalCount; i++) {
					if (classList.get(i).servicesList2Code != servicesList2Code
							&& classList.get(i).servicesList2Code != Integer.MIN_VALUE) {
						if (classList.get(i).servicesList2Code != Integer.MIN_VALUE)

							throw new EnergyproSystemException("\n" +
	                                "\n Заборонено використовувати в одному договорі калькуляції з різними видами послуг!!!" +
	                                "\n Kод послуги для калькуляції № " + classList.get(0).kod + " : " + classList.get(0).servicesList2Number +
	                                "\n Kод послуги для калькуляції № " + classList.get(i).kod + " : " + classList.get(i).servicesList2Number +
	                                "\n Зверніться у Відділ контролю за експлуатацією енергетичного обладнання до Парфьонова О.Ю. (тел. 12-84)!!!");
	                    else
	                        throw new EnergyproSystemException("\n" +
	                                "\n Помилка: на калькуляції № " + classList.get(i).kod + " не проставлений код послуги з системи документообігу");

					}
				}
			}


			String domain = ""; // NET-4579  домен от подразделения
			if (tklObj.replaceCounterKind.code > 0){ // пока посмотрим как будет работать определение домена только для многотарифных счетчиков

				ENDepartment2EPRenFilter d2pFil = new ENDepartment2EPRenFilter();
				d2pFil.departmentRef.code = codeRem;
				ENDepartment2EPRenShortList d2rList = d2pDAO.getScrollableFilteredList(d2pFil, 0, -1);
				if(d2rList.totalCount>0){
				  DomainDAO domDAO = new DomainDAO(getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE), userProfile);
				  DomainFilter domFil = new DomainFilter();
				  domFil.code = d2rList.get(0).domainCode;
				  int[] domArr = domDAO.getFilteredCodeArray(domFil, null, 0, -1);
				  if(domArr.length>0){
					  Domain domObj = domDAO.getObject(domArr[0]);
					  domain = domObj.domainInfo.domain;
				  }
				}
			}



			soObj = soLogic.getServicesObjectByPlanCode(pw2clObj.planRef.code);

			//SUPP-88252 Признак "платные/безоплатные работы" на калькуляции  если на калькуляции проставили с оплатой или без значит перенести для договора иначе будут указывать на договоре
	        if (tklObj!=null && tklObj.servicePaymentKind==ENConsts.SERVICEPAYMENTKIND_PAID ){
	        	soObj.isNoPay =  ENConsts.ENSERVICES_OBJECT_ISPAY;
	        }
	        if (tklObj!=null && tklObj.servicePaymentKind==ENConsts.SERVICEPAYMENTKIND_FREE_WORK ){
	        	soObj.isNoPay =  ENConsts.ENSERVICES_OBJECT_ISNOPAY;
	        }

			if (soObj.code != Integer.MIN_VALUE) {

				if (priconnections && soObj.department.code == codeRem)
				soObj.department.code = codeRem;

				if(!domain.equals("")){
				  soObj.domain_info = domain; // NET-4579
				}

				if (docFlowCustomerServices) {
					soObj.reconnectionTU = tempObject.reconnectionTU;
					soObj.personalAccountCode = tempObject.personalAccountCode;
					soObj.personalAccountNumber = tempObject.personalAccountNumber;
					soObj.contragentPassport = tempObject.contragentPassport;
					soObj.contragentOkpo = tempObject.contragentOkpo;
					soObj.contragentName = tempObject.contragentName;
					soObj.contragentBossName = tempObject.contragentBossName;
					soObj.contragentAddress = tempObject.contragentAddress;
					soObj.contragentAddressWork = tempObject.contragentAddressWork;
					soObj.contragentPhoneNumber = tempObject.contragentPhoneNumber;
					soObj.contragentObjectWork = tempObject.contragentObjectWork;
					soObj.contragentTypeRef.code = tempObject.contragentTypeRef.code;
					soObj.regionalType = tempObject.regionalType;
					soObj.isNoPay = tempObject.isNoPay;
					soObj.personalAccountUid = tempObject.personalAccountUid;

					soObj.codeEIC = tempObject.codeEIC;
					soObj.contragentPosition = tempObject.contragentPosition;
					soObj.basisType = tempObject.basisType;
					soObj.warrantNumber = tempObject.warrantNumber;
					soObj.warrantDate = tempObject.warrantDate;
					soObj.warrantFIO = tempObject.warrantFIO;
					soObj.contractDateServices = new Date();
					soObj.customerEmail = tempObject.customerEmail;
					soObj.customerMailingAddress = tempObject.customerMailingAddress;
					soObj.postCode = tempObject.postCode;

					soObj.department.code = codeRem;
				}

				if (counterZoneType > 0) {
					soObj.countersZoneType = counterZoneType;
				}

				if (relaxation) {
					soObj.tabNumber = tempObject.tabNumber;
					soObj.timeStart = tempObject.timeStart;
					soObj.timeFinal = tempObject.timeFinal;
					soObj.regionalType = ENSettleType.VILLAGE;
					soObj.contractKindRef.code = ENServicesContractKind.RELAXATION;
					soObj.contractTypeRef.code = ENServicesContractType.RELAXATION;
					soObj.contractStatusRef.code = ENServicesContractStatus.BUDGETAPPROVED;
					soObj.contragentTypeRef.code = ENServicesContragentType.PHYSICAL;

					soObj.contragentName = tempObject.contragentName;
					soObj.contragentBossName = tempObject.contragentBossName;
					soObj.contragentAddress = tempObject.contragentAddress;
					soObj.contragentPassport = tempObject.contragentPassport;
					soObj.basisType = new BigDecimal(ENBasisType.PASSPORT);
				}

				soDAO.save(soObj);
			}


				ENPlanWork plObj = new ENPlanWork();
			    plFilter.elementRef.code = soObj.element.code;
			    plFilter.conditionSQL = "ENPLANWORKKIND.CODE in ( " + ENPlanWorkKind.CALCULATION + " , " + ENPlanWorkKind.CALCULATION_SINGLE + ")";
			    String pricCondition = "";
			    if (priconnections && pricPlanCodes.length() > 0) {
					pricCondition = " ENPLANWORK.CODE NOT IN (" + pricPlanCodes + ")";
				}
			    int[] plArr = plDAO.getFilteredCodeArray(plFilter, pricCondition, null, 0, -1, null);

				for (int p = 0; p < plArr.length; p++) {
					plObj = plDAO.getObjectNoRefNoSegr(plArr[p]);
					plObj.departmentRef.code = codeRem;
					if (!domain.equals("")) {
						plObj.domain_info = domain; // NET-4579
					}
						plDAO.save(plObj);
				}


			// апдейт РЕМ для объекта по коду департмента из услуг добираемся до РЕМ
			ENDepartment2EPRenFilter d2pFilter = new ENDepartment2EPRenFilter();
			d2pFilter.departmentRef.code = soObj.department.code;
			ENDepartment2EPRenShortList d2pList = d2pDAO.getScrollableFilteredList(d2pFilter, 0, -1);
			if (d2pList.totalCount > 0) {
				ENElementDAO elDAO = new ENElementDAO(connection, userProfile);
				ENElement elObj = elDAO.getObject(soObj.element.code);
				elObj.renRef.code = d2pList.get(0).renRefCode;
				if(!domain.equals("")){
					elObj.domain_info = domain  ; // NET-4579
				}
				elDAO.save(elObj);
			}


			// если под договор есть зарезервированное время тогда будем проверять
	        //  на пересечение с зарезервированым временем с другими договорами на дату выполнения работ указаную в договоре
	        /*
	        ENTimeLineDAO  tlDAO = new ENTimeLineDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	        ENTimeLineFilter tlFilter = new ENTimeLineFilter();
	        tlFilter.servicesObjectRef.code = soObj.code;
	        ENTimeLineShortList tlList = tlDAO.getScrollableFilteredList(tlFilter,0,-1);
	        if (tlList.totalCount > 0 ) {

	                soLogic.recalcTimeLineForServicesObject(soObj.code);
	        }
	        */



			/**
			 * 12.04.2013 +++ для присоединений, если договор черновой сразу
			 * утверждаем калькуляцию и генерим месячный план
			 *
			 */
			if (priconnections && !addTU) {
				try {
					Context cnt = new InitialContext();
					Object objRef = cnt.lookup(ENServicesObjectController.JNDI_NAME);
					ENServicesObjectControllerHome soHome = (ENServicesObjectControllerHome) PortableRemoteObject
							.narrow(objRef, ENServicesObjectControllerHome.class);
					ENServicesObjectController soController = soHome.create();

					if (soObj.contractStatusRef.code == ENServicesContractStatus.GOOD) {
						soController.budgetApproved(soObj.code, plObj.code);
						soController.signed(soObj.code, priconnections, false);
					} else {
						soController.signed(soObj.code, priconnections, false);
					}

				} catch (NamingException e) {
					throw new EnergyproSystemException(e.getMessage(), e);
				} catch (RemoteException e) {
					throw new EnergyproSystemException(e.getMessage(), e);
				} catch (CreateException e) {
					throw new EnergyproSystemException(e.getMessage(), e);
				}
			}


	        ///////////////////////////////////////////////////////////////////////
	        // Если услуга по замене счетчика на многотарифный и в остатках его нет,
	        // но есть "место" в заявке, нужно подкинуть этот договор в связку!
	        if (tklObj.replaceCounterKind.code == TKReplaceCounterKind.REPLACE_COUNTER)
	        {

	        	if(counterFromRestShort != null ){
	        		soLogic.reserveCounterForServicesObject(counterFromRestShort , soObj , ENPlanWorkKind.CALCULATION);
	        	}
	        	else {
	            	if (counterFromApprovedCost != null)
	            	{
	            		if (counterFromApprovedCost.code == Integer.MIN_VALUE)
	            		{
	            			throw new SystemException("\n\nNET-4455 Помилка пошуку затвердженої вартості лічильників!");
	            		}

	            		soLogic.addApprovedCostItem(counterFromApprovedCost, soObj.code, counterZoneType);

	            		System.out.println("$$$$$ REPLACE_COUNTER: Added item to approved cost, appCost.code: " + counterFromApprovedCost.code + " $$$$$");
	        	    }
	        	}
	        }
	        ///////////////////////////////////////////////////////////////////////


			if (docFlowCustomerServices || relaxation) {
				return soObj.code;
			} else {
				return result;
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
		catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		}

	}


	public int addPlanWorkItemsByClassificationTypeForCalculation(ENPlanWork2ClassificationType object,
			BigDecimal distance, boolean priconnections, int soCode, TKMaterials2TKMaterialsShort m2mShort,
			Date customPlanDate) {
		try {

			TKClassificationTypeDAO clTypedAO = new TKClassificationTypeDAO(connection, userProfile);
			ENPlanWorkDAO planCalcSingleDAO = new ENPlanWorkDAO(connection, userProfile);
			ServicesLogic soLogic = new ServicesLogic(connection, userProfile);

			if (priconnections) {
				object.planRef.code = Integer.MIN_VALUE;
			}

			// значение "isnotlicensedactivity" для работы (NULL или 0 значит лицензионая)
			TKClassificationType clo = clTypedAO.getObject(object.classificationTypeRef.code);

			this.checkCurrentUserCanAddCalculationsFromTestSources(clo.code, clo.techcardsource.code);


            // 15.11.2018 сравним customPlanDate с текущей датой сервера , если customPlanDate меньше тольгда переприсвоим в customPlanDate текущей датой сервера
 			// ибо вылез бок когда дата на клиентских компьютерах сбивается
 			// входящий параметр customPlanDate убрать нельзя т.к она используется для создания тестовых калькуляций
			if(customPlanDate==null){
				customPlanDate = new Date();
			}
			long diffDate = Tools.getDaysDiff( new Date() , customPlanDate, TimeUnit.DAYS  );
 			if (diffDate<0){
 				customPlanDate = new Date();
 			}

			int result = Integer.MIN_VALUE;
			if (object.planRef.code == Integer.MIN_VALUE) {

				addPlanWorkItemsByClassificationTypeForCalculation(object, distance, ENPlanWorkKind.CALCULATION_SINGLE,
						priconnections, soCode, m2mShort, customPlanDate);

				ENServicesObject so = soLogic.getServicesObjectByPlanCode(object.planRef.code);
				object.planRef.code = soLogic.addForCalculation(so, ENPlanWorkKind.CALCULATION, customPlanDate);

				result = addPlanWorkItemsByClassificationTypeForCalculation(object, distance,
						ENPlanWorkKind.CALCULATION, priconnections, soCode, m2mShort, customPlanDate);

			} else {
				// если лицензионнная тогда обрабатываем  план кошторис единичный тоже
				// NET-2396 создание / редактировани единичного кошториса для всех видов работ if (isLicensed == 0 || isLicensed == Integer.MIN_VALUE){
                // запоминаем код плана кошториса (не единичного)

				int planCalc =  object.planRef.code;

                //  для кошториса  единичного
                int planCalcSingle = Integer.MIN_VALUE;

                ENPlanWorkFilter planCalcSingleFilter = new ENPlanWorkFilter();
                planCalcSingleFilter.conditionSQL =  " code = ( select pw2.code from enplanwork pw1 , enelement el , enplanwork pw2 \n" +
                "                          Where pw1.elementrefcode = el.code \n" +
                "                            and pw1.code =  " + object.planRef.code + " \n" +
                "                            and pw1.kindcode = " + ENPlanWorkKind.CALCULATION + "   \n" +
                "                            and pw2.elementrefcode = el.code  \n" +
                "                            and pw2.kindcode = "+ ENPlanWorkKind.CALCULATION_SINGLE+" )";

                ENPlanWorkShortList planCalcSingleList = planCalcSingleDAO.getScrollableFilteredList(planCalcSingleFilter, 0, -1);

                planCalcSingle = planCalcSingleList.get(0).code;

                // если лицензионнная тогда делаем единичный план кошторис
                // NET-2396 создание / редактировани единичного кошториса для всех видов работ if (isLicensed == 0 || isLicensed == Integer.MIN_VALUE){
				object.planRef.code = planCalcSingle;
				addPlanWorkItemsByClassificationTypeForCalculation(object, distance, ENPlanWorkKind.CALCULATION_SINGLE,
						priconnections, soCode, m2mShort, customPlanDate);

                // для кошториса не единичного
				object.planRef.code = planCalc;
				result = addPlanWorkItemsByClassificationTypeForCalculation(object, distance,
						ENPlanWorkKind.CALCULATION, priconnections, soCode, m2mShort, customPlanDate);
			}

			// если лицензионнная тогда делаем пересчет для  план кошторис с единичного плана
			// NET-2396 создание / редактировани единичного кошториса для всех видов работ if (isLicensed == 0 || isLicensed == Integer.MIN_VALUE){
			// тут перерасчет таблиц калькуляций (данные с (кошторис единичный) множим на количество работ к кошторисе  )
			soLogic.recalculateCalculations(object, priconnections);

			return result;

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}

	/**
	 *
	 * Проверка, что пользователь может добавлять заданную калькуляцию из тестовых источников
	 *
	 * Вычитывает из настроек список пользователей кто может это делать.
	 *
	 * @param tkClassificationTypeCode код калькуляции
	 * @param techCardSourceCode код источника, что будет проверяться
	 * @throws PersistenceException
	 */
	public void checkCurrentUserCanAddCalculationsFromTestSources(int tkClassificationTypeCode, int techCardSourceCode) throws PersistenceException {
    	if(techCardSourceCode != TKTechCardSource.CALCULATIONS) {
            ENSettingsLogic settingsLogic = new ENSettingsLogic(connection, userProfile);
            Vector<String> usersAllowed = new Vector<>();
            Vector<String> usersAllowedFromSettings = settingsLogic.getVectorWithValues(ENSettingsKeysConsts.USERS_ALLOWED_TO_ADD_CALCULATION_FROM_TEST_SOURCES);
            for(String str : usersAllowedFromSettings) usersAllowed.add(str.trim().toUpperCase());
            if(!usersAllowed.contains(userProfile.userName.toUpperCase())) {
            	throw new EnergyproSystemException(String.format("Роботи можливо додавати тільки із джерела \"Калькуляції\" код класифікації: %d", tkClassificationTypeCode));
            }

        }
	}


	public int addPlanWorkItemsByClassificationTypeForCalculation(ENPlanWork2ClassificationType object,
			BigDecimal distance, int planKindCode, boolean priconnections, int soCode,
			TKMaterials2TKMaterialsShort m2mShort, Date customPlanDate) {
		try {

			TKTechCardDAO techCardDAO = new TKTechCardDAO(connection, userProfile);
			TKClassificationTypeDAO classDao = new TKClassificationTypeDAO(connection, userProfile);
			ENPlanWork2ClassificationTypeDAO dao = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
			ServicesLogic soLogic = new ServicesLogic(connection, userProfile);


			TKTechCardFilter techCardFilter = new TKTechCardFilter();
			techCardFilter.classificationType.code = object.classificationTypeRef.code;
			int[] techCardArr = techCardDAO.getFilteredCodeArray(techCardFilter, 0, -1);
			if (techCardArr.length == 0) {
				throw new EnergyproSystemException("\n\n"
						+ "Не знайдено операції(тех.карти) для класифікатора з кодом " + object.classificationTypeRef.code);
			}



            // 15.11.2018 сравним customPlanDate с текущей датой сервера , если customPlanDate меньше тольгда переприсвоим в customPlanDate текущей датой сервера
 			// ибо вылез бок когда дата на клиентских компьютерах сбивается
 			// входящий параметр customPlanDate убрать нельзя т.к она используется для создания тестовых калькуляций

			if(customPlanDate==null){
				customPlanDate = new Date();
			}
			long diffDate = Tools.getDaysDiff( new Date() , customPlanDate, TimeUnit.DAYS  );
 			if (diffDate<0){
 				customPlanDate = new Date();
 			}


	        TKClassificationType classType = classDao.getObject(object.classificationTypeRef.code);

	        this.checkCurrentUserCanAddCalculationsFromTestSources(classType.code, classType.techcardsource.code);

	        //////////////////////////////////////////////
	        // Проверка на совпадение видов работ из Услуг
	        soLogic.checkFinWorkTypes(object, priconnections);
	        //////////////////////////////////////////////


	        ////////////////////////////////////////////// SUPP-4588
	        // Проверка работ в договоре (должны все быть с признаком на калькуляции с выездом или все без выезда) (т.е с предварительным кошторисом или без )
	        /** 01.03.2020... +++ проверять надо если есть план... */
	        if (object.planRef.code != Integer.MIN_VALUE) {
	        	soLogic.checkClassificationTypePreCost(object);
	        }
	        //////////////////////////////////////////////

			int piCode = Integer.MIN_VALUE;
			int planCode = object.planRef.code;
			for (int i = 0; i < techCardArr.length; i++) {

				ENPlanWorkItem piObj = new ENPlanWorkItem();
				piObj.planRef.code = planCode;
				piObj.kartaRef.code = techCardArr[i];
				piObj.countGen = object.countGen;

	            piCode = this.addForCalculation(piObj, distance, planKindCode, priconnections, soCode, m2mShort, customPlanDate);

				if (planCode == Integer.MIN_VALUE) {
	                // как то оно хитро работает .. чуть шо передернуть piObj ;)
	                planCode = piObj.planRef.code;
				}
			}

	        if (piCode == Integer.MIN_VALUE){
	            throw new EnergyproSystemException("\n\n"
	            		+ "Не додано жодної операції (тех.карти)");
	        }


	        object.planRef.code = planCode;
	        object.userGen = userProfile.userName;
	        object.dateEdit = new Date();


	        /** 26.04.2013 +++ для присоединений определяем вид работ */
	        if (priconnections) {

	            int workTU[] = TKClassificationType.PREPARED_TU;
	            for (int i = 0; i < workTU.length; i++) {
	                if (workTU[i] == object.classificationTypeRef.code) {
	                    object.connectionWorkTypeRef.code = ENConnectionWorkType.TU;
	                }
	            }

	            int workAgree[] = TKClassificationType.AGREEMENT;
	            for (int i = 0; i < workAgree.length; i++) {
	                if (workAgree[i] == object.classificationTypeRef.code) {
	                    object.connectionWorkTypeRef.code = ENConnectionWorkType.AGREEMENT;
	                }
	            }

	            int workConnections[] = TKClassificationType.CONNECTIONS;
	            for (int i = 0; i < workConnections.length; i++) {
	                if (workConnections[i] == object.classificationTypeRef.code) {
	                    object.connectionWorkTypeRef.code = ENConnectionWorkType.CONNECTIONS;
	                }
	            }
	        }

	        this.setParametersOnDate(object, customPlanDate);

	        int outCode = dao.add(object);

	        // проверка tkcalckind для по договору

	        soLogic.checkTkCalcKind(planCode);
	        //***
	        //*** soLogic.createDistancesByPlanCode(planCode);
	        soLogic.createDistancesByPlanCode(planCode);
	        //***

	        // создадим доставку ...
	        new HumenLogic(connection, userProfile).createDeliveryTime(planCode);

	        // обновм сумму договора БЕЗ НДС
	        BigDecimal contractCostWithoutVAT = new ServicesCalculatorLogic(connection, userProfile).calculateServices(object.planRef.code) ;

	        ENServicesObject soObj = soLogic.getServicesObjectByPlanCode(planCode);
	        soObj.contractServicesSumma = contractCostWithoutVAT;

	        new ENServicesObjectDAO(connection, userProfile).save(soObj);

			return outCode;

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	public void setParametersOnDate(ENPlanWork2ClassificationType obj, Date date) {
		try {

			TKClassificationTypeDAO tkClassificationTypeDao = new TKClassificationTypeDAO(connection, userProfile);
			TKClassificationType classType = tkClassificationTypeDao.getObject(obj.classificationTypeRef.code);

			Date onDate = (date == null) ? new Date() : date;
			String classNumber = classType.kod;
			TKClassificationTypeParamsOnDate params = tkClassificationTypeDao.getLastParamsOnDate(onDate, classType);

			if(params != null) {
				if (obj.productionExpensesPercent == null) {
					obj.productionExpensesPercent = params.productionExpensesPercent;
				}

				if(obj.calcKindRef == null || obj.calcKindRef.code == Integer.MIN_VALUE) {
					obj.calcKindRef.code = params.calcKindRef.code;
				}

				if(obj.administrativeExpensesPercent == null) {
					obj.administrativeExpensesPercent = params.administrativeExpensesPercent;
				}
			}

			if (obj.productionExpensesPercent == null) {
				throw new SystemException(String.format("Не знайдений процент загальновиробничих витрат для калькуляції %s", classNumber));
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}



	public int addForCalculation(ENPlanWorkItem object, BigDecimal distance, int planKindCode, boolean priconnections,
			int soCode, TKMaterials2TKMaterialsShort m2mShort, Date customPlanDate) {
		try {

			ServicesLogic sLogic = new ServicesLogic(connection, userProfile);
			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);
			PlanWorkLogic planWorkLogic = new PlanWorkLogic(connection, userProfile);
			ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
			ENPlanWorkItemDAO planWorkItemDao = new ENPlanWorkItemDAO(connection, userProfile);
			TKTechCardDAO techCardDao = new TKTechCardDAO(connection, userProfile);
            TKClassificationTypeDAO classificationTypeDao = new TKClassificationTypeDAO(connection, userProfile);


            // 15.11.2018 сравним customPlanDate с текущей датой сервера , если customPlanDate меньше тольгда переприсвоим в customPlanDate текущей датой сервера
 			// ибо вылез бок когда дата на клиентских компьютерах сбивается
 			// входящий параметр customPlanDate убрать нельзя т.к она используется для создания тестовых калькуляций
            if(customPlanDate==null){
				customPlanDate = new Date();
			}
            long diffDate = Tools.getDaysDiff( new Date() , customPlanDate, TimeUnit.DAYS  );
 			if (diffDate<0){
 				customPlanDate = new Date();
 			}

			if (object.kartaRef.code == 0) {
				throw new EnergyproSystemException("\n\n"
						+ "робота не знайдена ... код плана =" + object.planRef.code);
			}

			if (object.countGen.doubleValue() <= 0) {
				throw new EnergyproSystemException("\n\n"
						+ "Кількість робіт повинна бути більшою за 0!");
			}

			if (object.planRef.code == Integer.MIN_VALUE) {

	            ENServicesObject so = new ENServicesObject();

	            if (priconnections) {
	                so.contractTypeRef.code = ENServicesContractType.CONNECTION;
	            }

	            so.contractServicesDistance = distance;

	            so.contractDate = customPlanDate;

	            /// определим тип калькуляции и по нему тип расчета для ServicesObject'а
	            TKClassificationType classTypeObj = new TKClassificationType();
	            TKTechCard tkObj = new TKTechCard();

	            tkObj = techCardDao.getObject(object.kartaRef.code);
	            classTypeObj = classificationTypeDao.getObject(tkObj.classificationType.code);

	            // SUPP-4588 -- если калькуляция имеет признак "без предварительного кошториса" то тоже расчет по старому
	            if (classTypeObj.isnotlicensedactivity > 0 || classTypeObj.isWithoutPreCost == 1 ) {
	                so.calcTypeRef.code = ENServicesObjectCalcType.BY_CALCULATION;
	            }


	            if (soCode == Integer.MIN_VALUE) {
	                soCode = sLogic.addServicesObjectForCalculation(so);
	            } else {
	                so = servicesObjectDao.getObject(soCode);
	            }


	            // создадим план
				int planCode = sLogic.addForCalculation(so, planKindCode, customPlanDate);


				ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
				planFilter.elementRef.code = so.element.code;

				if (priconnections) {
					planFilter.kind.code = planKindCode;
					planFilter.status.code = ENPlanWorkStatus.GOOD;
				} else {
					planFilter.kind.code = planKindCode;
				}

				int[] planArr = planDao.getFilteredCodeArray(planFilter, 0, -1);
				if (planArr.length != 1) {
						throw new EnergyproSystemException("\n\n"
								+ "Помилка у кількості кошторисів для договору!");
				}

				object.planRef.code = planArr[0];
			}


			// типа проверим совпадение времени общего на ТехКарте и СУММЫ времени на каждой должности ...
			new TechCardLogic(connection, userProfile).validateNormOfTime(object.kartaRef.code);

			ENPlanWorkItemFilter f = new ENPlanWorkItemFilter();
			f.planRef.code = object.planRef.code;
			f.kartaRef.code = object.kartaRef.code;

			int[] arr = planWorkItemDao.getFilteredCodeArray(f, null, null, 0, -1, null);
			if (arr.length > 0) {
				throw new SystemException("\n\n"
						+ "Така робота вже є у Плані ... змінюйте кількість робіт ...");
			}

			ENPlanWork plan = planWorkLogic.getPlanByCode(object.planRef.code);
			if (plan.kind.code != ENPlanWorkKind.CALCULATION && plan.kind.code != ENPlanWorkKind.CALCULATION_SINGLE) {

				throw new SystemException("\n\n"
						+ "Цей план не є КОШТОРИСОМ!");
			}


	     	sLogic.checkEditableCalculation(plan, true, priconnections);

	     	///////////////////////////////////////////////////////////////////////////
	     	// Подкинем бюджетодержателя из техкарты
			boolean isBudgetEmpty = false;

			if (plan.budgetRef == null) {
				isBudgetEmpty = true;
			}

			if (plan.budgetRef.code == Integer.MIN_VALUE) {
				isBudgetEmpty = true;
			}

			if (isBudgetEmpty) {

				TKTechCard tc = techCardDao.getObject(object.kartaRef.code);

				if (tc.budgetRef != null) {
					if (tc.budgetRef.code > Integer.MIN_VALUE) {
						plan.budgetRef.code = tc.budgetRef.code;
						planDao.save(plan);
					}
				}
			}

	     	///////////////////////////////////////////////////////////////////////////
			if (planKindCode == ENPlanWorkKind.CALCULATION_SINGLE) {
				object.countGen = new BigDecimal(1);
			}

			int planItemOutCode = planWorkLogic.addPlanWorkItem(object, plan, m2mShort);

			return planItemOutCode;

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	/**
	 *
	 * NET-4572 Генерация плана работ с работами по калькуляциям для коллекции объектов {@link ENServicesCost}
	 *
	 * @param servicesCost {@link ENServicesCost} объект расчета по калькуляциям
	 * @return {@link ENPlanWork} созданный план (месячный)
	 * @throws PersistenceException
	 */
	public ENPlanWork generatePlanWithWorksForENServicesCost(Collection<ENServicesCost> servicesCosts, ENPlanWork planTemplate) throws PersistenceException {
		try {
			if(servicesCosts == null) {
				throw new java.lang.NullPointerException();
			}
			if(servicesCosts.size() == 0) {
				throw new SystemException("Немає розрахунків калькуляцій для формування плану");
			}

			ENPlanWork out = new ENPlanWork();

			ServicesLogic servicesLogic = new ServicesLogic(connection, userProfile);
			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(connection, userProfile);
			ENPlanWorkDAO planWorkDao = new ENPlanWorkDAO(connection, userProfile);
			TKCalcCostDAO calcCostDao = new TKCalcCostDAO(connection, userProfile);
			TKTechCardDAO techCardDao = new TKTechCardDAO(connection, userProfile);
			TKMaterialsDAO tkMaterialsDao = new TKMaterialsDAO(connection, userProfile);
			ENServicesTransportDAO servicesTransportDao = new ENServicesTransportDAO(connection, userProfile);
			ENServicesCostDAO servicesCostDao = new ENServicesCostDAO(connection, userProfile);
	        ENServices2PlanDAO s2pDAO = new ENServices2PlanDAO(connection, userProfile);
	        FINExecutorLogic finExecutorLogic = new FINExecutorLogic(connection, userProfile);
	        ENElementDAO elementDao = new ENElementDAO(connection, userProfile);
	        ENServicesMaterialsDAO servicesMaterialsDao = new ENServicesMaterialsDAO(connection, userProfile);
	        ENEstimateItemDAO estimateDao = new ENEstimateItemDAO(connection, userProfile);

	        Context context = new InitialContext();
	        Object objRef = context.lookup(ENEstimateItemController.JNDI_NAME);
	        ENEstimateItemControllerHome home = (ENEstimateItemControllerHome) PortableRemoteObject.narrow(objRef, ENEstimateItemControllerHome.class);
	        ENEstimateItemController estimateController = home.create();


			Hashtable<Integer, TKCalcCost> calcCosts = new Hashtable<>();
			Date period = null;
			Integer servicesObjectCode = null;
			Hashtable<Integer, BigDecimal> distances = new Hashtable<>();
			List<ENServicesCost> servicesCostsList = new Vector<>();

			/// Первый цикл метода
			/// 1) находится общий период для калькуляций
			/// 2) заполняется лист объектов calcCost
			/// 3) проверка, что все принадлежат к одному объекту договора ENServicesCost
			/// 4) нахождение расчитанной дистанции и запись её в хэш-таблицу
			for(ENServicesCost servicesCost : servicesCosts) {
				calcCosts.put(servicesCost.tkCalcCostRef.code ,calcCostDao.getObject(servicesCost.tkCalcCostRef.code));

				servicesCostsList.add(servicesCostDao.getObject(servicesCost.code));

				// Дистанция хранится на транспорте
				int[] transportCodes = servicesTransportDao.getArrayOfCodesByENServicesCost(servicesCost);
				if(transportCodes.length > 0) {
					ENServicesTransport servicesTransport = servicesTransportDao.getObject(transportCodes[0]);
					distances.put(servicesCost.code, servicesTransport.distance);
				}

				Date temp = Tools.getFirstDayOfMonth(servicesCost.dateGen);
				if(period == null) {
					period = temp;
				} else {
					if(period.compareTo(temp) != 0) {
						throw new SystemException(String.format("Обрані калькуляції не співпадають за періодами %s та %s."
								+ "Плани на них необхідно формувати окремо", Tools.dateFormatDefault.format(temp)
								, Tools.dateFormatDefault.format(period)));
					}
				}

				if(servicesObjectCode == null) {
					servicesObjectCode = servicesCost.servicesObjectRef.code;
				} else {
					if(servicesObjectCode.compareTo(servicesCost.servicesObjectRef.code) != 0) {
						throw new SystemException("Калькуляції пов''язані з різними договорами!");
					}
				}

			}

			// Создание месячного плана после первого цикла
			ENServicesObject servicesObject = servicesObjectDao.getObjectNoSegr(servicesObjectCode);
			out.code = servicesLogic.addForCalculation(servicesObject, ENPlanWorkKind.CALCULATION, period);
			out = planWorkDao.getObject(out.code);

			boolean isBudgetApproved = false;

			if(servicesObject.contractStatusRef.code == ENServicesContractStatus.BUDGETAPPROVED) {
				servicesObject.contractStatusRef.code = ENServicesContractStatus.GOOD;
				servicesObjectDao.save(servicesObject);
				isBudgetApproved = true;
			}

			/// Второй цикл метода
			/// 1) Создание работ и включение их в созданный выше план
			/// 2) Проверка, что на расчет калькуляции не было создано планов раньше
			/// 3) Присваивание плана для расчета калькуляции
			for(ENServicesCost servicesCost : servicesCostsList) {

				if(servicesCost.planRef.code != Integer.MIN_VALUE) {
					ENServicesCostShort temp = servicesCostDao.getShortObject(servicesCost.code);
					throw new SystemException(String.format("Для розрахунку калькуляції № %s від %s вже створено план"
							, temp.tkClassificationTypeRefKod
							, Tools.dateFormatDefault.format(temp.dateGen)));
				}

				servicesCost.planRef.code = out.code;
				servicesCostDao.save(servicesCost);

				Set<Integer> addedMaterialsCodes = new HashSet<>();
				Set<Integer> addedPlanWorkItemsCodes = new HashSet<>();

				TKCalcCost calcCost = calcCosts.get(servicesCost.tkCalcCostRef.code);
				int[] techCardCodes = techCardDao.getFilteredCodeArrayByClassificationTypeCode(calcCost.classificationTypeRef.code);
				for(int techCardCode : techCardCodes) {
					ENPlanWorkItem planWorkItem = new ENPlanWorkItem();
					planWorkItem.countGen = servicesCost.countGen;
					planWorkItem.kartaRef.code = techCardCode;
					planWorkItem.planRef.code = out.code;
					this.addForCalculation(planWorkItem, distances.get(servicesCost.code)
							, ENPlanWorkKind.CALCULATION, false, servicesObject.code
							, null, period);

					addedPlanWorkItemsCodes.add(planWorkItem.code);

					// 19.03.2019 Добавление материалов, которые были добавлены вручную
					ENServicesMaterialsFilter servicesMaterialsInsertedFilter = new ENServicesMaterialsFilter();
					servicesMaterialsInsertedFilter.kartaRef.code = techCardCode;
					servicesMaterialsInsertedFilter.servicesCostRef.code = servicesCost.code;
					servicesMaterialsInsertedFilter.conditionSQL = String.format("%s is null", ENServicesMaterials.calcMaterialsRef_QFielld);
					int[] servicesMaterialsInsertedCodes = servicesMaterialsDao.getFilteredCodeArray(servicesMaterialsInsertedFilter, 0, -1);
					for(int servicesMaterialsInsertedCode : servicesMaterialsInsertedCodes) {
						ENServicesMaterials servicesMaterialsInserted = servicesMaterialsDao.getObject(servicesMaterialsInsertedCode);
						TKMaterials tkMaterial = tkMaterialsDao.getObject(servicesMaterialsInserted.materialRef.code);
						ENEstimateItem estimateItem = new ENEstimateItem();
						estimateItem.accountingTypeRef.code = tkMaterial.accountingTypeRef.code;
						estimateItem.materialRef.code = tkMaterial.code;
						estimateItem.countGen = servicesMaterialsInserted.countGen;
						estimateItem.countFact = servicesMaterialsInserted.countGen;
						estimateItem.price = servicesMaterialsInserted.priceGen;
						estimateItem.cost = servicesMaterialsInserted.sumGen;
						estimateItem.planRef.code = out.code;
						estimateItem.planItemRef.code = planWorkItem.code;
						estimateItem.kindRef.code = ENEstimateItemKind.MATERIALS;
						estimateItem.typeRef.code = ENEstimateItemType.MANUAL_BY_PLANITEM;


						estimateController.add(estimateItem);
						addedMaterialsCodes.add(estimateItem.code);

					}
				}

				TKCalcMaterialsShortList deletedMaterials = servicesMaterialsDao.getListOfRemovedMaterialsByENServicesCost(servicesCost);
				for(TKCalcMaterialsShort deletedMaterial : deletedMaterials.list) {
					BigDecimal deletedQuantity = deletedMaterial.countGen.multiply(servicesCost.countGen)
							.setScale(6, BigDecimal.ROUND_HALF_UP);
					ENEstimateItemFilter estimatesToDeleteFilter = new ENEstimateItemFilter();
					estimatesToDeleteFilter.materialRef.code = deletedMaterial.materialRefCode;
					estimatesToDeleteFilter.planRef.code = out.code;
					Vector<Integer> binded = new Vector<>(addedPlanWorkItemsCodes);
					if(addedPlanWorkItemsCodes.size() > 0) {
						estimatesToDeleteFilter.conditionSQL = String.format("%s in (%s)", ENEstimateItem.planItemRef_QFielld
								, Tools.repeatSymbol("?", ",", addedPlanWorkItemsCodes.size()));
					}
					binded.addAll(addedMaterialsCodes);
					if(addedMaterialsCodes.size() > 0) {
						estimatesToDeleteFilter.conditionSQL = BaseDAOUtils.addToCondition(String.format("%s not in (%s)", ENEstimateItem.code_QFielld
								, Tools.repeatSymbol("?", ",", addedMaterialsCodes.size())),
								estimatesToDeleteFilter.conditionSQL);
					}
					int[] estimatesToDeleteCodes = estimateDao.getFilteredCodeArray(estimatesToDeleteFilter, 0, -1, binded);
					BigDecimal estimatesToDeleteQuantity = estimateDao.getAggregateValue("sum"
							, String.format("%s::decimal", ENEstimateItem.countFact_QFielld), estimatesToDeleteFilter, binded);
					if(estimatesToDeleteQuantity == null) estimatesToDeleteQuantity = BigDecimal.ZERO;
					if(deletedQuantity.compareTo(estimatesToDeleteQuantity) != 0) {
						throw new SystemException(String.format("Помилка при видаленні матеріалу \"%s\" (не співпадає кількість"
								+ "видалена по калькуляції - %s %s та матеріалів у плані %s %s)"
								, deletedMaterial.materialName, deletedQuantity, deletedMaterial.measureUnitName
								, estimatesToDeleteQuantity, deletedMaterial.measureUnitName));
					}

					for(int estimatesToDeleteCode : estimatesToDeleteCodes) {
						estimateController.remove(estimatesToDeleteCode);
					}
				}

				// 19.03.2019 Изменение материалов которые были изменены вручную
				ENServicesMaterialsFilter servicesMaterialsUpdatedFilter = new ENServicesMaterialsFilter();
				servicesMaterialsUpdatedFilter.servicesCostRef.code = servicesCost.code;
				servicesMaterialsUpdatedFilter.conditionSQL = String.format("%s is not null and (round(cast(%s as decimal), 6) "
						+ " <> round(cast(%s * %s as decimal), 6))"
						, ENServicesMaterials.calcMaterialsRef_QFielld
						, ENServicesMaterials.countGen_QFielld
						, TKCalcMaterials.countGen_QFielld
						, ENServicesCost.countGen_QFielld);

				ENServicesMaterialsShortList servicesMaterialsUpdatedList
				= servicesMaterialsDao.getScrollableFilteredList(servicesMaterialsUpdatedFilter, 0, -1);

				for(ENServicesMaterialsShort servicesMaterialsUpdated : servicesMaterialsUpdatedList.list) {
					ENEstimateItemFilter estimatesToUpdateFilter = new ENEstimateItemFilter();
					estimatesToUpdateFilter.materialRef.code = servicesMaterialsUpdated.materialRefCode;
					estimatesToUpdateFilter.planRef.code = out.code;
					Vector<Integer> binded = new Vector<>(addedPlanWorkItemsCodes);
					if(addedPlanWorkItemsCodes.size() > 0) {
						estimatesToUpdateFilter.conditionSQL = String.format("%s in (%s)", ENEstimateItem.planItemRef_QFielld
								, Tools.repeatSymbol("?", ",", addedPlanWorkItemsCodes.size()));
					}
					binded.addAll(addedMaterialsCodes);
					if(addedMaterialsCodes.size() > 0) {
						estimatesToUpdateFilter.conditionSQL = BaseDAOUtils.addToCondition(String.format("%s not in (%s)", ENEstimateItem.code_QFielld
								, Tools.repeatSymbol("?", ",", addedMaterialsCodes.size()))
								, estimatesToUpdateFilter.conditionSQL);
					}
					BigDecimal estimatesToUpdateQuantity = estimateDao.getAggregateValue("sum"
							, String.format("%s::decimal", ENEstimateItem.countFact_QFielld), estimatesToUpdateFilter, binded);
					if(estimatesToUpdateQuantity == null) estimatesToUpdateQuantity = BigDecimal.ZERO;
					BigDecimal delta = servicesMaterialsUpdated.countGen.subtract(estimatesToUpdateQuantity);
					if(delta.compareTo(BigDecimal.ZERO) == 0) {
						throw new SystemException(String.format("Помилка для матеріалу %s кількість, що змінюється (%f %s) дорівнює наявній кількості (%f %s)"
								, servicesMaterialsUpdated.countGen, servicesMaterialsUpdated.measureUnitName, estimatesToUpdateQuantity
								, servicesMaterialsUpdated.measureUnitName));
					}
					int[] estimatesToUpdateCodes = estimateDao.getFilteredCodeArray(estimatesToUpdateFilter, 0, -1, binded);
					if(estimatesToUpdateCodes.length == 0) throw new SystemException("Помилка у кількості");
					// Если больше, то просто количество добавляется на первый материал
					if(delta.compareTo(BigDecimal.ZERO) == 1) {
						ENEstimateItem estimate = estimateDao.getObject(estimatesToUpdateCodes[0]);
						estimate.countFact = estimate.countFact.add(delta);
						estimateController.save(estimate);
					} else {
						delta = delta.multiply(new BigDecimal(-1));
						// Если меньше, то количество будет отниматься от материалов
						for(int estimatesToUpdateCode : estimatesToUpdateCodes) {
							ENEstimateItem estimate = estimateDao.getObject(estimatesToUpdateCode);
							if(estimate.countFact.compareTo(delta) == 1) {
								estimate.countFact = estimate.countFact.subtract(delta);
								estimateController.save(estimate);
								delta = BigDecimal.ZERO;
							} else {
								estimateController.remove(estimate.code);
								delta = delta.subtract(estimate.countFact);
							}
						}
						if(delta.compareTo(BigDecimal.ZERO) != 0) {
							throw new SystemException("Помилка у розрахунці матеріалів!");
						}

					}

				}

				// Изменилась цена
				servicesMaterialsUpdatedFilter.conditionSQL = String.format("%s is not null and (%s <> %s)"
						, ENServicesMaterials.calcMaterialsRef_QFielld
						, ENServicesMaterials.priceGen_QFielld
						, TKCalcMaterials.priceGen_QFielld);
				servicesMaterialsUpdatedList
				= servicesMaterialsDao.getScrollableFilteredList(servicesMaterialsUpdatedFilter, 0, -1);
				for(ENServicesMaterialsShort servicesMaterialsUpdated : servicesMaterialsUpdatedList.list) {
					ENEstimateItemFilter estimatesToUpdateFilter = new ENEstimateItemFilter();
					estimatesToUpdateFilter.materialRef.code = servicesMaterialsUpdated.materialRefCode;
					estimatesToUpdateFilter.planRef.code = out.code;
					Vector<Integer> binded = new Vector<>(addedPlanWorkItemsCodes);
					if(addedPlanWorkItemsCodes.size() > 0) {
						estimatesToUpdateFilter.conditionSQL = String.format("%s in (%s)", ENEstimateItem.planItemRef_QFielld
								, Tools.repeatSymbol("?", ",", addedPlanWorkItemsCodes.size()));
					}
					binded.addAll(addedMaterialsCodes);
					if(addedMaterialsCodes.size() > 0) {
						estimatesToUpdateFilter.conditionSQL = BaseDAOUtils.addToCondition(String.format("%s not in (%s)", ENEstimateItem.code_QFielld
								, Tools.repeatSymbol("?", ",", addedMaterialsCodes.size()))
								, estimatesToUpdateFilter.conditionSQL);
					}
					int[] estimatesToUpdateCodes = estimateDao.getFilteredCodeArray(estimatesToUpdateFilter, 0, -1, binded);
					for(int estimatesToUpdateCode : estimatesToUpdateCodes) {
						ENEstimateItem estimate = estimateDao.getObject(estimatesToUpdateCode);
						estimate.price = servicesMaterialsUpdated.priceGen;
						estimate.cost = estimate.price.multiply(estimate.countFact).setScale(2, BigDecimal.ROUND_HALF_UP);
						estimateDao.save(estimate);
					}
				}

			}

			// 15.03.2019 Для предотвращения OptimisticLocking
			out = planWorkDao.getObject(out.code);
			out.kind.code = ENPlanWorkKind.CURRENT;

			if(planTemplate != null) {
				out.stateRef.code = planTemplate.stateRef.code;
				out.typeRef.code = planTemplate.typeRef.code;
				out.elementRef.code = planTemplate.elementRef.code;
				out.budgetRef.code = planTemplate.budgetRef.code;
				out.responsibilityRef.code = planTemplate.responsibilityRef.code;
				out.departmentRef.code = planTemplate.departmentRef.code;
				if(planTemplate.finExecutor != null) {
					out.finExecutor = planTemplate.finExecutor;
					ENElement e = elementDao.getObject(out.elementRef.code);
					finExecutorLogic.setFinExecutorInPlan(out, e);
				}
			} else {
				out.stateRef.code = ENPlanWorkState.WORK_IN_OUT;
			}
			planWorkDao.save(out);

	    	ENServices2Plan s2p = new ENServices2Plan();
	    	s2p.code = Integer.MIN_VALUE;
	    	s2p.planRef.code = out.code;
	    	s2p.servicesObjectRef.code = servicesObjectCode;
	    	s2pDAO.add(s2p);

			if(isBudgetApproved) {
				servicesObject.contractStatusRef.code = ENServicesContractStatus.BUDGETAPPROVED;
				servicesObjectDao.save(servicesObject);
			}

			return out;


		} catch (NamingException e) {
			throw new SystemException(e);
		} catch (RemoteException e) {
			throw new SystemException(e);
		} catch (CreateException e) {
			throw new SystemException(e);
		} finally {

		}
	}

	public void undoGeneratePlanWithWorksForENServicesCost(Collection<ENServicesCost> servicesCosts) throws PersistenceException {

		if(servicesCosts == null || servicesCosts.size() == 0) {
			throw new java.lang.IllegalArgumentException();
		}

		ENServicesCostDAO servicesCostDao = new ENServicesCostDAO(connection, userProfile);
		ENPlanWorkDAO planDao = new ENPlanWorkDAO(connection, userProfile);
		PlanWorkLogic planWorkLogic = new PlanWorkLogic(connection, userProfile);
		ENServices2PlanDAO s2pDAO = new ENServices2PlanDAO(connection, userProfile);

		List<ENServicesCost> servicesCostsList = new Vector<>();
		Set<Integer> servicesCostsCodes = new HashSet<>();
		Set<Integer> planCodes = new HashSet<>();
		List<ENPlanWork> planWorks = new Vector<>();


		for(ENServicesCost servicesCost : servicesCosts) {
			ENServicesCost temp = servicesCostDao.getObject(servicesCost.code);
			servicesCostsCodes.add(temp.code);
			if(temp.planRef.code == Integer.MIN_VALUE) {
				ENServicesCostShort tempShort = servicesCostDao.getShortObject(servicesCost.code);
				throw new SystemException(String.format("Для розрахунку калькуляції № %s від %s не було створено план"
						, tempShort.tkClassificationTypeRefKod
						, Tools.dateFormatDefault.format(temp.dateGen)));
			} else {
				planCodes.add(temp.planRef.code);
			}
			temp.planRef.code = Integer.MIN_VALUE;
			servicesCostDao.save(temp);
			servicesCostsList.add(temp);
		}

		for(int planCode : planCodes) {
			ENPlanWork planWork = planDao.getObject(planCode);
			planWorks.add(planWork);
			if(planWork.status.code != ENPlanWorkStatus.GOOD) {
				throw new SystemException("\n"
                		+ "Поточный план повинен бути чорновим!");
			}

			// Проверка, что нет расчетов больше на этот план, если есть, то их необходимо
			// переформировать после удаления
			int[] otherServicesCostsCodes = servicesCostDao.getCodesByENPlanWork(planWork);
			List<ENServicesCost> otherServicesCosts = new Vector<>();
			for(int otherServicesCostCode : otherServicesCostsCodes) {
				ENServicesCost temp = servicesCostDao.getObject(otherServicesCostCode);
				temp.planRef.code = Integer.MIN_VALUE;
				servicesCostDao.save(temp);
				otherServicesCosts.add(temp);
			}

			// Удаление связки с договором
			ENServices2PlanFilter s2pFilter = new ENServices2PlanFilter();
			s2pFilter.planRef.code = planCode;
			int[] s2pCodes = s2pDAO.getFilteredCodeArray(s2pFilter, 0, -1);
			for(int s2pCode : s2pCodes) {
				s2pDAO.remove(s2pCode);
			}


			planWorkLogic.deletePlan(planCode);

			if(otherServicesCosts.size() > 0) this.generatePlanWithWorksForENServicesCost(otherServicesCosts, planWork);
		}
	}




	/**
	 *
	 * @param plan2classificationTypeCode
	 */
	public void removePlanWorkItemsByClassificationTypeForCalculation(int plan2classificationTypeCode) {
		removePlanWorkItemsByClassificationTypeForCalculation(plan2classificationTypeCode, true);
	}

	/**
	 *
	 * @param plan2classificationTypeCode
	 * @param deleteServicesObject
	 */
	public void removePlanWorkItemsByClassificationTypeForCalculation(int plan2classificationTypeCode, boolean deleteServicesObject) {
		try {
			// при удалении передается код связки под план-кошторис
			// Нужно вытянуть код связки из plan2classificationTypeCode для план-кошторис единичный и удалить по двум связкам следующей процедурой

			ENPlanWork2ClassificationTypeDAO p2cDAO = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
			ENServicesObjectDAO serviceDAO = new ENServicesObjectDAO(connection, userProfile);
			ElementLogic elLogic = new ElementLogic(connection, userProfile);
			ServicesLogic soLogic = new ServicesLogic(connection, userProfile);

			int plan2classificationTypeCodeSingleCalc = p2cDAO.getCodeSingleCalcPlan2ClassificationTypeByCalcPlan2ClassificationType(plan2classificationTypeCode);

			ENPlanWork2ClassificationTypeFilter p2cFilter = new ENPlanWork2ClassificationTypeFilter();
			p2cFilter.code = plan2classificationTypeCode;
			ENPlanWork2ClassificationTypeShortList listClass = p2cDAO.getScrollableFilteredList(p2cFilter, 0, -1);
			int planCode = listClass.get(0).planRefCode;

			int elementCode = elLogic.getElementCodeByPlanCode(planCode);

			ENServicesObjectFilter serviceFilter = new ENServicesObjectFilter();
			serviceFilter.element.code = elementCode;
			int soArr[] = serviceDAO.getFilteredCodeArray(serviceFilter, 0, -1);

			ENServicesObject sObject = new ENServicesObject();
			if (soArr.length > 0 ) {
				sObject = serviceDAO.getObject(soArr[0]);
			}


			/**
			 *  NET-4406... 29.09.2014 +++ регистрация заявлений бытовых потребителей на услуги....
			 *  если договор связан з Заявлением, меняем статус договора на отмененный и завершаем движение в DocFlow...
			 *
			 */

			if (deleteServicesObject) {
				if (soLogic.updateDocMovementStatusByServicesConsumer(sObject.code, false)) {
					return;
				}
			}

			if (plan2classificationTypeCodeSingleCalc != Integer.MIN_VALUE) {
				// удаляем связку для план кошториса единичного
				removePlanWorkItemsByClassificationTypeForCalculation_(plan2classificationTypeCodeSingleCalc);
			}

			// удаляем связку для план кошториса
			removePlanWorkItemsByClassificationTypeForCalculation_(plan2classificationTypeCode);


			// если под договор есть зарезервированное время тогда будем проверять
			// на пересечение с зарезервированым временем с другими договорами на дату выполнения работ указаную в договоре
            ENTimeLineDAO  tlDAO = new ENTimeLineDAO(connection, userProfile);
            ENTimeLineFilter tlFilter = new ENTimeLineFilter();
            tlFilter.conditionSQL = " ENSERVICESOBJECT.CODE in (select so.code  from enservicesobject so , enplanwork p " +
                           " where so.elementcode = p.elementrefcode " +
                           "   and p.kindcode = " + ENPlanWorkKind.CALCULATION +
                           "   and p.code = " + planCode +
                           "   limit 1) ";

            ENTimeLineShortList tlList = tlDAO.getScrollableFilteredList(tlFilter, 0, -1);
            if (tlList.totalCount > 0 ) {
            	soLogic.recalcTimeLineForServicesObject(tlList.get(0).servicesObjectRefCode);
            }

            //// После удаления в развязке строк проверим если удалены все строки то нужно удалить планы кошторис и если есть кошторис единичный , объект
            ENPlanWork2ClassificationTypeFilter pw2ctFilter = new ENPlanWork2ClassificationTypeFilter();
            pw2ctFilter.planRef.code =  planCode;
            ENPlanWork2ClassificationTypeShortList pw2ctList =  p2cDAO.getScrollableFilteredList(pw2ctFilter, 0, -1);

            // если нет ничего то удаляем планы и объект
            if (pw2ctList.totalCount == 0 ) {
            	// выносим планы и данные по калькуляциям в связанных таблицах
            	ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
            	ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
            	planFilter.elementRef.code = elementCode ;
            	ENPlanWorkShortList planList = planDAO.getScrollableFilteredList(planFilter,0,-1);

            	for (int i = 0; i < planList.totalCount; i++) {
            		// удаление в записей из таблицы encalccontracttotal
            		ENCalcContractTotalDAO cctdao = new ENCalcContractTotalDAO(connection, userProfile);
            		ENCalcContractTotalFilter cctFilter = new ENCalcContractTotalFilter();
            		cctFilter.planRef.code = planList.get(i).code;
            		ENCalcContractTotalShortList cctList = cctdao.getScrollableFilteredList(cctFilter, 0, -1);

            		for (int icct = 0; icct < cctList.totalCount; icct++) {
            			cctdao.remove(cctList.get(icct).code);
            		}

            		planDAO.remove(planList.get(i).code);
            	}

            	// выносим договор
            	if (soArr.length > 0 ) {
            		// выносим timeline
					tlFilter = new ENTimeLineFilter();
					tlFilter.servicesObjectRef.code = soArr[0];
					int arr[] = tlDAO.getFilteredCodeArray(tlFilter, 0, -1);

					for (int i = 0; i < arr.length; i++) {
						tlDAO.remove(arr[i]);
					}

            		if (deleteServicesObject) {
                		/** NET-4231... 24.05.2013 +++ для присоединий не удалять договор при удалении калькуляции... */
                		if (sObject.contractTypeRef.code != ENServicesContractType.CONNECTION) {
                			serviceDAO.remove(soArr[0]);
                		}
            		}
				}
			}

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	/**
	 *
	 * @param plan2classificationTypeCode
	 */
	public void removePlanWorkItemsByClassificationTypeForCalculation_(int plan2classificationTypeCode) {
		try {

			ENPlanWork2ClassificationTypeDAO dao = new ENPlanWork2ClassificationTypeDAO(connection, userProfile);
			ENGiveCounterDAO giveCounterDao = new ENGiveCounterDAO(connection, userProfile);
			TKClassificationTypeDAO classificationTypeDao = new TKClassificationTypeDAO(connection, userProfile);
			ENPlanWork2ClassificationType object = dao.getObject(plan2classificationTypeCode);

			ServicesCalculatorLogic calcLogic = new ServicesCalculatorLogic(connection, userProfile);
			calcLogic.removeCalculationsFromPlanByClassification(object.planRef.code, plan2classificationTypeCode);

	        ENPlanWorkItemFilter piFilter = new ENPlanWorkItemFilter();
	        piFilter.planRef.code = object.planRef.code;
	        piFilter.conditionSQL = "enplanworkitem.kartarefcode in ( "
	        		+ " select qq.code from tktechcard qq "
	        		+ " where qq.classificationtypecode = " + object.classificationTypeRef.code + ")";

			int[] piArr = new ENPlanWorkItemDAO(connection, userProfile).getFilteredCodeArray(piFilter, piFilter.conditionSQL, null, 0, -1, null);
			for (int i = 0; i < piArr.length; i++) {
				this.removeForCalculation(piArr[i], false);
			}
			
			// SUPP-102888 09.08.2021 Проверка на внесенные записи по переданным счетчикам, если есть то генерируется исключение
			// т.к. все равно при удалении записи ENPlanWork2ClassificationType будет выдана ошибка ограничения
			ENGiveCounterShortList counterList = giveCounterDao.getCountersByPlan2ClassificationTypeCode(plan2classificationTypeCode);
			if(counterList.totalCount > 0) {
				TKClassificationType classificationType = classificationTypeDao.getObject(object.classificationTypeRef.code);
				throw new SystemException(String.format("Для виконання цієї дії необхідно видалити запис про переданий лічильник на вкладці \"Лічильники, що передаються Замовником\" для калькуляції № %s"
						, classificationType.kod));
			}

	        dao.remove(object.code);

			// обновм сумму договора БЕЗ НДС
			ServicesLogic soLogic = new ServicesLogic(connection, userProfile);
			calcLogic.calculateServices(object.planRef.code);
			soLogic.recalculateCalculations(object);

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


	/**
	 *
	 * @param code
	 * @param priconnection
	 */
	public void removeForCalculation(int code, boolean priconnection) {
		try {

			ENPlanWorkItemDAO objectDAO = new ENPlanWorkItemDAO(connection, userProfile);
			ENPlanWorkItem object = objectDAO.getObject(code);

			if (object.planRef.code == Integer.MIN_VALUE) {
				throw new EnergyproSystemException("planRef not found");
			}

			PlanWorkLogic logic = new PlanWorkLogic(connection, userProfile);

			ENPlanWork plan = logic.getPlanByCode(object.planRef.code);

		     if ((plan.kind.code != ENPlanWorkKind.CALCULATION)&&(plan.kind.code != ENPlanWorkKind.CALCULATION_SINGLE)) {
		        //logic.validateMOLinPlan(plan.code);
		        throw new EnergyproSystemException("Цей план не є КОШТОРИСОМ!");
		     }

			ServicesLogic sLogic = new ServicesLogic(connection, userProfile);

			if (!priconnection) {
				sLogic.checkEditableCalculation(plan, true);
			}

			EstimateLogic eLogic = new EstimateLogic(connection, userProfile);

			// удалим смету
			eLogic.removeENEstimateItemsByPlanItemCode(code);

			// удалим людей ...
			HumenLogic hLogic = new HumenLogic(connection, userProfile);
			hLogic.removeHumenItemsByPlanItemCode(object.code);

			// удалим транспорт
			TransportLogic tLogic = new TransportLogic(connection, userProfile);
			tLogic.removeENTransportItemsByPlanItemCode(object.code);

			// must be DELETEd COEFFFFFFFF for PlanWorkItem ..
			ENPlanWorkItem2TKKoefDAO pi2kDAO = new ENPlanWorkItem2TKKoefDAO(connection, userProfile);
			ENPlanWorkItem2TKKoefFilter pi2kFilter = new ENPlanWorkItem2TKKoefFilter();
			pi2kFilter.planWorkItemRef.code = code;
			int[] pi2kArr = pi2kDAO.getFilteredCodeArray(pi2kFilter, null, null, 0, -1, null);
			for (int i = 0; i < pi2kArr.length; i++) {
				pi2kDAO.remove(pi2kArr[i]);
			}
			////

			objectDAO.remove(code);

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}



	/**
	 *
	 * @param planWorkItem2TKKoef
	 * @return
	 */
	public int addPlanWorkItem2TKKoef(ENPlanWorkItem2TKKoef planWorkItem2TKKoef) {
		try {
			planWorkItem2TKKoef.setDomain_info(null);

			ENPlanWorkItem2TKKoefDAO objectDAO = new ENPlanWorkItem2TKKoefDAO(connection, userProfile);

	      	///// 02.07.12 NET-2345 Запрет добавления более одного корректирующего коэффициента для работ на плане
			ENPlanWorkItem2TKKoefFilter koefFilter = new ENPlanWorkItem2TKKoefFilter();
			koefFilter.planWorkItemRef.code = planWorkItem2TKKoef.planWorkItemRef.code;
			ENPlanWorkItem2TKKoefShortList koefList = objectDAO.getScrollableFilteredList(koefFilter, 0, -1);

			if (koefList.totalCount > 0) {
				throw new EnergyproSystemException("\n"
						+ "NET-2345 Заборонено використовувати більше одного корегуючого коефіцієнта для роботи!");
			}
			/////

			int out = objectDAO.add(planWorkItem2TKKoef);

			new PlanWorkItemLogic(connection, userProfile).updateCoef(planWorkItem2TKKoef.planWorkItemRef.code);

			// время на людях ..
			new HumenLogic(connection, userProfile).recalcHumenItemsByPlanItemCode(planWorkItem2TKKoef.planWorkItemRef.code);

			return out;

		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	}


}
