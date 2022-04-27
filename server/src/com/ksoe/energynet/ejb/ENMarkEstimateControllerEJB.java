
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENMarkEstimate;
  *
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENMarkEstimateDAO;
import com.ksoe.energynet.ejb.generated.ENMarkEstimateControllerEJBGen;
import com.ksoe.energynet.valueobject.ENMarkEstimate;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENMarkEstimateControllerEJB extends ENMarkEstimateControllerEJBGen
 {

  public ENMarkEstimateControllerEJB() {}

	public int add(ENMarkEstimate object) {
		try {

			ENMarkEstimateDAO objectDAO = new ENMarkEstimateDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			object.userName = getUserProfile().userName;
			object.code = objectDAO.add(object);

			return object.code;
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.rqorder.valueobject.RQBill%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENMarkEstimate