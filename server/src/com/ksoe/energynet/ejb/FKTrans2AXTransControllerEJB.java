
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for FKTrans2AXTrans;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.FKTrans2AXTransDAO;
import com.ksoe.energynet.dataminer.FKTrans2AXTransItemDAO;
import com.ksoe.energynet.ejb.generated.FKTrans2AXTransControllerEJBGen;
import com.ksoe.energynet.logic.FKTrans2AXTransLogic;
import com.ksoe.energynet.valueobject.FKTrans2AXTrans;
import com.ksoe.energynet.valueobject.filter.FKTrans2AXTransItemFilter;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class FKTrans2AXTransControllerEJB extends
		FKTrans2AXTransControllerEJBGen {

	public FKTrans2AXTransControllerEJB() {
	}
	
	
	/* FKTrans2AXTrans. Добавить */
	public void addFKTrans2EN(int FKTrans2AXTransCode ) {
		try {
			FKTrans2AXTransDAO objectDAO = new FKTrans2AXTransDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			FKTrans2AXTransLogic fktrans2axtranLogik = new FKTrans2AXTransLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			
			FKTrans2AXTrans fk2axObj = objectDAO.getObject(FKTrans2AXTransCode);
			
			fktrans2axtranLogik.addFKTrans2EN(fk2axObj.monthGen , fk2axObj.yearGen , fk2axObj.taskOwner , FKTrans2AXTransCode );
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.FKTrans2AXTrans%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	/* FKTrans2AXTrans. Удалить */
	public void remove(int code) {
		try {
			FKTrans2AXTransDAO objectDAO = new FKTrans2AXTransDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			FKTrans2AXTransItemDAO objectItemDao = new FKTrans2AXTransItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			FKTrans2AXTransItemFilter objectItemFilter = new FKTrans2AXTransItemFilter();
			objectItemFilter.FKTrans2AXTrans.code = code;
			
			int[] transItemArr = objectItemDao.getFilteredCodeArray(objectItemFilter, 0, -1);
			for (int i = 0; i < transItemArr.length; i++) {
				objectItemDao.remove(transItemArr[i]);			
			}
			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.FKTrans2AXTrans%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for FKTrans2AXTrans