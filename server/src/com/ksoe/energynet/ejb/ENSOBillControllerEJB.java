
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENSOBill;
 *
 */

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENSOBillDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.ejb.generated.ENSOBillControllerEJBGen;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.valueobject.ENSOBill;
import com.ksoe.energynet.valueobject.ENSOValues;
import com.ksoe.energynet.valueobject.ENSOValuesType;
import com.ksoe.energynet.valueobject.ENServicesContractType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.filter.ENActFilter;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENSOBillControllerEJB extends ENSOBillControllerEJBGen {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ENSOBillControllerEJB() {
	}
	
	public int add(ENSOBill object) {
		Connection conn = null;
		try {
			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			
			ENSOBillDAO objectDAO = new ENSOBillDAO(getUserProfile(), conn);
			
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

		    object.code = objectDAO.add(object);
		    this.calculateENSOValuesTermsIfNeeded(object);
		    return object.code;
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENSOBill%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if(conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {}
		}
	}
	
	public void remove(int code) {
		try {
			ENSOBillDAO objectDAO = new ENSOBillDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENSOBill object = objectDAO.getObject(code);

			objectDAO.remove(code);
			this.calculateENSOValuesTermsIfNeeded(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENSOBill%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

   	/* ENSOBill. Изменить */
	public void save(ENSOBill object) {
		try {
			ENSOBillDAO objectDAO = new ENSOBillDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

		    objectDAO.save(object);
		    this.calculateENSOValuesTermsIfNeeded(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENSOBill%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public BigDecimal getSumByActs(ENSOBill obj) {

		BigDecimal retVal = new BigDecimal(0.0);

		try {
			ENActDAO actDAO = new ENActDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ActLogic actLogic = new ActLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getUserProfile());

			String dateAct = new SimpleDateFormat("dd.MM.yyyy").format(obj.dateGen);

			ENActFilter actFilter = new ENActFilter();
			actFilter.conditionSQL = " enact.code in (select ac2p.actrefcode from enact2enplanwork ac2p, enservices2plan s2p "
					+ " where ac2p.plancode = s2p.planrefcode and s2p.servicesobjectrefcode = "
					+ obj.servicesObjectRef.code + ")" + " and enact.dateact between first_day('" + dateAct
					+ "') and last_day('" + dateAct + "')";

			int[] actArr = actDAO.getFilteredCodeArray(actFilter, 0, -1);
			for (int i = 0; i < actArr.length; i++) {
				BigDecimal actSum = actLogic.getSumByActCode(actArr[i]);
				retVal = retVal.add(actSum);
			}

			if (retVal != new BigDecimal(0)) {
				retVal = retVal.multiply(new BigDecimal(1.2)).setScale(2, RoundingMode.HALF_UP);
			}

			return retVal;

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't add {%com.ksoe.energynet.valueobject.ENSORItems2Post04%} object.", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}

	}
	
	private void calculateENSOValuesTermsIfNeeded(ENSOBill object) throws DatasourceConnectException, PersistenceException {
		// Если редактируется дата подачи заявления, то запускается перерасчет сроков по присоединению
		ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
				getUserProfile());
		ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
				getUserProfile());
		ENServicesObject so = servicesObjectDao.getObject(object.servicesObjectRef.code);
		servicesLogic.calculateENSOValuesTermsIfNeeded(so);
	}

} // end of EJB Controller for ENSOBill