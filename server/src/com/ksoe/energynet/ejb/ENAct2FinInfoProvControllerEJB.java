
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENAct2FinInfoProv;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAct2FinInfoProvDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.ejb.generated.ENAct2FinInfoProvControllerEJBGen;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2FinInfoProv;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.filter.ENActFilter;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENAct2FinInfoProvControllerEJB extends
		ENAct2FinInfoProvControllerEJBGen {

	public ENAct2FinInfoProvControllerEJB() {
	}


/* ENAct2FinInfoProv. Добавить */
@Override
public int add(ENAct2FinInfoProv object) {
	try {
		ENAct2FinInfoProvDAO objectDAO = new ENAct2FinInfoProvDAO(
				getUserProfile(),
				getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

		ENActDAO actDAO = new ENActDAO(
				getUserProfile(),
				getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

		ENActFilter actFil = new ENActFilter();
		actFil.code=object.actRef.code;
		int[] actArr = actDAO.getFilteredCodeArray(actFil, 0, -1);
		ENAct actObj = actDAO.getObject(actArr[0]);
		if(actObj.statusRef.code != ENActStatus.GOOD && actObj.statusRef.code != ENActStatus.SIGNATURE ){
			throw new SystemException(
					"Акт вже проведний!!!"); }

		int objectCode = Integer.MIN_VALUE;
		if (object.kau_card_object_id != Integer.MIN_VALUE || object.kau_element_expenses_id != Integer.MIN_VALUE ){
			return objectDAO.add(object);
		}
	    return objectCode;
	} catch (DatasourceConnectException e) {
		throw new SystemException(
				"Can't add {%com.ksoe.energynet.valueobject.ENAct2FinInfoProv%} object.",
				e);
	} catch (PersistenceException e) {
		throw new SystemException(e.getMessage(), e);
	} finally {
		closeConnection();
	}
}


	/* ENAct2FinInfoProv. Изменить */
@Override
public void save(ENAct2FinInfoProv object) {
	try {
		ENAct2FinInfoProvDAO objectDAO = new ENAct2FinInfoProvDAO(
				getUserProfile(),
				getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

		ENActDAO actDAO = new ENActDAO(
				getUserProfile(),
				getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

		ENActFilter actFil = new ENActFilter();
		actFil.code=object.actRef.code;
		int[] actArr = actDAO.getFilteredCodeArray(actFil, 0, -1);
		ENAct actObj = actDAO.getObject(actArr[0]);
		if(actObj.statusRef.code != ENActStatus.GOOD && actObj.statusRef.code != ENActStatus.SIGNATURE ){
			throw new SystemException(
					"Акт вже проведний!!!");
		}

		/** SUPP-97297... если сравнивать, то надо проверять на null */
		// ENAct2FinInfoProv objectOld = objectDAO.getObject(object.code);
		// if (!objectOld.kau_card_object_kod.equals(object.kau_card_object_kod)
		//		|| !objectOld.kau_element_expenses_kod.equals(object.kau_element_expenses_kod) ){

			objectDAO.save(object);
		//}


	} catch (DatasourceConnectException e) {
		throw new SystemException(
				"Can't save {%com.ksoe.energynet.valueobject.ENAct2FinInfoProv%} object.",
				e);
	} catch (PersistenceException e) {
		throw new SystemException(e.getMessage(), e);
	} finally {
		closeConnection();
	}
}

} // end of EJB Controller for ENAct2FinInfoProv