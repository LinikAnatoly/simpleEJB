
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for SCSeal2ENWorkOrderByt;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAct2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENEstimateItem2ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderBytItemDAO;
import com.ksoe.energynet.dataminer.SCSeal2ENWorkOrderBytDAO;
import com.ksoe.energynet.dataminer.SCSealDAO;
import com.ksoe.energynet.ejb.generated.SCSeal2ENWorkOrderBytControllerEJBGen;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.SCLogic;
import com.ksoe.energynet.logic.WorkOrderLogic;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2ENPlanWork;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2Type;
import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENWorkOrderBytItem;
import com.ksoe.energynet.valueobject.ENWorkOrderBytStatus;
import com.ksoe.energynet.valueobject.SCSeal;
import com.ksoe.energynet.valueobject.SCSeal2ENWorkOrderByt;
import com.ksoe.energynet.valueobject.SCSeal2WorkOrderBytKind;
import com.ksoe.energynet.valueobject.SCSealLockType;
import com.ksoe.energynet.valueobject.SCSealStatus;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytItemFilter;
import com.ksoe.energynet.valueobject.filter.SCSeal2ENWorkOrderBytFilter;
import com.ksoe.energynet.valueobject.filter.SCSealFilter;
import com.ksoe.energynet.valueobject.lists.SCSeal2ENWorkOrderBytShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.valueobject.TKAccountingType;

public class SCSeal2ENWorkOrderBytControllerEJB extends
		SCSeal2ENWorkOrderBytControllerEJBGen {

	public SCSeal2ENWorkOrderBytControllerEJB() {
	}

	public SCSeal2ENWorkOrderBytShortList getSealsListForWorkOrderByt(int workOrderBytCode) {
		try {
			SCSeal2ENWorkOrderBytDAO objectDAO = new SCSeal2ENWorkOrderBytDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.getSealsListForWorkOrderByt(workOrderBytCode);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't getSealsListForWorkOrderByt",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public SCSeal2ENWorkOrderBytShortList getWorkOrderBytItemsForSealsBinding(int workOrderBytCode, int accountingTypeCode) {

		if (accountingTypeCode != TKAccountingType.SEAL &&
			accountingTypeCode != TKAccountingType.IMP &&
			accountingTypeCode != TKAccountingType.HOLO)
		{
			throw new SystemException("\n\nNET-4350 Невідомий тип об'єкту!");
		}

		try {
			SCSeal2ENWorkOrderBytDAO objectDAO = new SCSeal2ENWorkOrderBytDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.getWorkOrderBytItemsForSealsBinding(workOrderBytCode, accountingTypeCode);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't getWorkOrderBytItemsForSealsBinding",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/**
	 * Изменение привязки пломбы к плану
	 *
	 * @param scSeal2ENWorkOrderBytCode - код связки пломбы со сменным заданием
	 * @param estimateItemCodes - коды estimateItem'ов, к которым нужно привязать пломбу
	 *
	 **/
	public void rebindSeal(int scSeal2ENWorkOrderBytCode, String estimateItemCodes)
	{
		if (scSeal2ENWorkOrderBytCode == Integer.MIN_VALUE)
		{
			throw new SystemException("\n\nNET-4350 Не заданий код зв'язки змінного завдання з пломбою!");
		}

		if (estimateItemCodes == null)
		{
			throw new SystemException("\n\nNET-4350 У плані не знайдений перелік пломб! " +
					"[scSeal2ENWorkOrderBytCode = " + scSeal2ENWorkOrderBytCode + "]");
		}

		if (estimateItemCodes.trim().equals(""))
		{
			throw new SystemException("\n\nNET-4350 У плані не знайдений перелік пломб! " +
					"[scSeal2ENWorkOrderBytCode = " + scSeal2ENWorkOrderBytCode + "]");
		}

		try {
			SCSeal2ENWorkOrderBytDAO seal2WorkOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			SCSeal2ENWorkOrderByt seal2WorkOrderByt = seal2WorkOrderBytDAO.getObject(scSeal2ENWorkOrderBytCode);

			// Проверка статуса сменного задания
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			scLogic.checkWorkOrderBytForStatus(seal2WorkOrderByt.workOrderBytRef.code, ENWorkOrderBytStatus.COMPLETED, true);

			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSeal seal = sealDAO.getObject(seal2WorkOrderByt.sealRef.code);

			if (seal2WorkOrderByt.workOrderBytItemRef.code != Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4530 Пломбу з серійним номером " + seal.buildNumber + " вже прив'язано до плану!\n" +
						"Для прив'язки к іншому плану спочатку її потрібно перенести у реєстр невикористаних пломб!");
			}

			int workOrderBytCode = seal2WorkOrderByt.workOrderBytRef.code;

			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENEstimateItem2ENEstimateItemDAO ei2eiDAO = new ENEstimateItem2ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENAct2ENPlanWorkDAO act2planDAO = new ENAct2ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENActDAO actDAO = new ENActDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			WorkOrderLogic workOrderLogic = new WorkOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			ENEstimateItemFilter estimateItemFilter = new ENEstimateItemFilter();
			estimateItemFilter.conditionSQL =
				    " code in ( " +
				    "   select distinct ei.code " +
				    "   from " +
				    "     enestimateitem ei, enplanworkitem pi " +
				    "   where ei.planitemrefcode = pi.code " +
				    "     and pi.countgen > 0 " +
				    "     and ei.countfact > 0 " +
				    "     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
				    "     and ei.code in (" + estimateItemCodes + ")" +
				    " )";

			int[] estimateItemArr = estimateItemDAO.getFilteredCodeArray(estimateItemFilter, 0, -1);

			// int planCode = Integer.MIN_VALUE;

			for (int i = 0; i < estimateItemArr.length; i++)
			{
				/////
				ENEstimateItem estimateItem = estimateItemDAO.getObject(estimateItemArr[i]);

				//if (estimateItem.planRef.code != planCode) // чтобы не дергать план каждый раз
				//{
			        ENPlanWork plan = planDAO.getObjectNOSEGR(estimateItem.planRef.code);

			        if (plan == null)
			        {
			        	throw new SystemException("\n\nNET-4350 Не знайдено план з кодом " + estimateItem.planRef.code + " !");
			        }

			        if (plan.kind.code != ENPlanWorkKind.FACT || plan.status.code != ENPlanWorkStatus.GOOD)
			        {
			        	throw new SystemException("\n\nNET-4350 Змінювати прив'язку пломб дозволяється тільки на ЧОРНОВИХ ЗАВДАННЯХ-ФАКТАХ!\n" +
			        			"План з кодом " + plan.code + " не є чорновим Завданням-фактом!");
			        }
			        else
					{
						ENAct2ENPlanWorkFilter act2planFilter = new ENAct2ENPlanWorkFilter();
						act2planFilter.plan.code = plan.code;

						int[] act2planArr = act2planDAO.getFilteredCodeArray(act2planFilter, 0, -1);

						if (act2planArr.length > 0)
						{
							ENAct2ENPlanWork act2plan = act2planDAO.getObject(act2planArr[0]);
							ENAct act = actDAO.getObject(act2plan.actRef.code);

							if (act.statusRef.code != ENActStatus.GOOD)
							{
								throw new SystemException("\n\nNET-4530 Завдання-Факт, до якого прив'язується пломба, вже включено до акту, який не є чорновим!\n" +
										"Спочатку відмініть підписання акту!\n" +
										"Код Завдання-Факту: " + plan.code + ", № Акту: " + act.numberGen);
							}
						}
					}
				//}

				// Проверим, чтобы совпадал МОЛ, с которого мы резервируем пломбу, с тем, который у нас в наряд-задании на плане
				String finMolCode = workOrderLogic.getMasterCodeFromWorkOrderByPlanCode(plan.code, true);
				if (! seal.molCode.equals(finMolCode))
				{
					throw new SystemException("\n\nNET-4530 МВО, з якої резервуються пломби (" + seal.molCode +
							"), не співпадає з МВО на наряд-завданні в плані (" + finMolCode + ") !");
				}

				SCSealFilter sealFilter = new SCSealFilter();
				sealFilter.estimateItemRef.code = estimateItemArr[i];
				sealFilter.lockTypeRef.code = SCSealLockType.FOR_WORKORDERBYT;

				int[] sealsBoundArr = sealDAO.getFilteredCodeArray(sealFilter, 0, -1);
				/////

				int estimateItemCount = estimateItem.countFact.intValue();
				int estimateItemCount4Binding = estimateItemCount - sealsBoundArr.length;

				if (estimateItemCount4Binding <= 0)
				{
					continue;
				}

				ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();

				ENEstimateItem2ENEstimateItemFilter ei2eiFilter = new ENEstimateItem2ENEstimateItemFilter();
				ei2eiFilter.estimateItemOutRef.code = estimateItemArr[i];
				ei2eiFilter.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
				int[] ei2eiArr = ei2eiDAO.getFilteredCodeArray(ei2eiFilter, 0, -1);

				// 08.07.16 Возникают ситуации, когда работу с пломбами добавляют уже в Задание-Факт
				// (или могут просто добавить пломбы в работу в Задании-Факте)
				/*
				if (ei2eiArr.length == 0)
				{
					throw new SystemException("\n\nNET-4350 Для пломби у Завданні-Факті не знайдено відповідний матеріал у Завданні-Плані!\n" +
							" Код матеріала у Завданні-Факті: " + estimateItemArr[i]);
				}
				*/
				
				boolean firstTry = false;
				
				if (ei2eiArr.length > 0)
				{
					ENEstimateItem2ENEstimateItem ei2ei = ei2eiDAO.getObject(ei2eiArr[0]);
					int estimateItemCodeFromPlan = ei2ei.estimateItemInRef.code;

					workOrderBytItemFilter.conditionSQL =
				    		" code in ( " +
		    				"   select wbi.code " +
		    				"   from " +
		    				"     enestimateitem ei, enplanworkitem pi, " +
		    				"     enworkorderbytitem wbi " +
		    				"   where ei.planitemrefcode = pi.code " +
		    				"     and wbi.planitemrefcode = pi.code " +
		    				"     and wbi.workorderbytrefcode = " + workOrderBytCode +
		    				"     and ei.code = " + estimateItemCodeFromPlan +
						    " )";
					
					firstTry = true;
				}
				else
				{
					workOrderBytItemFilter.conditionSQL =
							" code in ( " +
							"   select wbi.code " +
							"   from " +
							"      ENWORKORDERBYTITEM wbi, " +
							"      enestimateitem ei, " +
							"      enplanwork plan, " +
							"      enplanwork fact, " +
							"      enplancorrecthistory ch " +
							"  where " +
							"      ei.code = " + estimateItemArr[i] +
							"      and ei.planrefcode = fact.code " +
							"      and wbi.planrefcode = plan.code " +
							"      and plan.code = ch.planoldrefcode " +
							"      and fact.code = ch.plannewrefcode " +
							"      and fact.statuscode = " + ENPlanWorkStatus.GOOD +
							"      and fact.code = " + plan.code +
							"      and ch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
							"      and wbi.workorderbytrefcode = " + workOrderBytCode +
							"      and ei.countfact > 0 " +
							" )";
				}

				int[] workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

				if (workOrderBytItemArr.length == 0)
				{
					// 05.10.2017 SUPP-66429 Если первый способ не помог, пробуем второй
					if (firstTry) 
					{
						workOrderBytItemFilter.conditionSQL =
								" code in ( " +
								"   select wbi.code " +
								"   from " +
								"      ENWORKORDERBYTITEM wbi, " +
								"      enestimateitem ei, " +
								"      enplanwork plan, " +
								"      enplanwork fact, " +
								"      enplancorrecthistory ch " +
								"  where " +
								"      ei.code = " + estimateItemArr[i] +
								"      and ei.planrefcode = fact.code " +
								"      and wbi.planrefcode = plan.code " +
								"      and plan.code = ch.planoldrefcode " +
								"      and fact.code = ch.plannewrefcode " +
								"      and fact.statuscode = " + ENPlanWorkStatus.GOOD +
								"      and fact.code = " + plan.code +
								"      and ch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
								"      and wbi.workorderbytrefcode = " + workOrderBytCode +
								"      and ei.countfact > 0 " +
								" )";
						
						workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);
						
						if (workOrderBytItemArr.length == 0)
						{
							throw new SystemException("\n\nNET-4530 Не знайдено строк змінного завдання з пломбами!");
						}
					} 
					else 
					{
						throw new SystemException("\n\nNET-4530 Не знайдено строк змінного завдання з пломбами!");	
					}
				}

				System.out.println("estimateItem " + estimateItemArr[i] + " - " +
						"seal " + seal.buildNumber);

				seal.estimateItemRef.code = estimateItemArr[i];
				seal.statusRef.code = SCSealStatus.GOOD;

				sealDAO.save(seal);

				seal2WorkOrderByt.workOrderBytItemRef.code = workOrderBytItemArr[0];
				seal2WorkOrderBytDAO.save(seal2WorkOrderByt);

				/////
				ENWorkOrderBytItem workOrderBytItem = workOrderBytItemDAO.getObject(workOrderBytItemArr[0]);

				if (workOrderBytItem == null)
				{
					throw new SystemException("\n\nNET-4530 Не знайдено строку змінного завдання з кодом " + workOrderBytItemArr[0] + " !");
				}

				if (workOrderBytItem.finWorker == null)
				{
					throw new SystemException("\n\nNET-4530 Не знайдено виконавця для строки змінного завдання з кодом " + workOrderBytItemArr[0] + " !");
				}

				// Апдейтим исполнителя на пломбе в ScanCounters
				scLogic.updateSealExecutor(seal.scCode, workOrderBytItem.finWorker.tabNumber, workOrderBytItem.finWorker.name);
				/////

				// После привязки сразу выходим, т.к. у нас заезжает для привязки только одна пломба
				return;

			}

			// Если дошло досюда, это значит, что уже все пломбы привязаны, и человек пытается привязать лишнюю пломбу
			throw new SystemException("\n\nNET-4530 На змінному завданні вже прив'язано необхідну кількість пломб!");

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't rebindSeal", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/**
	 * Изменение привязки пломбы к плану (для сменных заданий рейдовых бригад)
	 *
	 * @param scSeal2ENWorkOrderBytCode - код связки пломбы со сменным заданием
	 * @param estimateItemCodes - коды estimateItem'ов, к которым нужно привязать пломбу
	 *
	 **/
	public void rebindSealForRaid(int scSeal2ENWorkOrderBytCode, String estimateItemCodes, String accountNumber, String customerName)
	{
		if (scSeal2ENWorkOrderBytCode == Integer.MIN_VALUE)
		{
			throw new SystemException("\n\nNET-4350 Не заданий код зв'язки змінного завдання з пломбою!");
		}

		if (estimateItemCodes == null)
		{
			throw new SystemException("\n\nNET-4350 У плані не знайдений перелік пломб! " +
					"[scSeal2ENWorkOrderBytCode = " + scSeal2ENWorkOrderBytCode + "]");
		}

		if (estimateItemCodes.trim().equals(""))
		{
			throw new SystemException("\n\nNET-4350 У плані не знайдений перелік пломб! " +
					"[scSeal2ENWorkOrderBytCode = " + scSeal2ENWorkOrderBytCode + "]");
		}

		try {
			SCSeal2ENWorkOrderBytDAO seal2WorkOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			SCSeal2ENWorkOrderByt seal2WorkOrderByt = seal2WorkOrderBytDAO.getObject(scSeal2ENWorkOrderBytCode);

			// Проверка статуса сменного задания
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			scLogic.checkWorkOrderBytForStatus(seal2WorkOrderByt.workOrderBytRef.code, ENWorkOrderBytStatus.COMPLETED, true);

			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSeal seal = sealDAO.getObject(seal2WorkOrderByt.sealRef.code);

			if (seal2WorkOrderByt.workOrderBytItemRef.code != Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4530 Пломбу з серійним номером " + seal.buildNumber + " вже прив'язано до плану!\n" +
						"Для прив'язки к іншому плану спочатку її потрібно перенести у реєстр невикористаних пломб!");
			}

			int workOrderBytCode = seal2WorkOrderByt.workOrderBytRef.code;

			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENEstimateItem2ENEstimateItemDAO ei2eiDAO = new ENEstimateItem2ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENAct2ENPlanWorkDAO act2planDAO = new ENAct2ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENActDAO actDAO = new ENActDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			WorkOrderLogic workOrderLogic = new WorkOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			ENEstimateItemFilter estimateItemFilter = new ENEstimateItemFilter();
			estimateItemFilter.conditionSQL =
				    " code in ( " +
				    "   select distinct ei.code " +
				    "   from " +
				    "     enestimateitem ei, enplanworkitem pi " +
				    "   where ei.planitemrefcode = pi.code " +
				    "     and pi.countgen > 0 " +
				    "     and ei.countfact > 0 " +
				    "     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
				    "     and ei.code in (" + estimateItemCodes + ")" +
				    " )";

			int[] estimateItemArr = estimateItemDAO.getFilteredCodeArray(estimateItemFilter, 0, -1);

			// int planCode = Integer.MIN_VALUE;

			for (int i = 0; i < estimateItemArr.length; i++)
			{
				/////
				ENEstimateItem estimateItem = estimateItemDAO.getObject(estimateItemArr[i]);

				//if (estimateItem.planRef.code != planCode) // чтобы не дергать план каждый раз
				//{
			        ENPlanWork plan = planDAO.getObjectNOSEGR(estimateItem.planRef.code);

			        if (plan == null)
			        {
			        	throw new SystemException("\n\nNET-4350 Не знайдено план з кодом " + estimateItem.planRef.code + " !");
			        }

			        if (plan.kind.code != ENPlanWorkKind.FACT || plan.status.code != ENPlanWorkStatus.GOOD)
			        {
			        	throw new SystemException("\n\nNET-4350 Змінювати прив'язку пломб дозволяється тільки на ЧОРНОВИХ ЗАВДАННЯХ-ФАКТАХ!\n" +
			        			"План з кодом " + plan.code + " не є чорновим Завданням-фактом!");
			        }
			        else
					{
						ENAct2ENPlanWorkFilter act2planFilter = new ENAct2ENPlanWorkFilter();
						act2planFilter.plan.code = plan.code;

						int[] act2planArr = act2planDAO.getFilteredCodeArray(act2planFilter, 0, -1);

						if (act2planArr.length > 0)
						{
							ENAct2ENPlanWork act2plan = act2planDAO.getObject(act2planArr[0]);
							ENAct act = actDAO.getObject(act2plan.actRef.code);

							if (act.statusRef.code != ENActStatus.GOOD)
							{
								throw new SystemException("\n\nNET-4530 Завдання-Факт, до якого прив'язується пломба, вже включено до акту, який не є чорновим!\n" +
										"Спочатку відмініть підписання акту!\n" +
										"Код Завдання-Факту: " + plan.code + ", № Акту: " + act.numberGen);
							}
						}
					}
				//}

				// Проверим, чтобы совпадал МОЛ, с которого мы резервируем пломбу, с тем, который у нас в наряд-задании на плане
				String finMolCode = workOrderLogic.getMasterCodeFromWorkOrderByPlanCode(plan.code, true);
				if (! seal.molCode.equals(finMolCode))
				{
					throw new SystemException("\n\nNET-4530 МВО, з якої резервуються пломби (" + seal.molCode +
							"), не співпадає з МВО на наряд-завданні в плані (" + finMolCode + ") !");
				}

				SCSealFilter sealFilter = new SCSealFilter();
				sealFilter.estimateItemRef.code = estimateItemArr[i];
				sealFilter.lockTypeRef.code = SCSealLockType.FOR_WORKORDERBYT;

				int[] sealsBoundArr = sealDAO.getFilteredCodeArray(sealFilter, 0, -1);
				/////

				int estimateItemCount = estimateItem.countFact.intValue();
				int estimateItemCount4Binding = estimateItemCount - sealsBoundArr.length;

				if (estimateItemCount4Binding <= 0)
				{
					continue;
				}

				ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();

				ENEstimateItem2ENEstimateItemFilter ei2eiFilter = new ENEstimateItem2ENEstimateItemFilter();
				ei2eiFilter.estimateItemOutRef.code = estimateItemArr[i];
				ei2eiFilter.typeRef.code = ENEstimateItem2Type.PLAN_MOVED;
				int[] ei2eiArr = ei2eiDAO.getFilteredCodeArray(ei2eiFilter, 0, -1);

				// 08.07.16 Возникают ситуации, когда работу с пломбами добавляют уже в Задание-Факт
				// (или могут просто добавить пломбы в работу в Задании-Факте)
				/*
				if (ei2eiArr.length == 0)
				{
					throw new SystemException("\n\nNET-4350 Для пломби у Завданні-Факті не знайдено відповідний матеріал у Завданні-Плані!\n" +
							" Код матеріала у Завданні-Факті: " + estimateItemArr[i]);
				}
				*/
				if (ei2eiArr.length > 0)
				{
					ENEstimateItem2ENEstimateItem ei2ei = ei2eiDAO.getObject(ei2eiArr[0]);
					int estimateItemCodeFromPlan = ei2ei.estimateItemInRef.code;

					workOrderBytItemFilter.conditionSQL =
				    		" code in ( " +
		    				"   select wbi.code " +
		    				"   from " +
		    				"     enestimateitem ei, enplanworkitem pi, " +
		    				"     enworkorderbytitem wbi " +
		    				"   where ei.planitemrefcode = pi.code " +
		    				"     and wbi.planitemrefcode = pi.code " +
		    				"     and wbi.workorderbytrefcode = " + workOrderBytCode +
		    				"     and ei.code = " + estimateItemCodeFromPlan +
						    " )";
				}
				else
				{
					workOrderBytItemFilter.conditionSQL =
							" code in ( " +
							"   select wbi.code " +
							"   from " +
							"      ENWORKORDERBYTITEM wbi, " +
							"      enestimateitem ei, " +
							"      enplanwork plan, " +
							"      enplanwork fact, " +
							"      enplancorrecthistory ch " +
							"  where " +
							"      ei.code = " + estimateItemArr[i] +
							"      and ei.planrefcode = fact.code " +
							"      and wbi.planrefcode = plan.code " +
							"      and plan.code = ch.planoldrefcode " +
							"      and fact.code = ch.plannewrefcode " +
							"      and fact.statuscode = " + ENPlanWorkStatus.GOOD +
							"      and fact.code = " + plan.code +
							"      and ch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
							"      and wbi.workorderbytrefcode = " + workOrderBytCode +
							"      and ei.countfact > 0 " +
							" )";
				}

				workOrderBytItemFilter.accountNumber = accountNumber;
				workOrderBytItemFilter.customerName = customerName;

				int[] workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

				if (workOrderBytItemArr.length == 0)
				{
					throw new SystemException("\n\nNET-4530 Не знайдено строк змінного завдання з пломбами!");
				}

				System.out.println("estimateItem " + estimateItemArr[i] + " - " +
						"seal " + seal.buildNumber);

				seal.estimateItemRef.code = estimateItemArr[i];
				seal.statusRef.code = SCSealStatus.GOOD;

				sealDAO.save(seal);

				seal2WorkOrderByt.workOrderBytItemRef.code = workOrderBytItemArr[0];
				seal2WorkOrderBytDAO.save(seal2WorkOrderByt);

				/////
				ENWorkOrderBytItem workOrderBytItem = workOrderBytItemDAO.getObject(workOrderBytItemArr[0]);

				if (workOrderBytItem == null)
				{
					throw new SystemException("\n\nNET-4530 Не знайдено строку змінного завдання з кодом " + workOrderBytItemArr[0] + " !");
				}

				if (workOrderBytItem.finWorker == null)
				{
					throw new SystemException("\n\nNET-4530 Не знайдено виконавця для строки змінного завдання з кодом " + workOrderBytItemArr[0] + " !");
				}

				// Апдейтим исполнителя на пломбе в ScanCounters
				scLogic.updateSealExecutor(seal.scCode, workOrderBytItem.finWorker.tabNumber, workOrderBytItem.finWorker.name);
				/////

				// После привязки сразу выходим, т.к. у нас заезжает для привязки только одна пломба
				return;

			}

			// Если дошло досюда, это значит, что уже все пломбы привязаны, и человек пытается привязать лишнюю пломбу
			throw new SystemException("\n\nNET-4530 На змінному завданні вже прив'язано необхідну кількість пломб!");

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't rebindSealForRaid", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}



	/**
	 * Перенос пломбы в реестр неиспользованных пломб
	 *
	 * @param scSeal2ENWorkOrderBytCode - код связки пломбы со сменным заданием
	 *
	 **/
	public void moveSealToUnused(int scSeal2ENWorkOrderBytCode)
	{
		try {
			SCSeal2ENWorkOrderBytDAO seal2WorkOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			SCSeal2ENWorkOrderByt seal2WorkOrderByt = seal2WorkOrderBytDAO.getObject(scSeal2ENWorkOrderBytCode);

			// Проверка статуса сменного задания
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			scLogic.checkWorkOrderBytForStatus(seal2WorkOrderByt.workOrderBytRef.code, ENWorkOrderBytStatus.COMPLETED, true);

			// Убираем в связке ссылку на строку Сменного задания
			seal2WorkOrderByt.workOrderBytItemRef.code = Integer.MIN_VALUE;
			seal2WorkOrderBytDAO.save(seal2WorkOrderByt);

			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			SCSeal seal = sealDAO.getObject(seal2WorkOrderByt.sealRef.code);

			// Проверим, чтобы пломбу вдруг не успели установить в биллинге (или еще что-то сделать с ней)!!!
			if (seal.statusRef.code == SCSealStatus.INSTALLED)
			{
				throw new SystemException("\n\nNET-4530 Пломба № " + seal.buildNumber + " вже встановлена у білінгу!");
			}

			if (seal.statusRef.code != SCSealStatus.GOOD && seal.statusRef.code != SCSealStatus.SPOILED)
			{
				throw new SystemException("\n\nNET-4530 Пломба № " + seal.buildNumber + " має неприпустимий статус (" +
						seal.statusRef.code + ") для цієї операції!");
			}

			/////
			// Проверим, чтобы пломба не была включена в уже утвержденный Факт или в подписанный Акт
			PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENPlanWork plan = planLogic.getPlanBySeal(seal);

			if (plan != null)
			{
				if (plan.code == Integer.MIN_VALUE)
				{
					throw new SystemException("\n\nNET-4530 Помилка пошуку плану! Код пломби (scseal.code): " + seal.code);
				}

		        if (plan.kind.code != ENPlanWorkKind.FACT || plan.status.code != ENPlanWorkStatus.GOOD)
		        {
		        	throw new SystemException("\n\nNET-4350 Змінювати прив'язку пломб дозволяється тільки на ЧОРНОВИХ ЗАВДАННЯХ-ФАКТАХ!\n" +
		        			"План з кодом " + plan.code + " не є чорновим Завданням-фактом!");
		        }
				else
				{
					ENAct2ENPlanWorkDAO act2planDAO = new ENAct2ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
					ENActDAO actDAO = new ENActDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

					ENAct2ENPlanWorkFilter act2planFilter = new ENAct2ENPlanWorkFilter();
					act2planFilter.plan.code = plan.code;

					int[] act2planArr = act2planDAO.getFilteredCodeArray(act2planFilter, 0, -1);

					if (act2planArr.length > 0)
					{
						ENAct2ENPlanWork act2plan = act2planDAO.getObject(act2planArr[0]);
						ENAct act = actDAO.getObject(act2plan.actRef.code);

						if (act.statusRef.code != ENActStatus.GOOD)
						{
							throw new SystemException("\n\nNET-4530 Цю пломбу вже включено до акту, який не є чорновим!\n" +
									"Спочатку відмініть підписання акту!\n" +
									"Код Завдання-Факту: " + plan.code + ", № Акту: " + act.numberGen);
						}
					}
				}
			}
			/////

			// Проверим бух. счет пломбы в ScanCounters
			scLogic.checkSealSCAccount(seal.scCode, "2013", "Цю пломбу не можна переносити в перелік невикористаних!");

			// У пломбы убираем ссылку на эстимейт, а статус меняем на "Діюча" (на случай, если она была в реестре испорченных)
			seal.statusRef.code = SCSealStatus.GOOD;
			seal.estimateItemRef.code = Integer.MIN_VALUE;
			sealDAO.save(seal);

			/////
			// Нужно найти такую же пломбу на Задании-Плане и отвязать ее от плана (вместе со связками)
			SCSealFilter scSealFilter = new SCSealFilter();
			scSealFilter.scCode = seal.scCode;
			scSealFilter.conditionSQL =
					" code in " +
					" ( " +
					"   select s1.code " +
					"   from " +
					"     scseal s, scseal s1, " +
					"     scseal2enworkorderbyt swb, scseal2enworkorderbyt swb1 " +
					"   where swb.sealrefcode = s.code " +
					"     and swb.workorderbytrefcode = " + seal2WorkOrderByt.workOrderBytRef.code +
					"     and s.sccode = " + seal.scCode +
					"     and swb.kindrefcode = " + SCSeal2WorkOrderBytKind.FACT +
					"     and swb1.sealrefcode = s1.code " +
					"     and swb1.workorderbytrefcode = swb.workorderbytrefcode " +
					"     and swb1.kindrefcode = " + SCSeal2WorkOrderBytKind.PLAN +
					"     and s1.sccode = s.sccode " +
					" ) ";

			int[] scSealArr = sealDAO.getFilteredCodeArray(scSealFilter, 0, -1);

			for (int i = 0; i < scSealArr.length; i++)
			{
				SCSeal2ENWorkOrderBytFilter seal2workOrderBytPlanFilter = new SCSeal2ENWorkOrderBytFilter();
				seal2workOrderBytPlanFilter.sealRef.code = scSealArr[i];
				seal2workOrderBytPlanFilter.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
				seal2workOrderBytPlanFilter.workOrderBytRef.code = seal2WorkOrderByt.workOrderBytRef.code;

				int[] seal2workOrderBytPlanArr = seal2WorkOrderBytDAO.getFilteredCodeArray(seal2workOrderBytPlanFilter, 0, -1);

				for (int s = 0; s < seal2workOrderBytPlanArr.length; s++)
				{
					// Убираем в связке ссылку на строку Сменного задания
					SCSeal2ENWorkOrderByt seal2WorkOrderBytPlan = seal2WorkOrderBytDAO.getObject(seal2workOrderBytPlanArr[s]);
					seal2WorkOrderBytPlan.workOrderBytItemRef.code = Integer.MIN_VALUE;
					seal2WorkOrderBytDAO.save(seal2WorkOrderBytPlan);
				}

				// У пломбы убираем ссылку на эстимейт, а статус меняем на "Діюча" (на случай, если она была в реестре испорченных)
				SCSeal sealPlan = sealDAO.getObject(scSealArr[i]);
				sealPlan.statusRef.code = SCSealStatus.GOOD;
				sealPlan.estimateItemRef.code = Integer.MIN_VALUE;
				sealDAO.save(sealPlan);
			}
			/////

			// Убираем исполнителя на пломбе в ScanCounters
			scLogic.updateSealExecutor(seal.scCode, null, null);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't moveSealToUnused", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/**
	 * Перенос пломбы в реестр испорченных пломб
	 *
	 * @param scSeal2ENWorkOrderBytCode - код связки пломбы со сменным заданием
	 *
	 **/
	public void moveSealToSpoiled(int scSeal2ENWorkOrderBytCode)
	{
		try {
			SCSeal2ENWorkOrderBytDAO seal2WorkOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


			SCSeal2ENWorkOrderByt seal2WorkOrderByt = seal2WorkOrderBytDAO.getObject(scSeal2ENWorkOrderBytCode);

			// Проверка статуса сменного задания
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			scLogic.checkWorkOrderBytForStatus(seal2WorkOrderByt.workOrderBytRef.code, ENWorkOrderBytStatus.COMPLETED, true);

			// Убираем в связке ссылку на строку Сменного задания
			seal2WorkOrderByt.workOrderBytItemRef.code = Integer.MIN_VALUE;
			seal2WorkOrderBytDAO.save(seal2WorkOrderByt);

			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			SCSeal seal = sealDAO.getObject(seal2WorkOrderByt.sealRef.code);

			// Проверим, чтобы пломбу вдруг не успели установить в биллинге (или еще что-то сделать с ней)!!!
			if (seal.statusRef.code == SCSealStatus.INSTALLED)
			{
				throw new SystemException("\n\nNET-4530 Пломба № " + seal.buildNumber + " вже встановлена у білінгу!");
			}

			if (seal.statusRef.code != SCSealStatus.GOOD)
			{
				throw new SystemException("\n\nNET-4530 Пломба № " + seal.buildNumber + " має неприпустимий статус (" +
						seal.statusRef.code + ") для цієї операції!");
			}

			/////
			// Проверим, чтобы пломба не была включена в уже утвержденный Факт или в подписанный Акт
			PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENPlanWork plan = planLogic.getPlanBySeal(seal);

			if (plan != null)
			{
				if (plan.code == Integer.MIN_VALUE)
				{
					throw new SystemException("\n\nNET-4530 Помилка пошуку плану! Код пломби (scseal.code): " + seal.code);
				}

		        if (plan.kind.code != ENPlanWorkKind.FACT || plan.status.code != ENPlanWorkStatus.GOOD)
		        {
		        	throw new SystemException("\n\nNET-4350 Змінювати прив'язку пломб дозволяється тільки на ЧОРНОВИХ ЗАВДАННЯХ-ФАКТАХ!\n" +
		        			"План з кодом " + plan.code + " не є чорновим Завданням-фактом!");
		        }
				else
				{
					ENAct2ENPlanWorkDAO act2planDAO = new ENAct2ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
					ENActDAO actDAO = new ENActDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

					ENAct2ENPlanWorkFilter act2planFilter = new ENAct2ENPlanWorkFilter();
					act2planFilter.plan.code = plan.code;

					int[] act2planArr = act2planDAO.getFilteredCodeArray(act2planFilter, 0, -1);

					if (act2planArr.length > 0)
					{
						ENAct2ENPlanWork act2plan = act2planDAO.getObject(act2planArr[0]);
						ENAct act = actDAO.getObject(act2plan.actRef.code);

						if (act.statusRef.code != ENActStatus.GOOD)
						{
							throw new SystemException("\n\nNET-4530 Цю пломбу вже включено до акту, який не є чорновим!\n" +
									"Спочатку відмініть підписання акту!\n" +
									"Код Завдання-Факту: " + plan.code + ", № Акту: " + act.numberGen);
						}
					}
				}
			}
			/////

			// Проверим бух. счет пломбы в ScanCounters
			scLogic.checkSealSCAccount(seal.scCode, "2013", "Цю пломбу не можна переносити в перелік зіпсованих!");

			// У пломбы убираем ссылку на эстимейт, а статус меняем на "Зіпсована"
			seal.statusRef.code = SCSealStatus.SPOILED;
			seal.estimateItemRef.code = Integer.MIN_VALUE;
			sealDAO.save(seal);

			/////
			// Нужно найти такую же пломбу на Задании-Плане и отвязать ее от плана (вместе со связками)
			SCSealFilter scSealFilter = new SCSealFilter();
			scSealFilter.scCode = seal.scCode;
			scSealFilter.conditionSQL =
					" code in " +
					" ( " +
					"   select s1.code " +
					"   from " +
					"     scseal s, scseal s1, " +
					"     scseal2enworkorderbyt swb, scseal2enworkorderbyt swb1 " +
					"   where swb.sealrefcode = s.code " +
					"     and swb.workorderbytrefcode = " + seal2WorkOrderByt.workOrderBytRef.code +
					"     and s.sccode = " + seal.scCode +
					"     and swb.kindrefcode = " + SCSeal2WorkOrderBytKind.FACT +
					"     and swb1.sealrefcode = s1.code " +
					"     and swb1.workorderbytrefcode = swb.workorderbytrefcode " +
					"     and swb1.kindrefcode = " + SCSeal2WorkOrderBytKind.PLAN +
					"     and s1.sccode = s.sccode " +
					" ) ";

			int[] scSealArr = sealDAO.getFilteredCodeArray(scSealFilter, 0, -1);

			for (int i = 0; i < scSealArr.length; i++)
			{
				SCSeal2ENWorkOrderBytFilter seal2workOrderBytPlanFilter = new SCSeal2ENWorkOrderBytFilter();
				seal2workOrderBytPlanFilter.sealRef.code = scSealArr[i];
				seal2workOrderBytPlanFilter.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
				seal2workOrderBytPlanFilter.workOrderBytRef.code = seal2WorkOrderByt.workOrderBytRef.code;

				int[] seal2workOrderBytPlanArr = seal2WorkOrderBytDAO.getFilteredCodeArray(seal2workOrderBytPlanFilter, 0, -1);

				for (int s = 0; s < seal2workOrderBytPlanArr.length; s++)
				{
					// Убираем в связке ссылку на строку Сменного задания
					SCSeal2ENWorkOrderByt seal2WorkOrderBytPlan = seal2WorkOrderBytDAO.getObject(seal2workOrderBytPlanArr[s]);
					seal2WorkOrderBytPlan.workOrderBytItemRef.code = Integer.MIN_VALUE;
					seal2WorkOrderBytDAO.save(seal2WorkOrderBytPlan);
				}

				// У пломбы убираем ссылку на эстимейт, а статус меняем на "Зіпсована"
				SCSeal sealPlan = sealDAO.getObject(scSealArr[i]);
				sealPlan.statusRef.code = SCSealStatus.SPOILED;
				sealPlan.estimateItemRef.code = Integer.MIN_VALUE;
				sealDAO.save(sealPlan);
			}
			/////

			// Убираем исполнителя на пломбе в ScanCounters
			scLogic.updateSealExecutor(seal.scCode, null, null);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't moveSealToSpoiled", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for SCSeal2ENWorkOrderByt