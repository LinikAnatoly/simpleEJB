
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENSOTechParams;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENSOTechParamsDAO;
import com.ksoe.energynet.ejb.generated.ENSOTechParamsControllerEJBGen;
import com.ksoe.energynet.logic.TechConditionsLogic;
import com.ksoe.energynet.valueobject.ENSOTechParams;
import com.ksoe.energynet.valueobject.references.*;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

import java.math.BigDecimal;
import java.util.Date;

public class ENSOTechParamsControllerEJB extends
		ENSOTechParamsControllerEJBGen {

	public ENSOTechParamsControllerEJB() {
	}
	

   	/* ENSOTechParams. Изменить */
	public void calcTarif(ENSOTechParams object) {
		try {

            TechConditionsLogic tcLogic = new TechConditionsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            tcLogic.calcTarif(object.servicesobject.code);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENSOTechParams%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


   	/* ENSOTechParams. Расчёт стоимости подключения */
	public BigDecimal getConnectionCost(int connectionKind, int departmentCode, int categoryRefCode,
								  int levelRefCode, int powerPointRefCode, int phasityRefCode,
								  int installationTypeRefCode, int lineTypeRefCode,
								  int locationTypeRefCode, BigDecimal tyServicesPower,
								  int closestDistance, int closestDistance2) {
		try {
			Date regDate = new Date();
            TechConditionsLogic tcLogic = new TechConditionsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENPowerReliabilityCategoryRef categoryRef = new ENPowerReliabilityCategoryRef();
			categoryRef.setCode(categoryRefCode);
			ENConnectionLevelRef levelRef = new ENConnectionLevelRef();
			levelRef.setCode(levelRefCode);
			ENConnectionPowerPointRef powerPointRef = new ENConnectionPowerPointRef();
			powerPointRef.setCode(powerPointRefCode);
			ENConnectionPhasityRef phasityRef = new ENConnectionPhasityRef();
			phasityRef.setCode(phasityRefCode);
			ENConnectionInstallationTypeRef installationTypeRef = new ENConnectionInstallationTypeRef();
			installationTypeRef.setCode(installationTypeRefCode);
			ENConnectionLineTypeRef lineTypeRef = new ENConnectionLineTypeRef();
			lineTypeRef.setCode(lineTypeRefCode);
			ENConnectionLocationTypeRef locationTypeRef = new ENConnectionLocationTypeRef();
			locationTypeRef.setCode(locationTypeRefCode);

            return tcLogic.getConnectionCost(regDate, connectionKind, departmentCode, categoryRef,
					levelRef, powerPointRef, phasityRef, installationTypeRef, lineTypeRef,
					locationTypeRef, tyServicesPower, closestDistance, closestDistance2, Integer.MIN_VALUE).tyServicesSumma;

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENSOTechParams%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENSOTechParams