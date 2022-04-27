//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENNormVolumeAVZItem;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENNormVolumeAVZItemDAO;
import com.ksoe.energynet.ejb.generated.ENNormVolumeAVZItemControllerEJBGen;
import com.ksoe.energynet.valueobject.ENNormVolumeAVZItem;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.valueobject.TKMaterials;

public class ENNormVolumeAVZItemControllerEJB extends
		ENNormVolumeAVZItemControllerEJBGen {

	public ENNormVolumeAVZItemControllerEJB() {
	}

	/* ENNormVolumeAVZItem. Добавить */
	@Override
	public int add(ENNormVolumeAVZItem object) {
		try {
			ENNormVolumeAVZItemDAO objectDAO = new ENNormVolumeAVZItemDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			TKMaterialsDAO materialsDAO = new TKMaterialsDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			TKMaterials materials = materialsDAO.getObject(object.materialRef.code);

			if (materials.rootGroupRef.code == TKMaterials.SYSTEM_MATERIAL) {
				throw new SystemException("\n\n" +
						"Матеріали з групи \"СИСТЕМНИЙ МАТЕРІАЛ ENERGYNET\" не додаються!!!");
			}


			object.userGen = getUserProfile().userName;
			object.dateEdit = new Date();

			return objectDAO.add(object);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENNormVolumeAVZItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENNormVolumeAVZItem