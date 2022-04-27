
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENFamilySize2ServicesObject;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENCottageDAO;
import com.ksoe.energynet.dataminer.ENFamilySize2ServicesObjectDAO;
import com.ksoe.energynet.ejb.generated.ENFamilySize2ServicesObjectControllerEJBGen;
import com.ksoe.energynet.valueobject.ENCottage;
import com.ksoe.energynet.valueobject.ENFamilySize2ServicesObject;
import com.ksoe.energynet.valueobject.filter.ENCottageFilter;
import com.ksoe.energynet.valueobject.filter.ENFamilySize2ServicesObjectFilter;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENFamilySize2ServicesObjectControllerEJB extends
		ENFamilySize2ServicesObjectControllerEJBGen {

	public ENFamilySize2ServicesObjectControllerEJB() {
	}


	/* ENFamilySize2ServicesObject. Добавить */
	@Override
	public int add(ENFamilySize2ServicesObject object) {
		try {
			ENFamilySize2ServicesObjectDAO objectDAO = new ENFamilySize2ServicesObjectDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENCottageDAO cottageDao = new ENCottageDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


			/** кол-во желающих не должно превышать размер домика  */
			ENFamilySize2ServicesObjectFilter fmsFilter =  new ENFamilySize2ServicesObjectFilter();
			fmsFilter.servicesObjectRef.code = object.servicesObjectRef.code;

			int fmsArr[] = objectDAO.getFilteredCodeArray(fmsFilter, 0, -1);


			ENCottageFilter cottageFilter = new ENCottageFilter();
			cottageFilter.conditionSQL = " encottage.code = (select r2s.cottagerefcode "
					+ " from enrentperiod2services r2s where r2s.servicesobjectrefcode = " + object.servicesObjectRef.code + ")";

			int cArr[] = cottageDao.getFilteredCodeArray(cottageFilter, 0, -1);
			if (cArr.length > 0) {
				ENCottage cottage = cottageDao.getObject(cArr[0]);

				if (cottage.numberBeds < (fmsArr.length + 2)) {
					throw new SystemException("\n\n"
							+ "Кількість проживаючих не повинна перевищувати кількість спальних місць в будиночку!!!");
				}
			}


			object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

		    return objectDAO.add(object);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENFamilySize2ServicesObject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


} // end of EJB Controller for ENFamilySize2ServicesObject