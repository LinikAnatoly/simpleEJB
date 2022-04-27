
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for FKTrans2AXTransItem;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.FKTrans2AXTransDAO;
import com.ksoe.energynet.dataminer.FKTrans2AXTransItemDAO;
import com.ksoe.energynet.ejb.generated.FKTrans2AXTransItemControllerEJBGen;
import com.ksoe.energynet.logic.FKTrans2AXTransLogic;
import com.ksoe.energynet.valueobject.FKTrans2AXTrans;
import com.ksoe.energynet.valueobject.filter.FKTrans2AXTransItemFilter;
import com.ksoe.energynet.valueobject.lists.FKTrans2AXTransItemShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class FKTrans2AXTransItemControllerEJB extends
		FKTrans2AXTransItemControllerEJBGen {

	public FKTrans2AXTransItemControllerEJB() {
	}
	
	
	/* FKTrans2AXTransItem. Получить список для просмотра по фильтру */
	public FKTrans2AXTransItemShortList getScrollableFilteredListGroup(	FKTrans2AXTransItemFilter filterObject, int fromPosition,	int quantity) {
		try {
			FKTrans2AXTransItemDAO objectDAO = new FKTrans2AXTransItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.getScrollableFilteredListGroup(filterObject,filterObject.conditionSQL ,filterObject.orderBySQL , fromPosition, quantity, null);
		
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get list of {%com.ksoe.energynet.valueobject.FKTrans2AXTransItem%} objects.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
	/* FKTrans2AXTransItem. Формирование аналитик для проводок АХ (по дню)  */
	public void makeDimensionAX( int transCode , String transDate ) {
		try {
			
			FKTrans2AXTransLogic fktrans2axtranLogik = new FKTrans2AXTransLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			
			fktrans2axtranLogik.makeDimensionAX( transCode , transDate  );
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.FKTrans2AXTrans%} object.",
					e);
		} finally {
			closeConnection();
		} 
	}
	
	
	/* FKTrans2AXTransItem. провести пачку проводок в АХ (по дню)  */
	public void moveTrans2AX( int transCode , String transDate ) {
		try {
			
			FKTrans2AXTransLogic fktrans2axtranLogik = new FKTrans2AXTransLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			
			fktrans2axtranLogik.startCreatingPack( transCode , transDate  );
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.FKTrans2AXTransItem%} object.",
					e);
		} finally {
			closeConnection();
		} 
	}
	
	
	/* FKTrans2AXTransItem. Передать пачку проводок в АХ (по дню)  */
	public void exportTrans2AX( int transCode , String transDate ) {
		try {
			
			FKTrans2AXTransLogic fktrans2axtranLogik = new FKTrans2AXTransLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			
			fktrans2axtranLogik.exportTrans2AX( transCode , transDate  );
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't exportTrans2AX ",
					e);
		} finally {
			closeConnection();
		} 
	}
	
	
	/* Генерация проводок в АХ (по дню/дням) пачкой(день)  */
	public void startCreatingPack( int transCode , String transDate ) {
		try {
			
			FKTrans2AXTransLogic fktrans2axtranLogik = new FKTrans2AXTransLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			
			fktrans2axtranLogik.startCreatingPack( transCode , transDate  );
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't startCreatingPack ",
					e);
		} finally {
			closeConnection();
		} 
	}
	
	
	

} // end of EJB Controller for FKTrans2AXTransItem