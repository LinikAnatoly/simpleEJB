
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENCustomerWarrantDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENWarrantDAO;

/**
 * EJB Controller for ENCustomerWarrant;
 *
 */

import com.ksoe.energynet.ejb.generated.ENCustomerWarrantControllerEJBGen;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.valueobject.ENCustomerWarrant;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENWarrant;
import com.ksoe.energynet.valueobject.filter.ENCustomerWarrantFilter;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENCustomerWarrantControllerEJB extends ENCustomerWarrantControllerEJBGen {

	public ENCustomerWarrantControllerEJB() {
	}


	/* ENCustomerWarrant. Добавить */
	@Override
	public int add(ENCustomerWarrant customerWarrant) {
		try {
			ENCustomerWarrantDAO customerWarrantDao = new ENCustomerWarrantDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			customerWarrant.userGen = getUserProfile().userName;

			if (customerWarrant.servicesObjectRef.code != Integer.MIN_VALUE) {

				ENCustomerWarrantFilter customerWarrantFilter = new ENCustomerWarrantFilter();
				customerWarrantFilter.servicesObjectRef.code = customerWarrant.servicesObjectRef.code;
				customerWarrantFilter.warrantRef.code = customerWarrant.warrantRef.code;

				int wArr[] = customerWarrantDao.getFilteredCodeArray(customerWarrantFilter, 0, -1);
				if (wArr.length > 0) {
					throw new SystemException("\n\n"
							+ "Ця довіреність вже є в договорі!");
				}
			}


			/** если доверенность заказчика с правом подписи - изменить в договоре... */
			if (customerWarrant.typeCode == ENConsts.YES
					&& customerWarrant.servicesObjectRef.code != Integer.MIN_VALUE) {

				ENWarrantDAO warrantDao = new ENWarrantDAO(getUserProfile(),
						getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(getUserProfile(),
						getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

				ENServicesObject servicesObject = servicesObjectDao.getObject(customerWarrant.servicesObjectRef.code);
				ENWarrant warrant = warrantDao.getObject(customerWarrant.warrantRef.code);

				servicesObject.warrantNumber = warrant.numbergen;
				servicesObject.warrantFIO = warrant.warrantFIO;
				servicesObject.warrantDate = warrant.dateGen;

				servicesObjectDao.save(servicesObject);
			}



			return customerWarrantDao.add(customerWarrant);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't add {%com.ksoe.energynet.valueobject.ENCustomerWarrant%} object.", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}



	/* ENCustomerWarrant. Изменить */
	@Override
	public void save(ENCustomerWarrant customerWarrant) {
		try {
			ENCustomerWarrantDAO customerWarrantDao = new ENCustomerWarrantDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENCustomerWarrant oldCustomerWarrant = customerWarrantDao.getObject(customerWarrant.code);


			if (customerWarrant.servicesObjectRef.code != Integer.MIN_VALUE) {

				if (customerWarrant.warrantRef.code != oldCustomerWarrant.warrantRef.code) {
					ENCustomerWarrantFilter customerWarrantFilter = new ENCustomerWarrantFilter();
					customerWarrantFilter.servicesObjectRef.code = customerWarrant.servicesObjectRef.code;
					customerWarrantFilter.warrantRef.code = customerWarrant.warrantRef.code;

					int wArr[] = customerWarrantDao.getFilteredCodeArray(customerWarrantFilter, 0, -1);
					if (wArr.length > 0) {
						throw new SystemException("\n\n"
								+ "Ця довіреність вже є в договорі!");
					}
				}
			}


			/** если доверенность заказчика с правом подписи - изменить в договоре... */
			if (customerWarrant.typeCode == ENConsts.YES
					&& customerWarrant.servicesObjectRef.code != Integer.MIN_VALUE) {

				ENWarrantDAO warrantDao = new ENWarrantDAO(getUserProfile(),
						getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
				ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(getUserProfile(),
						getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

				ENServicesObject servicesObject = servicesObjectDao.getObject(customerWarrant.servicesObjectRef.code);
				ENWarrant warrant = warrantDao.getObject(customerWarrant.warrantRef.code);

				servicesObject.warrantNumber = warrant.numbergen;
				servicesObject.warrantFIO = warrant.warrantFIO;
				servicesObject.warrantDate = warrant.dateGen;

				servicesObjectDao.save(servicesObject);
			}


			customerWarrantDao.save(customerWarrant);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't save {%com.ksoe.energynet.valueobject.ENCustomerWarrant%} object.", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENCustomerWarrant