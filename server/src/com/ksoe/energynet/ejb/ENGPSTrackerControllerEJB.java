
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENGPSTracker;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENGPSTrackerDAO;
import com.ksoe.energynet.ejb.generated.ENGPSTrackerControllerEJBGen;
import com.ksoe.energynet.logic.TransportLogic;
import com.ksoe.energynet.valueobject.ENGPSTracker;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENGPSTrackerControllerEJB extends
		ENGPSTrackerControllerEJBGen {

	public ENGPSTrackerControllerEJB() {
	}
	
	/* ENGPSTracker. Установить на транспортное средство */
	public void installGPS(int gpsTrackerCode, int transportRealCode, Date date)  {
		   try
		    {
				TransportLogic transportLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
				transportLogic.installGPS(gpsTrackerCode, transportRealCode, date);
		    }
		   catch (DatasourceConnectException e) {throw new SystemException("Can't installGPS ",e);}
		  }
	
	/* ENGPSTracker. Снять с транспортного средства */
	public void unInstallGPS(int gpsTrackerCode, Date date)  {
		   try
		    {
				TransportLogic transportLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
				transportLogic.unInstallGPS(gpsTrackerCode, date);
		    }
		   catch (DatasourceConnectException e) {throw new SystemException("Can't unInstallGPS ",e);}
		  }

} // end of EJB Controller for ENGPSTracker