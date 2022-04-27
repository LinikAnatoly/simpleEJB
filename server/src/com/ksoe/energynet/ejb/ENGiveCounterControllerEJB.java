//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

import java.math.BigDecimal;
import java.util.Vector;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.ejb.generated.ENGiveCounterControllerEJBGen;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.valueobject.ENGiveCounter;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.filter.ENGiveCounterFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
/**
 * EJB Controller for ENGiveCounter;
 *
 */
import com.ksoe.energynet.dataminer.ENGiveCounterDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;

public class ENGiveCounterControllerEJB extends ENGiveCounterControllerEJBGen {

	public ENGiveCounterControllerEJB() {
	}

	/* ENGiveCounter. Добавить */
	public int add(ENGiveCounter object) {
		try {
			ENGiveCounterDAO objectDAO = new ENGiveCounterDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ServicesLogic logic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			ENServicesObject so = new ENServicesObject();
			so = soDAO.getObject(object.servicesObjectRef.code);

			if (so.contractStatusRef.code > ENServicesContractStatus.BUDGETAPPROVED) {
				throw new EnergyproSystemException("" +
						"\n " +
						"\n Після підписання договору заборонено додавати лічильники!!!");
			}
			object.code = objectDAO.add(object);
			
			
			if(logic.isGiveCounterOnBalanceByServicesObjectCode(object.servicesObjectRef.code)) {
				
				
				ENGiveCounterFilter filter = new ENGiveCounterFilter();
				filter.servicesObjectRef.code = object.servicesObjectRef.code;
				Vector<Object> bindedObjects = new Vector<Object>();
				bindedObjects.add(object.code);
				filter.conditionSQL = String.format("%s <> ?", ENGiveCounter.code_QFielld);
				long count = objectDAO.count(filter, bindedObjects);
			
				if(count > 0) {
					throw new SystemException(String.format("Вже є лічильник абонента прибуткований під договор № %s", so.contractNumberServices));
				}
				
				if(object.cost == null) {
					throw new EnergyproSystemException("Не задана вартість");
				}
				
				if(object.vat == null) {
					object.vat = new BigDecimal(0);
				}
				
				logic.makeIncomeFKOrdersForGivenCounters(so);
			}
			
			return object.code;

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENGiveCounter%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	public void remove(int code) {
		try {
			ENGiveCounterDAO objectDAO = new ENGiveCounterDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENGiveCounter object = objectDAO.getObject(code);
			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ServicesLogic logic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			ENServicesObject so = new ENServicesObject();
			so = soDAO.getObject(object.servicesObjectRef.code);

			if (so.contractStatusRef.code > ENServicesContractStatus.BUDGETAPPROVED) {
				throw new EnergyproSystemException("" +
						"\n " +
						"\n Після підписання договору заборонено видаляти лічильники!!!");
			}
			
			if(logic.isGiveCounterOnBalanceByServicesObjectCode(so.code)) {
				logic.undoMakeIncomeFKOrdersForGivenCounters(so);
			}
				
			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		}
		
	}

	/* ENGiveCounter. Изменить */
	public void save(ENGiveCounter object) {
		try {

			ENGiveCounterDAO objectDAO = new ENGiveCounterDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENServicesObject so = new ENServicesObject();
			so = soDAO.getObject(object.servicesObjectRef.code);

			if (so.contractStatusRef.code > ENServicesContractStatus.BUDGETAPPROVED) {
				throw new EnergyproSystemException("" +
						"\n " +
						"\n Після підписання договору заборонено редагувати лічильники!!!");
			}


			objectDAO.save(object);

			ServicesLogic logic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			if(logic.isGiveCounterOnBalanceByServicesObjectCode(so.code)) {
				
				if(object.cost == null) {
					throw new EnergyproSystemException("Не задана вартість");
				}
				
				if(object.vat == null) {
					object.vat = new BigDecimal(0);
				}
				
				logic.undoMakeIncomeFKOrdersForGivenCounters(so);
				logic.makeIncomeFKOrdersForGivenCounters(so);
				
			}
			
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENGiveCounter%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
} // end of EJB Controller for ENGiveCounter