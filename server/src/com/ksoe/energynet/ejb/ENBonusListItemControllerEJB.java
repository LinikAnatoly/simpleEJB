
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENBonusListItem;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENBonusListDAO;
import com.ksoe.energynet.dataminer.ENBonusListItemDAO;
import com.ksoe.energynet.ejb.generated.ENBonusListItemControllerEJBGen;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.valueobject.ENBonusList;
import com.ksoe.energynet.valueobject.ENBonusListItem;
import com.ksoe.energynet.valueobject.ENBonusListItemStatus;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENBonusListItemControllerEJB extends
		ENBonusListItemControllerEJBGen {

	public ENBonusListItemControllerEJB() {
	}
	
	/* ENBonusListItem. Удалить */
	public void remove(int code) {
		try {
			ENBonusListItemDAO objectDAO = new ENBonusListItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENBonusListDAO bonDAO = new ENBonusListDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)); 
			
			ENBonusListItem bonItemObj = objectDAO.getObject(code);
			ENBonusList bonObj = bonDAO.getObject(bonItemObj.bonusList.code);
			
			if(bonObj.status.code == ENConsts.ENBONUSLIST_STATUS_APPROVED){
				throw new SystemException(" Відомість вже затверджена");
			} 
			 
			
			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENBonusListItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	/* ENBonusListItem. Изменить */
	public void save(ENBonusListItem object) {
		try {
			ENBonusListItemDAO objectDAO = new ENBonusListItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();
	        
	        ENBonusListDAO bonDAO = new ENBonusListDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)); 
			
			ENBonusList bonObj = bonDAO.getObject(object.bonusList.code);
			
			if(bonObj.status.code == ENConsts.ENBONUSLIST_STATUS_APPROVED){
				throw new SystemException(" Відомість вже затверджена");
			} 

		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENBonusListItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	/* ENBonusListItem. Добавить */
	public int add(ENBonusListItem object) {
		try {
			ENBonusListItemDAO objectDAO = new ENBonusListItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();
	        object.userAdd = getUserProfile().userName;
	        object.dateAdd = new Date(); 
	        
	        ENBonusListDAO bonDAO = new ENBonusListDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)); 
			
			ENBonusList bonObj = bonDAO.getObject(object.bonusList.code);
			
			if(bonObj.status.code == ENConsts.ENBONUSLIST_STATUS_APPROVED){
				throw new SystemException(" Відомість вже затверджена");
			} 

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENBonusListItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	/* ENBonusListItem.Ставит признак того что строка ведомости не действительна */
	public void SetBonusItemInvalid(ENBonusListItem object) {
		try {
			ENBonusListItemDAO objectDAO = new ENBonusListItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userSetInvalid = getUserProfile().userName;
	        object.dateSetInvalid = new Date();
	        object.status.code = ENBonusListItemStatus.INVALID;
	        
	        ENBonusListDAO bonDAO = new ENBonusListDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)); 
			
			ENBonusList bonObj = bonDAO.getObject(object.bonusList.code);
			
			if(bonObj.status.code == ENConsts.ENBONUSLIST_STATUS_APPROVED){
				throw new SystemException(" Відомість вже затверджена");
			} 

		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't SetBonusItemInvalid {%com.ksoe.energynet.valueobject.ENBonusListItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	/* ENBonusListItem.Убирает  признак того что строка ведомости не действительна */
	public void UnSetBonusItemInvalid(ENBonusListItem object) {
		try {
			ENBonusListItemDAO objectDAO = new ENBonusListItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userSetInvalid = "";
	        object.dateSetInvalid = null;
	        object.reasonInvalid = "";
	        object.status.code = ENBonusListItemStatus.VALID;
	        
	        ENBonusListDAO bonDAO = new ENBonusListDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)); 
			
			ENBonusList bonObj = bonDAO.getObject(object.bonusList.code);
			
			if(bonObj.status.code == ENConsts.ENBONUSLIST_STATUS_APPROVED){
				throw new SystemException(" Відомість вже затверджена");
			} 

		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't UnSetBonusItemInvalid {%com.ksoe.energynet.valueobject.ENBonusListItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENBonusListItem