
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENBonusList;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENBonusListDAO;
import com.ksoe.energynet.dataminer.ENBonusListItemDAO;
import com.ksoe.energynet.ejb.generated.ENBonusListControllerEJBGen;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.HumenLogic;
import com.ksoe.energynet.valueobject.ENBonusList;
import com.ksoe.energynet.valueobject.FINWorkerKind;
import com.ksoe.energynet.valueobject.filter.ENBonusListItemFilter;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENBonusListControllerEJB extends
		ENBonusListControllerEJBGen {

	public ENBonusListControllerEJB() {
	}
	
	
	/* ENBonusList. Добавить */
	public int add(ENBonusList object) {
		try {
			ENBonusListDAO objectDAO = new ENBonusListDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			int enBonusListCode = Integer.MIN_VALUE;
			object.userAdd = getUserProfile().userName;
	        object.dateAdd = new Date();
	        object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();
	        object.status.code = ENConsts.ENBONUSLIST_STATUS_DRAFT;
			
			

		    enBonusListCode = objectDAO.add(object);
		    /// Формирование строк ведомости  
		    HumenLogic humLogic = new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		    humLogic.generateBonusListItemByPersonalFromMDAX(object);
		    
		    ENBonusList bsObj =  objectDAO.getObject(enBonusListCode);
		    
		    if (bsObj.numberGen.trim().equalsIgnoreCase("auto")){
		    	bsObj.numberGen = bsObj.code+"" + object.monthGen+""+object.yearGen + (object.kindRef.code == FINWorkerKind.PROM ? "Т" : object.kindRef.code == FINWorkerKind.ESBYT  ? "E" : "") ;
		    	objectDAO.save(bsObj);
		    }
		    
		    return enBonusListCode;
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENBonusList%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
	/* ENBonusList. Удалить */
	public void remove(int code) {
		try {
			ENBonusListDAO objectDAO = new ENBonusListDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENBonusListItemDAO objectItemDAO = new ENBonusListItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENBonusList listObj = objectDAO.getObject(code);
			if(listObj.status.code == ENConsts.ENBONUSLIST_STATUS_APPROVED){
				throw new SystemException(" Відомість вже затверджена");
			}
			ENBonusListItemFilter listFilter = new ENBonusListItemFilter();
			listFilter.bonusList.code = code;
			
			int[] listArr = objectItemDAO.getFilteredCodeArray(listFilter, 0, -1);
			
			 for (int l = 0; l < listArr.length; l++) {
				 objectItemDAO.remove(listArr[l]);
			 }

			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENBonusList%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
	/* ENBonusList. утвердить */
	public void approve(int objectCode) {
		try {
			ENBonusListDAO objectDAO = new ENBonusListDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
          
			ENBonusList object = objectDAO.getObject(objectCode);
			
			if (object.status.code == ENConsts.ENBONUSLIST_STATUS_APPROVED ){
				throw new SystemException(" Відомість вже затверджена");
			}
			
			object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();
	        object.status.code = ENConsts.ENBONUSLIST_STATUS_APPROVED;
	        objectDAO.save(object);
	        
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't approve {%com.ksoe.energynet.valueobject.ENBonusList%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	
	/* ENBonusList. отменить утверждение ведомости  */
	public void unapprove(int objectCode) {
		try {
			ENBonusListDAO objectDAO = new ENBonusListDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
          
			ENBonusList object = objectDAO.getObject(objectCode);
			
			if (object.status.code == ENConsts.ENBONUSLIST_STATUS_DRAFT ){
				throw new SystemException(" Відомість вже чернова");
			}
	        
			object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();
	        object.status.code = ENConsts.ENBONUSLIST_STATUS_DRAFT;
	        objectDAO.save(object);
	        
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't approve {%com.ksoe.energynet.valueobject.ENBonusList%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENBonusList