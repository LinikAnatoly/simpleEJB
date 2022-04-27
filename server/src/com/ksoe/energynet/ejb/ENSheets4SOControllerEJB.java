
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENSheets4SO;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.ejb.generated.ENSheets4SOControllerEJBGen;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.valueobject.ENSheets4SO;
import com.ksoe.energynet.valueobject.ENSheets4SOItems;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENSheets4SOControllerEJB extends
		ENSheets4SOControllerEJBGen {

	public ENSheets4SOControllerEJB() {
	}

	/* ENSheets4SO. Добавить */
		public void regenerateENSheets4SO(int sheet4SOCode) {
		try {
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			servicesLogic.regenerateENSheets4SO(sheet4SOCode);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't regenerateENSheets4SO {%com.ksoe.energynet.valueobject.ENSheets4SO%} object.",
					e);
		} finally {
			closeConnection();
		}
	}

	/* ENSheets4SO. Добавить */
	public int add(ENSheets4SO object) {
		try {
	        ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	        return servicesLogic.addENSheets4SO(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENSheets4SO%} object.",
					e);
		} finally {
			closeConnection();
		}
	}

	/* ENSheets4SO. Добавить */
	public int add(ENSheets4SO object, ENSheets4SOItems[] items) {
		try {
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			return servicesLogic.addENSheets4SO(object, items);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENSheets4SO%} object.",
					e);
		} finally {
			closeConnection();
		}
	}

	/* ENSheets4SO. Удалить */
	public void remove(int code) {
		try {
	        ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	        servicesLogic.removeENSheets4SO(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENSheets4SO%} object.",
					e);
		} finally {
			closeConnection();
		}
	}

   	/* ENSheets4SO. Изменить */
	public void save(ENSheets4SO object) {
		try {
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			servicesLogic.saveENSheets4SO(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENSheets4SO%} object.",
					e);
		} finally {
			closeConnection();
		}
	}

	public int generateNextLandSheets() {
		try {
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			return servicesLogic.generateNextLandSheets();
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't generateNextLandSheets",
					e);
		} finally {
			closeConnection();
		}
	}

	public int generateNextLandSheets(Date generationDate) {
		try {
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			return servicesLogic.generateNextLandSheetsForDate(generationDate);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't generateNextLandSheets",
					e);
		} finally {
			closeConnection();
		}
	}

	public int generateNextLandSheetsForToday() {
		try {
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			return servicesLogic.generateNextLandSheetsForToday();
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't generateNextLandSheets",
					e);
		} finally {
			closeConnection();
		}
	}

	public String getSheetPostCode(int servicesobjectCode) {
		return getSheetPostCode(servicesobjectCode, null);
	}

	public String getSheetPostCode(int servicesobjectCode, String previousSheetPostCode) {
		ServicesLogic logic;
		try {
			logic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			return logic.getSheetPostCode(servicesobjectCode, previousSheetPostCode);
		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't getSheetPostCode", e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENSheets4SO