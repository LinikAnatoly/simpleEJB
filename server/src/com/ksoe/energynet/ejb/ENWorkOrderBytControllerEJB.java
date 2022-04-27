
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENWorkOrderByt;
 *
 */

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.callcenter.ejb.SMSInformController;
import com.ksoe.callcenter.ejb.SMSInformControllerHome;
import com.ksoe.callcenter.valueobject.SMSInform;
import com.ksoe.callcenter.valueobject.SMSInformOperator;
import com.ksoe.energynet.dataminer.ENAct2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENPlanInformCustomerDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderBytDAO;
import com.ksoe.energynet.dataminer.ENWorkOrderBytItemDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.dataminer.SCSeal2ENWorkOrderBytDAO;
import com.ksoe.energynet.dataminer.SCSealDAO;
import com.ksoe.energynet.ejb.generated.ENWorkOrderBytControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.AuthLogic.FinConnectionData;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.EstimateLogic;
import com.ksoe.energynet.logic.FINLogic;
import com.ksoe.energynet.logic.HumenLogic;
import com.ksoe.energynet.logic.SCLogic;
import com.ksoe.energynet.logic.WorkOrderLogic;
import com.ksoe.energynet.util.CCIdentifierEjbCache;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItem2Type;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.ENPlanCorrectReason;
import com.ksoe.energynet.valueobject.ENPlanInformCustomer;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENWorkOrderByt;
import com.ksoe.energynet.valueobject.ENWorkOrderBytItem;
import com.ksoe.energynet.valueobject.ENWorkOrderBytStatus;
import com.ksoe.energynet.valueobject.ENWorkOrderBytType;
import com.ksoe.energynet.valueobject.FINChargeType;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.SCSeal;
import com.ksoe.energynet.valueobject.SCSeal2ENWorkOrderByt;
import com.ksoe.energynet.valueobject.SCSeal2WorkOrderBytKind;
import com.ksoe.energynet.valueobject.SCSealLockType;
import com.ksoe.energynet.valueobject.SCSealStatus;
import com.ksoe.energynet.valueobject.brief.ENMetrologyCounterShort;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanInformCustomerFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytItemFilter;
import com.ksoe.energynet.valueobject.filter.SCSeal2ENWorkOrderBytFilter;
import com.ksoe.energynet.valueobject.filter.SCSealFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanInformCustomerShortList;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.logic.TechCardLogic;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.TKClassificationType;

public class ENWorkOrderBytControllerEJB extends
		ENWorkOrderBytControllerEJBGen {

	public ENWorkOrderBytControllerEJB() {
	}

	/* ENWorkOrderByt. Добавить */
	@Override
	public int add(ENWorkOrderByt object) {
		int workOrderBytCode = Integer.MIN_VALUE;

		try {
			object.statusRef.code = ENWorkOrderBytStatus.DRAFT;

			WorkOrderLogic workOrderLogic = new WorkOrderLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			workOrderBytCode = workOrderLogic.addWorkOrderByt(object);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENWorkOrderByt%} object.", e);
		}

		return workOrderBytCode;
	}


	/* ENWorkOrderByt. Добавить из биллинга (для рейдовых бригад) */
	public int addForRaid(ENWorkOrderByt object)
	{
		object.typeRef.code = ENWorkOrderBytType.RAID_BY_BILLING;

		return add(object);
	}

	/* ENWorkOrderByt. Добавить из биллинга (для снятия контролей) */
	public int addForControl(ENWorkOrderByt object)
	{
		object.typeRef.code = ENWorkOrderBytType.CONTROL;

		return add(object);
	}

   	/* ENWorkOrderByt. Изменить */
	@Override
	public void save(ENWorkOrderByt object)
	{
	   Connection finConn = null;
	   Connection enConn = null;

	   try
	   {
		   /////
		   AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		   FinConnectionData finConnectionData = l.getFinConnectionData();
		   /////

		   //finConn = getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
		   finConn = getConnection(finConnectionData.connectionString);
		   enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

	       if (object.finWorker != null){
	    	 if (object.finWorker.tabNumber != null) {

	    		 //проверим является ли воркер инвалидом
	    		HumenLogic hLogic = new HumenLogic(enConn, getUserProfile());
	    		FINLogic fLogicFin = new FINLogic(finConn ,getUserProfile());
	    		//FINLogic fLogicNet = new FINLogic(enConn,getUserProfile());


	    		FINWorkerDAO wDAO = new FINWorkerDAO(getUserProfile(),enConn);
	    		FINWorker w = new FINWorker();

	    		if  (object.finWorker.code > Integer.MIN_VALUE){
	    			w = wDAO.getObject(object.finWorker.code);
	    		}
	    		w.code = object.finWorker.code;
	    		w.name = object.finWorker.name;
	    		w.tabNumber = object.finWorker.tabNumber;
	    		w.positionCode = object.finWorker.positionCode;
	    		w.positionName = object.finWorker.positionName;
	    		w.departmentCode = object.finWorker.departmentCode;
	    		w.departmentName = object.finWorker.departmentName;
	    		w.priceGen = object.finWorker.priceGen;
	    		w.categor = object.finWorker.categor;
	    		w.finCode = object.finWorker.finCode;
	    		///// 07.12.11 Убираем признак "Командировочный" вообще, потому что с ним неправильно рассчитывается з/п
	    		//w.isSentAssignment = object.finWorker.isSentAssignment;
	    		w.isSentAssignment = 0;
	    		/////
	    		w.kindRef.code = object.finWorker.kindRef.code;
                // MDAX-441
                w.positionId = object.finWorker.positionId;

	    		// если инвалид тогда проставляем в финворкер процент отчислений со справочника FINCHARGEHISTORY и тип отчислений FINChargeType = 2
	    		// иначе процент отчислений также берем со справочника но только для обычных работников  FINChargeType = 1
	    		if (fLogicFin.getCheckIsInvalid(object.finWorker.tabNumber, object.dateGen) > 0)
	    		{
	                // если инвалид
	    	        w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_INVALID, object.dateGen);
	    	        w.chargeRef.code = FINChargeType.IS_INVALID;
	    		}
	    		else
	    		{   // если НЕ инвалид
	    			w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_NOT_INVALID, object.dateGen);
	    			w.chargeRef.code = FINChargeType.IS_NOT_INVALID;
	    		}

	    		object.finWorker.code = wDAO.add(w);

	    		/*
	    		if  (object.finWorker.code == Integer.MIN_VALUE){
	    			object.finWorker.code = wDAO.add(w);
	    		}
	    		else
	    		{
	    			wDAO.save(w);
	    		} */

	    	   }
		     }

		    super.save(object);

	   }
	   catch (DatasourceConnectException e)
	   {
			throw new SystemException("Can't save {%com.ksoe.energynet.valueobject.ENWorkOrderByt%} object.", e);
	   }
	   catch (PersistenceException e)
	   {
			throw new SystemException(e.getMessage(), e);
	   }
	   finally
	   {
			try {
				if (finConn != null && ! finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}
			try {
				if (enConn != null && ! enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
	   }
	}

	@Override
	public void remove(int code)
	{
		remove(code, false);
	}

	public void removeForRaid(int code)
	{
		remove(code, true);
	}

	public void removeForControl(int code)
	{
		remove(code, true);
	}

	public void remove(int code, boolean isFromBilling)
	{
		try
		{
    		ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
    		ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(code);

    		if (workOrderByt == null)
    		{
    			throw new SystemException("\n\nNET-4350 Не знайдено змінне завдання! Код = " + code);
    		}

			if (workOrderByt.typeRef.code == ENWorkOrderBytType.RAID_BY_BILLING && !isFromBilling)
			{
				throw new SystemException("\n\nNET-4431 Це завдання було сформовано з білінгу! Видалення можливе також лише з білінгу!");
			}

			if (workOrderByt.typeRef.code != ENWorkOrderBytType.BY_ENERGYNET && !isFromBilling)
			{
				throw new SystemException("\n\nNET-4431 Неправильний тип змінного завдання! Код завдання: " + code +
						", код типу: " + workOrderByt.typeRef.code);
			}

			///// Проверим, есть ли в задании строки. Если есть - выведем человеческий матюк (чтобы не ругалось на foreign'ы)
			ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();
			workOrderBytItemFilter.workOrderBytRef.code = code;

			int[] workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

			if (workOrderBytItemArr.length > 0)
			{
				throw new SystemException("\n\nNET-4350 Для видалення цього змінного завдання спочатку видаліть строки з нього!");
			}
			/////

			super.remove(code);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENWorkOrderByt%} object.",
					e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	public void removeBadRaid(int code) {
		try {
    		ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
    		ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(code);

    		if (workOrderByt == null) {
    			throw new SystemException("\n\nNET-4350 Не знайдено змінне завдання! Код = " + code);
    		}

			if (workOrderByt.typeRef.code != ENWorkOrderBytType.RAID_BY_BILLING) {
				throw new SystemException("\n\nNET-4431 Неправильний тип змінного завдання! Код завдання: " + code +
						", код типу: " + workOrderByt.typeRef.code);
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.DRAFT) {
				throw new SystemException("\n\nВидаляти дозволяється тільки чорнові змінні завдання! Код завдання: " + code);
			}

			ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();
			workOrderBytItemFilter.workOrderBytRef.code = code;
			int[] workOrderBytItemCodes = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

			for (int workOrderBytItemCode : workOrderBytItemCodes) {
				workOrderBytItemDAO.remove(workOrderBytItemCode);
			}

			super.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENWorkOrderByt%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public ENWorkOrderBytShortList getScrollableFilteredListForRaid(ENWorkOrderBytFilter filterObject, int fromPosition, int quantity)
	{
		return getScrollableFilteredList(filterObject, fromPosition, quantity);
	}

	public ENWorkOrderByt getObjectForRaid(int code)
	{
		return getObject(code);
	}

	public void addSeals(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode)
	{
		addSeals(workOrderBytCode, seals, accountingTypeCode, false);
	}

	/**
	 * Привязка пломб к сменному заданию (по плану)
	 *
	 * @param workOrderBytCode - код сменного задания
	 * @param seals - массив с пломбами
	 * @param accountingTypeCode - тип учета (пломба/ИМП/голограмма)
	 * @param noBindingToPlans - привязывать ли пломбы к конкретным планам (true - не привязывать, false - привязывать)
	 */
	public void addSeals(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode, boolean noBindingToPlans)
	{
		if (accountingTypeCode != TKAccountingType.SEAL &&
			accountingTypeCode != TKAccountingType.IMP &&
			accountingTypeCode != TKAccountingType.HOLO)
		{
			throw new SystemException("\n\nNET-4350 Невідомий тип об'єкту!");
		}

		if (seals.length == 0)
		{
			throw new SystemException("\n\nNET-4350 Не заданий перелік пломб!");
		}

		if (accountingTypeCode == Integer.MIN_VALUE)
		{
			throw new SystemException("\n\nNET-4350 Не заданий тип обліку!");
		}

		try
		{
			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено змінне завдання з кодом " + workOrderBytCode + " !");
			}

			if (workOrderByt.typeRef.code != ENWorkOrderBytType.BY_ENERGYNET)
			{
				throw new SystemException("\n\nNET-4530 Змінне завдання з кодом " + workOrderBytCode + " має неприпустимий для цієї операції тип (" +
						workOrderByt.typeRef.code + ") !");
			}

			// Проверка статуса сменного задания
			scLogic.checkWorkOrderBytForStatus(workOrderByt, ENWorkOrderBytStatus.FORMED, true);

			ENEstimateItemFilter estimateItemFilter = new ENEstimateItemFilter();
			estimateItemFilter.conditionSQL =
				    " code in ( " +
				    "   select distinct ei.code " +
				    "   from " +
				    "     enestimateitem ei, enplanworkitem pi, " +
				    "     enworkorderbytitem wbi " +
				    "   where ei.planitemrefcode = pi.code " +
				    "     and wbi.planitemrefcode = pi.code " +
				    "     and pi.countgen > 0 " +
				    "     and wbi.workorderbytrefcode = " + workOrderBytCode +
				    "     and ei.countfact > 0 " +
				    //"     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
				    "     and ei.accountingtyperefcode = " + accountingTypeCode +
				    " )";

			int[] estimateItemArr = estimateItemDAO.getFilteredCodeArray(estimateItemFilter, 0, -1);

			// Если в плане пломбы вообще не нужны, нефиг клацать на "Привязку пломб"!!!
			if (estimateItemArr.length == 0)
			{
				throw new SystemException("\n\nNET-4530 У цьому Змінному завданні немає робіт, у яких використовуються пломби!");
			}

			WorkOrderLogic workOrderLogic = new WorkOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			int sealsArrIndex = 0;
			int sealsByPlansCount = 0;

			// int planCode = Integer.MIN_VALUE;

			if (! noBindingToPlans)
			{
				for (int i = 0; i < estimateItemArr.length; i++)
				{
					if (sealsArrIndex > seals.length - 1)
					{
						// Выходим (могут же пломбы привязывать частями, например, выбирают с подотчета за несколько раз - из разных коробок)
						//throw new SystemException("\n\nNET-4530 Видано недостатню кількість пломб для змінного завдання!");
						return;
					}

					/////
					ENEstimateItem estimateItem = estimateItemDAO.getObject(estimateItemArr[i]);

					// Проверим, чтобы план уже не превратился в факт (потому что, если вдруг план переведут в факт до того,
					// как в сменном задании к нему привяжут пломбы, то на факте пломбы уже никак не появятся)
					//if (estimateItem.planRef.code != planCode) // чтобы не дергать план каждый раз
					//{
				        ENPlanWork plan = planDAO.getObject(estimateItem.planRef.code);

				        if (plan == null)
				        {
				        	throw new SystemException("\n\nNET-4530 Не знайдено план з кодом " + estimateItem.planRef.code + " !");
				        }

				        if (plan.kind.code != ENPlanWorkKind.NPW || plan.status.code != ENPlanWorkStatus.GOOD)
				        {
				        	throw new SystemException("\n\nNET-4530 План з кодом " + plan.code + " не є чорновим Завданням-Планом!\n" +
				        			"Для прив'язки пломб по факту переведіть Змінне завдання в статус \"Виконане\"!");
				        }
					//}

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
					workOrderBytItemFilter.conditionSQL =
				    		" code in ( " +
		    				"   select wbi.code " +
		    				"   from " +
		    				"     enestimateitem ei, enplanworkitem pi, " +
		    				"     enworkorderbytitem wbi " +
		    				"   where ei.planitemrefcode = pi.code " +
		    				"     and wbi.planitemrefcode = pi.code " +
		    				"     and wbi.workorderbytrefcode = " + workOrderBytCode +
		    				"     and ei.code = " + estimateItemArr[i] +
						    " )";
					int[] workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

					if (workOrderBytItemArr.length == 0)
					{
						throw new SystemException("\n\nNET-4530 Не знайдено строк змінного завдання з пломбами!");
					}

					//for (int j = 1; j <= estimateItemCount; j++)
					for (int j = 1; j <= estimateItemCount4Binding; j++)
					{
						if (sealsArrIndex > seals.length - 1)
						{
							// Выходим (могут же пломбы привязывать частями, например, выбирают с подотчета за несколько раз - из разных коробок)
							//throw new SystemException("\n\nNET-4530 Видано недостатню кількість пломб для змінного завдання!");
							return;
						}

						ENMetrologyCounterShort tmpSeal = seals[sealsArrIndex++];

						System.out.println("estimateItem " + estimateItemArr[i] + " - " +
								"seal " + tmpSeal.buildNumber);

						SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(tmpSeal, SCSealLockType.FOR_WORKORDERBYT);

						// Проверим, чтобы совпадал МОЛ, с которого мы резервируем пломбу, с тем, который у нас в наряд-задании на плане
						String finMolCode = workOrderLogic.getMasterCodeFromWorkOrderByPlanCode(plan.code, true);
						if (! seal.molCode.equals(finMolCode))
						{
							throw new SystemException("\n\nNET-4530 МВО, з якої резервуються пломби (" + seal.molCode +
									"), не співпадає з МВО на наряд-завданні в плані (" + finMolCode + ") !");
						}

						seal.estimateItemRef.code = estimateItemArr[i];

						int sealCode = sealDAO.add(seal);

						/* Будем создавать связку только с первой строкой задания с эстимейтом (а то куча связок с одной пломбой
						 * могут создать ненужный головняк при переразносках пломб по факту)
						for (int w = 0; w < workOrderBytItemArr.length; w++)
						{
							SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
							seal2workOrderByt.sealRef.code = sealCode;
							seal2workOrderByt.workOrderBytItemRef.code = workOrderBytItemArr[w];
							seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
							seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
							seal2workOrderBytDAO.add(seal2workOrderByt);
						}
						*/
						SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
						seal2workOrderByt.sealRef.code = sealCode;
						seal2workOrderByt.workOrderBytItemRef.code = workOrderBytItemArr[0];
						seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
						seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
						seal2workOrderBytDAO.add(seal2workOrderByt);

						// В случае, если у нас несколько строк задания, будем брать данные с первой!
						ENWorkOrderBytItem workOrderBytItem = workOrderBytItemDAO.getObject(workOrderBytItemArr[0]);

						if (workOrderBytItem == null)
						{
							throw new SystemException("\n\nNET-4530 Не знайдено строку змінного завдання з кодом " + workOrderBytItemArr[0] + " !");
						}

						if (workOrderBytItem.finWorker == null)
						{
							throw new SystemException("\n\nNET-4530 Не знайдено виконавця для строки змінного завдання з кодом " + workOrderBytItemArr[0] + " !");
						}

						// Лочим пломбу в ScanCounters
						scLogic.lockSeal(seal.scCode, workOrderByt.numberGen, workOrderByt.dateGen,
										 workOrderBytItem.finWorker.tabNumber, workOrderBytItem.finWorker.name,
										 ENMetrologyCounter.BILLING_LOCK /* ?? */);

						sealsByPlansCount = sealsArrIndex;
					}

				} // for (int i = 0; i < estimateItemArr.length; i++)

			} // if (! noBindingToPlans)

			// Остаток пломб (т.е. то, что выдано поверх потребности)
			// нужно подвязать под все сменное задание (без ссылки на конкретный workOrderBytItem)
			if (sealsByPlansCount < seals.length)
			{
				/////
				// 03.06.16 Возможна хитрая ситуация, когда пломба подвязана к эстимейту из нашего задания в другом задании
				// (типа в работе 2 монтера и каждому выдается отдельное задание, но с одним и тем же планом - см. SUPP-49304).
				// В этом случае мы не должны давать привязать к нему пломбу (или кидать ее в дополнительные, непривязанные?).
				// Думаю, не будем давать такое делать!

				SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
				seal2workOrderBytFilter.conditionSQL =
					" code in ( " +
					"   select swb.code " +
					"   from  " +
					"     enestimateitem ei, enplanworkitem pi,  " +
					"     enworkorderbytitem wbi, " +
					"     scseal s, scseal2enworkorderbyt swb " +
					"   where ei.planitemrefcode = pi.code  " +
					"     and wbi.planitemrefcode = pi.code  " +
					"     and pi.countgen > 0  " +
					"     and wbi.workorderbytrefcode = " + workOrderBytCode +
					"     and ei.countfact > 0  " +
					//"     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
					"     and ei.accountingtyperefcode = " + accountingTypeCode +
					"      " +
					"     and s.estimateitemrefcode = ei.code " +
					"     and s.locktyperefcode = " + SCSealLockType.FOR_WORKORDERBYT +
					"     and swb.sealrefcode = s.code " +
					"     and swb.workorderbytrefcode <> " + workOrderBytCode +
					")";

				int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

				if (seal2workOrderBytArr.length > 0)
				{
					SCSeal2ENWorkOrderByt scSeal2ENWorkOrderByt = seal2workOrderBytDAO.getObject(seal2workOrderBytArr[0]);

					ENWorkOrderByt workOrderBytOther = workOrderBytDAO.getObject(scSeal2ENWorkOrderByt.workOrderBytRef.code);
					ENWorkOrderBytItem workOrderBytItemOther = workOrderBytItemDAO.getObject(scSeal2ENWorkOrderByt.workOrderBytItemRef.code);

		     		throw new SystemException("\n\nNET-4530 Для \"" + workOrderBytItemOther.customerName + "\"\n" +
                               "вже зарезервовано пломби в іншому змінному завданні № " + workOrderBytOther.numberGen + " від " +
                               new SimpleDateFormat("dd.MM.yyyy").format(workOrderBytOther.dateGen) +
                               " (код: " + workOrderBytOther.code + ") !");
				}
				/////


				for (int i = sealsArrIndex; i < seals.length; i++)
				{
					ENMetrologyCounterShort tmpSeal = seals[i];

					System.out.println("NO estimateItem - seal " + tmpSeal.buildNumber);

					SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(tmpSeal, SCSealLockType.FOR_WORKORDERBYT);

					int sealCode = sealDAO.add(seal);

					SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
					seal2workOrderByt.sealRef.code = sealCode;
					seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
					seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
					seal2workOrderBytDAO.add(seal2workOrderByt);

					if (workOrderByt.finWorker == null)
					{
						throw new SystemException("\n\nNET-4530 Не знайдено виконавця для змінного завдання з кодом " + workOrderBytCode + " !");
					}

					// Лочим пломбу в ScanCounters. Данные по исполнителю берем с самого задания, а не со строки,
					// т.к. тут у нас уже нет привязки к конкретной строке
					scLogic.lockSeal(seal.scCode, workOrderByt.numberGen, workOrderByt.dateGen,
									 workOrderByt.finWorker.tabNumber, workOrderByt.finWorker.name,
									 ENMetrologyCounter.BILLING_LOCK /* ?? */);
				}
			}
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't addSeals", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	/**
	 * Привязка пломб к сменному заданию для рейдовой бригады (по плану)
	 *
	 * @param workOrderBytCode - код сменного задания
	 * @param seals - массив с пломбами
	 * @param accountingTypeCode - тип учета (пломба/ИМП/голограмма)
	 * @param noBindingToPlans - привязывать ли пломбы к конкретным планам (true - не привязывать, false - привязывать)
	 */
	public void addSealsForRaid(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode, boolean noBindingToPlans)
	{
		if (accountingTypeCode != TKAccountingType.SEAL &&
			accountingTypeCode != TKAccountingType.IMP &&
			accountingTypeCode != TKAccountingType.HOLO)
		{
			throw new SystemException("\n\nNET-4350 Невідомий тип об'єкту!");
		}

		if (seals.length == 0)
		{
			throw new SystemException("\n\nNET-4350 Не заданий перелік пломб!");
		}

		if (accountingTypeCode == Integer.MIN_VALUE)
		{
			throw new SystemException("\n\nNET-4350 Не заданий тип обліку!");
		}

		try
		{
			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено змінне завдання з кодом " + workOrderBytCode + " !");
			}

			if (workOrderByt.typeRef.code != ENWorkOrderBytType.RAID_BY_BILLING)
			{
				throw new SystemException("\n\nNET-4530 Змінне завдання з кодом " + workOrderBytCode + " має неприпустимий для цієї операції тип (" +
						workOrderByt.typeRef.code + ") !");
			}

			// Проверка статуса сменного задания
			scLogic.checkWorkOrderBytForStatus(workOrderByt, ENWorkOrderBytStatus.FORMED, true);

			ENEstimateItemFilter estimateItemFilter = new ENEstimateItemFilter();
			estimateItemFilter.conditionSQL =
				    " code in ( " +
				    "   select distinct ei.code " +
				    "   from " +
				    "     enestimateitem ei, enplanworkitem pi, " +
				    "     enworkorderbytitem wbi " +
				    "   where ei.planitemrefcode = pi.code " +
				    "     and wbi.planitemrefcode = pi.code " +
				    "     and pi.countgen > 0 " +
				    "     and wbi.workorderbytrefcode = " + workOrderBytCode +
				    "     and ei.countfact > 0 " +
				    //"     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
				    "     and ei.accountingtyperefcode = " + accountingTypeCode +
				    " )";

			int[] estimateItemArr = estimateItemDAO.getFilteredCodeArray(estimateItemFilter, 0, -1);

			// Если в плане пломбы вообще не нужны, нефиг клацать на "Привязку пломб"!!!
			if (estimateItemArr.length == 0)
			{
				throw new SystemException("\n\nNET-4530 У цьому Змінному завданні немає робіт, у яких використовуються пломби!");
			}

			WorkOrderLogic workOrderLogic = new WorkOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			EstimateLogic estimateLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			int sealsArrIndex = 0;
			int sealsByPlansCount = 0;

			// int planCode = Integer.MIN_VALUE;

			if (! noBindingToPlans)
			{
				for (int i = 0; i < estimateItemArr.length; i++)
				{
					if (sealsArrIndex > seals.length - 1)
					{
						// Выходим (могут же пломбы привязывать частями, например, выбирают с подотчета за несколько раз - из разных коробок)
						//throw new SystemException("\n\nNET-4530 Видано недостатню кількість пломб для змінного завдання!");
						return;
					}

					/////
					ENEstimateItem estimateItem = estimateItemDAO.getObject(estimateItemArr[i]);

					// Проверим, чтобы план уже не превратился в факт (потому что, если вдруг план переведут в факт до того,
					// как в сменном задании к нему привяжут пломбы, то на факте пломбы уже никак не появятся)
					//if (estimateItem.planRef.code != planCode) // чтобы не дергать план каждый раз
					//{
				        ENPlanWork plan = planDAO.getObject(estimateItem.planRef.code);

				        if (plan == null)
				        {
				        	throw new SystemException("\n\nNET-4530 Не знайдено план з кодом " + estimateItem.planRef.code + " !");
				        }

				        if (plan.kind.code != ENPlanWorkKind.NPW || plan.status.code != ENPlanWorkStatus.GOOD)
				        {
				        	throw new SystemException("\n\nNET-4530 План з кодом " + plan.code + " не є чорновим Завданням-Планом!\n" +
				        			"Для прив'язки пломб по факту переведіть Змінне завдання в статус \"Виконане\"!");
				        }
					//}

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
					workOrderBytItemFilter.conditionSQL =
				    		" code in ( " +
		    				"   select wbi.code " +
		    				"   from " +
		    				"     enestimateitem ei, enplanworkitem pi, " +
		    				"     enworkorderbytitem wbi " +
		    				"   where ei.planitemrefcode = pi.code " +
		    				"     and wbi.planitemrefcode = pi.code " +
		    				"     and wbi.workorderbytrefcode = " + workOrderBytCode +
		    				"     and ei.code = " + estimateItemArr[i] +
						    " )";
					workOrderBytItemFilter.orderBySQL = "customername";

					int[] workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

					if (workOrderBytItemArr.length == 0)
					{
						throw new SystemException("\n\nNET-4530 Не знайдено строк змінного завдання з пломбами!");
					}

					int j = 1;

					//for (int j = 1; j <= estimateItemCount4Binding; j++)
					//while (j <= estimateItemCount4Binding)
					{
						if (sealsArrIndex > seals.length - 1)
						{
							// Выходим (могут же пломбы привязывать частями, например, выбирают с подотчета за несколько раз - из разных коробок)
							//throw new SystemException("\n\nNET-4530 Видано недостатню кількість пломб для змінного завдання!");
							return;
						}

						String tmpCustomerNumber = "";

						for (int w = 0; w < workOrderBytItemArr.length && j <= estimateItemCount4Binding; w++)
						{
							ENWorkOrderBytItem workOrderBytItem = workOrderBytItemDAO.getObject(workOrderBytItemArr[w]);

							if (workOrderBytItem == null)
							{
								throw new SystemException("\n\nNET-4530 Не знайдено строку змінного завдання з кодом " + workOrderBytItemArr[w] + " !");
							}

							if (! workOrderBytItem.customerName.equals(tmpCustomerNumber))
							{
								tmpCustomerNumber = workOrderBytItem.customerName;
							}
							else
							{
								continue;
							}

							///// Если к текущей строке сменного задания уже привязано достаточно пломб, нужно ее пропустить
							SCSeal2ENWorkOrderBytFilter seal2WorkOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
							seal2WorkOrderBytFilter.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
							seal2WorkOrderBytFilter.workOrderBytItemRef.code = workOrderBytItemArr[w];

							int[] seal2WorkOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2WorkOrderBytFilter, 0, -1);

							int countByTechCard = estimateLogic.getEstimateCountByTechCard(estimateItemArr[i]).intValue();
							int count4Binding = countByTechCard - seal2WorkOrderBytArr.length;

							if (count4Binding <= 0)
							{
								continue;
							}
							/////

							//for (int c = 1; c <= countByTechCard; c++)
							for (int c = 1; c <= count4Binding; c++)
							{
								if (sealsArrIndex > seals.length - 1)
								{
									// Выходим (могут же пломбы привязывать частями, например, выбирают с подотчета за несколько раз - из разных коробок)
									//throw new SystemException("\n\nNET-4530 Видано недостатню кількість пломб для змінного завдання!");
									return;
								}

								ENMetrologyCounterShort tmpSeal = seals[sealsArrIndex++];

								System.out.println("estimateItem " + estimateItemArr[i] + " - " +
										"seal " + tmpSeal.buildNumber);

								SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(tmpSeal, SCSealLockType.FOR_WORKORDERBYT);

								// Проверим, чтобы совпадал МОЛ, с которого мы резервируем пломбу, с тем, который у нас в наряд-задании на плане
								String finMolCode = workOrderLogic.getMasterCodeFromWorkOrderByPlanCode(plan.code, true);
								if (! seal.molCode.equals(finMolCode))
								{
									throw new SystemException("\n\nNET-4530 МВО, з якої резервуються пломби (" + seal.molCode +
											"), не співпадає з МВО на наряд-завданні в плані (" + finMolCode + ") !");
								}

								seal.estimateItemRef.code = estimateItemArr[i];

								int sealCode = sealDAO.add(seal);

								SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
								seal2workOrderByt.sealRef.code = sealCode;
								seal2workOrderByt.workOrderBytItemRef.code = workOrderBytItemArr[w];
								seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
								seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
								seal2workOrderBytDAO.add(seal2workOrderByt);

								if (workOrderBytItem.finWorker == null)
								{
									throw new SystemException("\n\nNET-4530 Не знайдено виконавця для строки змінного завдання з кодом " + workOrderBytItemArr[w] + " !");
								}

								// Лочим пломбу в ScanCounters
								scLogic.lockSeal(seal.scCode, workOrderByt.numberGen, workOrderByt.dateGen,
												 workOrderBytItem.finWorker.tabNumber, workOrderBytItem.finWorker.name,
												 ENMetrologyCounter.BILLING_LOCK /* ?? */);

								sealsByPlansCount = sealsArrIndex;

								j++;
							}
						}

					}

				} // for (int i = 0; i < estimateItemArr.length; i++)

			} // if (! noBindingToPlans)

			// Остаток пломб (т.е. то, что выдано поверх потребности)
			// нужно подвязать под все сменное задание (без ссылки на конкретный workOrderBytItem)
			if (sealsByPlansCount < seals.length)
			{
				/////
				// 03.06.16 Возможна хитрая ситуация, когда пломба подвязана к эстимейту из нашего задания в другом задании
				// (типа в работе 2 монтера и каждому выдается отдельное задание, но с одним и тем же планом - см. SUPP-49304).
				// В этом случае мы не должны давать привязать к нему пломбу (или кидать ее в дополнительные, непривязанные?).
				// Думаю, не будем давать такое делать!

				SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
				seal2workOrderBytFilter.conditionSQL =
					" code in ( " +
					"   select swb.code " +
					"   from  " +
					"     enestimateitem ei, enplanworkitem pi,  " +
					"     enworkorderbytitem wbi, " +
					"     scseal s, scseal2enworkorderbyt swb " +
					"   where ei.planitemrefcode = pi.code  " +
					"     and wbi.planitemrefcode = pi.code  " +
					"     and pi.countgen > 0  " +
					"     and wbi.workorderbytrefcode = " + workOrderBytCode +
					"     and ei.countfact > 0  " +
					//"     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
					"     and ei.accountingtyperefcode = " + accountingTypeCode +
					"      " +
					"     and s.estimateitemrefcode = ei.code " +
					"     and s.locktyperefcode = " + SCSealLockType.FOR_WORKORDERBYT +
					"     and swb.sealrefcode = s.code " +
					"     and swb.workorderbytrefcode <> " + workOrderBytCode +
					")";

				int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

				if (seal2workOrderBytArr.length > 0)
				{
					SCSeal2ENWorkOrderByt scSeal2ENWorkOrderByt = seal2workOrderBytDAO.getObject(seal2workOrderBytArr[0]);

					ENWorkOrderByt workOrderBytOther = workOrderBytDAO.getObject(scSeal2ENWorkOrderByt.workOrderBytRef.code);
					ENWorkOrderBytItem workOrderBytItemOther = workOrderBytItemDAO.getObject(scSeal2ENWorkOrderByt.workOrderBytItemRef.code);

		     		throw new SystemException("\n\nNET-4530 Для \"" + workOrderBytItemOther.customerName + "\"\n" +
                               "вже зарезервовано пломби в іншому змінному завданні № " + workOrderBytOther.numberGen + " від " +
                               new SimpleDateFormat("dd.MM.yyyy").format(workOrderBytOther.dateGen) +
                               " (код: " + workOrderBytOther.code + ") !");
				}
				/////


				for (int i = sealsArrIndex; i < seals.length; i++)
				{
					ENMetrologyCounterShort tmpSeal = seals[i];

					System.out.println("NO estimateItem - seal " + tmpSeal.buildNumber);

					SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(tmpSeal, SCSealLockType.FOR_WORKORDERBYT);

					int sealCode = sealDAO.add(seal);

					SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
					seal2workOrderByt.sealRef.code = sealCode;
					seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
					seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
					seal2workOrderBytDAO.add(seal2workOrderByt);

					if (workOrderByt.finWorker == null)
					{
						throw new SystemException("\n\nNET-4530 Не знайдено виконавця для змінного завдання з кодом " + workOrderBytCode + " !");
					}

					// Лочим пломбу в ScanCounters. Данные по исполнителю берем с самого задания, а не со строки,
					// т.к. тут у нас уже нет привязки к конкретной строке
					scLogic.lockSeal(seal.scCode, workOrderByt.numberGen, workOrderByt.dateGen,
									 workOrderByt.finWorker.tabNumber, workOrderByt.finWorker.name,
									 ENMetrologyCounter.BILLING_LOCK /* ?? */);
				}
			}
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't addSealsForRaid", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	public void addSealsByFact(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode)
	{
		addSealsByFact(workOrderBytCode, seals, accountingTypeCode, false);
	}

	/**
	 * Привязка пломб к сменному заданию (по факту)
	 *
	 * @param workOrderBytCode - код сменного задания
	 * @param seals - массив с пломбами
	 * @param accountingTypeCode - тип учета (пломба/ИМП/голограмма)
	 * @param noBindingToPlans - привязывать ли пломбы к конкретным планам (true - не привязывать, false - привязывать)
	 */
	public void addSealsByFact(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode, boolean noBindingToPlans)
	{
		if (accountingTypeCode != TKAccountingType.SEAL &&
			accountingTypeCode != TKAccountingType.IMP &&
			accountingTypeCode != TKAccountingType.HOLO)
		{
			throw new SystemException("\n\nNET-4350 Невідомий тип об'єкту!");
		}

		if (seals.length == 0)
		{
			throw new SystemException("\n\nNET-4350 Не заданий перелік пломб!");
		}

		if (accountingTypeCode == Integer.MIN_VALUE)
		{
			throw new SystemException("\n\nNET-4350 Не заданий тип обліку!");
		}

		try
		{
			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено змінне завдання з кодом " + workOrderBytCode + " !");
			}

			if (workOrderByt.typeRef.code != ENWorkOrderBytType.BY_ENERGYNET)
			{
				throw new SystemException("\n\nNET-4530 Змінне завдання з кодом " + workOrderBytCode + " має неприпустимий для цієї операції тип (" +
						workOrderByt.typeRef.code + ") !");
			}

			// Проверка статуса сменного задания
			scLogic.checkWorkOrderBytForStatus(workOrderByt, ENWorkOrderBytStatus.COMPLETED, true);

			ENEstimateItemFilter estimateItemFilter = new ENEstimateItemFilter();

			// 08.07.16 Возникают ситуации, когда работу с пломбами добавляют уже в Задание-Факт
			// (или могут просто добавить пломбы в работу в Задании-Факте)
			/*
			estimateItemFilter.conditionSQL =
					" code in ( " +
					"   select distinct ei1.code " +
					"   from " +
					"     enestimateitem ei, enestimateitem ei1, " +
					"     enestimateitem2nstmttm ei2ei, " +
					"     enplanworkitem pi, " +
					"     enworkorderbytitem wbi, " +
					"     enplanwork p " +
					"   where ei.planitemrefcode = pi.code " +
					"     and ei.materialrefcode = ei1.materialrefcode " +
					"     and ei2ei.estimateiteminrefcode = ei.code " +
					"     and ei2ei.estimateitemoutrefcode = ei1.code " +
					"     and ei2ei.typerefcode = " + ENEstimateItem2Type.PLAN_MOVED +
					"     and ei1.planrefcode = p.code and p.statuscode = " + ENPlanWorkStatus.GOOD +
					"     and wbi.planitemrefcode = pi.code " +
					"     and pi.countgen > 0 " +
					"     and wbi.workorderbytrefcode = " + workOrderBytCode +
					"     and ei.countfact > 0 " +
					"     and ei1.countfact > 0 " +
					"     and ei.accountingtyperefcode = " + accountingTypeCode +
					//"     and ei1.accountingtyperefcode = " + accountingTypeCode +
					" ) ";
			*/
			estimateItemFilter.conditionSQL =
					" code in ( " +
					"   select distinct ei.code " +
					"   from " +
					"      ENWORKORDERBYTITEM wbi, " +
					"      enestimateitem ei, " +
					"      enplanwork plan, " +
					"      enplanwork fact, " +
					"      enplancorrecthistory ch " +
					"  where " +
					"      ei.planrefcode = fact.code " +
					"      and wbi.planrefcode = plan.code " +
					"      and plan.code = ch.planoldrefcode " +
					"      and fact.code = ch.plannewrefcode " +
					"      and fact.statuscode = " + ENPlanWorkStatus.GOOD +
					"      and ch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
					"      and wbi.workorderbytrefcode = " + workOrderBytCode +
					"      and ei.countfact > 0 " +
					"      and ei.accountingtyperefcode = " + accountingTypeCode +
					" ) ";

			int[] estimateItemArr = estimateItemDAO.getFilteredCodeArray(estimateItemFilter, 0, -1);

			// Если в плане пломбы вообще не нужны, нефиг клацать на "Привязку пломб"!!!
			if (estimateItemArr.length == 0)
			{
				throw new SystemException("\n\nNET-4530 У цьому Змінному завданні немає робіт (у Завданнях-Фактах), у яких використовуються пломби!");
			}

			WorkOrderLogic workOrderLogic = new WorkOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			int sealsArrIndex = 0;
			int sealsByPlansCount = 0;

			// int planCode = Integer.MIN_VALUE;

			if (! noBindingToPlans)
			{
				for (int i = 0; i < estimateItemArr.length; i++)
				{
					if (sealsArrIndex > seals.length - 1)
					{
						// Выходим (могут же пломбы привязывать частями, например, выбирают с подотчета за несколько раз - из разных коробок)
						//throw new SystemException("\n\nNET-4530 Видано недостатню кількість пломб для змінного завдання!");
						return;
					}

					/////
					ENEstimateItem estimateItem = estimateItemDAO.getObject(estimateItemArr[i]);

					//if (estimateItem.planRef.code != planCode) // чтобы не дергать план каждый раз
					//{
				        ENPlanWork plan = planDAO.getObject(estimateItem.planRef.code);

				        if (plan == null)
				        {
				        	throw new SystemException("\n\nNET-4530 Не знайдено план з кодом " + estimateItem.planRef.code + " !");
				        }

				        if (plan.kind.code != ENPlanWorkKind.FACT || plan.status.code != ENPlanWorkStatus.GOOD)
				        {
				        	throw new SystemException("\n\nNET-4530 Прив'язувати пломби по факту дозволяється тільки на ЧОРНОВИХ ЗАВДАННЯХ-ФАКТАХ!\n" +
				        			"План з кодом " + plan.code + " не є чорновим Завданням-Фактом!");
				        }
					//}

					SCSealFilter sealFilter = new SCSealFilter();
					sealFilter.estimateItemRef.code = estimateItemArr[i];
					// Для привязки надо выбирать 2 lockTyp'а, потому что, если какую-то пломбу установят в биллинге,
					// ее lockType изменится на SCSealLockType.FOR_FACT
					//sealFilter.lockTypeRef.code = SCSealLockType.FOR_WORKORDERBYT;
					sealFilter.conditionSQL = "locktyperefcode in (" + SCSealLockType.FOR_WORKORDERBYT + ", " + SCSealLockType.FOR_FACT + ")";

					int[] sealsBoundArr = sealDAO.getFilteredCodeArray(sealFilter, 0, -1);
					/////

					int estimateItemCount = estimateItem.countFact.intValue();
					int estimateItemCount4Binding = estimateItemCount - sealsBoundArr.length;

					if (estimateItemCount4Binding <= 0)
					{
						continue;
					}

					ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();
					workOrderBytItemFilter.conditionSQL =
							" code in ( " +
							"   select wbi.code " +
							"   from " +
							"     enestimateitem ei, enestimateitem ei1, " +
							"     enestimateitem2nstmttm ei2ei, " +
							"     enplanworkitem pi, " +
							"     enworkorderbytitem wbi " +
							"   where ei.planitemrefcode = pi.code " +
							"     and ei.materialrefcode = ei1.materialrefcode " +
							"     and ei2ei.estimateiteminrefcode = ei.code " +
							"     and ei2ei.estimateitemoutrefcode = ei1.code " +
							"     and ei2ei.typerefcode = " + ENEstimateItem2Type.PLAN_MOVED +
							"     and wbi.planitemrefcode = pi.code " +
							"     and wbi.workorderbytrefcode = " + workOrderBytCode +
							"     and ei1.code = " + estimateItemArr[i] +
							" )";

					int[] workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

					if (workOrderBytItemArr.length == 0)
					{
						// Если не нашли по связке эстимейтов, значит, пломба была добавлена уже на Задание-Факт,
						// и нужно искать по-другому
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
								"      and ei.accountingtyperefcode = " + accountingTypeCode +
								" )";

						workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

						if (workOrderBytItemArr.length == 0)
						{
							throw new SystemException("\n\nNET-4530 Не знайдено строк змінного завдання з пломбами!");
						}
					}

					//for (int j = 1; j <= estimateItemCount; j++)
					for (int j = 1; j <= estimateItemCount4Binding; j++)
					{
						if (sealsArrIndex > seals.length - 1)
						{
							// Выходим (могут же пломбы привязывать частями, например, выбирают с подотчета за несколько раз - из разных коробок)
							//throw new SystemException("\n\nNET-4530 Видано недостатню кількість пломб для змінного завдання!");
							return;
						}

						ENMetrologyCounterShort tmpSeal = seals[sealsArrIndex++];

						System.out.println("estimateItem " + estimateItemArr[i] + " - " +
								"seal " + tmpSeal.buildNumber);

						SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(tmpSeal, SCSealLockType.FOR_WORKORDERBYT);

						// Проверим, чтобы совпадал МОЛ, с которого мы резервируем пломбу, с тем, который у нас в наряд-задании на плане
						String finMolCode = workOrderLogic.getMasterCodeFromWorkOrderByPlanCode(plan.code, true);
						if (! seal.molCode.equals(finMolCode))
						{
							throw new SystemException("\n\nNET-4530 МВО, з якої резервуються пломби (" + seal.molCode +
									"), не співпадає з МВО на наряд-завданні в плані (" + finMolCode + ") !");
						}

						scLogic.checkSealLastMovementDateWithPlanDate(seal, plan);

						seal.estimateItemRef.code = estimateItemArr[i];



						int sealCode = sealDAO.add(seal);

						/* Будем создавать связку только с первой строкой задания с эстимейтом (а то куча связок с одной пломбой
						 * могут создать ненужный головняк при переразносках пломб по факту)
						for (int w = 0; w < workOrderBytItemArr.length; w++)
						{
							SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
							seal2workOrderByt.sealRef.code = sealCode;
							seal2workOrderByt.workOrderBytItemRef.code = workOrderBytItemArr[w];
							seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
							seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
							seal2workOrderBytDAO.add(seal2workOrderByt);
						}
						*/
						SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
						seal2workOrderByt.sealRef.code = sealCode;
						seal2workOrderByt.workOrderBytItemRef.code = workOrderBytItemArr[0];
						seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
						seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.FACT;
						seal2workOrderBytDAO.add(seal2workOrderByt);

						// В случае, если у нас несколько строк задания, будем брать данные с первой!
						ENWorkOrderBytItem workOrderBytItem = workOrderBytItemDAO.getObject(workOrderBytItemArr[0]);

						if (workOrderBytItem == null)
						{
							throw new SystemException("\n\nNET-4530 Не знайдено строку змінного завдання з кодом " + workOrderBytItemArr[0] + " !");
						}

						if (workOrderBytItem.finWorker == null)
						{
							throw new SystemException("\n\nNET-4530 Не знайдено виконавця для строки змінного завдання з кодом " + workOrderBytItemArr[0] + " !");
						}

						// Лочим пломбу в ScanCounters
						scLogic.lockSeal(seal.scCode, workOrderByt.numberGen, workOrderByt.dateGen,
										 workOrderBytItem.finWorker.tabNumber, workOrderBytItem.finWorker.name,
										 ENMetrologyCounter.BILLING_LOCK /* ?? */);

						sealsByPlansCount = sealsArrIndex;
					}

				} // for (int i = 0; i < estimateItemArr.length; i++)

			} // if (! noBindingToPlans)

			// Остаток пломб (т.е. то, что выдано поверх потребности)
			// нужно подвязать под все сменное задание (без ссылки на конкретный workOrderBytItem)
			if (sealsByPlansCount < seals.length)
			{
				/////
				// 03.06.16 Возможна хитрая ситуация, когда пломба подвязана к эстимейту из нашего задания в другом задании
				// (типа в работе 2 монтера и каждому выдается отдельное задание, но с одним и тем же планом - см. SUPP-49304).
				// В этом случае мы не должны давать привязать к нему пломбу (или кидать ее в дополнительные, непривязанные?).
				// Думаю, не будем давать такое делать!

				SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
				seal2workOrderBytFilter.conditionSQL =
					" code in ( " +
					"   select swb.code " +
					"   from  " +
					"     enestimateitem ei, enplanworkitem pi,  " +
					"     enworkorderbytitem wbi, " +
					"     scseal s, scseal2enworkorderbyt swb " +
					"   where ei.planitemrefcode = pi.code  " +
					"     and wbi.planitemrefcode = pi.code  " +
					"     and pi.countgen > 0  " +
					"     and wbi.workorderbytrefcode = " + workOrderBytCode +
					"     and ei.countfact > 0  " +
					//"     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
					"     and ei.accountingtyperefcode = " + accountingTypeCode +
					"      " +
					"     and s.estimateitemrefcode = ei.code " +
					"     and s.locktyperefcode = " + SCSealLockType.FOR_WORKORDERBYT +
					"     and swb.sealrefcode = s.code " +
					"     and swb.workorderbytrefcode <> " + workOrderBytCode +
					")";

				int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

				if (seal2workOrderBytArr.length > 0)
				{
					SCSeal2ENWorkOrderByt scSeal2ENWorkOrderByt = seal2workOrderBytDAO.getObject(seal2workOrderBytArr[0]);

					ENWorkOrderByt workOrderBytOther = workOrderBytDAO.getObject(scSeal2ENWorkOrderByt.workOrderBytRef.code);
					ENWorkOrderBytItem workOrderBytItemOther = workOrderBytItemDAO.getObject(scSeal2ENWorkOrderByt.workOrderBytItemRef.code);

		     		throw new SystemException("\n\nNET-4530 Для \"" + workOrderBytItemOther.customerName + "\"\n" +
                               "вже зарезервовано пломби в іншому змінному завданні № " + workOrderBytOther.numberGen + " від " +
                               new SimpleDateFormat("dd.MM.yyyy").format(workOrderBytOther.dateGen) +
                               " (код: " + workOrderBytOther.code + ") !");
				}
				/////


				for (int i = sealsArrIndex; i < seals.length; i++)
				{
					ENMetrologyCounterShort tmpSeal = seals[i];

					System.out.println("NO estimateItem - seal " + tmpSeal.buildNumber);

					SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(tmpSeal, SCSealLockType.FOR_WORKORDERBYT);

					int sealCode = sealDAO.add(seal);

					SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
					seal2workOrderByt.sealRef.code = sealCode;
					seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
					seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.FACT;
					seal2workOrderBytDAO.add(seal2workOrderByt);

					if (workOrderByt.finWorker == null)
					{
						throw new SystemException("\n\nNET-4530 Не знайдено виконавця для змінного завдання з кодом " + workOrderBytCode + " !");
					}

					// Лочим пломбу в ScanCounters. Данные по исполнителю берем с самого задания, а не со строки,
					// т.к. тут у нас уже нет привязки к конкретной строке
					scLogic.lockSeal(seal.scCode, workOrderByt.numberGen, workOrderByt.dateGen,
									 workOrderByt.finWorker.tabNumber, workOrderByt.finWorker.name,
									 ENMetrologyCounter.BILLING_LOCK /* ?? */);
				}
			}
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't addSealsByFact", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	/**
	 * Привязка пломб к сменному заданию для рейдовой бригады (по факту)
	 *
	 * @param workOrderBytCode - код сменного задания
	 * @param seals - массив с пломбами
	 * @param accountingTypeCode - тип учета (пломба/ИМП/голограмма)
	 * @param noBindingToPlans - привязывать ли пломбы к конкретным планам (true - не привязывать, false - привязывать)
	 */
	public void addSealsForRaidByFact(int workOrderBytCode, ENMetrologyCounterShort[] seals, int accountingTypeCode, boolean noBindingToPlans)
	{
		if (accountingTypeCode != TKAccountingType.SEAL &&
			accountingTypeCode != TKAccountingType.IMP &&
			accountingTypeCode != TKAccountingType.HOLO)
		{
			throw new SystemException("\n\nNET-4350 Невідомий тип об'єкту!");
		}

		if (seals.length == 0)
		{
			throw new SystemException("\n\nNET-4350 Не заданий перелік пломб!");
		}

		if (accountingTypeCode == Integer.MIN_VALUE)
		{
			throw new SystemException("\n\nNET-4350 Не заданий тип обліку!");
		}

		try
		{
			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено змінне завдання з кодом " + workOrderBytCode + " !");
			}

			if (workOrderByt.typeRef.code != ENWorkOrderBytType.RAID_BY_BILLING)
			{
				throw new SystemException("\n\nNET-4530 Змінне завдання з кодом " + workOrderBytCode + " має неприпустимий для цієї операції тип (" +
						workOrderByt.typeRef.code + ") !");
			}

			// Проверка статуса сменного задания
			scLogic.checkWorkOrderBytForStatus(workOrderByt, ENWorkOrderBytStatus.COMPLETED, true);

			ENEstimateItemFilter estimateItemFilter = new ENEstimateItemFilter();

			// 08.07.16 Возникают ситуации, когда работу с пломбами добавляют уже в Задание-Факт
			// (или могут просто добавить пломбы в работу в Задании-Факте)
			/*
			estimateItemFilter.conditionSQL =
					" code in ( " +
					"   select distinct ei1.code " +
					"   from " +
					"     enestimateitem ei, enestimateitem ei1, " +
					"     enestimateitem2nstmttm ei2ei, " +
					"     enplanworkitem pi, " +
					"     enworkorderbytitem wbi, " +
					"     enplanwork p " +
					"   where ei.planitemrefcode = pi.code " +
					"     and ei.materialrefcode = ei1.materialrefcode " +
					"     and ei2ei.estimateiteminrefcode = ei.code " +
					"     and ei2ei.estimateitemoutrefcode = ei1.code " +
					"     and ei2ei.typerefcode = " + ENEstimateItem2Type.PLAN_MOVED +
					"     and ei1.planrefcode = p.code and p.statuscode = " + ENPlanWorkStatus.GOOD +
					"     and wbi.planitemrefcode = pi.code " +
					"     and pi.countgen > 0 " +
					"     and wbi.workorderbytrefcode = " + workOrderBytCode +
					"     and ei.countfact > 0 " +
					"     and ei1.countfact > 0 " +
					"     and ei.accountingtyperefcode = " + accountingTypeCode +
					//"     and ei1.accountingtyperefcode = " + accountingTypeCode +
					" ) ";
			*/
			estimateItemFilter.conditionSQL =
					" code in ( " +
					"   select distinct ei.code " +
					"   from " +
					"      ENWORKORDERBYTITEM wbi, " +
					"      enestimateitem ei, " +
					"      enplanwork plan, " +
					"      enplanwork fact, " +
					"      enplancorrecthistory ch " +
					"  where " +
					"      ei.planrefcode = fact.code " +
					"      and wbi.planrefcode = plan.code " +
					"      and plan.code = ch.planoldrefcode " +
					"      and fact.code = ch.plannewrefcode " +
					"      and fact.statuscode = " + ENPlanWorkStatus.GOOD +
					"      and ch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
					"      and wbi.workorderbytrefcode = " + workOrderBytCode +
					"      and ei.countfact > 0 " +
					"      and ei.accountingtyperefcode = " + accountingTypeCode +
					" ) ";

			int[] estimateItemArr = estimateItemDAO.getFilteredCodeArray(estimateItemFilter, 0, -1);

			// Если в плане пломбы вообще не нужны, нефиг клацать на "Привязку пломб"!!!
			if (estimateItemArr.length == 0)
			{
				// 27.09.2017 Проверим случай, когда все факты уже утверждены (т.е. акты проведены),
				// и при этом пытаются привязать пломбы (тот же запрос, что и вверху, но выбираем 
				// ВСЕ Задания-Факты, а не только черновые)
				estimateItemFilter.conditionSQL =
						" code in ( " +
						"   select distinct ei.code " +
						"   from " +
						"      ENWORKORDERBYTITEM wbi, " +
						"      enestimateitem ei, " +
						"      enplanwork plan, " +
						"      enplanwork fact, " +
						"      enplancorrecthistory ch " +
						"  where " +
						"      ei.planrefcode = fact.code " +
						"      and wbi.planrefcode = plan.code " +
						"      and plan.code = ch.planoldrefcode " +
						"      and fact.code = ch.plannewrefcode " +
						// ЗДЕСЬ ВЫБИРАЕМ ВСЕ ЗАДАНИЯ-ФАКТЫ, А НЕ ТОЛЬКО ЧЕРНОВЫЕ!
						//"      and fact.statuscode = " + ENPlanWorkStatus.GOOD +
						"      and ch.reasoncode = " + ENPlanCorrectReason.MOVE_TO_FACT +
						"      and wbi.workorderbytrefcode = " + workOrderBytCode +
						"      and ei.countfact > 0 " +
						"      and ei.accountingtyperefcode = " + accountingTypeCode +
						" ) ";

				estimateItemArr = estimateItemDAO.getFilteredCodeArray(estimateItemFilter, 0, -1);				
				
				if (estimateItemArr.length > 0) {
					throw new SystemException("\n\nNET-4530 Усі Завдання-Факти з цього Змінного завдання вже затверджені!\n" + 
							"Для прив'язки пломб спочатку відмініть проведення актів (або затвердження Завдань-Фактів, якщо актів немає)!");
				}
				
				throw new SystemException("\n\nNET-4530 У цьому Змінному завданні немає робіт (у Завданнях-Фактах), у яких використовуються пломби!");
			}

			WorkOrderLogic workOrderLogic = new WorkOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			EstimateLogic estimateLogic = new EstimateLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			int sealsArrIndex = 0;
			int sealsByPlansCount = 0;

			// int planCode = Integer.MIN_VALUE;

			if (! noBindingToPlans)
			{
				for (int i = 0; i < estimateItemArr.length; i++)
				{
					if (sealsArrIndex > seals.length - 1)
					{
						// Выходим (могут же пломбы привязывать частями, например, выбирают с подотчета за несколько раз - из разных коробок)
						//throw new SystemException("\n\nNET-4530 Видано недостатню кількість пломб для змінного завдання!");
						return;
					}

					/////
					ENEstimateItem estimateItem = estimateItemDAO.getObject(estimateItemArr[i]);

					//if (estimateItem.planRef.code != planCode) // чтобы не дергать план каждый раз
					//{
				        ENPlanWork plan = planDAO.getObject(estimateItem.planRef.code);

				        if (plan == null)
				        {
				        	throw new SystemException("\n\nNET-4530 Не знайдено план з кодом " + estimateItem.planRef.code + " !");
				        }

				        if (plan.kind.code != ENPlanWorkKind.FACT || plan.status.code != ENPlanWorkStatus.GOOD)
				        {
				        	throw new SystemException("\n\nNET-4530 Прив'язувати пломби по факту дозволяється тільки на ЧОРНОВИХ ЗАВДАННЯХ-ФАКТАХ!\n" +
				        			"План з кодом " + plan.code + " не є чорновим Завданням-Фактом!");
				        }
					//}

					SCSealFilter sealFilter = new SCSealFilter();
					sealFilter.estimateItemRef.code = estimateItemArr[i];
					// Для привязки надо выбирать 2 lockTyp'а, потому что, если какую-то пломбу установят в биллинге,
					// ее lockType изменится на SCSealLockType.FOR_FACT
					//sealFilter.lockTypeRef.code = SCSealLockType.FOR_WORKORDERBYT;
					sealFilter.conditionSQL = "locktyperefcode in (" + SCSealLockType.FOR_WORKORDERBYT + ", " + SCSealLockType.FOR_FACT + ")";

					int[] sealsBoundArr = sealDAO.getFilteredCodeArray(sealFilter, 0, -1);
					/////

					int estimateItemCount = estimateItem.countFact.intValue();
					int estimateItemCount4Binding = estimateItemCount - sealsBoundArr.length;

					if (estimateItemCount4Binding <= 0)
					{
						continue;
					}

					ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();
					workOrderBytItemFilter.conditionSQL =
							" code in ( " +
							"   select wbi.code " +
							"   from " +
							"     enestimateitem ei, enestimateitem ei1, " +
							"     enestimateitem2nstmttm ei2ei, " +
							"     enplanworkitem pi, " +
							"     enworkorderbytitem wbi " +
							"   where ei.planitemrefcode = pi.code " +
							"     and ei.materialrefcode = ei1.materialrefcode " +
							"     and ei2ei.estimateiteminrefcode = ei.code " +
							"     and ei2ei.estimateitemoutrefcode = ei1.code " +
							"     and ei2ei.typerefcode = " + ENEstimateItem2Type.PLAN_MOVED +
							"     and wbi.planitemrefcode = pi.code " +
							"     and wbi.workorderbytrefcode = " + workOrderBytCode +
							"     and ei1.code = " + estimateItemArr[i] +
							" )";
					workOrderBytItemFilter.orderBySQL = "customername";

					int[] workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

					if (workOrderBytItemArr.length == 0)
					{
						// Если не нашли по связке эстимейтов, значит, пломба была добавлена уже на Задание-Факт,
						// и нужно искать по-другому
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
								"      and ei.accountingtyperefcode = " + accountingTypeCode +
								" )";

						workOrderBytItemArr = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

						if (workOrderBytItemArr.length == 0)
						{
							throw new SystemException("\n\nNET-4530 Не знайдено строк змінного завдання з пломбами!");
						}
					}

					int j = 1;

					//for (int j = 1; j <= estimateItemCount4Binding; j++)
					//while (j <= estimateItemCount4Binding)
					{
						if (sealsArrIndex > seals.length - 1)
						{
							// Выходим (могут же пломбы привязывать частями, например, выбирают с подотчета за несколько раз - из разных коробок)
							//throw new SystemException("\n\nNET-4530 Видано недостатню кількість пломб для змінного завдання!");
							return;
						}

						String tmpCustomerNumber = "";

						for (int w = 0; w < workOrderBytItemArr.length && j <= estimateItemCount4Binding; w++)
						{
							ENWorkOrderBytItem workOrderBytItem = workOrderBytItemDAO.getObject(workOrderBytItemArr[w]);

							if (workOrderBytItem == null)
							{
								throw new SystemException("\n\nNET-4530 Не знайдено строку змінного завдання з кодом " + workOrderBytItemArr[w] + " !");
							}

							if (! workOrderBytItem.customerName.equals(tmpCustomerNumber))
							{
								tmpCustomerNumber = workOrderBytItem.customerName;
							}
							else
							{
								continue;
							}

							///// Если к текущей строке сменного задания уже привязано достаточно пломб, нужно ее пропустить
							SCSeal2ENWorkOrderBytFilter seal2WorkOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
							seal2WorkOrderBytFilter.kindRef.code = SCSeal2WorkOrderBytKind.FACT;
							seal2WorkOrderBytFilter.workOrderBytItemRef.code = workOrderBytItemArr[w];

							// Поле TYPE_OBJECT в OSTABLE (в ScanCounters): Тип картотеки (1 - счетчик, 2 - пломба, 3 - индикатор, 4 - голограмма)
							int scTypeObject = Integer.MIN_VALUE;

							switch (accountingTypeCode)
							{
								case TKAccountingType.SEAL:
									scTypeObject = ENConsts.SCANCOUNTERS_TYPEOBJECT_SEAL;
									break;

								case TKAccountingType.IMP:
									scTypeObject = ENConsts.SCANCOUNTERS_TYPEOBJECT_INDICATOR;
									break;

								case TKAccountingType.HOLO:
									scTypeObject = ENConsts.SCANCOUNTERS_TYPEOBJECT_HOLOGRAM;
									break;

								default:
									scTypeObject = Integer.MIN_VALUE;
							}

							if (scTypeObject == Integer.MIN_VALUE)
							{
								throw new SystemException("\n\nNET-4530 Невідомий тип картотеки в ScanCounters!\n" +
										"type_object: " + scTypeObject);
							}

							seal2WorkOrderBytFilter.conditionSQL =
								" SCSEAL2ENWORKORDERBYT.sealrefcode in " +
								"   (select s.code from scseal s where s.typerefcode = " + scTypeObject +
								"       and s.code = SCSEAL2ENWORKORDERBYT.sealrefcode) ";

							int[] seal2WorkOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2WorkOrderBytFilter, 0, -1);

							int countByTechCard = estimateLogic.getEstimateCountByTechCard(estimateItemArr[i]).intValue();
							int count4Binding = countByTechCard - seal2WorkOrderBytArr.length;

							if (count4Binding <= 0)
							{
								continue;
							}
							/////

							//for (int c = 1; c <= countByTechCard; c++)
							for (int c = 1; c <= count4Binding; c++)
							{
								if (sealsArrIndex > seals.length - 1)
								{
									// Выходим (могут же пломбы привязывать частями, например, выбирают с подотчета за несколько раз - из разных коробок)
									//throw new SystemException("\n\nNET-4530 Видано недостатню кількість пломб для змінного завдання!");
									return;
								}

								ENMetrologyCounterShort tmpSeal = seals[sealsArrIndex++];

								System.out.println("estimateItem " + estimateItemArr[i] + " - " +
										"seal " + tmpSeal.buildNumber);

								SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(tmpSeal, SCSealLockType.FOR_WORKORDERBYT);

								// Проверим, чтобы совпадал МОЛ, с которого мы резервируем пломбу, с тем, который у нас в наряд-задании на плане
								String finMolCode = workOrderLogic.getMasterCodeFromWorkOrderByPlanCode(plan.code, true);
								if (! seal.molCode.equals(finMolCode))
								{
									throw new SystemException("\n\nNET-4530 МВО, з якої резервуються пломби (" + seal.molCode +
											"), не співпадає з МВО на наряд-завданні в плані (" + finMolCode + ") !");
								}

								seal.estimateItemRef.code = estimateItemArr[i];

								int sealCode = sealDAO.add(seal);

								SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
								seal2workOrderByt.sealRef.code = sealCode;
								seal2workOrderByt.workOrderBytItemRef.code = workOrderBytItemArr[w];
								seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
								seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.FACT;
								seal2workOrderBytDAO.add(seal2workOrderByt);

								if (workOrderBytItem.finWorker == null)
								{
									throw new SystemException("\n\nNET-4530 Не знайдено виконавця для строки змінного завдання з кодом " + workOrderBytItemArr[w] + " !");
								}

								// Лочим пломбу в ScanCounters
								scLogic.lockSeal(seal.scCode, workOrderByt.numberGen, workOrderByt.dateGen,
												 workOrderBytItem.finWorker.tabNumber, workOrderBytItem.finWorker.name,
												 ENMetrologyCounter.BILLING_LOCK /* ?? */);

								sealsByPlansCount = sealsArrIndex;

								j++;
							}
						}
					}

				} // for (int i = 0; i < estimateItemArr.length; i++)

			} // if (! noBindingToPlans)

			// Остаток пломб (т.е. то, что выдано поверх потребности)
			// нужно подвязать под все сменное задание (без ссылки на конкретный workOrderBytItem)
			if (sealsByPlansCount < seals.length)
			{
				/////
				// 03.06.16 Возможна хитрая ситуация, когда пломба подвязана к эстимейту из нашего задания в другом задании
				// (типа в работе 2 монтера и каждому выдается отдельное задание, но с одним и тем же планом - см. SUPP-49304).
				// В этом случае мы не должны давать привязать к нему пломбу (или кидать ее в дополнительные, непривязанные?).
				// Думаю, не будем давать такое делать!

				SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
				seal2workOrderBytFilter.conditionSQL =
					" code in ( " +
					"   select swb.code " +
					"   from  " +
					"     enestimateitem ei, enplanworkitem pi,  " +
					"     enworkorderbytitem wbi, " +
					"     scseal s, scseal2enworkorderbyt swb " +
					"   where ei.planitemrefcode = pi.code  " +
					"     and wbi.planitemrefcode = pi.code  " +
					"     and pi.countgen > 0  " +
					"     and wbi.workorderbytrefcode = " + workOrderBytCode +
					"     and ei.countfact > 0  " +
					//"     and ei.accountingtyperefcode in (" + TKAccountingType.ALL_SEALS + ") " +
					"     and ei.accountingtyperefcode = " + accountingTypeCode +
					"      " +
					"     and s.estimateitemrefcode = ei.code " +
					"     and s.locktyperefcode = " + SCSealLockType.FOR_WORKORDERBYT +
					"     and swb.sealrefcode = s.code " +
					"     and swb.workorderbytrefcode <> " + workOrderBytCode +
					")";

				int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

				if (seal2workOrderBytArr.length > 0)
				{
					SCSeal2ENWorkOrderByt scSeal2ENWorkOrderByt = seal2workOrderBytDAO.getObject(seal2workOrderBytArr[0]);

					ENWorkOrderByt workOrderBytOther = workOrderBytDAO.getObject(scSeal2ENWorkOrderByt.workOrderBytRef.code);
					ENWorkOrderBytItem workOrderBytItemOther = workOrderBytItemDAO.getObject(scSeal2ENWorkOrderByt.workOrderBytItemRef.code);

		     		throw new SystemException("\n\nNET-4530 Для \"" + workOrderBytItemOther.customerName + "\"\n" +
                               "вже зарезервовано пломби в іншому змінному завданні № " + workOrderBytOther.numberGen + " від " +
                               new SimpleDateFormat("dd.MM.yyyy").format(workOrderBytOther.dateGen) +
                               " (код: " + workOrderBytOther.code + ") !");
				}
				/////


				for (int i = sealsArrIndex; i < seals.length; i++)
				{
					ENMetrologyCounterShort tmpSeal = seals[i];

					System.out.println("NO estimateItem - seal " + tmpSeal.buildNumber);

					SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(tmpSeal, SCSealLockType.FOR_WORKORDERBYT);

					int sealCode = sealDAO.add(seal);

					SCSeal2ENWorkOrderByt seal2workOrderByt = new SCSeal2ENWorkOrderByt();
					seal2workOrderByt.sealRef.code = sealCode;
					seal2workOrderByt.workOrderBytRef.code = workOrderBytCode;
					seal2workOrderByt.kindRef.code = SCSeal2WorkOrderBytKind.FACT;
					seal2workOrderBytDAO.add(seal2workOrderByt);

					if (workOrderByt.finWorker == null)
					{
						throw new SystemException("\n\nNET-4530 Не знайдено виконавця для змінного завдання з кодом " + workOrderBytCode + " !");
					}

					// Лочим пломбу в ScanCounters. Данные по исполнителю берем с самого задания, а не со строки,
					// т.к. тут у нас уже нет привязки к конкретной строке
					scLogic.lockSeal(seal.scCode, workOrderByt.numberGen, workOrderByt.dateGen,
									 workOrderByt.finWorker.tabNumber, workOrderByt.finWorker.name,
									 ENMetrologyCounter.BILLING_LOCK /* ?? */);
				}
			}
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't addSealsForRaidByFact", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}


	public void removeSeals(int workOrderBytCode, int[] sealCodes)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено змінне завдання з кодом " + workOrderBytCode + " !");
			}

			// Проверка статуса сменного задания
			scLogic.checkWorkOrderBytForStatus(workOrderByt, ENWorkOrderBytStatus.FORMED, true);

			String strSealCodes = "";

			for (int i = 0; i < sealCodes.length; i++)
			{
				if (strSealCodes.length() == 0)
				{
					strSealCodes = "" + sealCodes[i];
				}
				else
				{
					strSealCodes += ", " + sealCodes[i];
				}
			}

			if (strSealCodes.length() == 0)
			{
				throw new SystemException("\n\nNET-4530 Не заданий перелік пломб для видалення!");
			}

			SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
			seal2workOrderBytFilter.conditionSQL = "sealrefcode in (" + strSealCodes + ")";

			int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

			for (int i = 0; i < seal2workOrderBytArr.length; i++)
			{
				SCSeal2ENWorkOrderByt seal2WorkOrderByt = seal2workOrderBytDAO.getObject(seal2workOrderBytArr[i]);

				SCSeal seal = sealDAO.getObject(seal2WorkOrderByt.sealRef.code);

				// Проверим, чтобы из плана не был создан факт, а то факт может появиться независимо от сменного задания
				// (и в него скопируются привязанные на плане пломбы) - а потом возьмут и отменят привязку пломб на задании
				scLogic.checkPlanStatusForSeal(seal, "Тому видаляти прив'язку пломб можливо лише на Завданні-Факті " +
						"(після переведення Змінного завдання в статус \"Виконане\")!");

				// Проверим бух. счет пломбы в ScanCounters
				scLogic.checkSealSCAccount(seal.scCode, "2013", "Цю пломбу не можна видаляти з завдання!");

				// Разлочиваем пломбу в ScanCounters
				scLogic.lockSeal(seal.scCode, null, null, null, null,
								 -1 * ENMetrologyCounter.BILLING_LOCK /* ?? */);

				seal2workOrderBytDAO.remove(seal2workOrderBytArr[i]);
				sealDAO.remove(seal.code);
			}
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't removeSeals", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}

	}

	public void removeSealsByFact(int workOrderBytCode, int[] sealCodes)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено змінне завдання з кодом " + workOrderBytCode + " !");
			}

			// Проверка статуса сменного задания
			scLogic.checkWorkOrderBytForStatus(workOrderByt, ENWorkOrderBytStatus.COMPLETED, true);

			String strSealCodes = "";

			for (int i = 0; i < sealCodes.length; i++)
			{
				if (strSealCodes.length() == 0)
				{
					strSealCodes = "" + sealCodes[i];
				}
				else
				{
					strSealCodes += ", " + sealCodes[i];
				}
			}

			if (strSealCodes.length() == 0)
			{
				throw new SystemException("\n\nNET-4530 Не заданий перелік пломб для видалення!");
			}

			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENAct2ENPlanWorkDAO act2planDAO = new ENAct2ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
			seal2workOrderBytFilter.conditionSQL = "sealrefcode in (" + strSealCodes + ")";

			int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

			for (int i = 0; i < seal2workOrderBytArr.length; i++)
			{
				SCSeal2ENWorkOrderByt seal2WorkOrderByt = seal2workOrderBytDAO.getObject(seal2workOrderBytArr[i]);

				SCSeal seal = sealDAO.getObject(seal2WorkOrderByt.sealRef.code);

				if (seal.statusRef.code != SCSealStatus.GOOD && seal.statusRef.code != SCSealStatus.SPOILED)
				{
					throw new SystemException("\n\nNET-4530 Пломбу № " + seal.buildNumber + " вже встановлено у білінгу!");
				}

				//scLogic.checkPlanStatusForSeal(seal, "");
				/////
				if (seal.estimateItemRef != null)
				{
					if (seal.estimateItemRef.code != Integer.MIN_VALUE)
					{
						// Если зайдет сюда, то у пломбы статус "Зіпсована", что невозможно для пломб, привязанных к планам!!!
						if (seal.statusRef.code != SCSealStatus.GOOD)
						{
							throw new SystemException("\n\nNET-4530 Пломба № " + seal.buildNumber +
									"має некоректний статус для цієї операції!");
						}

						ENEstimateItem estimateItem = estimateItemDAO.getObject(seal.estimateItemRef.code);
						ENPlanWork plan = planDAO.getObjectNOSEGR(estimateItem.planRef.code);

						if (plan.kind.code != ENPlanWorkKind.FACT || plan.status.code != ENPlanWorkStatus.GOOD)
				        {
							throw new SystemException("\n\nNET-4530 План, до якого прив'язано пломбу № " + seal.buildNumber +
									", не є чорновим Завданням-Фактом!");
				        }

						ENAct2ENPlanWorkFilter act2planFilter = new ENAct2ENPlanWorkFilter();
						act2planFilter.plan.code = plan.code;

						int[] act2planArr = act2planDAO.getFilteredCodeArray(act2planFilter, 0, -1);

						if (act2planArr.length > 0)
						{
							throw new SystemException("\n\nNET-4530 Завдання-Факт, до якого прив'язано пломбу № " + seal.buildNumber +
									", вже включено до акту! Код Завдання-Факту: " + plan.code);
						}
					}
				}
				/////

				/////
				// Нужно найти такую же пломбу на Задании-Плане и удалить ее тоже (вместе со связкой)
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
						"     and swb.workorderbytrefcode = " + workOrderBytCode +
						"     and s.sccode = " + seal.scCode +
						"     and swb.kindrefcode = " + SCSeal2WorkOrderBytKind.FACT +
						"     and swb1.sealrefcode = s1.code " +
						"     and swb1.workorderbytrefcode = swb.workorderbytrefcode " +
						"     and swb1.kindrefcode = " + SCSeal2WorkOrderBytKind.PLAN +
						"     and s1.sccode = s.sccode " +
						" ) ";

				int[] scSealArr = sealDAO.getFilteredCodeArray(scSealFilter, 0, -1);

				for (int j = 0; j < scSealArr.length; j++)
				{
					SCSeal2ENWorkOrderBytFilter seal2workOrderBytPlanFilter = new SCSeal2ENWorkOrderBytFilter();
					seal2workOrderBytPlanFilter.sealRef.code = scSealArr[j];
					seal2workOrderBytPlanFilter.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;
					seal2workOrderBytPlanFilter.workOrderBytRef.code = workOrderBytCode;

					int[] seal2workOrderBytPlanArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytPlanFilter, 0, -1);

					for (int s = 0; s < seal2workOrderBytPlanArr.length; s++)
					{
						seal2workOrderBytDAO.remove(seal2workOrderBytPlanArr[s]);
					}

					sealDAO.remove(scSealArr[j]);
				}
				/////

				// Разлочиваем пломбу в ScanCounters
				scLogic.lockSeal(seal.scCode, null, null, null, null,
								 -1 * ENMetrologyCounter.BILLING_LOCK /* ?? */);

				seal2workOrderBytDAO.remove(seal2workOrderBytArr[i]);
				sealDAO.remove(seal.code);
			}
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't removeSealsByFact", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	public void makeFormed(int workOrderBytCode) 
	{

		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено змінне завдання з кодом " + workOrderBytCode + " !");
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.DRAFT)
			{
				throw new SystemException("\n\nNET-4530 Змінне завдання з кодом " + workOrderBytCode + " повинно бути в статусі \"Чорнове\" !");
			}

			workOrderByt.statusRef.code = ENWorkOrderBytStatus.FORMED;
			workOrderBytDAO.save(workOrderByt);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't makeFormed", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	public void undoMakeFormed(int workOrderBytCode)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено змінне завдання з кодом " + workOrderBytCode + " !");
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.FORMED)
			{
				throw new SystemException("\n\nNET-4530 Змінне завдання з кодом " + workOrderBytCode + " повинно бути в статусі \"Складене\" !");
			}

            ///// Не дадим отменить перевод задания в статус "Складене", если уже есть привязанные пломбы
			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
			seal2workOrderBytFilter.workOrderBytRef.code = workOrderBytCode;

			int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

			if (seal2workOrderBytArr.length > 0)
			{
				throw new SystemException("\n\nNET-4530 На змінному завданні вже є зарезервовані пломби! Спочатку потрібно відмінити резервування!");
			}
			/////

			workOrderByt.statusRef.code = ENWorkOrderBytStatus.DRAFT;
			workOrderBytDAO.save(workOrderByt);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't undoMakeFormed", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	public void makeApproved(int workOrderBytCode)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено змінне завдання з кодом " + workOrderBytCode + " !");
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.FORMED)
			{
				throw new SystemException("\n\nNET-4530 Змінне завдання з кодом " + workOrderBytCode + " повинно бути в статусі \"Складене\" !");
			}

			/////
			/* 12.06.16 Для возможности привязки по факту убираем проверку
			// Сверяем общее кол-во пломб, необходимое на задании, с подвязанным кол-вом.
			// До тех пор, пока не будет подвязано достаточное кол-во, не дадим перевести задание в статус "Затверджене"
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			int sealsTotalCount = scLogic.getSealsCountForWorkOrderByt(workOrderBytCode);
			int sealsCountReserved = scLogic.getSealsCountReservedByPlanForWorkOrderByt(workOrderBytCode);

            if (sealsCountReserved < sealsTotalCount)
            {
            	throw new SystemException("\n\nNET-4530 Кількість зарезервованих пломб на Змінному завданні менша за мінімально необхідну!\n" +
            			"Зарезервовано: " + sealsCountReserved + ", необхідно: " + sealsTotalCount);
            }
            */
			/////

			workOrderByt.statusRef.code = ENWorkOrderBytStatus.APPROVED;
			workOrderBytDAO.save(workOrderByt);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't makeApproved", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	public void undoMakeApproved(int workOrderBytCode)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено змінне завдання з кодом " + workOrderBytCode + " !");
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.APPROVED)
			{
				throw new SystemException("\n\nNET-4530 Змінне завдання з кодом " + workOrderBytCode + " повинно бути в статусі \"Затверджене\" !");
			}

			workOrderByt.statusRef.code = ENWorkOrderBytStatus.FORMED;
			workOrderBytDAO.save(workOrderByt);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't undoMakeApproved", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	public void makeCompleted(int workOrderBytCode)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено змінне завдання з кодом " + workOrderBytCode + " !");
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.APPROVED)
			{
				throw new SystemException("\n\nNET-4530 Змінне завдання з кодом " + workOrderBytCode + " повинно бути в статусі \"Затверджене\" !");
			}

			workOrderByt.statusRef.code = ENWorkOrderBytStatus.COMPLETED;
			workOrderBytDAO.save(workOrderByt);

			/////
			// Переводим все черновые Задания-Планы из этого сменного задания в Задания-Факты
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
			planFilter.status.code = ENPlanWorkStatus.GOOD;
			planFilter.conditionSQL =
					" code in " +
					" ( " +
					"   select distinct bi.planrefcode " +
					"     from enworkorderbytitem bi " +
					"    where bi.workorderbytrefcode = " + workOrderBytCode +
					" )";

			int[] planArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);

			if (planArr.length > 0)
			{
	            Context planCnt = new InitialContext();
	            Object planRef = planCnt.lookup(ENPlanWorkController.JNDI_NAME);
	            ENPlanWorkControllerHome planHome = (ENPlanWorkControllerHome) PortableRemoteObject.narrow(planRef, ENPlanWorkControllerHome.class);
	            ENPlanWorkController planController = planHome.create();

	            for (int i = 0; i < planArr.length; i++)
	            {
	            	planController.closePlanWork(planArr[i]);
	            }
			}
			/////

            ///// Копируем пломбы, не привязанные к планам (привязанные скопируются выше в planController.closePlanWork)
            SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            SCSeal2ENWorkOrderBytDAO seal2wbDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            SCSealFilter sealFilter = new SCSealFilter();

            sealFilter.conditionSQL =
        		" code in " +
        		" ( " +
        		"   select swb.sealrefcode " +
        		"   from scseal2enworkorderbyt swb " +
        		"   where swb.workorderbytrefcode = " + workOrderBytCode +
        		"     and swb.workorderbytitemrefcod is null " +
        		"     and swb.kindrefcode = " + SCSeal2WorkOrderBytKind.PLAN +
        		" ) " +
        		" and estimateitemrefcode is null ";

            int[] sealArr = sealDAO.getFilteredCodeArray(sealFilter, 0, -1);

            for (int i = 0; i < sealArr.length; i++)
            {
            	SCSeal scSeal = sealDAO.getObject(sealArr[i]);
            	int newSealCode = sealDAO.add(scSeal);

                // Создаем связки SCSeal2WorkOrderByt со ссылками на новые SCSeal'ы и kindRefCode = 2 (ФАКТ) !!!!!
                SCSeal2ENWorkOrderBytFilter scSeal2wbFilter = new SCSeal2ENWorkOrderBytFilter();
                scSeal2wbFilter.workOrderBytRef.code = workOrderBytCode;
                scSeal2wbFilter.sealRef.code = sealArr[i];
                scSeal2wbFilter.kindRef.code = SCSeal2WorkOrderBytKind.PLAN;

                int[] scSeal2wbArr = seal2wbDAO.getFilteredCodeArray(scSeal2wbFilter, 0, -1);

                for (int w = 0; w < scSeal2wbArr.length; w++)
                {
                	SCSeal2ENWorkOrderByt scSeal2wb = seal2wbDAO.getObject(scSeal2wbArr[w]);
                	scSeal2wb.kindRef.code = SCSeal2WorkOrderBytKind.FACT;
                	scSeal2wb.sealRef.code = newSealCode;
                	seal2wbDAO.add(scSeal2wb);
                }
            }
            /////
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't makeCompleted", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (NamingException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (RemoteException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (CreateException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	public void undoMakeCompleted(int workOrderBytCode)
	{
		// ВРЕМЕННО!!!
		/*
		if (1 == 1)
		{
			throw new SystemException("\n\nNET-4530 Цю функцію тимчасово заблоковано !");
		}
		*/

		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено змінне завдання з кодом " + workOrderBytCode + " !");
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.COMPLETED)
			{
				throw new SystemException("\n\nNET-4530 Змінне завдання з кодом " + workOrderBytCode + " повинно бути в статусі \"Виконане\" !");
			}

			/*
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			// Проверим, что с пломбами
			scLogic.checkSealsStatusesForWorkOrderByt(workOrderBytCode, true, "Відміняти переведення завдання в статус \"Виконане\" заборонено!");
			*/

			SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
			seal2workOrderBytFilter.workOrderBytRef.code = workOrderBytCode;

			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

			if (seal2workOrderBytArr.length > 0)
			{
				throw new SystemException("\n\nNET-4530 Спочатку потрібно відмінити резервування для усіх пломб (тобто, видалити прив'язку)!\n\n" +
						"Але повертати завдання в попередній статус необов'язково, тому що можливо прив'язати будь-яку пломбу, навіть якщо " +
						"завдання знаходиться в статусі \"Виконане\"!");
			}

			workOrderByt.statusRef.code = ENWorkOrderBytStatus.APPROVED;
			workOrderBytDAO.save(workOrderByt);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't undoMakeCompleted", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	public void makeClosed(int workOrderBytCode)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено змінне завдання з кодом " + workOrderBytCode + " !");
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.COMPLETED)
			{
				throw new SystemException("\n\nNET-4530 Змінне завдання з кодом " + workOrderBytCode + " повинно бути в статусі \"Виконане\" !");
			}

			/////
			// Сверяем общее кол-во пломб, необходимое на задании, с подвязанным кол-вом по факту.
			// До тех пор, пока не будет подвязано достаточное кол-во, не дадим перевести задание в статус "Завершене"
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			int sealsTotalCount = scLogic.getSealsCountByFactForWorkOrderByt(workOrderBytCode);

            SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            SCSealFilter sealFilter = new SCSealFilter();
            sealFilter.conditionSQL =
        		" code in " +
        		" ( " +
        		"   select distinct swb.sealrefcode " +
        		"   from scseal2enworkorderbyt swb " +
        		"   where swb.workorderbytrefcode = " + workOrderBytCode +
        		"     and swb.workorderbytitemrefcod is not null " +
        		"     and swb.kindrefcode = " + SCSeal2WorkOrderBytKind.FACT +
        		" ) " +
        		" and estimateitemrefcode is not null ";

            int[] sealArr = sealDAO.getFilteredCodeArray(sealFilter, 0, -1);

            // Уберем лишнюю проверку, а то клацать и менять на каждом факте countfact на эстимейтах с пломбами будет напряжно
            /*
            if (sealArr.length < sealsTotalCount)
            {
            	throw new SystemException("\n\nNET-4530 Кількість зарезервованих пломб на Змінному завданні менша за необхідну!\n" +
            			"Зарезервовано: " + sealArr.length + ", необхідно: " + sealsTotalCount);
            }
            */

            // А вот привязать больше нельзя давать!!!
            if (sealArr.length > sealsTotalCount)
            {
            	throw new SystemException("\n\nNET-4530 Кількість зарезервованих пломб на Змінному завданні більша за необхідну!\n" +
            			"Зарезервовано: " + sealArr.length + ", необхідно: " + sealsTotalCount);
            }
			/////

            TechCardLogic techCardLogic = new TechCardLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            
            /////
            // 12.07.16 При переводе сменного задания в статус "Завершенное" будем проверять, чтобы все пломбы, подвязанные под планы,
            // были установлены в биллинге (или их нужно переместить в неиспользованные/испорченные)
            for (int i = 0; i < sealArr.length; i++)
            {
            	SCSeal seal = sealDAO.getObject(sealArr[i]);

            	/// найдем план для пломбы
            	/// если у плана тип Параметризация, то не будем проверять, что он установлен в Биллинге
            	ENEstimateItemDAO eiDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            	ENEstimateItem ei = eiDAO.getObject(seal.estimateItemRef.code);

            	ENPlanWorkDAO pwDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            	ENPlanWork pw = pwDAO.getObject(ei.planRef.code);

            	Boolean isParametrisationPlan = false;
            	if (pw.stateRef.code == ENPlanWorkState.COUNTERS_PARAMETRIZATION || pw.stateRef.code == ENPlanWorkState.COUNTERS_PARAMETRIZATION_FREE_OF_CHARGE) {
            		isParametrisationPlan = true;
            	}

            	// 28.02.2018 NET-4549 Если на калькуляции установлен признак "Программирование счетчика в условиях Метрологической службы",
            	// то не проверяем в Биллинге
            	Boolean isMetrology = false;
            	TKClassificationType tkClassificationType = techCardLogic.getTKClassificationTypeByPlanWorkItemCode(ei.planItemRef.code);
            	if (tkClassificationType != null) {
            		if (tkClassificationType.isMetrology == 1) {
            			isMetrology = true;
            		}
            	}
            	
    			if (seal.statusRef.code == SCSealStatus.GOOD && !isParametrisationPlan && !isMetrology)
    			{
    				throw new SystemException("\n\nNET-4530 Для переведення змінного завдання в статус \"Завершене\"" +
    						" потрібно спочатку всі використані пломби встановити в білінгу (або, якщо пломбу не використано," +
    						" перенести її в невикористані/зіпсовані)!\n" +
    						"Пломбу № " + seal.buildNumber + " ще НЕ встановлено в білінгу!");
    			}
            }
            /////

			workOrderByt.statusRef.code = ENWorkOrderBytStatus.CLOSED;
			workOrderBytDAO.save(workOrderByt);

            /////
            // Все неиспользованные на задании пломбы нужно разлочить
            SCSealFilter sealUnusedFilter = new SCSealFilter();
            sealUnusedFilter.statusRef.code = SCSealStatus.GOOD;
            sealUnusedFilter.conditionSQL =
        		" code in " +
        		" ( " +
        		"   select distinct swb.sealrefcode " +
        		"   from scseal2enworkorderbyt swb " +
        		"   where swb.workorderbytrefcode = " + workOrderBytCode +
        		"     and swb.workorderbytitemrefcod is null " +
        		"     and swb.kindrefcode = " + SCSeal2WorkOrderBytKind.FACT +
        		" ) " +
        		" and estimateitemrefcode is null ";

            int[] sealUnusedArr = sealDAO.getFilteredCodeArray(sealUnusedFilter, 0, -1);

            for (int i = 0; i < sealUnusedArr.length; i++)
            {
            	SCSeal seal = sealDAO.getObject(sealUnusedArr[i]);

            	// Разлочиваем пломбу в ScanCounters
				scLogic.lockSeal(seal.scCode, null, null, null, null,
								 -1 * ENMetrologyCounter.BILLING_LOCK, true);
            }
            /////
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't makeClosed", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	public void undoMakeClosed(int workOrderBytCode)
	{
		try
		{
			ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWorkOrderByt workOrderByt = workOrderBytDAO.getObject(workOrderBytCode);

			if (workOrderByt == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено змінне завдання з кодом " + workOrderBytCode + " !");
			}

			if (workOrderByt.statusRef.code != ENWorkOrderBytStatus.CLOSED)
			{
				throw new SystemException("\n\nNET-4530 Змінне завдання з кодом " + workOrderBytCode + " повинно бути в статусі \"Завершене\" !");
			}

			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			// Проверим, что с пломбами
			scLogic.checkSealsStatusesForWorkOrderByt(workOrderBytCode, true, "Відміняти переведення завдання в статус \"Завершене\" заборонено!");

			/* Лочить ничего не надо, потому что пока пломбы были разлочены, их могли
			 * уже куда-то утянуть и установить. Нужно просто удалить их вместе со связками (см. ниже).
            /////
            // Пытаемся все неиспользованные на задании пломбы залочить обратно
			SCSealFilter sealUnusedFilter = new SCSealFilter();
            sealUnusedFilter.statusRef.code = SCSealStatus.GOOD;
            sealUnusedFilter.conditionSQL =
        		" code in " +
        		" ( " +
        		"   select distinct swb.sealrefcode " +
        		"   from scseal2enworkorderbyt swb " +
        		"   where swb.workorderbytrefcode = " + workOrderBytCode +
        		"     and swb.workorderbytitemrefcod is null " +
        		"     and swb.kindrefcode = " + SCSeal2WorkOrderBytKind.FACT +
        		" ) " +
        		" and estimateitemrefcode is null ";

            SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            int[] sealUnusedArr = sealDAO.getFilteredCodeArray(sealUnusedFilter, 0, -1);

            for (int i = 0; i < sealUnusedArr.length; i++)
            {
            	SCSeal seal = sealDAO.getObject(sealUnusedArr[i]);

            	// Лочим пломбу в ScanCounters
				scLogic.lockSeal(seal.scCode, null, null, null, null,
								 ENMetrologyCounter.BILLING_LOCK, true);
            }
            /////
            */

            /////
            // Все неиспользованные на задании пломбы удаляем вместе со связками
			SCSeal2ENWorkOrderBytDAO seal2workOrderBytDAO = new SCSeal2ENWorkOrderBytDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			SCSeal2ENWorkOrderBytFilter seal2workOrderBytFilter = new SCSeal2ENWorkOrderBytFilter();
			seal2workOrderBytFilter.workOrderBytRef.code = workOrderBytCode;
			seal2workOrderBytFilter.conditionSQL = "workorderbytitemrefcod is null";

			int[] seal2workOrderBytArr = seal2workOrderBytDAO.getFilteredCodeArray(seal2workOrderBytFilter, 0, -1);

			for (int i = 0; i < seal2workOrderBytArr.length; i++)
			{
				SCSeal2ENWorkOrderByt seal2workOrderByt = seal2workOrderBytDAO.getObject(seal2workOrderBytArr[i]);

				SCSealFilter sealUnusedFilter = new SCSealFilter();
	            sealUnusedFilter.statusRef.code = SCSealStatus.GOOD;
	            sealUnusedFilter.code = seal2workOrderByt.sealRef.code;
	            sealUnusedFilter.conditionSQL = "estimateitemrefcode is null";

	            int[] sealArr = sealDAO.getFilteredCodeArray(sealUnusedFilter, 0, -1);

				seal2workOrderBytDAO.remove(seal2workOrderBytArr[i]);

	            for (int j = 0; j < sealArr.length; j++)
	            {
	            	sealDAO.remove(sealArr[j]);
	            }
			}
			/////

			workOrderByt.statusRef.code = ENWorkOrderBytStatus.COMPLETED;
			workOrderBytDAO.save(workOrderByt);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't undoMakeClosed", e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	public boolean checkWorkOrderBytForStatus(int workOrderBytCode, int statusCode, boolean isException)
	{
		try
		{
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			return scLogic.checkWorkOrderBytForStatus(workOrderBytCode, statusCode, isException);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't checkWorkOrderBytForStatus", e);
		}
		finally
		{
			closeConnection();
		}
	}

	public boolean checkWorkOrderBytForStatus(ENWorkOrderByt workOrderByt, int statusCode, boolean isException)
	{
		try
		{
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			return scLogic.checkWorkOrderBytForStatus(workOrderByt, statusCode, isException);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException("Can't checkWorkOrderBytForStatus", e);
		}
		finally
		{
			closeConnection();
		}
	}

} // end of EJB Controller for ENWorkOrderByt