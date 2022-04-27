

//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENServices2CalcAdditionalItemsDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;

/**
 * EJB Controller for ENServices2CalcAdditionalItems;
 *
 */

import com.ksoe.energynet.ejb.generated.ENServices2CalcAdditionalItemsControllerEJBGen;
import com.ksoe.energynet.logic.ServicesCalculatorLogic;
import com.ksoe.energynet.valueobject.ENServices2CalcAdditionalItems;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENServices2CalcAdditionalItemsControllerEJB extends
		ENServices2CalcAdditionalItemsControllerEJBGen {

	public ENServices2CalcAdditionalItemsControllerEJB() {
	}
	
	private void checkAndRecalcENServicesObject(ENServices2CalcAdditionalItems object) throws DatasourceConnectException, PersistenceException {
		
		if(object == null) {
			throw new java.lang.NullPointerException("Не заданий об'єкт");
		}
		if(object.servicesObjectRef.code == Integer.MIN_VALUE) {
			throw new java.lang.NullPointerException("Не заданий договір для об'єкту");
		}
		
		ENServicesObjectDAO servicesObjectDao = 
				new ENServicesObjectDAO(getUserProfile()
						, getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		ServicesCalculatorLogic servicesCalculatorLogic = new ServicesCalculatorLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)
				, getUserProfile());
		
		ENServicesObject servicesObject = servicesObjectDao.getObject(object.servicesObjectRef.code);
		
		
		servicesCalculatorLogic.evaluateSumsByENServicesCost(servicesObject);
	}
	

	@Override
	public int add(ENServices2CalcAdditionalItems object) {		
		try {
			
			ENServices2CalcAdditionalItemsDAO dao = new ENServices2CalcAdditionalItemsDAO(getUserProfile()
					, getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			object.code = dao.add(object);
			
			this.checkAndRecalcENServicesObject(object);
			
			return object.code;
			
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
	}

	@Override
	public void remove(int code) {
		try {
			ENServices2CalcAdditionalItemsDAO dao = new ENServices2CalcAdditionalItemsDAO(getUserProfile()
					, getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENServices2CalcAdditionalItems object = dao.getObject(code);
			
			dao.remove(code);
			
			this.checkAndRecalcENServicesObject(object);
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
	}

	@Override
	public void save(ENServices2CalcAdditionalItems object) {
		try {
			ENServices2CalcAdditionalItemsDAO dao = new ENServices2CalcAdditionalItemsDAO(getUserProfile()
					, getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			dao.save(object);
			this.checkAndRecalcENServicesObject(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
	}
	
	

} // end of EJB Controller for ENServices2CalcAdditionalItems