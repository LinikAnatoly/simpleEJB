
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENCottage2TKClassificationType;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENCottage2TKClassificationTypeDAO;
import com.ksoe.energynet.ejb.generated.ENCottage2TKClassificationTypeControllerEJBGen;
import com.ksoe.energynet.valueobject.ENCottage2TKClassificationType;
import com.ksoe.energynet.valueobject.filter.ENCottage2TKClassificationTypeFilter;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.dataminer.TKClassificationTypeDAO;
import com.ksoe.techcard.valueobject.filter.TKClassificationTypeFilter;

public class ENCottage2TKClassificationTypeControllerEJB extends
		ENCottage2TKClassificationTypeControllerEJBGen {

	public ENCottage2TKClassificationTypeControllerEJB() {
	}

	/* ENCottage2TKClassificationType. Добавить */
	@Override
	public int add(ENCottage2TKClassificationType object) {
		try {
			ENCottage2TKClassificationTypeDAO objectDAO = new ENCottage2TKClassificationTypeDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			TKClassificationTypeDAO classificationTypeDao = new TKClassificationTypeDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			TKClassificationTypeFilter classificationTypeFilter = new TKClassificationTypeFilter();
			classificationTypeFilter.parentRef.code = object.classificationTypeRef.code;

			int classificationTypeArr[] = classificationTypeDao.getFilteredCodeArray(classificationTypeFilter, 0, -1);
			if (classificationTypeArr.length > 0) {
				throw new SystemException("\n\n"
						+ "Додавати треба калькуляцію!\n"
						+ "Будьте уважні!");
			}

			ENCottage2TKClassificationTypeFilter cottage2ClassificationTypeFilter =  new ENCottage2TKClassificationTypeFilter();
			cottage2ClassificationTypeFilter.cottageRef.code = object.cottageRef.code;

			int c2tArr[] = objectDAO.getFilteredCodeArray(cottage2ClassificationTypeFilter, 0, -1);
			if (c2tArr.length > 0) {
				throw new SystemException("\n\n"
						+ "Калькуляція повинна використовуватися тільки одна! \n"
						+ "Видаліть і додайте нову.");
			}


		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

		    return objectDAO.add(object);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENCottage2TKClassificationType%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENCottage2TKClassificationType