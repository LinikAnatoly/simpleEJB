
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENAccess2Enelement;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAccess2EnelementDAO;
import com.ksoe.energynet.ejb.generated.ENAccess2EnelementControllerEJBGen;
import com.ksoe.energynet.valueobject.filter.ENAccess2EnelementFilter;
import com.ksoe.energynet.valueobject.lists.ENAccess2EnelementShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENAccess2EnelementControllerEJB extends
		ENAccess2EnelementControllerEJBGen {

	public ENAccess2EnelementControllerEJB() {
	}
	
	
	
	/* ENAccess2Enelement. Получить список для просмотра по фильтру */
	public ENAccess2EnelementShortList getScrollableFilteredList(
			ENAccess2EnelementFilter aENAccess2EnelementFilter, int aFromPosition,
			int aQuantity) {
		try {
			ENAccess2EnelementDAO objectDAO = new ENAccess2EnelementDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.getScrollableFilteredList(aENAccess2EnelementFilter,aENAccess2EnelementFilter.conditionSQL,aENAccess2EnelementFilter.orderBySQL
					,aFromPosition, aQuantity, null);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't get list of {%com.ksoe.energynet.valueobject.ENAccess2Enelement%} objects.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENAccess2Enelement