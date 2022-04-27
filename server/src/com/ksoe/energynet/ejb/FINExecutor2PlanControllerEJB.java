//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for FINExecutor2Plan;
 *
 */

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.FINExecutor2PlanDAO;
import com.ksoe.energynet.dataminer.FINExecutorDAO;
import com.ksoe.energynet.ejb.generated.FINExecutor2PlanControllerEJBGen;
import com.ksoe.energynet.logic.FINExecutorLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.FINExecutor;
import com.ksoe.energynet.valueobject.FINExecutor2Plan;
import com.ksoe.energynet.valueobject.FINExecutorType;
import com.ksoe.energynet.valueobject.filter.FINExecutor2PlanFilter;
import com.ksoe.energynet.valueobject.lists.FINExecutor2PlanShortList;
import com.ksoe.energynet.valueobject.references.FINExecutorTypeRef;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class FINExecutor2PlanControllerEJB extends
		FINExecutor2PlanControllerEJBGen {

	public FINExecutor2PlanControllerEJB() {
	}

	/* FINExecutor2Plan. Добавить */
	public int add(FINExecutor2Plan object) {
		try {
			FINExecutor2PlanDAO objectDAO = new FINExecutor2PlanDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			FINExecutorDAO finExecutorDAO = new FINExecutorDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			FINExecutorLogic logic = new FINExecutorLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			if (object.finExecutorTypeRef == null)
			{
				object.finExecutorTypeRef = new FINExecutorTypeRef();
				object.finExecutorTypeRef.code = FINExecutorType.ADDITIONAL;
			}
			else
			{
				if (object.finExecutorTypeRef.code == FINExecutorType.PRIMARY)
				{
					throw new EnergyproSystemException("\n \n Основний виконавець додається з вкладки \"Основне\" на плані!");
				}
				if (object.finExecutorTypeRef.code == Integer.MIN_VALUE)
				{
					object.finExecutorTypeRef.code = FINExecutorType.ADDITIONAL;
				}
			}

			PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			
			///// Проверка, чтобы по 2 раза не добавляли одного и того же исполнителя в план
			FINExecutor2PlanFilter f2pFilter = new FINExecutor2PlanFilter();
			f2pFilter.planRef.code = object.planRef.code;
			FINExecutor2PlanShortList f2pList = objectDAO.getScrollableFilteredList(f2pFilter, 0, -1);

			for (int i = 0; i < f2pList.totalCount; i++)
			{
            	///// MDAX-441
        		boolean isFinExecutorsEqual = 
        			planLogic.compareFinExecutorsByCodes(object.finExecutor.axOrgId, f2pList.get(i).finExecutorAxOrgId, 
            											 object.finExecutor.finCode, f2pList.get(i).finExecutorFinCode);
            	/////
            	
				//if (object.finExecutor.finCode == f2pList.get(i).finExecutorFinCode)
        		//if (isFinCodesEqual || isAXOrgIdsEqual)
        		if (isFinExecutorsEqual)
				{
					throw new EnergyproSystemException("\n \n Цей виконавець вже є на плані! \n" +
							" Якщо необхідно, змінюйте його параметри, замість додавання нового!");
				}
			}
			/////

			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWork plan = planDAO.getObject(object.planRef.code);

			///////
			// Проверка, чтобы дата начала выполнения работ для бригады попадала в месяц плана
			Date dateStart, planMonthStart, planMonthFinish;
			dateStart = Tools.clearTimeOfDate(object.dateStart);

			Calendar calendar = Calendar.getInstance();
			calendar.set(Calendar.YEAR, plan.yearGen);
			calendar.set(Calendar.MONTH, plan.monthGen - 1);
			calendar.set(Calendar.DATE, 1);
			planMonthStart = Tools.clearTimeOfDate(calendar.getTime());

			if (dateStart.before(planMonthStart))
			{
				throw new EnergyproSystemException("\n \n Дата початку виконання робіт для виконавця повинна бути в межах " +
						plan.monthGen + " місяця " + plan.yearGen + " року !");
			}

			Calendar calendar_2 = Calendar.getInstance();
			calendar_2.set(Calendar.YEAR, plan.yearGen);
			calendar_2.set(Calendar.MONTH, plan.monthGen - 1);
			calendar_2.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
			planMonthFinish = Tools.clearTimeOfDate(calendar_2.getTime());

			if (dateStart.after(planMonthFinish))
			{
				throw new EnergyproSystemException("\n \n Дата початку виконання робіт для виконавця повинна бути в межах " +
						plan.monthGen + " місяця " + plan.yearGen + " року !");
			}
			///////

			//////////////////////////////
			// Если на плане есть исполнитель, а в нашу связку он еще не заехал (такое будет для старых планов),
			// накинем автоматом основного исполнителя в связку (копия из плана)
			FINExecutor2PlanFilter finExecutor2PlanFilter = new FINExecutor2PlanFilter();
			finExecutor2PlanFilter.planRef.code = object.planRef.code;
			finExecutor2PlanFilter.finExecutorTypeRef.code = FINExecutorType.PRIMARY;
			int[] finExecutor2PlanArr = objectDAO.getFilteredCodeArray(finExecutor2PlanFilter, 0, -1);

			if (finExecutor2PlanArr.length == 0)
			{
				if (plan.finExecutor == null)
				{
					throw new EnergyproSystemException("\n \n Спочатку потрібно вказати основного виконавця плану - на вкладці \"Основне\" на плані!");
				}

				if (plan.finExecutor.code == Integer.MIN_VALUE)
				{
					throw new EnergyproSystemException("\n \n Спочатку потрібно вказати основного виконавця плану - на вкладці \"Основне\" на плані!");
				}

				FINExecutor f = new FINExecutor();
				f.finCode = plan.finExecutor.finCode;
				f.name =  plan.finExecutor.name;
				f.finCehCode = plan.finExecutor.finCehCode;
				f.finCehName = plan.finExecutor.finCehName;
				f.finKindCode = plan.finExecutor.finKindCode;
				f.finKindName = plan.finExecutor.finKindName;
				f.finTypeCode = plan.finExecutor.finTypeCode;
				f.finTypeName = plan.finExecutor.finTypeName;
                ///// MDAX-441
                f.axOrgId = plan.finExecutor.axOrgId;
                f.axParentOrgId = plan.finExecutor.axParentOrgId;
                f.axParentOrgName = plan.finExecutor.axParentOrgName;
                f.axOrgTypeId = plan.finExecutor.axOrgTypeId;
                f.axOrgTypeName = plan.finExecutor.axOrgTypeName;
                /////				
                logic.checkFinExecutorHasPersonal(plan.dateStart, f);
                
				int fCode = finExecutorDAO.add(f);

				FINExecutor2Plan executor2Plan = new FINExecutor2Plan();
				executor2Plan.code = Integer.MIN_VALUE;
				executor2Plan.finExecutorTypeRef.code = FINExecutorType.PRIMARY;
				executor2Plan.planRef.code = object.planRef.code;
				executor2Plan.finExecutor.code = fCode;
				executor2Plan.dateStart = plan.dateStart;
				executor2Plan.dateFinal = plan.dateFinal;
				executor2Plan.percentLoad = new BigDecimal(100);
				executor2Plan.budgetRef.code = plan.budgetRef.code;

				objectDAO.add(executor2Plan);
			}
			//////////////////////////////

			logic.checkFinExecutorHasPersonal(plan.dateFinal, object.finExecutor);
			int finExecutorCode = finExecutorDAO.add(object.finExecutor);
			object.finExecutor.code = finExecutorCode;

			object.dateEdit = new Date();
			object.userGen = getUserProfile().userName;

			int newObjectCode = objectDAO.add(object);

			// Пересчитаем проценты загрузки исполнителей
			//PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			//planLogic.recalcFinExecutorsPercentLoad(object.planRef.code);
			planLogic.recalcTotalTime(object.planRef.code);

			return newObjectCode;

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.FINExecutor2Plan%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* FINExecutor2Plan. Удалить */
	public void remove(int code) {
		try {
			FINExecutor2PlanDAO objectDAO = new FINExecutor2PlanDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			FINExecutor2Plan object = objectDAO.getObject(code);
			if (object.finExecutorTypeRef.code == FINExecutorType.PRIMARY) {
				throw new EnergyproSystemException(
						"\n \n Заборонено видаляти основного виконавця плану!!!");
			}

			objectDAO.remove(code);

			// Пересчитаем проценты загрузки исполнителей
			PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			//planLogic.recalcFinExecutorsPercentLoad(object.planRef.code);
			planLogic.recalcTotalTime(object.planRef.code);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.FINExecutor2Plan%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* FINExecutor2Plan. Изменить */
	public void save(FINExecutor2Plan object) {
		try {
			FINExecutor2PlanDAO objectDAO = new FINExecutor2PlanDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			FINExecutorLogic logic = new FINExecutorLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			FINExecutor2Plan oldObject = objectDAO.getObject(object.code);

			if (object.finExecutorTypeRef.code != oldObject.finExecutorTypeRef.code) {
				throw new EnergyproSystemException("\n \n Заборонено змінювати тип виконавця!");
			}

			if (object.percentLoad.doubleValue() != oldObject.percentLoad.doubleValue())
			{
				if (object.finExecutorTypeRef.code == FINExecutorType.PRIMARY)
				{
					throw new EnergyproSystemException("\n \n Для основного виконавця відсоток завантаження перераховується автоматично! "+
							"\n Змінюйте його для додаткових виконавців!");
				}
			}

			PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			
			///// Проверка, чтобы по 2 раза не добавляли одного и того же исполнителя в план
			FINExecutor2PlanFilter f2pFilter = new FINExecutor2PlanFilter();
			f2pFilter.planRef.code = object.planRef.code;
			f2pFilter.conditionSQL = "FINEXECUTOR2PLAN.CODE <> " + object.code;
			FINExecutor2PlanShortList f2pList = objectDAO.getScrollableFilteredList(f2pFilter, 0, -1);

			for (int i = 0; i < f2pList.totalCount; i++)
			{
            	///// MDAX-441
        		boolean isFinExecutorsEqual = 
        			planLogic.compareFinExecutorsByCodes(object.finExecutor.axOrgId, f2pList.get(i).finExecutorAxOrgId, 
            											 object.finExecutor.finCode, f2pList.get(i).finExecutorFinCode);
            	/////
            	
				//if (object.finExecutor.finCode == f2pList.get(i).finExecutorFinCode)
        		//if (isFinCodesEqual || isAXOrgIdsEqual)
        		if (isFinExecutorsEqual)
				{
					throw new EnergyproSystemException("\n \n Цей виконавець вже є на плані! \n" +
							" Якщо необхідно, змінюйте його параметри, замість додавання нового!");
				}
			}
			/////

			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWork plan = planDAO.getObject(object.planRef.code);

			///////
			// Проверка, чтобы дата начала выполнения работ для бригады попадала в месяц плана
			Date dateStart, planMonthStart, planMonthFinish;
			dateStart = Tools.clearTimeOfDate(object.dateStart);

			Calendar calendar = Calendar.getInstance();
			calendar.set(Calendar.YEAR, plan.yearGen);
			calendar.set(Calendar.MONTH, plan.monthGen - 1);
			calendar.set(Calendar.DATE, 1);
			planMonthStart = Tools.clearTimeOfDate(calendar.getTime());

			if (dateStart.before(planMonthStart))
			{
				throw new EnergyproSystemException("\n \n Дата початку виконання робіт для виконавця повинна бути в межах " +
						plan.monthGen + " місяця " + plan.yearGen + " року !");
			}

			Calendar calendar_2 = Calendar.getInstance();
			calendar_2.set(Calendar.YEAR, plan.yearGen);
			calendar_2.set(Calendar.MONTH, plan.monthGen - 1);
			calendar_2.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
			planMonthFinish = Tools.clearTimeOfDate(calendar_2.getTime());

			if (dateStart.after(planMonthFinish))
			{
				throw new EnergyproSystemException("\n \n Дата початку виконання робіт для виконавця повинна бути в межах " +
						plan.monthGen + " місяця " + plan.yearGen + " року !");
			}
			///////

			FINExecutorDAO finExecutorDAO = new FINExecutorDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			/*
			if (object.finExecutor.code == Integer.MIN_VALUE) {
				FINExecutor f = new FINExecutor();
				f.finCode = object.finExecutor.finCode;
				f.name = object.finExecutor.name;
				f.finCehCode = object.finExecutor.finCehCode;
				f.finCehName = object.finExecutor.finCehName;
				f.finKindCode = object.finExecutor.finKindCode;
				f.finKindName = object.finExecutor.finKindName;
				f.finTypeCode = object.finExecutor.finTypeCode;
				f.finTypeName = object.finExecutor.finTypeName;
				f.code = new FINExecutorDAO(
						getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
						getUserProfile()).add(f);
				object.finExecutor.code = f.code;
			}
			*/

			// Код сбрасывается в Integer.MIN_VALUE на клиенте при выборе исполнителя
			if (object.finExecutor.code == Integer.MIN_VALUE)
			{
				FINExecutor f = null;

				// Если уже есть FINExecutor, пересохраним его, чтобы не плодить записи в базе
				if (oldObject.finExecutor.code > Integer.MIN_VALUE)
				{
					f = finExecutorDAO.getObject(oldObject.finExecutor.code);
				}
				else
				{
					f = new FINExecutor();
					f.code = Integer.MIN_VALUE;
				}

				f.finCode = object.finExecutor.finCode;
				f.name = object.finExecutor.name;
				f.finCehCode = object.finExecutor.finCehCode;
				f.finCehName = object.finExecutor.finCehName;
				f.finKindCode = object.finExecutor.finKindCode;
				f.finKindName = object.finExecutor.finKindName;
				f.finTypeCode = object.finExecutor.finTypeCode;
				f.finTypeName = object.finExecutor.finTypeName;
                ///// MDAX-441
                f.axOrgId = object.finExecutor.axOrgId;
                f.axParentOrgId = object.finExecutor.axParentOrgId;
                f.axParentOrgName = object.finExecutor.axParentOrgName;
                f.axOrgTypeId = object.finExecutor.axOrgTypeId;
                f.axOrgTypeName = object.finExecutor.axOrgTypeName;
                /////
                
                logic.checkFinExecutorHasPersonal(plan.dateStart, f);
                
				if (oldObject.finExecutor.code > Integer.MIN_VALUE)
				{
					f.code = finExecutorDAO.add(f);
				}
				else
				{
					f.code = finExecutorDAO.add(f);
				}

				/* если изменяется основной исполнитель, меняем его и на плане */
				/////
				if (object.finExecutorTypeRef.code == FINExecutorType.PRIMARY)
				{
					if (plan.finExecutor == null)
					{
						throw new EnergyproSystemException("\n \n NET-2800 Не знайдений основний виконавець плану - на вкладці \"Основне\" на плані!");
					}

					if (plan.finExecutor.code == Integer.MIN_VALUE)
					{
						throw new EnergyproSystemException("\n \n NET-2800 Не знайдений основний виконавець плану - на вкладці \"Основне\" на плані!");
					}

					FINExecutor planFinExecutor = finExecutorDAO.getObject(plan.finExecutor.code);
					planFinExecutor.finCode = object.finExecutor.finCode;
					planFinExecutor.name = object.finExecutor.name;
					planFinExecutor.finCehCode = object.finExecutor.finCehCode;
					planFinExecutor.finCehName = object.finExecutor.finCehName;
					planFinExecutor.finKindCode = object.finExecutor.finKindCode;
					planFinExecutor.finKindName = object.finExecutor.finKindName;
					planFinExecutor.finTypeCode = object.finExecutor.finTypeCode;
					planFinExecutor.finTypeName = object.finExecutor.finTypeName;
	                ///// MDAX-441
					planFinExecutor.axOrgId = object.finExecutor.axOrgId;
					planFinExecutor.axParentOrgId = object.finExecutor.axParentOrgId;
					planFinExecutor.axParentOrgName = object.finExecutor.axParentOrgName;
					planFinExecutor.axOrgTypeId = object.finExecutor.axOrgTypeId;
					planFinExecutor.axOrgTypeName = object.finExecutor.axOrgTypeName;
	                /////					
					finExecutorDAO.add(planFinExecutor);
				}
				/////

				object.finExecutor.code = f.code;
			}

			object.dateEdit = new Date();
			object.userGen = getUserProfile().userName;

			objectDAO.save(object);

			if (object.percentLoad.doubleValue() != oldObject.percentLoad.doubleValue() ||
				! object.dateStart.equals(oldObject.dateStart))
			{
				// Пересчитаем проценты загрузки исполнителей
				//PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
				//planLogic.recalcFinExecutorsPercentLoad(object.planRef.code);
				planLogic.recalcTotalTime(object.planRef.code);
			}

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't save {%com.ksoe.energynet.valueobject.FINExecutor2Plan%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for FINExecutor2Plan