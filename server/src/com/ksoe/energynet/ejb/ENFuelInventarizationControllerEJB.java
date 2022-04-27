
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENFuelInventarization;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENFuelInventarizationDAO;
import com.ksoe.energynet.ejb.generated.ENFuelInventarizationControllerEJBGen;
import com.ksoe.energynet.logic.FuelInventarizationLogic;
import com.ksoe.energynet.valueobject.ENFuelInventarization;
import com.ksoe.energynet.valueobject.ENFuelInventarizationStatus;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENFuelInventarizationControllerEJB extends
		ENFuelInventarizationControllerEJBGen {

	public ENFuelInventarizationControllerEJB() {
	}
	
	
	/* ENFuelInventarization. Добавить строки инвентаризации*/
	public void generateInventarizationItems(ENFuelInventarization object) {
		try {
			
			FuelInventarizationLogic fuelInventarizationLogic = new FuelInventarizationLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getUserProfile());
			
			fuelInventarizationLogic.generateInventarizationItems(object);
		    
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENFuelInventarization%} object.",
					e);
		} finally {
			closeConnection();
		}
	}
	

	/* ENFuelInventarization. Удалить строки инвентаризации*/
	public void removeInventarizationItems(int inventarizationCode) {
		try {
			
			FuelInventarizationLogic fuelInventarizationLogic = new FuelInventarizationLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getUserProfile());
			
			fuelInventarizationLogic.removeInventarizationItems(inventarizationCode);
		    
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENFuelInventarization%} object.",
					e);
		} finally {
			closeConnection();
		}
	}
	
	public void reserveItems(int inventarizationCode) {
		try {
			
			FuelInventarizationLogic fuelInventarizationLogic = new FuelInventarizationLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getUserProfile());
			
			fuelInventarizationLogic.reserveItems(inventarizationCode);
		    
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENFuelInventarization%} object.",
					e);
		} finally {
			closeConnection();
		}
	}
	
	public void removeReserveItems(int inventarizationCode) {
		try {
			
			FuelInventarizationLogic fuelInventarizationLogic = new FuelInventarizationLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getUserProfile());
			
			fuelInventarizationLogic.removeReserveItems(inventarizationCode);
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENFuelInventarization%} object.",
					e);
		} finally {
			closeConnection();
		}
	}
	
	public void closeInventarization(int inventarizationCode)  {
		try {
			
			FuelInventarizationLogic fuelInventarizationLogic = new FuelInventarizationLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getUserProfile());
			
			fuelInventarizationLogic.moveOrderForInventarizationToFK(inventarizationCode);
			
			fuelInventarizationLogic.moveActForInventarizationToFK(inventarizationCode);
			
			fuelInventarizationLogic.updateTravelSheetRemainders(inventarizationCode, true);
			
			ENFuelInventarizationDAO objectDAO = new ENFuelInventarizationDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENFuelInventarization object = objectDAO.getObject(inventarizationCode);
			object.statusRef.code = ENFuelInventarizationStatus.CLOSED;
			objectDAO.save(object);
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"closeInventarization",
					e);
		} catch (PersistenceException e) {
				throw new SystemException(
						"closeInventarization",
						e);
		} finally {
			closeConnection();
		}
	}
	
	public void cancelCloseInventarization(int inventarizationCode) {
		try {
			
			FuelInventarizationLogic fuelInventarizationLogic = new FuelInventarizationLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					getUserProfile());
			
			fuelInventarizationLogic.cancelMoveOrderForInventarizationToFK(inventarizationCode);
			
			fuelInventarizationLogic.cancelMoveActForInventarizationToFK(inventarizationCode);
			
			fuelInventarizationLogic.updateTravelSheetRemainders(inventarizationCode, false);
			
			ENFuelInventarizationDAO objectDAO = new ENFuelInventarizationDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENFuelInventarization object = objectDAO.getObject(inventarizationCode);
			object.statusRef.code = ENFuelInventarizationStatus.FUEL_RESERVED;
			objectDAO.save(object);
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENFuelInventarization%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(
					"closeInventarization",
					e);
	    } finally {
			closeConnection();
		}
	}
	
	
} // end of EJB Controller for ENFuelInventarization