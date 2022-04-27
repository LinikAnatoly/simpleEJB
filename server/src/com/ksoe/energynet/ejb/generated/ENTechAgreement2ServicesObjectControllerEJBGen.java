
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb.generated;

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENTechAgreement2ServicesObjectDAO;
import com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject;
import com.ksoe.energynet.valueobject.lists.ENTechAgreement2ServicesObjectShortList;
import com.ksoe.energynet.valueobject.brief.ENTechAgreement2ServicesObjectShort;
import com.ksoe.energynet.valueobject.filter.ENTechAgreement2ServicesObjectFilter;
import com.ksoe.lla.persistence.GenericSessionStatelessBean;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

/**
 * EJB controller for ENTechAgreement2ServicesObject;
 *
 */


public abstract class ENTechAgreement2ServicesObjectControllerEJBGen extends
		GenericSessionStatelessBean {
	public ENTechAgreement2ServicesObjectControllerEJBGen() {
	}

	/* ENTechAgreement2ServicesObject. �������� */
	public int add(ENTechAgreement2ServicesObject object) {
		try {
			ENTechAgreement2ServicesObjectDAO objectDAO = new ENTechAgreement2ServicesObjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENTechAgreement2ServicesObject. ������� */
	public void remove(int code) {
		try {
			ENTechAgreement2ServicesObjectDAO objectDAO = new ENTechAgreement2ServicesObjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

   	/* ENTechAgreement2ServicesObject. �������� */
	public void save(ENTechAgreement2ServicesObject object) {
		try {
			ENTechAgreement2ServicesObjectDAO objectDAO = new ENTechAgreement2ServicesObjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENTechAgreement2ServicesObject. �������� ������ */
	public ENTechAgreement2ServicesObject getObject(int code) {
		try {
			ENTechAgreement2ServicesObjectDAO objectDAO = new ENTechAgreement2ServicesObjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.getObject(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get {%com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENTechAgreement2ServicesObject. �������� ������ ������ */
	public ENTechAgreement2ServicesObjectShortList getList() {
		return getScrollableFilteredList(null, 0, -1);
	}

	/* ENTechAgreement2ServicesObject. �������� ������ �� ������� */
	public ENTechAgreement2ServicesObjectShortList getFilteredList(
			ENTechAgreement2ServicesObjectFilter filterObject) {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	/* ENTechAgreement2ServicesObject. �������� ������ ��� ��������� */
	public ENTechAgreement2ServicesObjectShortList getScrollableList(int fromPosition,
			int quantity) {
		return getScrollableFilteredList(null, fromPosition, quantity);
	}

	/* ENTechAgreement2ServicesObject. �������� ������ ��� ��������� �� ������� */
	public ENTechAgreement2ServicesObjectShortList getScrollableFilteredList(
			ENTechAgreement2ServicesObjectFilter filterObject, int fromPosition,
			int quantity) {
		try {
			ENTechAgreement2ServicesObjectDAO objectDAO = new ENTechAgreement2ServicesObjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.getScrollableFilteredList(filterObject,
					fromPosition, quantity, null);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get list of {%com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject%} objects.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENTechAgreement2ServicesObject. �������� ������ ��� ��������� �� ������� */
	public ENTechAgreement2ServicesObjectShortList getScrollableListByCondition(
			String aCondition, int fromPosition, int quantity) {
		ENTechAgreement2ServicesObjectFilter filterObject = new ENTechAgreement2ServicesObjectFilter();
		filterObject.conditionSQL = aCondition;
		return getScrollableFilteredList(filterObject, fromPosition, quantity);
	}

	/* ENTechAgreement2ServicesObject. �������� ������ ��-����� �� ������� */
	public int[] getScrollableFilteredCodeArray(
			ENTechAgreement2ServicesObjectFilter filterObject, int fromPosition,
			int quantity) {
		try {
			ENTechAgreement2ServicesObjectDAO objectDAO = new ENTechAgreement2ServicesObjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.getFilteredCodeArray(filterObject, fromPosition,
					quantity);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get code array of {%com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject%} objects.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENTechAgreement2ServicesObject. �������� ������ �� ������ */
	public ENTechAgreement2ServicesObjectShort getShortObject(int code) {
		try {
			ENTechAgreement2ServicesObjectDAO objectDAO = new ENTechAgreement2ServicesObjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.getShortObject(code);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get {%com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject%} ShortObject.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

}