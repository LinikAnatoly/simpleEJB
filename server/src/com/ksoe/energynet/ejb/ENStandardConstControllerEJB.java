//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENStandardConst;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENStandardConstDAO;
import com.ksoe.energynet.dataminer.ENStandardConstEntryDAO;
import com.ksoe.energynet.ejb.generated.ENStandardConstControllerEJBGen;
import com.ksoe.energynet.valueobject.ENStandardConst;
import com.ksoe.energynet.valueobject.filter.ENStandardConstEntryFilter;
import com.ksoe.energynet.valueobject.filter.ENStandardConstFilter;
import com.ksoe.energynet.valueobject.lists.ENStandardConstShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENStandardConstControllerEJB extends
		ENStandardConstControllerEJBGen {

	public ENStandardConstControllerEJB() {
	}

	/* ENStandardConst. Добавить */
	public int add(ENStandardConst object) {
		try {
			ENStandardConstDAO objectDAO = new ENStandardConstDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			String existsName = "";
			String unitName = object.name.trim().toUpperCase();

			ENStandardConstFilter constFilter = new ENStandardConstFilter();
			ENStandardConstShortList constList = objectDAO.getScrollableFilteredList(constFilter, 0, -1);

			if (constList.totalCount > 0) {
				for (int t = 0; t < constList.totalCount; t++) {
					ENStandardConst consts = objectDAO.getObject(constList.get(t).code);
					existsName = consts.name.trim().toUpperCase();

					if (unitName.equals(existsName)) {
						throw new EnergyproSystemException(
								"\n \n Така величина вже присутня в базі!" +
								"\n  Будьте уважні!");
					}
				}
			}

			object.name = object.name.trim();
			return objectDAO.add(object);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENStandardConst%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENStandardConst. Изменить */
	public void save(ENStandardConst object) {
		try {
			ENStandardConstDAO objectDAO = new ENStandardConstDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


			String existsName = "";
			String unitName = object.name.trim().toUpperCase();

			ENStandardConstFilter constFilter = new ENStandardConstFilter();
			ENStandardConstShortList constList = objectDAO.getScrollableFilteredList(constFilter, 0, -1);

			if (constList.totalCount > 0) {
				for (int t = 0; t < constList.totalCount; t++) {
					ENStandardConst consts = objectDAO.getObject(constList.get(t).code);
					existsName = consts.name.trim().toUpperCase();

					if (unitName.equals(existsName)) {
						throw new EnergyproSystemException(
								"\n \n Така величина вже присутня в базі!" +
								"\n  Будьте уважні!");
					}
				}
			}

			object.name = object.name.trim();
			objectDAO.save(object);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENStandardConst%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENStandardConst. Удалить */
	public void remove(int code) {
		try {
			ENStandardConstDAO objectDAO = new ENStandardConstDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENStandardConstEntryDAO entryDAO = new ENStandardConstEntryDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENStandardConstEntryFilter entryFilter = new ENStandardConstEntryFilter();
            entryFilter.constRef.code = code;
            int entryArr[] = entryDAO.getFilteredCodeArray(entryFilter, 0, -1);
            if (entryArr.length > 0) {
            	throw new EnergyproSystemException(
    					"\n \n Для цієї величини існують записи коефіцієнтів!!!" +
    					"\n Видалення неможливо!!!");
            }

			objectDAO.remove(code);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENStandardConst%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENStandardConst