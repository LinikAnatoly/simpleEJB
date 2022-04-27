
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENBuilding2Commission;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENBuilding2CommissionDAO;
import com.ksoe.energynet.ejb.generated.ENBuilding2CommissionControllerEJBGen;
import com.ksoe.energynet.valueobject.ENBuilding2Commission;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENBuilding2CommissionControllerEJB extends
		ENBuilding2CommissionControllerEJBGen {

	public ENBuilding2CommissionControllerEJB() {
	}
	
	
	/* ENBuilding2Commission. Добавить */
	public int add(ENBuilding2Commission object) {
		try {
			ENBuilding2CommissionDAO objectDAO = new ENBuilding2CommissionDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			/*if(object.ENBuildingCommissionTypeRef.code == Integer.MIN_VALUE){
				SystemException(" Тип запису не вказаний!!!");
			}*/
			
		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENBuilding2Commission%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	

   	/* ENBuilding2Commission. Изменить */
	public void save(ENBuilding2Commission object) {
		try {
			ENBuilding2CommissionDAO objectDAO = new ENBuilding2CommissionDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
		/*	if(object.ENBuildingCommissionTypeRef.code == Integer.MIN_VALUE){
				SystemException(" Тип запису не вказаний!!!");
			}*/

		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENBuilding2Commission%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENBuilding2Commission