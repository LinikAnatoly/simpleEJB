
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENAccumulatorsHistory;
  *
  */



import java.text.SimpleDateFormat;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAccumulatorsHistoryDAO;
import com.ksoe.energynet.ejb.generated.ENAccumulatorsHistoryControllerEJBGen;
import com.ksoe.energynet.valueobject.ENAccumulatorsHistory;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENAccumulatorsHistoryControllerEJB extends ENAccumulatorsHistoryControllerEJBGen
 {

  public ENAccumulatorsHistoryControllerEJB() {}

	public int add(ENAccumulatorsHistory object) {
		try {
			object.setDomain_info(null);

			ENAccumulatorsHistoryDAO objectDAO = new ENAccumulatorsHistoryDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			Date lastUninstallDate = objectDAO.getLastUninstallDate(object.accumulatorsRef.code);

			if (lastUninstallDate != null && object.installDate.before(lastUninstallDate)) {
				throw new EnergyproSystemException(
						"Дата установки не может быть ранее даты снятия !!!" +
						" Последняя дата снятия : " + new SimpleDateFormat("dd.MM.yyyy").format(lastUninstallDate).toString());
			}

			return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENAccumulatorsHistory%} object.", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public void save(ENAccumulatorsHistory object) {
		try {
			object.setDomain_info(null);

			ENAccumulatorsHistoryDAO objectDAO = new ENAccumulatorsHistoryDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			Date lastInstallDate = objectDAO.getLastInstallDate(object.accumulatorsRef.code);

			if (lastInstallDate != null && object.uninstallDate.before(lastInstallDate)) {
				throw new EnergyproSystemException(
						"Дата снятия не может быть ранее даты установки !!!" +
						" Последняя дата установки : " + new SimpleDateFormat("dd.MM.yyyy").format(lastInstallDate).toString());
			}

			objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENAccumulatorsHistory%} object.",	e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENAccumulatorsHistory