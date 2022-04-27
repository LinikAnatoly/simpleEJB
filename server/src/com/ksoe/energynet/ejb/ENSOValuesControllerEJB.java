
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENSOValuesDAO;
import com.ksoe.energynet.dataminer.ENSOValuesTypeDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;

/**
 * EJB Controller for ENSOValues;
 *
 */

import com.ksoe.energynet.ejb.generated.ENSOValuesControllerEJBGen;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.valueobject.ENConnectionKind;
import com.ksoe.energynet.valueobject.ENSOValues;
import com.ksoe.energynet.valueobject.ENSOValuesType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENSOValuesControllerEJB extends
		ENSOValuesControllerEJBGen {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ENSOValuesControllerEJB() {
	}
	

	
	public int add(ENSOValues object) {
		try {
			ENSOValuesDAO objectDAO = new ENSOValuesDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			this.checkTypeProhibitedForEditing(object);
			
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

		    object.code = objectDAO.add(object);
		    this.calculateENSOValuesTermsIfNeeded(object);
		    return object.code;
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENSOValues%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENSOValues. Удалить */
	public void remove(int code) {
		try {
			ENSOValuesDAO objectDAO = new ENSOValuesDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENSOValues object = objectDAO.getObject(code);
			this.checkTypeProhibitedForEditing(object);
			objectDAO.remove(code);
			this.calculateENSOValuesTermsIfNeeded(object);
			this.clearNextSheetDate(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENSOValues%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

   	/* ENSOValues. Изменить */
	public void save(ENSOValues object) {
		try {
			ENSOValuesDAO objectDAO = new ENSOValuesDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();
	        
	        ENSOValues oldObject = objectDAO.getObject(object.code);
	        this.checkTypeProhibitedForEditing(object);
	        this.checkTypeProhibitedForEditing(oldObject);

		    objectDAO.save(object);
		    this.calculateENSOValuesTermsIfNeeded(oldObject);
		    if(object.soValuesType.code != oldObject.soValuesType.code) {
		    	this.calculateENSOValuesTermsIfNeeded(object);
		    }
		    
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENSOValues%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	private void calculateENSOValuesTermsIfNeeded(ENSOValues object) throws DatasourceConnectException, PersistenceException {
		// Если редактируется дата подачи заявления, то запускается перерасчет сроков по присоединению
		if(object.soValuesType.code == ENSOValuesType.CONTRACT_REGISTRATION_DATE) {
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getUserProfile());
			ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getUserProfile());
			ENServicesObject so = servicesObjectDao.getObject(object.servicesobject.code);
			servicesLogic.calculateENSOValuesTermsIfNeeded(so);	
		}
	}
	
	private void checkTypeProhibitedForEditing(ENSOValues values) throws DatasourceConnectException, PersistenceException {
		if(values == null) {
			throw new java.lang.NullPointerException("Не заданий об'єкт додаткового реквізиту!");
		}
		if(values.soValuesType.code == Integer.MIN_VALUE) {
			throw new java.lang.NullPointerException(String.format("Некорректний тип додаткового реквізиту - %d", values.soValuesType.code));
		}
		
		ENServicesObjectDAO servicesObjectDao = new ENServicesObjectDAO(getUserProfile(),
				getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		ENTechConditionsServicesDAO techCondDao = new ENTechConditionsServicesDAO(getUserProfile()
				, getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		ENServicesObject servicesObject = servicesObjectDao.getObject(values.servicesobject.code);
		ENTechConditionsServices techCond = techCondDao.getObjectByENEServicesObject(servicesObject);
		
		if(techCond.connectionKindRef.code == ENConnectionKind.STANDART 
				&& ENSOValuesType.TERMS_FOR_STANDARD_CONNECTION.contains(values.soValuesType.code)) {
			ENSOValuesTypeDAO typeDao = new ENSOValuesTypeDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENSOValuesType type = typeDao.getObject(values.soValuesType.code);
			throw new SystemException(String.format("Додаткові реквізити типу \"%s\" розраховуються автоматично програмою і їх не можна\n"
					+ " редагувати вручну!", type.name));
			
		}
	}

	private void clearNextSheetDate(ENSOValues values) throws DatasourceConnectException {
		if (values == null) {
			throw new java.lang.NullPointerException("Не заданий об'єкт додаткового реквізиту!");
		}

		if (values.soValuesType.code == Integer.MIN_VALUE) {
			throw new java.lang.NullPointerException(String.format("Некорректний тип додаткового реквізиту - %d", values.soValuesType.code));
		}

		// Если удаляется доп. реквизит "Номер стадії відведення земельної ділянки",
		// то у последнего письма по земле очищается поле "Дата следующего письма"
		if (values.soValuesType.code == ENSOValuesType.LAND_SHEET_STAGE_NUMBER) {
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getUserProfile());
			servicesLogic.clearNextSheetDate(values.servicesobject.code);
		}
	}

	public ENSOValues getENSOValueForServicesObject(int servicesObjectCode, int soValuesTypeCode) {
		try {
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
			return servicesLogic.getENSOValueForServicesObject(servicesObjectCode, soValuesTypeCode);
		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't getENSOValueForServicesObject", e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENSOValues