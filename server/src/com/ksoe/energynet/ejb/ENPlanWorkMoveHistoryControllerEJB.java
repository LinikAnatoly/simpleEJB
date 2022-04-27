//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Mon Oct 05 15:21:12 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENPlanWorkMoveHistory;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.ejb.generated.ENPlanWorkMoveHistoryControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.valueobject.ENPlanWorkMoveHistory;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENPlanWorkMoveHistoryControllerEJB extends
		ENPlanWorkMoveHistoryControllerEJBGen {


	public int add(ENPlanWorkMoveHistory object, boolean isChangeForm) {
		try {

			AuthLogic l = new AuthLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getUserProfile());

			if (!l.checkPermission4PlanItems(object.planRef.code) ) {
				throw new EnergyproSystemException(
						"У Вас немає прав для коригування планів на цьому об'єкті ...");
			}

			PlanWorkLogic planLogic = new PlanWorkLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getUserProfile());

			
			
			return planLogic.movePlanWork(object, isChangeForm);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENPlanWorkMoveHistory%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public ENPlanWorkMoveHistoryControllerEJB() {
	}

} // end of EJB Controller for ENPlanWorkMoveHistory