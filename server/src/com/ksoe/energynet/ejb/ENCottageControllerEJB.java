
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENCottage;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENCottageDAO;
import com.ksoe.energynet.ejb.generated.ENCottageControllerEJBGen;
import com.ksoe.energynet.valueobject.ENCottage;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENCottageControllerEJB extends
		ENCottageControllerEJBGen {

	public ENCottageControllerEJB() {
	}


	/* ENCottage. Добавить */
	@Override
	public int add(ENCottage object) {
		try {
			ENCottageDAO objectDAO = new ENCottageDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

	        if (object.description != null) {
				object.description = object.description.replaceAll("\n"," ").trim();
			}

	        if (object.commentgen != null) {
				object.commentgen = object.commentgen.replaceAll("\n"," ").trim();
			}

		    return objectDAO.add(object);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENCottage%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


   	/* ENCottage. Изменить */
	@Override
	public void save(ENCottage object) {
		try {
			ENCottageDAO objectDAO = new ENCottageDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

	        if (object.description != null) {
				object.description = object.description.replaceAll("\n"," ").trim();
			}

	        if (object.commentgen != null) {
				object.commentgen = object.commentgen.replaceAll("\n"," ").trim();
			}

		    objectDAO.save(object);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENCottage%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENCottage