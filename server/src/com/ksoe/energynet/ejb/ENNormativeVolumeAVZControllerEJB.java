
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENNormativeVolumeAVZ;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDepartmentDAO;
import com.ksoe.energynet.dataminer.ENNormVolumeAVZItemDAO;
import com.ksoe.energynet.dataminer.ENNormativeVolumeAVZDAO;
import com.ksoe.energynet.ejb.generated.ENNormativeVolumeAVZControllerEJBGen;
import com.ksoe.energynet.valueobject.ENNormativeVolumeAVZ;
import com.ksoe.energynet.valueobject.filter.ENNormVolumeAVZItemFilter;
import com.ksoe.energynet.valueobject.filter.ENNormativeVolumeAVZFilter;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENNormativeVolumeAVZControllerEJB extends
		ENNormativeVolumeAVZControllerEJBGen {

	public ENNormativeVolumeAVZControllerEJB() {
	}


	/* ENNormativeVolumeAVZ. Добавить */
	@Override
	public int add(ENNormativeVolumeAVZ object) {
		try {
			ENNormativeVolumeAVZDAO objectDAO = new ENNormativeVolumeAVZDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENDepartmentDAO departmentDao = new ENDepartmentDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENNormativeVolumeAVZFilter avzFilter = new ENNormativeVolumeAVZFilter();
			avzFilter.budgetRef.code = object.budgetRef.code;
			avzFilter.departmentRef.code = object.departmentRef.code;
			avzFilter.rest_purpose_type_id = object.rest_purpose_type_id;

			int avzArr[] = objectDAO.getFilteredCodeArray(avzFilter, 0, -1);
			if (avzArr.length > 0) {
				throw new SystemException("\n\n" +
						"Норматівні об’єми АВЗ для підрозділу " + departmentDao.getObject(object.departmentRef.code).shortName +
						" та бюджетотримача " + departmentDao.getObject(object.budgetRef.code).shortName +
						" та типом залишку " + object.rest_purpose_type_name 
						+ " вже введені!!!");
			}

		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

		    return objectDAO.add(object);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENNormativeVolumeAVZ%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/* ENNormativeVolumeAVZ. Удалить */
	@Override
	public void remove(int code) {
		try {
			ENNormativeVolumeAVZDAO objectDAO = new ENNormativeVolumeAVZDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENNormVolumeAVZItemDAO avzItemDao = new ENNormVolumeAVZItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENNormVolumeAVZItemFilter avzItemFilter = new ENNormVolumeAVZItemFilter();
			avzItemFilter.normativeVolumeRef.code = code;

			int avzItemArr[] = avzItemDao.getFilteredCodeArray(avzItemFilter, 0, -1);
			for (int i = 0; i < avzItemArr.length; i++) {
				avzItemDao.remove(avzItemArr[i]);
			}

			objectDAO.remove(code);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENNormativeVolumeAVZ%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENNormativeVolumeAVZ