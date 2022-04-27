
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENAct2Prov;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAct2ProvDAO;
import com.ksoe.energynet.ejb.generated.ENAct2ProvControllerEJBGen;
import com.ksoe.energynet.valueobject.ENAct2Prov;
import com.ksoe.energynet.valueobject.filter.ENAct2ProvFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2ProvShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENAct2ProvControllerEJB extends
		ENAct2ProvControllerEJBGen {

	public ENAct2ProvControllerEJB() {
	}
	
	
	/* ENAct2Prov. Изменить шаблон проводки */
	public void savePostingInfo(ENAct2Prov object) {
		try {
			ENAct2ProvDAO objectDAO = new ENAct2ProvDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();
	        
	        ENAct2ProvFilter a2pFil = new ENAct2ProvFilter();
	        a2pFil.actRef.code = object.actRef.code;
	        ENAct2ProvShortList a2pList = objectDAO.getScrollableFilteredList(a2pFil, 0, -1);
	        
	        ENAct2Prov a2pObj = new ENAct2Prov();
	        
	        
	        if(a2pList.totalCount > 0 ){
	        	
	        	a2pObj = objectDAO.getObject(a2pList.get(0).code);
	        	a2pObj.actPostingKindRef.code = object.actPostingKindRef.code;
	        	a2pObj.isIncomeAct = object.isIncomeAct;
	        	objectDAO.save(a2pObj);
	        	return;
	        }
	        else 
	        {
	        	a2pObj.code = Integer.MIN_VALUE; 
	        	a2pObj.actRef.code = object.actRef.code;
	        	a2pObj.actPostingKindRef.code = object.actPostingKindRef.code;
	        	a2pObj.isIncomeAct = object.isIncomeAct; 
	        	a2pObj.partId = -1;
	        	objectDAO.add(a2pObj);
	        }
	        
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENAct2Prov%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENAct2Prov