//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENDestinationPoint;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDestinationPointDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.ejb.generated.ENDestinationPointControllerEJBGen;
import com.ksoe.energynet.logic.DepartmentLogic;
import com.ksoe.energynet.valueobject.ENDestinationPoint;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENDestinationPointControllerEJB extends
		ENDestinationPointControllerEJBGen {

	public ENDestinationPointControllerEJB() {
	}

	/* ENDestinationPoint. Добавить */
	public int add(ENDestinationPoint object) {
		try {

			DepartmentLogic dLogic = new DepartmentLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			object.dateEdit = new Date();
			object.userGen = getUserProfile().userName;

			ENElement e = new ENElement();
			e.typeRef.code = ENElementType.DESTINATIONPOINT;

			ENElementDAO elementDAO = new ENElementDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			 e.renRef.code = dLogic.getEPRen2Department(object.departmentRef.code);

			if (e.renRef.code == Integer.MIN_VALUE) {
				e.renRef.code = 0;
			}

			object.elementRef.code = elementDAO.add(e);

			ENDestinationPointDAO objectDAO = new ENDestinationPointDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENDestinationPoint%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENDestinationPoint. Изменить */
	public void save(ENDestinationPoint object) {
		try {

			object.userGen = getUserProfile().userName;
			object.dateEdit = new Date();
			
			DepartmentLogic dLogic = new DepartmentLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENElementDAO elDAO = new ENElementDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENDestinationPointDAO objectDAO = new ENDestinationPointDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENDestinationPoint oldObject = objectDAO.getObject(object.code);
			
			if(oldObject.departmentRef.code != object.departmentRef.code)
			{
				ENElement elObject = elDAO.getObject(object.elementRef.code);
				elObject.renRef.code = dLogic.getEPRen2Department(object.departmentRef.code);
				elDAO.save(elObject);
			}
			
			objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENDestinationPoint%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENDestinationPoint. Удалить */
	public void remove(int code) {
		try {

			ENDestinationPointDAO objectDAO = new ENDestinationPointDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENDestinationPoint object = objectDAO.getObject(code);

			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
			planFilter.elementRef.code = object.elementRef.code;
			int[] plArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);
			if (plArr.length > 0) {
				throw new EnergyproSystemException(
						"Видаляти не можна!!! Для цього об’єкту існують плани!!! ");
			}

			objectDAO.remove(code);

			ENElementDAO elDAO = new ENElementDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			elDAO.remove(object.elementRef.code);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENDestinationPoint%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENDestinationPoint