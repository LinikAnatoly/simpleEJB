
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENPlanXqtnHistory;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENPlanXqtnHistoryDAO;
import com.ksoe.energynet.ejb.generated.ENPlanXqtnHistoryControllerEJBGen;
import com.ksoe.energynet.valueobject.ENPlanXqtnHistory;
import com.ksoe.energynet.valueobject.filter.ENPlanXqtnHistoryFilter;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

import java.util.Date;

public class ENPlanXqtnHistoryControllerEJB extends
		ENPlanXqtnHistoryControllerEJBGen {

	public ENPlanXqtnHistoryControllerEJB() {
	}

	public int add(ENPlanXqtnHistory object) {
		try {
			ENPlanXqtnHistoryDAO objectDAO = new ENPlanXqtnHistoryDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			object.userGen = getUserProfile().userName;
			object.dateEdit = new Date();

			if (object.executionPercent  > new Integer(100) ||
					object.executionPercent  < new Integer(0)) {
				throw new SystemException("Відсоток виконання повинен знаходитися у діапозоні від 0 до 100!");
			}

			return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENPlanXqtnHistory%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public void remove(int code) {
		try {
			ENPlanXqtnHistoryDAO objectDAO = new ENPlanXqtnHistoryDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENPlanXqtnHistory xqtnHistory = objectDAO.getObject(code);
			ENPlanXqtnHistoryFilter xqtnHistoryFilter = new ENPlanXqtnHistoryFilter();
			xqtnHistoryFilter.planRef.code = xqtnHistory.planRef.code;
			xqtnHistoryFilter.conditionSQL = " dategen > " + xqtnHistory.dateGen;
			xqtnHistoryFilter.orderBySQL = " dategen desc";


			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENPlanXqtnHistory%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENPlanXqtnHistory