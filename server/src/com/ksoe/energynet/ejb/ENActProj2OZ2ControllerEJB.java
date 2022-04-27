
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENActProj2OZ2;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENActProj2OZ2DAO;
import com.ksoe.energynet.ejb.generated.ENActProj2OZ2ControllerEJBGen;
import com.ksoe.energynet.logic.ReconstrModernizacLogic;
import com.ksoe.energynet.valueobject.ENActProj2OZ2;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENActProj2OZ2ControllerEJB extends
		ENActProj2OZ2ControllerEJBGen {

	public ENActProj2OZ2ControllerEJB() {
	}

	/* ENActProj2OZ2. Добавить */
	public int add(ENActProj2OZ2 object) {
		try {
			ENActProj2OZ2DAO objectDAO = new ENActProj2OZ2DAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ReconstrModernizacLogic logic = new ReconstrModernizacLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();        
	        int objectCode = objectDAO.add(object);
	        
	     // пересчитаем общую сумму по всем актам относящихся к документу ОЗ2.(включая акты по проектированию )
	  	  logic.recalcSumInOZ2(object.ENReconstrModernOZRef.code);
	        
		    return objectCode;
		    
		    
		    
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENActProj2OZ2%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
	/* ENActProj2OZ2. Удалить */
	public void remove(int code) {
		try {
			ENActProj2OZ2DAO objectDAO = new ENActProj2OZ2DAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ReconstrModernizacLogic logic = new ReconstrModernizacLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			// определим код документа реконструкции можернизации 
			ENActProj2OZ2 ap2ozObject = objectDAO.getObject(code);
			int ozCode  = ap2ozObject.ENReconstrModernOZRef.code;
			
			objectDAO.remove(code);
			// пересчитаем общую сумму по всем актам относящихся к документу ОЗ2.(включая акты по проектированию )
		  	logic.recalcSumInOZ2(ozCode);
			
			
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENActProj2OZ2%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
} // end of EJB Controller for ENActProj2OZ2