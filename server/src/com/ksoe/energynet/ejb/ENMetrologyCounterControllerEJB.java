
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENMetrologyCounter;
  *
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENMetrologyCounterDAO;
import com.ksoe.energynet.ejb.generated.ENMetrologyCounterControllerEJBGen;
import com.ksoe.energynet.logic.SCLogic;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.filter.ENMetrologyCounterFilter;
import com.ksoe.energynet.valueobject.lists.ENMetrologyCounterShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.dataminer.TKAccountingTypeDAO;
import com.ksoe.techcard.valueobject.TKAccountingType;

public class ENMetrologyCounterControllerEJB extends ENMetrologyCounterControllerEJBGen
 {

	public ENMetrologyCounterControllerEJB() {
	}

	@Override
	public int add(ENMetrologyCounter object) {
		try {
			ENElementDAO elDAO = new ENElementDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENMetrologyCounterDAO objectDAO = new ENMetrologyCounterDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			object.setDomain_info(null);
			ENElement el = new ENElement();

			el.typeRef.code = ENElementType.METROLOGY_COUNTER;
			el.elementInRef.code = object.element.elementInRef.code;
			el.elementOutRef.code = object.element.elementOutRef.code;
			el.renRef.code = object.element.renRef.code;
			el.code = elDAO.add(el);

			object.element.code = el.code;
			
			this.checkAccountingType(object);

			return objectDAO.add(object);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENMetrologyObject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	@Override
	public void save(ENMetrologyCounter object) {
		try {
			ENElementDAO elDAO = new ENElementDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENMetrologyCounterDAO objectDAO = new ENMetrologyCounterDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			object.setDomain_info(null);
			ENElement el = new ENElement();

			el = elDAO.getObject(object.element.code);
			el.elementInRef.code = object.element.elementInRef.code;
			el.elementOutRef.code = object.element.elementOutRef.code;
			el.renRef.code = object.element.renRef.code;
			elDAO.save(el);
			
			this.checkAccountingType(object);

			objectDAO.save(object);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENMetrologyObject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	private void checkAccountingType(ENMetrologyCounter obj) throws PersistenceException, DatasourceConnectException {
		if(obj != null) {
			if(obj.accountingTypeRef == null || obj.accountingTypeRef.code == Integer.MIN_VALUE) {
				throw new SystemException("Для лічильника не заданий Тип обліку!");
			}
			if(obj.accountingTypeRef.code != TKAccountingType.COUNTERS
					&& obj.accountingTypeRef.code != TKAccountingType.OS) {
				TKAccountingTypeDAO accountingTypeDao = new TKAccountingTypeDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
				TKAccountingType accountingType = accountingTypeDao.getObject(obj.accountingTypeRef.code);
				if(accountingType == null) {
					throw new SystemException(String.format("Помилка у типі обліку для ун. коду %d", obj.accountingTypeRef.code));
				}
				throw new SystemException(String.format("Для лічильника не можливо вказати тип обліку \"%s\"", accountingType.name));
			}
		}
	}


	public ENMetrologyCounterShortList getCountersList(
			ENMetrologyCounterFilter filterObject, int fromPosition,
			int quantity) {
		return this.getCountersList(filterObject, fromPosition, quantity, TKAccountingType.COUNTERS);
	}
	
	  /**
	   * 
	   * Выборка счетчиков из СканСчетчиков и Основных средств
	   * 
	   * Из-за того, что в oracle записи в выборке начинаются с 1го номера, то вызов метода с параметром fromPosition = 0
	   * и fromPosition = 1 вернут одинаковый результат.
	   * 
	   * @param filterObject объект фильтра {@link ENMetrologyCounterFilter}
	   * @param fromPosition с какой позиции выбирать
	   * @param quantity количество записей или -1 если нужно выбрать все
	   * @param accountingTypeCode код типа учета {@link com.ksoe.techcard.valueobject.TKAccountingType}
	   * @return лист объектов {@link ENMetrologyCounterShortList}
	   * @throws java.rmi.RemoteException
	   */
	public ENMetrologyCounterShortList getCountersList(
			ENMetrologyCounterFilter filterObject, int fromPosition,
			int quantity, int accountingTypeCode) {
		try {
			SCLogic scLogic = new SCLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			return scLogic.getCountersListFromScanCounter(filterObject, fromPosition, quantity, accountingTypeCode);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("\n\n"
					+ "Нет подключения к БД СканСчетчик ...", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	public ENMetrologyCounterShortList getCountersListDistinctName(
			ENMetrologyCounterFilter filterObject, int fromPosition,
			int quantity) {
		try {
			SCLogic scLogic = new SCLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			return scLogic.getCountersListFromScanCounterDistinctName(filterObject, fromPosition, quantity);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("\n\n"
					+ "Нет подключения к БД СканСчетчик ...", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	public void setPhasity(ENMetrologyCounter[] counters) {
		try {
			ENMetrologyCounterDAO objectDAO = new ENMetrologyCounterDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE));

			for (ENMetrologyCounter temp : counters) {
				if (temp.phasity != 1 && temp.phasity != 3) {
					throw new EnergyproSystemException("\n\n"
							+ "Неправильна фазність у лічильника інв. № " + temp.invNumber);
				}
			}
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException();
		}
	}


	public ENMetrologyCounterShortList getSealsList(
			ENMetrologyCounterFilter filterObject, int fromPosition,
			int quantity) {
		try {
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			return scLogic.getSealsListFromScanCounter(filterObject, fromPosition, quantity);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("\n\n"
					+ "Нет подключения к БД СканСчетчик ...", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	public ENMetrologyCounterShortList getSealsList(
			ENMetrologyCounterFilter filterObject, int fromPosition,
			int quantity, boolean showAll) {
		try {
			SCLogic scLogic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			return scLogic.getSealsListFromScanCounter(filterObject, fromPosition, quantity, showAll);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("\n\n"
					+ "Нет подключения к БД СканСчетчик ...", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	public boolean isAccountForParametrization(String account) {
		try {
			SCLogic logic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			return logic.isAccountForParametrization(account);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("\n\n"
					+ "Нет подключения к БД СканСчетчик ...", e);
		} finally {
			closeConnection();
		}
	}


	public String getStringAccountsForParametrization() {
		try {
			SCLogic logic = new SCLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE), getUserProfile());

			return logic.getStringAccountsForParametrization();

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("\n\n"
					+ "Нет подключения к БД СканСчетчик ...", e);
		} finally {
			closeConnection();
		}
	}


} // end of EJB Controller for ENMetrologyCounter