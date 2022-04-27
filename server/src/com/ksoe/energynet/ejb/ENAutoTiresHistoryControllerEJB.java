//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENAutoTiresHistory;
 *
 */

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAutoTiresDistanceDAO;
import com.ksoe.energynet.dataminer.ENAutoTiresHistoryDAO;
import com.ksoe.energynet.ejb.generated.ENAutoTiresHistoryControllerEJBGen;
import com.ksoe.energynet.valueobject.ENAutoTiresDistance;
import com.ksoe.energynet.valueobject.ENAutoTiresHistory;
import com.ksoe.energynet.valueobject.filter.ENAutoTiresDistanceFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENAutoTiresHistoryControllerEJB extends
		ENAutoTiresHistoryControllerEJBGen {

	public ENAutoTiresHistoryControllerEJB() {
	}

	public int add(ENAutoTiresHistory object) {
		try {
			object.setDomain_info(null);

			ENAutoTiresHistoryDAO objectDAO = new ENAutoTiresHistoryDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			Date lastUninstallDate = objectDAO.getLastUninstallDate(object.tiresRef.code);

			if (lastUninstallDate != null && object.installDate.before(lastUninstallDate)) {
				throw new EnergyproSystemException(
						"Дата установки не может быть ранее даты снятия !!! " +
						" Последняя дата снятия : " + new SimpleDateFormat("dd.MM.yyyy").format(lastUninstallDate).toString());
			}

			int installPlaces = objectDAO.checkInstallPlaces(object.transportRealRef.code, object.installPlacesRef.code);
			String freeInstallPlaces = objectDAO.getFreeInstallPlaces(object.transportRealRef.code);

			if (installPlaces != Integer.MIN_VALUE && installPlaces == object.installPlacesRef.code) {
				throw new EnergyproSystemException(
						"На этом месте покрышка уже установлена !!! " +
						 " Свободно для установки : " + freeInstallPlaces);
			}

			return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENAutoTiresHistory%} object.", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public void save(ENAutoTiresHistory object) {
		try {
			object.setDomain_info(null);

			ENAutoTiresHistoryDAO objectDAO = new ENAutoTiresHistoryDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENAutoTiresDistanceDAO distanceDAO = new ENAutoTiresDistanceDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			Date lastInstallDate = objectDAO.getLastInstallDate(object.tiresRef.code);

			if (lastInstallDate != null && object.uninstallDate.before(lastInstallDate)) {
				throw new EnergyproSystemException(
						"Дата снятия не может быть ранее даты установки !!! " +
						" Последняя дата установки : " + new SimpleDateFormat("dd.MM.yyyy").format(lastInstallDate).toString());
			}

			/*Проверка, что не было движения автопокрышки после даты снятия */
			ENAutoTiresDistanceFilter distanceFilter = new ENAutoTiresDistanceFilter();
			distanceFilter.tiresRef.code = object.tiresRef.code;
			distanceFilter.conditionSQL = " " + ENAutoTiresDistance.recordtDate_QFielld + " > ?";
			Vector dates = new Vector();
			dates.add(0, object.uninstallDate);

			int[] distanceCodes = distanceDAO.getFilteredCodeArray(distanceFilter, distanceFilter.conditionSQL, "", 0, -1, dates);
			if(distanceCodes.length > 0)
				throw new EnergyproSystemException("Вже був пробіг цієї автопокришки після дати зняття (" + 
						new SimpleDateFormat("dd.MM.yyyy").format(object.uninstallDate).toString() + ")");
			
			objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENAutoTiresHistory%} object.",	e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENAutoTiresHistory