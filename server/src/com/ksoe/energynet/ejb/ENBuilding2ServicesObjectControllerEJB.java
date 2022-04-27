
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENBuilding2ServicesObject;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENBuilding2ServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENBuildingDAO;
import com.ksoe.energynet.ejb.generated.ENBuilding2ServicesObjectControllerEJBGen;
import com.ksoe.energynet.valueobject.ENBuilding;
import com.ksoe.energynet.valueobject.ENBuilding2ServicesObject;
import com.ksoe.energynet.valueobject.ENBuildingStatus;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENBuilding2ServicesObjectControllerEJB extends
		ENBuilding2ServicesObjectControllerEJBGen {

	public ENBuilding2ServicesObjectControllerEJB() {
	}
	
	
	/* ENBuilding2ServicesObject. Добавить */
	public int add(ENBuilding2ServicesObject object) {
		try {
			ENBuilding2ServicesObjectDAO objectDAO = new ENBuilding2ServicesObjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENBuildingDAO bDAO = new ENBuildingDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENBuilding bObject = bDAO.getObject(object.ENBuildingRef.code);
			
			if(bObject.statusRef.code != ENBuildingStatus.DRAFT ){
				throw new SystemException(" Документ ОЗ-1 складений або затверджений!!! ");
			}
				

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENBuilding2ServicesObject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	/* ENBuilding2ServicesObject. Удалить */
	public void remove(int code) {
		try {
			ENBuilding2ServicesObjectDAO objectDAO = new ENBuilding2ServicesObjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENBuildingDAO bDAO = new ENBuildingDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENBuilding2ServicesObject building2SoObj = objectDAO.getObject(code);
			
			ENBuilding bObject = bDAO.getObject(building2SoObj.ENBuildingRef.code);
			
			if(bObject.statusRef.code != ENBuildingStatus.DRAFT ){
				throw new SystemException(" Документ ОЗ-1 складений або затверджений!!! ");
			}
				

			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENBuilding2ServicesObject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENBuilding2ServicesObject