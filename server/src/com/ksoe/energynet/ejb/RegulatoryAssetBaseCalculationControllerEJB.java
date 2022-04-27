
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.Vector;
import java.util.concurrent.atomic.AtomicLong;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.RegulatoryAssetBaseCalculationDAO;
import com.ksoe.energynet.dataminer.RegulatoryAssetBaseDAO;
import com.ksoe.energynet.dataminer.RegulatoryAssetBaseFundingSourceDAO;
import com.ksoe.energynet.dataminer.RegulatoryAssetBaseGroupDAO;
import com.ksoe.energynet.dataminer.RegulatoryAssetBaseOutOfUseDAO;
import com.ksoe.energynet.dataminer.RegulatoryAssetBasePartialWriteOffDAO;

/**
 * EJB Controller for RegulatoryAssetBaseCalculation;
 *
 */

import com.ksoe.energynet.ejb.generated.RegulatoryAssetBaseCalculationControllerEJBGen;
import com.ksoe.energynet.logic.ENSettingsKeysConsts;
import com.ksoe.energynet.logic.ENSettingsLogic;
import com.ksoe.energynet.util.LockUtilsSync;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.RegulatoryAssetBase;
import com.ksoe.energynet.valueobject.RegulatoryAssetBaseCalculation;
import com.ksoe.energynet.valueobject.RegulatoryAssetBaseFundingSource;
import com.ksoe.energynet.valueobject.RegulatoryAssetBaseGroup;
import com.ksoe.energynet.valueobject.RegulatoryAssetBaseOutOfUse;
import com.ksoe.energynet.valueobject.RegulatoryAssetBasePartialWriteOff;
import com.ksoe.energynet.valueobject.RegulatoryAssetBaseSynchronizationData;
import com.ksoe.energynet.valueobject.brief.RegulatoryAssetBaseCalculationShort;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseCalculationFilter;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseFundingSourceFilter;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseGroupFilter;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseOutOfUseFilter;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBasePartialWriteOffFilter;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseCalculationShortList;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseFundingSourceShortList;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseGroupShortList;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseOutOfUseShortList;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBasePartialWriteOffShortList;
import com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseRef;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

import bsh.EvalError;
import bsh.Interpreter;
import bsh.NameSpace;
import bsh.UtilEvalError;

public class RegulatoryAssetBaseCalculationControllerEJB extends
		RegulatoryAssetBaseCalculationControllerEJBGen {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public RegulatoryAssetBaseCalculationControllerEJB() {

	}
	
	public RegulatoryAssetBaseCalculationShortList  getListOnPeriod(RegulatoryAssetBaseCalculationFilter calculationFilter, Date periodTo, int offset, int quantity) {
		try {
			RegulatoryAssetBaseCalculationDAO calculationDao = new RegulatoryAssetBaseCalculationDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return calculationDao.getListOnPeriod(calculationFilter, periodTo, offset, quantity);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get list of {%com.ksoe.energynet.valueobject.RegulatoryAssetBaseCalculation%} objects.",
					e);
		} finally {
			closeConnection();
		}
	}
	
	/**
	 * 
	 * Получить информацию для синхронизации с программами комплекса Финансовая коллекция и EnergyNet
	 * 
	 * @param from Период начала выбора
	 * @param to Период конца выбора
	 * @return
	 */
	public RegulatoryAssetBaseSynchronizationData getDataForSynchronization(Date from, Date to) {
		try {
			RegulatoryAssetBaseSynchronizationData data = new RegulatoryAssetBaseSynchronizationData();
			
			Date fromFirstDay = Tools.getFirstDayOfMonth(from);
			Date toLastDay = Tools.getLastDayOfMonth(to);
			
			Vector<RegulatoryAssetBase> incomeAssets = new Vector<RegulatoryAssetBase>();
			
			incomeAssets.addAll(this.getIncomeAssetsListFixedAssetsForSynchronization(fromFirstDay, toLastDay));
			incomeAssets.addAll(this.getIncomeAssetsListCountersForSynchronization(fromFirstDay, toLastDay));
			incomeAssets.addAll(this.getIncomeAssetsListMaterialsForSynchronization(fromFirstDay, toLastDay));
			data.setIncomeAssets(incomeAssets.toArray(new RegulatoryAssetBase[] {}));
			
			Vector<RegulatoryAssetBase> completelyWrittenOffAssets = new Vector<RegulatoryAssetBase>();
			completelyWrittenOffAssets.addAll(this.getCompletelyWrittenOffAssetsListFixedAssetsForSynchronization(fromFirstDay, toLastDay));
			completelyWrittenOffAssets.addAll(this.getCompletelyWrittenOffAssetsListCountersForSynchronization(fromFirstDay, toLastDay));
			completelyWrittenOffAssets.addAll(this.getCompletelyWrittenOffAssetsListMaterialsForSynchronization(fromFirstDay, toLastDay));
			data.setCompletelyWrittenOffAssets(completelyWrittenOffAssets.toArray(new RegulatoryAssetBase[] {}));
	
			Vector<RegulatoryAssetBasePartialWriteOff> partialWriteOffs = new Vector<RegulatoryAssetBasePartialWriteOff>();
			partialWriteOffs.addAll(this.getPartialWriteOffListOfFixedAssetsForSynchronization(fromFirstDay, toLastDay));
			data.setPartialWriteOffs(partialWriteOffs.toArray(new RegulatoryAssetBasePartialWriteOff[] {}));
			
			return data;
		} finally {
			closeConnection();
		}
	}
	
	/** Выборка приходов основных средств, которые должны попадать в РБА для синхронизации */
	private List<RegulatoryAssetBase> getIncomeAssetsListFixedAssetsForSynchronization(Date from, Date to) {
		return this.getRegulatoryAssetBaseListForSynchronizationByScript(ENSettingsKeysConsts.RAB_SYNCHRONIZATION_FIXED_ASSETS_INCOME_LIST_SCRIPT, from, to);
	}
	
	/** Выборка приходов счетчиков, которые должны попадать в РБА при синхронизации */
	private List<RegulatoryAssetBase> getIncomeAssetsListCountersForSynchronization(Date from, Date to) {
		return this.getRegulatoryAssetBaseListForSynchronizationByScript(ENSettingsKeysConsts.RAB_SYNCHRONIZATION_COUNTERS_INCOME_LIST_SCRIPT, from, to);
	}
	
	/** Выборка приходов материалов, которые должны попадать в РБА при синхронизации */
	private List<RegulatoryAssetBase> getIncomeAssetsListMaterialsForSynchronization(Date from, Date to) {
		return this.getRegulatoryAssetBaseListForSynchronizationByScript(ENSettingsKeysConsts.RAB_SYNCHRONIZATION_MATERIALS_INCOME_LIST_SCRIPT, from, to);
	}
	
	/** Выборка списанных основных средств, которые должны попадать в РБА для синхронизации */
	private List<RegulatoryAssetBase> getCompletelyWrittenOffAssetsListFixedAssetsForSynchronization(Date from, Date to) {
		return this.getRegulatoryAssetBaseListForSynchronizationByScript(ENSettingsKeysConsts.RAB_SYNCHRONIZATION_FIXED_ASSETS_WRITTEN_OFF_LIST_SCRIPT, from, to);
	}
	
	/** Выборка списанных счетчиков, которые должны попадать в РБА для синхронизации */
	private List<RegulatoryAssetBase> getCompletelyWrittenOffAssetsListCountersForSynchronization(Date from, Date to) {
		return this.getRegulatoryAssetBaseListForSynchronizationByScript(ENSettingsKeysConsts.RAB_SYNCHRONIZATION_COUNTERS_WRITTEN_OFF_LIST_SCRIPT, from, to);
	}
	
	/** Выборка списанных материалов, которые должны попадать в РБА для синхронизации */
	private List<RegulatoryAssetBase> getCompletelyWrittenOffAssetsListMaterialsForSynchronization(Date from, Date to) {
		return this.getRegulatoryAssetBaseListForSynchronizationByScript(ENSettingsKeysConsts.RAB_SYNCHRONIZATION_MATERIALS_WRITTEN_OFF_LIST_SCRIPT, from, to);
	}
	
	@SuppressWarnings("unchecked")
	private List<RegulatoryAssetBase> getRegulatoryAssetBaseListForSynchronizationByScript(String scriptKey, Date from, Date to) {
		try {
			ENSettingsLogic settingsLogic = new ENSettingsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			String script = settingsLogic.getValue(scriptKey);
			return (List<RegulatoryAssetBase>)this.executeBeanShellScriptAndGetObject(script, from, to);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
		}		
	}
	
	/** Выборка частичного списанаия основных средств, которые должны попадать в РБА для синхронизации */
	@SuppressWarnings("unchecked")
	private List<RegulatoryAssetBasePartialWriteOff> getPartialWriteOffListOfFixedAssetsForSynchronization(Date from, Date to) {
		try {
			ENSettingsLogic settingsLogic = new ENSettingsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			String script = settingsLogic.getValue(ENSettingsKeysConsts.RAB_SYNCHRONIZATION_ASSETS_PARTIAL_WRITE_OFF_LIST_SCRIPT);
			return (List<RegulatoryAssetBasePartialWriteOff>)this.executeBeanShellScriptAndGetObject(script, from, to);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
		}	
	}
	
	private Set<RegulatoryAssetBase> incomeAssets = Collections.synchronizedSet(new HashSet<>());
	
	/**
	 * 
	 * Синхронизация информации с программами комплекса Финансовая коллекция
	 * 
	 * @param data сохраняемая информация
	 */
	public void synchronize(RegulatoryAssetBaseSynchronizationData data) {
		synchronized(RegulatoryAssetBaseSynchronizationData.class) {
			boolean lockNeeded = false;
			try {
				List<RegulatoryAssetBase> incomeAssets = (data.getIncomeAssets() == null) ? new ArrayList<>() : Arrays.asList(data.getIncomeAssets());
				List<RegulatoryAssetBase> completelyWrittenOffAssets = (data.getCompletelyWrittenOffAssets() == null) ? new ArrayList<>() : Arrays.asList(data.getCompletelyWrittenOffAssets());
				List<RegulatoryAssetBasePartialWriteOff> partialWriteOffs = (data.getPartialWriteOffs() == null) ? new ArrayList<>() : Arrays.asList(data.getPartialWriteOffs());
				
				if(incomeAssets.size() + completelyWrittenOffAssets.size() + partialWriteOffs.size()  == 0) {
					return;
				}
				
				RegulatoryAssetBaseDAO dao = new RegulatoryAssetBaseDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				
				Stream<Integer> streamOfProcessedCodes = Stream.concat(completelyWrittenOffAssets.stream().map(RegulatoryAssetBase::getCode)
						, partialWriteOffs.stream().map(RegulatoryAssetBasePartialWriteOff::getAssetRef).map(RegulatoryAssetBaseRef::getCode));
				Set<Integer> processedCodes = streamOfProcessedCodes.collect(Collectors.toSet());
				lockNeeded = processedCodes.size() > 0;
				Object lock = (lockNeeded ? LockUtilsSync.lockByCodes(processedCodes) : new Object());
				synchronized(lock) {
					try {
						this.checkPerformingCalculation();
						// Обработка приходуемых активов
						this.incomeAssets.addAll(incomeAssets);
						for(RegulatoryAssetBase incomeAsset : incomeAssets) this.addAsset(incomeAsset, false);
						// Обработка списанных активов
						for(RegulatoryAssetBase writtenOffAsset : completelyWrittenOffAssets) {
							RegulatoryAssetBase asset = dao.getObject(writtenOffAsset.code);
							asset.writeOffNumber = writtenOffAsset.writeOffNumber;
							asset.writeOffDate = writtenOffAsset.writeOffDate;
							this.saveAsset(asset, false);
						}
						// Обработка частичного списания
						for(RegulatoryAssetBasePartialWriteOff partialWriteOff : partialWriteOffs) {
							this.addPartialWriteOff(partialWriteOff, false);
						}
					} catch (PersistenceException e) {
						throw new SystemException(e);
					} finally {
						if(lockNeeded) LockUtilsSync.releaseLocks(processedCodes);
						this.incomeAssets.removeAll(incomeAssets);
					}
				}						
			} catch (DatasourceConnectException e1) {
				throw new SystemException(e1);
			} finally {
				closeConnection();
			}	
		}
	}
	
	public RegulatoryAssetBaseGroupShortList getScrollableFilteredListOfGroups(RegulatoryAssetBaseGroupFilter filter, int offset, int quantity) {
		try {
			RegulatoryAssetBaseGroupDAO groupDao = new RegulatoryAssetBaseGroupDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			return groupDao.getScrollableFilteredList(filter, offset, quantity);
		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't get list of {%com.ksoe.energynet.valueobject.RegulatoryAssetBaseGroup%} objects.", e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
	}
	
	public RegulatoryAssetBaseFundingSourceShortList getScrollableFilteredListOfFundingSources(RegulatoryAssetBaseFundingSourceFilter filter, int offset, int quantity) {
		try {
			RegulatoryAssetBaseFundingSourceDAO groupDao = new RegulatoryAssetBaseFundingSourceDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			return groupDao.getScrollableFilteredList(filter, offset, quantity);
		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't get list of {%com.ksoe.energynet.valueobject.RegulatoryAssetFundingSource%} objects.", e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}

	}
	
	public RegulatoryAssetBaseGroup getGroup(int code) {
		try {
			RegulatoryAssetBaseGroupDAO groupDao = new RegulatoryAssetBaseGroupDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			return groupDao.getObject(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
		
	}
	
	public RegulatoryAssetBaseFundingSource getFundingSource(int code) {
		try {
			RegulatoryAssetBaseFundingSourceDAO dao = new RegulatoryAssetBaseFundingSourceDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			return dao.getObject(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
		
	}
	
	private static volatile boolean performingCalculation = false;
	private void startPerformingCalculation() {
		synchronized (RegulatoryAssetBaseCalculation.class) {
			if(RegulatoryAssetBaseCalculationControllerEJB.performingCalculation) throw new SystemException("\n\nРозрахунок вже виконується!\n\n");
			RegulatoryAssetBaseCalculationControllerEJB.performingCalculation = true;
		}
	}
	private void finishPerformingCalculation() {
		synchronized (RegulatoryAssetBaseCalculation.class) {
			if(!RegulatoryAssetBaseCalculationControllerEJB.performingCalculation) throw new SystemException("\n\nРозрахунок не виконувався!\n\n");
			RegulatoryAssetBaseCalculationControllerEJB.performingCalculation = false;
		}
	}
	private void checkPerformingCalculation() {
		if(RegulatoryAssetBaseCalculationControllerEJB.performingCalculation) {
			throw new SystemException("\n\nНа даний момент триває розрахунок регуляторної бази активів!"
					+ "\nНа час розрахунку заборонено проводити операції додавання, зміни або видалення активів!\n\n");
		}
	}
	
	
	public void calculate(Date period) {
		try {
			this.startPerformingCalculation();
			// Ожидание завершения всех операций (количество блокировок должно быть 0)
			while(LockUtilsSync.countLocks() > 0 || this.incomeAssets.size() > 0) {}
			RegulatoryAssetBaseCalculationDAO calculationDao = new RegulatoryAssetBaseCalculationDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				calculationDao.calculate(period);
			} catch (DatasourceConnectException e) {
				throw new SystemException(e);
			} catch (PersistenceException e) {
				throw new SystemException(e);
			} finally {
				this.finishPerformingCalculation();
				closeConnection();
			}
	}
	
	public RegulatoryAssetBaseCalculationShort getShortObjectOnPeriod(RegulatoryAssetBase asset, Date period) {
		try {
			RegulatoryAssetBaseCalculationDAO calculationDao = new RegulatoryAssetBaseCalculationDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			return calculationDao.getShortObjectOnPeriod(asset, period);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}				
	}
	
	private static final Hashtable<Long, RegulatoryAssetBaseCalculationFilter> filtersTable = new Hashtable<>();
	
	public long setFilter(RegulatoryAssetBaseCalculationFilter filter) {
		if(filter == null) throw new java.lang.NullPointerException();
		synchronized (filtersTable) {
			final AtomicLong id = new AtomicLong(System.currentTimeMillis());
			while(filtersTable.containsKey(id.get())) id.set(id.get() + 1);
			filtersTable.put(id.get(), filter);
			// Не удалившиеся старые значения удаляются (те что больше одного дня)
			filtersTable.keySet().stream().filter(e -> (e - id.get()) > (1000L * 60L * 60L * 24L)).forEach(filtersTable::remove);
			return id.get();
		}
	}
	
	public RegulatoryAssetBaseCalculationFilter getFilter(long id) {
		RegulatoryAssetBaseCalculationFilter filter = null;
		if(filtersTable.containsKey(id)) {
			filter = filtersTable.get(id);
			filtersTable.remove(id);
		}
		return filter;
	}
	
	/**
	 * Получить объект актива {@link RegulatoryAssetBase} по коду
	 * 
	 * @param code код объекта регулятивной базы активов
	 * @return {@link RegulatoryAssetBase}
	 */
	public RegulatoryAssetBase getAsset(int code) {
		try {
			RegulatoryAssetBaseDAO assetDao = new RegulatoryAssetBaseDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    return assetDao.getObject(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get {%com.ksoe.energynet.valueobject.RegulatoryAssetBase%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	public void dummyProcessSingle(RegulatoryAssetBase object) {
		System.out.println("Starting dummyProcessSingle for " + object.code);
		Object lock = LockUtilsSync.lockByCode(object.code);
		synchronized (lock) {
			try {
				System.out.println("Inside dummyProcessSingle for " + object.code + " after acquiring lock " + lock.hashCode());
				this.checkPerformingCalculation();
				try {Thread.sleep(60000L);} catch(InterruptedException e) {}				
			} finally {
				LockUtilsSync.releaseLock(object.code);				
			}
		}
		System.out.println("Finishing dummyProcessSingle for " + object.code);
	}
	
	public void dummyProcessBatch(Vector<RegulatoryAssetBase> objects) {
		List<Integer> codes = objects.stream().map(RegulatoryAssetBase::getCode).collect(Collectors.toList());
		System.out.println("Starting dummyProcessBatch for " + codes);
		Object lock = LockUtilsSync.lockByCodes(codes);
		synchronized (lock) {
			try {
				System.out.println("Inside dummyProcessBatch for " + codes + " after acquiring lock " + lock.hashCode());
				this.checkPerformingCalculation();
				try {Thread.sleep(60000L);} catch(InterruptedException e) {}
			} finally {
				LockUtilsSync.releaseLocks(codes);
			}

		}
		System.out.println("Finishing dummyProcessBatch for " + codes);
	}
	
	public int addAsset(RegulatoryAssetBase object) {
		return this.addAsset(object, true);
	}
	public int addAsset(RegulatoryAssetBase object, boolean addIntoIncomeSet) {
		try {
			this.checkAsset(object);
			this.checkPerformingCalculation();
			if(addIntoIncomeSet) this.incomeAssets.add(object);
			RegulatoryAssetBaseDAO assetDao = new RegulatoryAssetBaseDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RegulatoryAssetBaseCalculationDAO calculationDao = new RegulatoryAssetBaseCalculationDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			assetDao.checkInventory(object);
		    object.code = assetDao.add(object);
		    calculationDao.recalculateAsset(object);
		    return object.code;
		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't add {%com.ksoe.energynet.valueobject.RegulatoryAssetBase%} object.", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			if(addIntoIncomeSet) this.incomeAssets.remove(object);
			closeConnection();
		}
	}
	
	public void saveAsset(RegulatoryAssetBase object) {
		this.saveAsset(object, true);
	}
	
	private void saveAsset(RegulatoryAssetBase object, boolean useRealLock) {
		Object lock = (useRealLock) ? LockUtilsSync.lockByCode(object.code) : new Object();
		synchronized (lock) {
			try {
				this.checkAsset(object);
				RegulatoryAssetBaseDAO assetDao = new RegulatoryAssetBaseDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				RegulatoryAssetBaseCalculationDAO calculationDao = new RegulatoryAssetBaseCalculationDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				RegulatoryAssetBaseOutOfUseDAO outOfUseDao = new RegulatoryAssetBaseOutOfUseDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				RegulatoryAssetBasePartialWriteOffDAO partialWriteOffDao = new RegulatoryAssetBasePartialWriteOffDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				assetDao.checkInventory(object);
				this.checkOutOfUse(object, outOfUseDao.getListByAsset(object));
				this.checkPartialWriteOff(object, partialWriteOffDao.getListByAsset(object));
				RegulatoryAssetBase old = assetDao.getObject(object.code);
				if(!old.equals(object)) {
					this.checkPerformingCalculation();
					assetDao.save(object);
				    if(old.checkIfRecalculationIsNeeded(object)) {
				    	calculationDao.recalculateAsset(object);
				    }
				}
			} catch (DatasourceConnectException e) {
				throw new SystemException("Can't save {%com.ksoe.energynet.valueobject.RegulatoryAssetBase%} object.", e);
			} catch (PersistenceException e) {
				throw new SystemException(e.getMessage(), e);
			} finally {
				if(useRealLock) LockUtilsSync.releaseLock(object.code);
				closeConnection();
			}
		}
	}
	
	public void removeAsset(int code) {
		Object lock = LockUtilsSync.lockByCode(code);
		synchronized (lock) {
			try {
				RegulatoryAssetBaseDAO assetDao = new RegulatoryAssetBaseDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				RegulatoryAssetBase asset = assetDao.getObject(code);
				if(asset == null) {
					throw new SystemException(String.format("Помилка! Не знайдено запису із кодом %d", code));
				}
				this.checkPerformingCalculation();
				RegulatoryAssetBaseCalculationDAO calculationDao = new RegulatoryAssetBaseCalculationDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				RegulatoryAssetBaseOutOfUseDAO outOfUseDao = new RegulatoryAssetBaseOutOfUseDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				RegulatoryAssetBasePartialWriteOffDAO partialWriteOffDao = new RegulatoryAssetBasePartialWriteOffDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				calculationDao.removeByAssetCode(code);
				partialWriteOffDao.removeByAssetCode(code);
				outOfUseDao.removeByAssetCode(code);
				assetDao.remove(code);
			} catch (DatasourceConnectException e) {
				throw new SystemException(
						"Can't remove {%com.ksoe.energynet.valueobject.RegulatoryAssetBase%} object.",
						e);
			} catch (PersistenceException e) {
				throw new SystemException(e.getMessage(), e);
			} finally {
				LockUtilsSync.releaseLock(code);
				closeConnection();
			}
		}
	}
	
	public RegulatoryAssetBaseOutOfUse getOutOfUse(int code) {
		try {
			RegulatoryAssetBaseOutOfUseDAO outOfUseDao = new RegulatoryAssetBaseOutOfUseDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    return outOfUseDao.getObject(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get {%com.ksoe.energynet.valueobject.RegulatoryAssetBaseOutOfUse%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}		
	}
	
	public RegulatoryAssetBaseOutOfUseShortList getListOfOutOfUse(RegulatoryAssetBaseOutOfUseFilter filter, int offset, int quantity) {
		try {
			RegulatoryAssetBaseOutOfUseDAO outOfUseDao = new RegulatoryAssetBaseOutOfUseDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    return outOfUseDao.getScrollableFilteredList(filter, offset, quantity);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get {%com.ksoe.energynet.valueobject.RegulatoryAssetBaseOutOfUse%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}		
	}
	
	public int addOutOfUse(RegulatoryAssetBaseOutOfUse object) {
		Object lock = LockUtilsSync.lockByCode(object.assetRef.code);
		synchronized (lock) {
			try {
				this.checkPerformingCalculation();
				RegulatoryAssetBaseOutOfUseDAO outOfUseDao = new RegulatoryAssetBaseOutOfUseDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				RegulatoryAssetBaseCalculationDAO calculationDao = new RegulatoryAssetBaseCalculationDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				RegulatoryAssetBaseDAO assetDao = new RegulatoryAssetBaseDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			    RegulatoryAssetBase asset = assetDao.getObject(object.assetRef.code);
			    List<RegulatoryAssetBaseOutOfUse> outsOfUse = new Vector<>(Arrays.asList(object));
			    outsOfUse.addAll(outOfUseDao.getListByAsset(asset));
			    outsOfUse.add(object);
			    this.checkOutOfUse(asset, outsOfUse);
			    object.code = outOfUseDao.add(object);
			    calculationDao.recalculateAsset(asset);
			    return object.code;
			    
			} catch (DatasourceConnectException e) {
				throw new SystemException("Can't add {%com.ksoe.energynet.valueobject.RegulatoryAssetBaseOutOfUse%} object.", e);
			} catch (PersistenceException e) {
				throw new SystemException(e.getMessage(), e);
			} finally {
				LockUtilsSync.releaseLock(object.assetRef.code);
				closeConnection();
			}			
		}
	}
	
	public void saveOutOfUse(RegulatoryAssetBaseOutOfUse object) {
		Object lock = LockUtilsSync.lockByCode(object.assetRef.code);
		synchronized (lock) {
			try {
				this.checkPerformingCalculation();
				RegulatoryAssetBaseOutOfUseDAO outOfUseDao = new RegulatoryAssetBaseOutOfUseDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				RegulatoryAssetBaseCalculationDAO calculationDao = new RegulatoryAssetBaseCalculationDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				RegulatoryAssetBaseDAO assetDao = new RegulatoryAssetBaseDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				RegulatoryAssetBase asset = assetDao.getObject(object.assetRef.code);
				List<RegulatoryAssetBaseOutOfUse> outsOfUse = new Vector<>(Arrays.asList(object));
				outsOfUse.addAll(outOfUseDao.getListByAsset(asset));
				Optional<RegulatoryAssetBaseOutOfUse> old = outsOfUse.stream().filter(e -> e.code == object.code && e != object).findFirst();
				if(!old.isPresent()) {
					throw new SystemException(String.format("Не знайдено консервації із кодом %d", object.code));
				}
				if(old.get().equals(object)) {
					return;
				}
				outsOfUse.remove(old.get());
				this.checkOutOfUse(asset, outsOfUse);
				outOfUseDao.save(object);
				if(old.get().checkIfRecalculationIsNeeded(object)) {
					calculationDao.recalculateAsset(asset);
				}
			} catch (DatasourceConnectException e) {
				throw new SystemException(
						"Can't save {%com.ksoe.energynet.valueobject.RegulatoryAssetBaseOutOfUse%} object.",
						e);
			} catch (PersistenceException e) {
				throw new SystemException(e.getMessage(), e);
			} finally {
				LockUtilsSync.releaseLock(object.assetRef.code);
				closeConnection();
			}			
		}
	}
	
	public void removeOutOfUse(int code) {
		try {
			RegulatoryAssetBaseOutOfUseDAO outOfUseDao = new RegulatoryAssetBaseOutOfUseDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RegulatoryAssetBaseCalculationDAO calculationDao = new RegulatoryAssetBaseCalculationDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RegulatoryAssetBaseDAO assetDao = new RegulatoryAssetBaseDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RegulatoryAssetBaseOutOfUse object = outOfUseDao.getObject(code);
			if(object == null) {
				throw new SystemException(String.format("Не знайдено консервації із кодом %d", code));
			}
			RegulatoryAssetBase asset = assetDao.getObject(object.assetRef.code);
			if(asset == null) throw new SystemException(String.format("Не знайдено активу із кодом %d", object.assetRef.code));
			Object lock = LockUtilsSync.lockByCode(object.assetRef.code);
			synchronized (lock) {
				try {
					this.checkPerformingCalculation();
					outOfUseDao.remove(code);
					calculationDao.recalculateAsset(asset);
				} finally {
					LockUtilsSync.releaseLock(object.assetRef.code);
				}				
			}
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.RegulatoryAssetBaseOutOfUse%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}		
	}
	
	/**
	 * 
	 * Получить объект частичной ликвидации {@link RegulatoryAssetBasePartialWriteOff} по коду
	 * 
	 * @param code код частичной ликвидации
	 * @return {@link RegulatoryAssetBasePartialWriteOff}
	 */
	public RegulatoryAssetBasePartialWriteOff getPartialWriteOff(int code) {
		try {
			RegulatoryAssetBasePartialWriteOffDAO partialWriteOffDao = new RegulatoryAssetBasePartialWriteOffDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    return partialWriteOffDao.getObject(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get {%com.ksoe.energynet.valueobject.RegulatoryAssetBasePartialWriteOff%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}		
	}
	
	public RegulatoryAssetBasePartialWriteOffShortList getListOfPartialWriteOff(RegulatoryAssetBasePartialWriteOffFilter filter, int offset, int quantity) {
		try {
			RegulatoryAssetBasePartialWriteOffDAO partialWriteOffDao = new RegulatoryAssetBasePartialWriteOffDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    return partialWriteOffDao.getScrollableFilteredList(filter, offset, quantity);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get {%com.ksoe.energynet.valueobject.RegulatoryAssetPartialWriteOff%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}		
	}
	
	public int addPartialWriteOff(RegulatoryAssetBasePartialWriteOff object) {
		return this.addPartialWriteOff(object, true);
	}
	
	private int addPartialWriteOff(RegulatoryAssetBasePartialWriteOff object, boolean useRealLock) {
		Object lock = (useRealLock) ? LockUtilsSync.lockByCode(object.assetRef.code) : new Object();
		synchronized(lock) {
			try {
				this.checkPerformingCalculation();
				RegulatoryAssetBaseCalculationDAO calculationDao = new RegulatoryAssetBaseCalculationDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				RegulatoryAssetBasePartialWriteOffDAO partialWriteOffDao = new RegulatoryAssetBasePartialWriteOffDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				RegulatoryAssetBaseDAO assetDao = new RegulatoryAssetBaseDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			    object.code = partialWriteOffDao.add(object);
			    RegulatoryAssetBase asset = assetDao.getObject(object.assetRef.code);
			    this.checkPartialWriteOff(asset, Arrays.asList(object));
			    calculationDao.recalculateAsset(asset);
			    return object.code;
			} catch (DatasourceConnectException e) {
				throw new SystemException(
						"Can't add {%com.ksoe.energynet.valueobject.RegulatoryAssetBasePartialWriteOff%} object.",
						e);
			} catch (PersistenceException e) {
				throw new SystemException(e.getMessage(), e);
			} finally {
				if(useRealLock) LockUtilsSync.releaseLock(object.assetRef.code);
				closeConnection();
			}			
		}
	}
	
	public void savePartialWriteOff(RegulatoryAssetBasePartialWriteOff object) {
		Object lock = LockUtilsSync.lockByCode(object.assetRef.code);
		synchronized(lock) {
			try {
				this.checkPerformingCalculation();
				RegulatoryAssetBaseCalculationDAO calculationDao = new RegulatoryAssetBaseCalculationDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				RegulatoryAssetBasePartialWriteOffDAO partialWriteOffDao = new RegulatoryAssetBasePartialWriteOffDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				RegulatoryAssetBaseDAO assetDao = new RegulatoryAssetBaseDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				
				RegulatoryAssetBasePartialWriteOff old = partialWriteOffDao.getObject(object.code);
				if(old == null) {
					throw new SystemException(String.format("\n\nНе знайдено часткової ліквідації із кодом %d\n\n", object.code));
				}
				if(old.equals(object)) return;
				RegulatoryAssetBase asset = assetDao.getObject(object.assetRef.code);
				this.checkPartialWriteOff(asset, Arrays.asList(object));
				partialWriteOffDao.save(object);
				if(old.checkIfRecalculationIsNeeded(object)) {
					calculationDao.recalculateAsset(asset);
				}
			} catch (DatasourceConnectException e) {
				throw new SystemException(
						"Can't save {%com.ksoe.energynet.valueobject.RegulatoryAssetBasePartialWriteOff%} object.",
						e);
			} catch (PersistenceException e) {
				throw new SystemException(e.getMessage(), e);
			} finally {
				LockUtilsSync.releaseLock(object.assetRef.code);
				closeConnection();
			}		
		}		
	}
	
	public void removePartialWriteOff(int code) {
		try {
			RegulatoryAssetBaseCalculationDAO calculationDao = new RegulatoryAssetBaseCalculationDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RegulatoryAssetBasePartialWriteOffDAO partialWriteOffDao = new RegulatoryAssetBasePartialWriteOffDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RegulatoryAssetBaseDAO assetDao = new RegulatoryAssetBaseDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			RegulatoryAssetBasePartialWriteOff partialWriteOff = partialWriteOffDao.getObject(code);
			if(partialWriteOff == null) {
				throw new SystemException(String.format("\n\nНе знайдено часткової ліквідації із кодом %d\n\n", code));
			}
			RegulatoryAssetBase asset = assetDao.getObject(partialWriteOff.assetRef.code);
			if(asset == null) throw new SystemException(String.format("\n\nНе знайдено активу із кодом %d\n\n", partialWriteOff.assetRef.code));
			Object lock = LockUtilsSync.lockByCode(partialWriteOff.assetRef.code);
			synchronized (lock) {
				try {
					this.checkPerformingCalculation();
					partialWriteOffDao.remove(code);
					calculationDao.recalculateAsset(asset);
				} finally {
					LockUtilsSync.releaseLock(partialWriteOff.assetRef.code);
				}
			}
			
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}		
	}
	
	private void checkAsset(RegulatoryAssetBase asset) {
		if(asset == null) throw new java.lang.NullPointerException("Не задані параметри!");
		DateFormat df = Tools.dateFormatDefault;
		if(asset.inventoryNumber == null || asset.inventoryNumber.trim().length() == 0) {
			throw new SystemException("\n\nДля активу не заданий інвентарний номер!\n\n");
		}
		if(asset.name == null || asset.name.trim().length() == 0) {
			throw new SystemException(String.format("\n\nДля активу із інвентарним №%s не задане найменування!\n\n", asset.inventoryNumber));
		}
		if(asset.incomeDate == null) {
			throw new SystemException(String.format("\n\nДля активу із інвентарним №%s не задана дата прибуткування!\n\n", asset.inventoryNumber));
		}
		if(asset.groupRef == null || asset.groupRef.code == Integer.MIN_VALUE) {
			throw new SystemException(String.format("\n\nДля активу із інвентарним №%s не задана группа!\n\n", asset.inventoryNumber));
		}
		if(asset.initial == null) {
			throw new SystemException(String.format("\n\nДля активу із інвентарним №%s не задана ознака РБА Стара або нова!\n\n", asset.inventoryNumber));
		}
		if(asset.originalValue == null) {
			throw new SystemException(String.format("\n\nДля активу із інвентарним №%s не задана первісна вартість!\n\n", asset.inventoryNumber));
		}
		if(asset.originalValue.compareTo(BigDecimal.ZERO) < 0) {
			throw new SystemException(String.format("\n\nДля активу із інвентарним №%s первісна вартість не може бути від'ємною!\n\n", asset.inventoryNumber));
		}
		if(asset.usefulLife == Integer.MIN_VALUE) {
			throw new SystemException(String.format("\n\nДля активу із інвентарним №%s не заданий СКВ!\n\n", asset.inventoryNumber));
		}
		if(asset.usefulLife < 0) {
			throw new SystemException(String.format("\n\nДля активу із інвентарним №%s СКВ не може бути від'ємною!\n\n", asset.inventoryNumber));
		}
		if(asset.writeOffDate != null && asset.writeOffDate.compareTo(asset.incomeDate) < 0) {
			throw new SystemException(String.format("\n\nДля активу із інвентарним №%s дата списання (%s) не може бути меньшою за дату прибуткування (%s)!\n\n"
					, asset.inventoryNumber, df.format(asset.writeOffDate), df.format(asset.incomeDate)));
		}
	}
	
	private void checkOutOfUse(RegulatoryAssetBase asset, Collection<RegulatoryAssetBaseOutOfUse> outsOfUse) {
		if(asset == null || outsOfUse == null) throw new java.lang.NullPointerException("Не задані параметри!");
		DateFormat df = Tools.dateFormatDefault;
		
		for(RegulatoryAssetBaseOutOfUse outOfUse : outsOfUse) {
			if(outOfUse.dateStart == null) {
				throw new SystemException(String.format("\n\nНе задана дата початку у консервації для активу із інвентарним №%s!\n\n", asset.inventoryNumber));
			}
			if(outOfUse.dateFinish != null && outOfUse.dateStart.compareTo(outOfUse.dateFinish) > 0) {
				throw new SystemException(String.format("\n\nДати консервації повинні бути у хронологічному порядку для активу із інвентарним №%s!\nДата початку більша за дату кінця (%s > %s)!\n\n"
						, asset.inventoryNumber, df.format(outOfUse.dateStart), df.format(outOfUse.dateFinish)));
			}
			if(outOfUse.dateStart != null && outOfUse.dateStart.compareTo(asset.incomeDate) < 0) {
				throw new SystemException(String.format("\n\nДата початку консервації (%s) не повинна бути меньша за дату прибуткування активу (%s) із інвентарним № %s!\n\n"
						, df.format(outOfUse.dateStart), df.format(asset.incomeDate), asset.inventoryNumber));
			}
			if(asset.writeOffDate != null && outOfUse.dateStart.compareTo(asset.writeOffDate) > 0) {
				throw new SystemException(String.format("\n\nДата початку консервації (%s) не повинна бути більшою за дату списання активу (%s) із інвентарним № %s!\n\n"
						, df.format(outOfUse.dateStart), df.format(asset.writeOffDate), asset.inventoryNumber));
			}
			if(asset.writeOffDate != null && outOfUse.dateFinish != null && outOfUse.dateFinish.compareTo(asset.writeOffDate) > 0) {
				throw new SystemException(String.format("\n\nДата кінця консервації (%s) не повинна бути більшою за дату списання активу (%s) із інвентарним № %s!\n\n"
						, df.format(outOfUse.dateFinish), df.format(asset.writeOffDate), asset.inventoryNumber));
			}
		}
		for(RegulatoryAssetBaseOutOfUse outOfUse : outsOfUse) {
			// Проверка периодов консерваций на пересечение друг с другом
			for(RegulatoryAssetBaseOutOfUse outOfUseAnother : outsOfUse) {
				if(outOfUseAnother != outOfUse) {
					LocalDate thisDateStart = ZonedDateTime.ofInstant((new Date(outOfUse.dateStart.getTime())).toInstant(), ZoneId.systemDefault()).toLocalDate();
					LocalDate thisDateFinish = (outOfUse.dateFinish != null 
							? ZonedDateTime.ofInstant(new Date(outOfUse.dateFinish.getTime()).toInstant(), ZoneId.systemDefault()).toLocalDate() : LocalDate.MAX);
					
					LocalDate anotherDateStart = ZonedDateTime.ofInstant(new Date(outOfUseAnother.dateStart.getTime()).toInstant(), ZoneId.systemDefault()).toLocalDate();
					LocalDate anotherDateFinish = (outOfUseAnother.dateFinish != null 
							? ZonedDateTime.ofInstant(new Date(outOfUseAnother.dateFinish.getTime()).toInstant(), ZoneId.systemDefault()).toLocalDate() : LocalDate.MAX);
					boolean overlaps = anotherDateStart.compareTo(thisDateStart) == 0 || anotherDateFinish.compareTo(thisDateStart) == 0
							|| anotherDateStart.compareTo(thisDateFinish) == 0 || anotherDateFinish.compareTo(thisDateFinish) == 0;					
					if(!overlaps) {
						List<LocalDate> chronologicalOrder = Arrays.asList(thisDateStart, thisDateFinish, anotherDateStart, anotherDateFinish);
						Collections.sort(chronologicalOrder, LocalDate::compareTo);
						overlaps = chronologicalOrder.indexOf(thisDateFinish) - chronologicalOrder.indexOf(thisDateStart) != 1;
					}
					if(overlaps) {
						throw new SystemException(String.format("\n\nКонсервація з %s по %s перетинається за періодом із іншими консерваціями\n\n", df.format(outOfUse.dateStart)
								, (outOfUse.dateFinish != null ? df.format(outOfUse.dateFinish): "[Не введено]")));
					}
				}
			}
		}
		if(asset.writeOffDate != null) {
			if(outsOfUse.stream().map(RegulatoryAssetBaseOutOfUse::getDateFinish).filter(Objects::isNull).count() > 0) {
				throw new SystemException(String.format("\n\nДля активу із інвентарним № є незакінчені консервації!\nНеможливо поставити дату списання активу!\n\n"
						, asset.inventoryNumber));
			}
		}
	}
	private void checkPartialWriteOff(RegulatoryAssetBase asset, Collection<RegulatoryAssetBasePartialWriteOff> partialWriteOffs) {
		if(asset == null || partialWriteOffs == null) throw new java.lang.NullPointerException("Не задані параметри!");
		DateFormat df = Tools.dateFormatDefault;
		for(RegulatoryAssetBasePartialWriteOff partialWriteOff : partialWriteOffs) {
			if(partialWriteOff.value == null) {
				throw new SystemException(String.format("\n\nНе задана сума часткової ліквідації для активу із інвентарним № %s!\n\n", asset.inventoryNumber));
			}
			if(partialWriteOff.writeOffDate == null) {
				throw new SystemException(String.format("\n\nНе задана дата часткової ліквідації для активу із інвентарним № %s!\n\n", asset.inventoryNumber));
			}
		    if(asset.incomeDate.compareTo(partialWriteOff.writeOffDate) > 0) {
		    	throw new SystemException(String.format("\n\nДата прибуткування активу №%s більша ніж дата часткової ліквідації (%s > %s)\n\n"
		    			, asset.inventoryNumber, df.format(asset.incomeDate), df.format(partialWriteOff.writeOffDate)));
		    }
			if(asset.writeOffDate != null && partialWriteOff.writeOffDate.compareTo(asset.writeOffDate) > 0) {
		    	throw new SystemException(String.format("\n\nДата часткової ліквідації активу більше ніж дата ліквідації самого активу №%s (%s > %s)\n\n"
		    			, asset.inventoryNumber, df.format(partialWriteOff.writeOffDate), df.format(asset.writeOffDate)));				
			}
		}
	}
	
	public Object executeBeanShellScriptAndGetObject(String beanShellScript, Date from, Date to) {
		Connection finConn = null;
		Connection energyNetConn = null;
		
		try {
			finConn = initializeConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			energyNetConn = initializeConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			Interpreter bsh = new Interpreter();
			NameSpace ns = bsh.getNameSpace();
			ns.setVariable("userProfile", getUserProfile(), false);
			ns.setVariable("from", from, false);
			ns.setVariable("to", to, false);
			setConn(ns, finConn, "finConnection");
			setConn(ns, energyNetConn, "energyNetConnection");
			
			return bsh.eval(beanShellScript);
		} catch(EvalError e) {
			throw new EnergyproSystemException(e.toString());
		} catch (UtilEvalError e) {
			throw new EnergyproSystemException(e);
		}
		finally {
			closeConn(finConn);
			closeConn(energyNetConn);
		}
	}
	
	private Connection initializeConnection(String str) {
		try {
			return getRemoteConnection(str);
		} catch(DatasourceConnectException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	private void closeConn(Connection conn) {
		try {
			if (conn != null && !conn.isClosed()) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
		}
	}
	private void setConn(NameSpace ns, Connection conn, String connName) throws UtilEvalError {
		if(conn != null) {
			ns.setVariable(connName, conn, false);
		}
	}

} // end of EJB Controller for RegulatoryAssetBaseCalculation