
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENAct2RQFKOrder;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAct2RQFKOrderDAO;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENCountersStateVerificationDAO;
import com.ksoe.energynet.ejb.generated.ENAct2RQFKOrderControllerEJBGen;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2RQFKOrder;
import com.ksoe.energynet.valueobject.ENAct2RQFKOrderType;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.filter.ENCountersStateVerificationFilter;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrderStatus;

public class ENAct2RQFKOrderControllerEJB extends
		ENAct2RQFKOrderControllerEJBGen {

	public ENAct2RQFKOrderControllerEJB() {
	}
	
	public int add(ENAct2RQFKOrder object) {
		
        try {
			
        	ENActDAO actDAO = new ENActDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        	ENAct act = actDAO.getObjectNOSEGR(object.actRef.code);

        	ActLogic actLogic = new ActLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        	
        	// ��� ����� �� ��������� (�� � �������) ��������� ��������� �� ������� ��������� � ������ (��� ����������)
    		if (actLogic.checkActTypeForCountersStateVerification(act)) {
    		
    	    	if (act.statusRef.code != ENActStatus.SIGNATURE) {
    	    		throw new SystemException("\n\nNET-4559 ���������� ��� ������� ���� � ������ \"�� ��������\"! ��� ����: " + 
    	    				object.actRef.code);
    	    	}
    			
    	    	if (object.typeRef == null || object.typeRef.code != ENAct2RQFKOrderType.SERVICES) {
    	    		throw new SystemException("\n\nNET-4559 ����������� ��� ��'���� ����������� ���� � ����� � ������ � ������� " + 
    	    				"��� ���������� ���������!");        	    		
    	    	}
        		
            	actLogic.generateCountersStateVerification(object.actRef.code, object.fkOrderRef.code);
        	
    		}
        				
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}
	    
		return super.add(object);
		
	}
	
	public void remove(int code) {
		
        try {
        	
        	ENAct2RQFKOrderDAO act2RQFKOrderDAO = new ENAct2RQFKOrderDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        	ENAct2RQFKOrder object = act2RQFKOrderDAO.getObject(code);

        	if (object == null) {
        		throw new SystemException("\n\nNET-4559 �� �������� ����� � ����� " + code + 
        				" � ������� ��'���� ����������� ���� � ����� �� ������� � �������!");
        	}
        	
        	ENActDAO actDAO = new ENActDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
        	ENAct act = actDAO.getObjectNOSEGR(object.actRef.code);

	    	if (act.statusRef.code == ENActStatus.CLOSED) {
	    		throw new SystemException("\n\nNET-4559 ���������� ��� ��� ���������! ��� ����: " + object.actRef.code);
	    	}        	

	    	RQFKOrderDAO fkOrderDAO = new RQFKOrderDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	    	RQFKOrder fkOrder = fkOrderDAO.getObjectNOSEGR(object.fkOrderRef.code);
	    	
	    	if (fkOrder.status.code == RQFKOrderStatus.IN_FK) {
	    		throw new SystemException("\n\nNET-4559 ��� � ������ � ������� ��� ���������! ��� ����: " + object.fkOrderRef.code);
	    	}
	    	
	    	// ������� ������ �� ���������� ���������
	    	ENCountersStateVerificationDAO stateVerificationDAO = new ENCountersStateVerificationDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	    	
    		ENCountersStateVerificationFilter stateVerificationFilter = new ENCountersStateVerificationFilter();
    		stateVerificationFilter.actRef.code = object.actRef.code;
    		stateVerificationFilter.fkOrderRef.code = object.fkOrderRef.code;

    		int[] stateVerificationArr = stateVerificationDAO.getFilteredCodeArray(stateVerificationFilter, 0, -1);
    		
    		for (int i = 0; i < stateVerificationArr.length; i++) {
    			stateVerificationDAO.remove(stateVerificationArr[i]);
    		}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		}		
		
		
		super.remove(code);
		
	}	

} // end of EJB Controller for ENAct2RQFKOrder