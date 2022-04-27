//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

import java.util.Date;

/**
 * EJB Controller for ENSizMaterials2TKMaterials;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENSizMaterials2TKMaterialsDAO;
import com.ksoe.energynet.ejb.generated.ENSizMaterials2TKMaterialsControllerEJBGen;
import com.ksoe.energynet.logic.SiZLogic;
import com.ksoe.energynet.valueobject.ENSizMaterials2TKMaterials;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENSizMaterials2TKMaterialsControllerEJB extends
		ENSizMaterials2TKMaterialsControllerEJBGen {

	public ENSizMaterials2TKMaterialsControllerEJB() {
	}


	@Override
	public void save(ENSizMaterials2TKMaterials object) {

		if ( 1 == 1 ) {
			throw new SystemException("\n\n"
					+ "Ця функція не використовується.");
		}
	}


	/* ENSizMaterials2TKMaterials. Добавить */
	@Override
	public int add(ENSizMaterials2TKMaterials object) {
		try {

			ENSizMaterials2TKMaterialsDAO objectDAO = new ENSizMaterials2TKMaterialsDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			SiZLogic sizLogic = new SiZLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());


			object.userEdit = getUserProfile().userName;
			object.dateEdit = new Date();


			sizLogic.checkExistMaterials(object.tkMaterialsRef.code, object.elementRef.code);


			int objectCode = objectDAO.add(object);


			return objectCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


} // end of EJB Controller for ENSizMaterials2TKMaterials