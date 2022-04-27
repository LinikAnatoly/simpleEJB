
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for SCSeal;
 *
 */

import java.math.BigDecimal;
import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAct2ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENMolDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.SCSealDAO;
import com.ksoe.energynet.ejb.generated.SCSealControllerEJBGen;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.SCLogic;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkStatus;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.SCSeal;
import com.ksoe.energynet.valueobject.SCSeal2WorkOrderBytKind;
import com.ksoe.energynet.valueobject.SCSealLockType;
import com.ksoe.energynet.valueobject.SCSealStatus;
import com.ksoe.energynet.valueobject.brief.ENMetrologyCounterShort;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENMetrologyCounterFilter;
import com.ksoe.energynet.valueobject.filter.SCSeal2ENWorkOrderBytFilter;
import com.ksoe.energynet.valueobject.filter.SCSealFilter;
import com.ksoe.energynet.valueobject.lists.ENMetrologyCounterShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.valueobject.TKAccountingType;
import com.ksoe.techcard.valueobject.TKMaterials;

public class SCSealControllerEJB extends
		SCSealControllerEJBGen {

	public SCSealControllerEJB() {
	}

	/**
	 *  Установка пломбы из биллинга
	 *
	 *  @param sealCode - код пломбы (код из таблицы scseal)
	 *  @param factCode - код Задания-Факта, в котором устанавливается пломба
	 */
	public void installSeal(int sealCode, int factCode)
	{
		// Меняем lockType на seal'е:
		// с "5 - Для змінного завдання"
		// на "2 - Для Роботи з білінгу"
		// И статус - на "Установлена на л/с"

		try {

			if (sealCode == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4530 Не заданий код пломби (scseal.code)!");
			}

			if (factCode == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4530 Не заданий код Завдання-Факту для встановлення пломби!");
			}

			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWork plan = planDAO.getObjectNOSEGR(factCode);

			if (plan == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено план з кодом: " + factCode + " !");
			}

			// 15.06.16 Дадим выбирать утвержденные Задания-Факты, потому что проводят установку пломбы
			// в биллинге уже после проведения акта в EnergyNet!
			if (plan.kind.code != ENPlanWorkKind.FACT /*|| plan.status.code != ENPlanWorkStatus.GOOD*/)
			{
				//throw new SystemException("\n\nNET-4530 План з кодом " + factCode + " не є чорновим Завданням-Фактом!");
				throw new SystemException("\n\nNET-4530 План з кодом " + factCode + " не є Завданням-Фактом!");
			}

			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			SCSeal seal = sealDAO.getObject(sealCode);

			if (seal == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено пломбу з кодом " + sealCode + " (scseal.code)!");
			}

			/////
			// Проверим, чтобы пломба была привязана к плану с кодом factCode, а не к какому-то другому
			if (seal.estimateItemRef == null)
			{
				throw new SystemException("\n\nNET-4530 У пломби з кодом " + sealCode + " немає прив'язки до Завдання-Факту!");
			}

			if (seal.estimateItemRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4530 У пломби з кодом " + sealCode + " немає прив'язки до Завдання-Факту!");
			}

			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENEstimateItem estimateItem = estimateItemDAO.getObjectNoSegr(seal.estimateItemRef.code);

			if (estimateItem == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено матеріал у плані! [seal.estimateItemRef.code = " +
						seal.estimateItemRef.code + "]");
			}

			if (estimateItem.planRef.code != factCode)
			{
				throw new SystemException("\n\nNET-4530 Пломба з кодом " + sealCode + " прив'язана до іншого плану, ніж " + factCode + " !");
			}
			/////

			// Проверим, есть ли такая пломба в ScanCounters (с учетом строк, у которых признак SHOW_ <> 'Y')
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			boolean isClosedFact = false;
			if (plan.status.code != ENPlanWorkStatus.GOOD)
			{
				isClosedFact = true;
			}

			ENMetrologyCounterShortList scList = scLogic.checkSealInScanCounters(seal.scCode, isClosedFact);
			ENMetrologyCounterShort scSeal = scList.get(0);

			// Проверяем, чтобы у пломбы в SC был установлен lock "Работы в биллинге"
			// (потому что, когда дело доходит до вызова installSeal (вызов происходит из биллинга),
			// пломба по-любому должна быть залочена в ScanCounters)
			if (scSeal.lockCode != ENMetrologyCounter.BILLING_LOCK)
			{
				// Проверяем только, если факт не проведен
				if (! isClosedFact)
				{
					throw new SystemException("\n\nNET-4530 Пломбу НЕ заблоковано в ScanCounters! Код пломби (в SC): " + seal.scCode);
				}
			}

			seal.lockTypeRef.code = SCSealLockType.FOR_FACT; // То, что у нас в базе называется "Для Роботи з білінгу"
			seal.statusRef.code = SCSealStatus.INSTALLED;

			scLogic.checkSealLastMovementDateWithPlanDate(seal, plan);

			sealDAO.save(seal);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't installSeal", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public void cancelSealUninstallation(int sealCode, int factCode) {
		this.cancelSealInstallationAndUninstallation(sealCode, factCode, false);
	}
	public void cancelSealInstallation(int sealCode, int factCode) {
		this.cancelSealInstallationAndUninstallation(sealCode, factCode, true);
	}
	
	
	
	private void cancelSealInstallationAndUninstallation(int sealCode, int factCode, boolean isInstallation){
		try {

			if (sealCode == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4530 Не заданий код пломби (scseal.code)!");
			}


			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());
			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENPlanWork plan = planDAO.getObjectNOSEGR(factCode);

			if (plan == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено план з кодом: " + factCode + " !");
			}

			if (plan.kind!=null && plan.kind.code != ENPlanWorkKind.FACT)
			{
				throw new SystemException("\n\nNET-4530 План з кодом " + factCode + " не є Завданням-Фактом!");
			}
			if(plan.status != null && plan.status.code != ENPlanWorkStatus.GOOD){
				//throw new SystemException("\n\nNET-4530 План з кодом " + factCode + " не є чорновим Завданням-Фактом!");
			}

			SCSeal seal = sealDAO.getObject(sealCode);

			if (seal == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено пломбу з кодом " + sealCode + " (scseal.code)!");
			}

			if (seal.estimateItemRef == null)
			{
				throw new SystemException("\n\nNET-4530 У пломби з кодом " + sealCode + " немає прив'язки до Завдання-Факту!");
			}

			if (seal.estimateItemRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4530 У пломби з кодом " + sealCode + " немає прив'язки до Завдання-Факту!");
			}

			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENEstimateItem estimateItem = estimateItemDAO.getObjectNoSegr(seal.estimateItemRef.code);

			if (estimateItem == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено матеріал у плані! [seal.estimateItemRef.code = " +
						seal.estimateItemRef.code + "]");
			}

			if (estimateItem.planRef.code != factCode) {
				throw new SystemException("\n\nNET-4530 Пломба з кодом " + sealCode + " прив'язана до іншого плану, ніж " + factCode + " !");
			}

			if(seal.lockTypeRef == null) {
				throw new SystemException("\n\nSUPP-50411 Не вказано тип блокування пломби !");
			}

			if(seal.lockTypeRef.code != SCSealLockType.FOR_FACT) {
				throw new SystemException(String.format("\n\nSUPP-50411 Відмінити %s пломби можна лише якщо вона призначена для роботи з біллінгу!"
						, (isInstallation) ? "встановлення" : "зняття"));
			}
			if(seal.statusRef == null) {
				throw new SystemException("Неможливо визначити статус пломби");
			}
			
			if(isInstallation && seal.statusRef.code != SCSealStatus.INSTALLED) {
				throw new SystemException("\n\nSUPP-50411 Відміняти встановлення пломби можна лише для пломб зі статусом 'Встановлена'!");
			}
			
			if(!isInstallation && seal.statusRef.code != SCSealStatus.UNINSTALLED) {
				throw new SystemException("\n\nSUPP-50411 Відміняти зняття пломби можна лише для пломб зі статусом 'Знята з особового рахунку'!");
			}

			if(isInstallation) {
				seal.statusRef.code = SCSealStatus.GOOD;
				seal.lockTypeRef.code = SCSealLockType.FOR_WORKORDERBYT;
				sealDAO.save(seal);
			} else {
				seal.statusRef.code = SCSealStatus.GOOD;
				sealDAO.remove(seal.code);
				scLogic.lockSeal(seal.scCode, null, null, null, null,
						 (-1) * ENMetrologyCounter.BILLING_LOCK, true);
			}


		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't installSeal", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}


	}

	/**
	 *  Снятие пломбы из биллинга
	 *
	 *  @param scCode - код пломбы из ScanCounters (num_un)
	 *  @param factCode - код Задания-Факта, в котором снимается пломба
	 *
	 *  @return код созданного scseal'а со статусом "Знята з особового рахунку (демонтована)"
	 */
	public int uninstallSeal(int scCode, int factCode)
	{
		// Создаем новый enestimateItem c типом "Демонтовані матеріали" (в Задании-Факте с кодом factCode),
		// новый scseal со статусом "Снята с л/с", подвязываем этот scseal к этому новому enestimateItem'у и
		// лочим заданную пломбу в ScanCounters (по scCode)

		try {

			if (factCode == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4530 Не заданий код Завдання-Факту для зняття пломби!");
			}

			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWork plan = planDAO.getObjectNOSEGR(factCode);

			if (plan == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено план з кодом: " + factCode + " !");
			}

			if (plan.kind.code != ENPlanWorkKind.FACT /*|| plan.status.code != ENPlanWorkStatus.GOOD*/)
			{
				//throw new SystemException("\n\nNET-4530 План з кодом " + factCode + " не є чорновим Завданням-Фактом!");
				throw new SystemException("\n\nNET-4530 План з кодом " + factCode + " не є Завданням-Фактом!");
			}

			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			TKMaterialsDAO tkMaterialsDAO = new TKMaterialsDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());


			// Проверим для начала, есть ли такая пломба в ScanCounters
			/* 23.06.16 Надо искать пломбу без учета признака SHOW_ = 'Y', потому что после
			 * проведения установки появится новая запись, и вот ее нам как и нужно найти
			ENMetrologyCounterShortList scList = scLogic.checkSealInScanCounters(scCode);
			ENMetrologyCounterShort scSeal = scList.get(0);
			*/
			ENMetrologyCounterShortList scSealInstalledList = scLogic.checkSealInScanCounters(scCode, true);
			ENMetrologyCounterShort scSealInstalled = scSealInstalledList.get(0);

			// А теперь ищем эту пломбу, но уже не по num_un, а по заводскому и инвентарному
			// (и уже с учетом признака SHOW_ = 'Y'!)
			ENMetrologyCounterFilter scSealFilter = new ENMetrologyCounterFilter();
			scSealFilter.buildNumber = scSealInstalled.buildNumber;
			scSealFilter.invNumber = scSealInstalled.invNumber;

			ENMetrologyCounterShortList scList = scLogic.getSealsFromScanCounters(scSealFilter, 0, -1);

			if (scList.totalCount == 0)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено пломбу в ScanCounters! Серійний номер: " + scSealInstalled.buildNumber);
			}

			if (scList.totalCount > 1)
			{
				throw new SystemException("\n\nNET-4530 Кількість пломб у ScanCounters > 1! Серійний номер: " + scSealInstalled.buildNumber);
			}

			ENMetrologyCounterShort scSeal = scList.get(0);

			if (scSeal.account == null)
			{
				throw new SystemException("\n\nNET-4530 Не вказано бух. рахунок для пломби в ScanCounters! Код пломби (в SC): " + scCode);
			}

			if (! scSeal.account.equals("0731"))
			{
				throw new SystemException("\n\nNET-4530 Бух. рахунок для пломби, що знімається, повинен бути 0731! Код пломби (в SC): " + scCode);
			}

			// Нужно проверить еще, чтобы у пломбы не было lock'а в SC!!!!!!!!!!!
			// Будет проверено в scLogic.lockSeal (вызываем ниже в конце метода)

			///// Определяем accountingType и код материала для эстимейта
			int accountingType = Integer.MIN_VALUE;
			int materialCode = Integer.MIN_VALUE;

			// Поле TYPE_OBJECT в OSTABLE (в ScanCounters): Тип картотеки (1 - счетчик, 2 - пломба, 3 - индикатор, 4 - голограмма)
			int scTypeObject = scSeal.typeObject;

			switch (scTypeObject)
			{
				case ENConsts.SCANCOUNTERS_TYPEOBJECT_SEAL: //2:
					accountingType = TKAccountingType.SEAL;
					materialCode = ENConsts.TKMATERIALS_SEAL;
					break;

				case ENConsts.SCANCOUNTERS_TYPEOBJECT_INDICATOR: //3:
					accountingType = TKAccountingType.IMP;
					materialCode = ENConsts.TKMATERIALS_INDICATOR;
					break;

				case ENConsts.SCANCOUNTERS_TYPEOBJECT_HOLOGRAM: //4:
					accountingType = TKAccountingType.HOLO;
					materialCode = ENConsts.TKMATERIALS_HOLOGRAM;
					break;

				default:
					accountingType = Integer.MIN_VALUE;
					materialCode = Integer.MIN_VALUE;
			}

			if (accountingType == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4530 Невідомий тип картотеки в ScanCounters!\n" +
						"scCode: " + scCode + ", type_object: " + scTypeObject);
			}
			/////

			TKMaterials sealMaterial = tkMaterialsDAO.getObject(materialCode);

			if (sealMaterial == null)
			{
				throw new SystemException("\n\nNET-4530 Не знайдено нормативний матеріал з кодом " + materialCode);
			}

        	Context context = new InitialContext();

	    	Object estimateItemRef = context.lookup(ENEstimateItemController.JNDI_NAME);
	    	ENEstimateItemControllerHome estimateItemHome = (ENEstimateItemControllerHome) PortableRemoteObject
	                .narrow(estimateItemRef, ENEstimateItemControllerHome.class);
	    	ENEstimateItemController estimateItemController = estimateItemHome.create();

    		// Создаем ENEstimateItem c типом "Демонтовані матеріали"
    		ENEstimateItem estimateItem = new ENEstimateItem();
    		estimateItem.code = Integer.MIN_VALUE;

    		estimateItem.countGen = new BigDecimal(0);
    		estimateItem.countFact = new BigDecimal(1);

    		estimateItem.price = sealMaterial.cost;
    		estimateItem.isUseVAT = 1;
    		//estimateItem.deliveryTime = 0; //???
    		//estimateItem.deliveryTime = Integer.MIN_VALUE;
    		//estimateItem.deliveryTime = sealMaterial.deliveryDate;
    		estimateItem.useWorkTime = Integer.MIN_VALUE;
    		estimateItem.planRef.code = factCode;
    		estimateItem.materialRef.code = materialCode;
    		estimateItem.kindRef.code = ENEstimateItemKind.UNMOUNT;
    		estimateItem.accountingTypeRef.code = accountingType;

    		int eiCode = estimateItemController.add(estimateItem);

    		if (eiCode == Integer.MIN_VALUE)
    		{
    			throw new SystemException("\n\nNET-4530 Помилка при додаванні демонтованого матеріалу в план (для знятої пломби)!");
    		}

    		// Создаем scseal и устанавливаем ему код эстимейта = eiCode
    		SCSeal seal = scLogic.createSCSealFromMetrologyCounterShort(scSeal, SCSealLockType.FOR_FACT);
    		seal.estimateItemRef.code = eiCode;
    		seal.statusRef.code = SCSealStatus.UNINSTALLED;

    		scLogic.checkSealLastMovementDateWithPlanDate(seal, plan);

    		int sealCode = sealDAO.add(seal);

			// Лочим пломбу в ScanCounters
			scLogic.lockSeal(seal.scCode, null, null, null, null,
							 ENMetrologyCounter.BILLING_LOCK, true);

    		return sealCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't uninstallSeal", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
            throw new SystemException(e.getMessage(), e);
        } catch (RemoteException e) {
            throw new SystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
			closeConnection();
		}
	}
	
	public int add(SCSeal object) {
		
		try {
			
			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENMolDAO molDao = new ENMolDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENEstimateItem estimateItem = estimateItemDAO.getObject(object.estimateItemRef.code);
			ENPlanWork plan = planDAO.getObjectNOSEGR(estimateItem.planRef.code);

			if (plan.kind.code != ENPlanWorkKind.FACT || plan.status.code != ENPlanWorkStatus.GOOD)
	        {
				throw new SystemException("\n\nNET-4561 План, до якого прив'язується пломба, не є чорновим Завданням-Фактом!");
	        }
			
			ENAct2ENPlanWorkFilter act2planFilter = new ENAct2ENPlanWorkFilter();
			act2planFilter.plan.code = plan.code;

			ENAct2ENPlanWorkDAO act2planDAO = new ENAct2ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			int[] act2planArr = act2planDAO.getFilteredCodeArray(act2planFilter, 0, -1);

			if (act2planArr.length > 0)
			{
				throw new SystemException("\n\nNET-4561 Завдання-Факт, до якого прив'язується пломба, вже включено до акту!");
			}
			
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					                      getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());			

			scLogic.checkSealLastMovementDateWithPlanDate(object, plan);

			if(object.molCode != null && object.molCode.trim().length() > 0) molDao.checkMolStatus(object.molCode);
			object.molName = object.molCode; // molName у нас не передается

			object.lockTypeRef.code = SCSealLockType.FOR_WRITEOFF;
			object.statusRef.code = SCSealStatus.GOOD;

			int sealCode = super.add(object);

			PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENWorkOrder workOrder = planLogic.getWorkOrderByPlanCode(plan.code);

			// Лочим пломбу в ScanCounters
			scLogic.lockSeal(object.scCode, 
					         null, null, null, null,
					         ENMetrologyCounter.WRITE_OFF_LOCK, false, 
							 workOrder.workOrderNumber, workOrder.dateGen);			

			return sealCode;
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.SCSeal%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	public void remove(int code) {
		
		try {
			
			SCSealDAO sealDAO = new SCSealDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENEstimateItemDAO estimateItemDAO = new ENEstimateItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENAct2ENPlanWorkDAO act2planDAO = new ENAct2ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			SCSeal seal = sealDAO.getObject(code);

			/*
			if (seal.statusRef.code != SCSealStatus.GOOD && seal.statusRef.code != SCSealStatus.SPOILED)
			{
				throw new SystemException("\n\nNET-4530 Пломбу № " + seal.buildNumber + " вже встановлено у білінгу!");
			}
			*/

			if (seal.estimateItemRef == null) {
				throw new SystemException("\n\nNET-4561 Не задано код нормативного матеріалу для пломби!");
			}
			
			if (seal.estimateItemRef.code == Integer.MIN_VALUE) {
				throw new SystemException("\n\nNET-4561 Не задано код нормативного матеріалу для пломби!");
			}
			
			//scLogic.checkPlanStatusForSeal(seal, "");
			/////

			if (seal.statusRef.code != SCSealStatus.GOOD)
			{
				throw new SystemException("\n\nNET-4561 Пломба № " + seal.buildNumber +
						" має некоректний статус для цієї операції!");
			}

			ENEstimateItem estimateItem = estimateItemDAO.getObject(seal.estimateItemRef.code);
			ENPlanWork plan = planDAO.getObjectNOSEGR(estimateItem.planRef.code);

			if (plan.kind.code != ENPlanWorkKind.FACT || plan.status.code != ENPlanWorkStatus.GOOD)
	        {
				throw new SystemException("\n\nNET-4561 План, до якого прив'язано пломбу № " + seal.buildNumber +
						", не є чорновим Завданням-Фактом!");
	        }

			ENAct2ENPlanWorkFilter act2planFilter = new ENAct2ENPlanWorkFilter();
			act2planFilter.plan.code = plan.code;

			int[] act2planArr = act2planDAO.getFilteredCodeArray(act2planFilter, 0, -1);

			if (act2planArr.length > 0)
			{
				throw new SystemException("\n\nNET-4561 Завдання-Факт, до якого прив'язано пломбу № " + seal.buildNumber +
						", вже включено до акту! Код Завдання-Факту: " + plan.code);
			}
			/////

			
			//if (plan.kind.code == ENPlanWorkKind.FACT) {
			
				/////
				// Нужно найти такую же пломбу на Задании-Плане и удалить ее тоже (вместе со связкой)
				/*
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
				*/
				/////

				SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
						                      getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());			
				// Разлочиваем пломбу в ScanCounters
				scLogic.lockSeal(seal.scCode, null, null, null, null,
								 -1 * ENMetrologyCounter.WRITE_OFF_LOCK /* ?? */);

			//}

			super.remove(code);
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.SCSeal%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}	

} // end of EJB Controller for SCSeal