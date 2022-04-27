
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import java.sql.Connection;
import java.sql.SQLException;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENServicesCostDAO;
import com.ksoe.energynet.dataminer.ENServicesMaterialsDAO;

/**
 * EJB Controller for ENServicesMaterials;
 *
 */

import com.ksoe.energynet.ejb.generated.ENServicesMaterialsControllerEJBGen;
import com.ksoe.energynet.logic.ServicesCalculatorLogic;
import com.ksoe.energynet.valueobject.ENServicesCost;
import com.ksoe.energynet.valueobject.ENServicesMaterials;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.dataminer.TKCalcCostDAO;
import com.ksoe.techcard.dataminer.TKClassificationTypeDAO;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.logic.TKConsts;
import com.ksoe.techcard.valueobject.TKCalcCost;
import com.ksoe.techcard.valueobject.TKClassificationType;
import com.ksoe.techcard.valueobject.TKMaterials;

public class ENServicesMaterialsControllerEJB extends
		ENServicesMaterialsControllerEJBGen {

	public ENServicesMaterialsControllerEJB() {
	}
	
	public int add(ENServicesMaterials object) {
		Connection conn = null;
		try {
			
			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			
			ENServicesMaterialsDAO objectDAO = new ENServicesMaterialsDAO(getUserProfile(), conn);
		    ServicesCalculatorLogic logic = new ServicesCalculatorLogic(conn, getUserProfile());
		    ENServicesCostDAO servicesCostDao = new ENServicesCostDAO(conn, getUserProfile());
		    TKMaterialsDAO tkMaterialDao = new TKMaterialsDAO(conn, getUserProfile());
		    
		    TKMaterials tkMaterial = tkMaterialDao.getObject(object.materialRef.code);
		    
		    object.measureUnitName = tkMaterial.measurement.name;
		    object.materialName = tkMaterial.name;


		    int code = objectDAO.add(object);
		    
		    ENServicesCost servicesCost = servicesCostDao.getObject(object.servicesCostRef.code);
		    this.checkLicensity(servicesCost);
		    logic.evaluateServicesCost(servicesCost);
		    
		    return code;
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENServicesMaterials%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
            try {
                if (conn != null && ! conn.isClosed()) {
                	conn.close();
                	conn = null;
                }
            } catch (SQLException e) {
            }
		}
	}

	/* ENServicesMaterials. Удалить */
	public void remove(int code) {
		Connection conn = null;
		try {
			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ENServicesMaterialsDAO objectDAO = new ENServicesMaterialsDAO(getUserProfile(), conn);
			ENServicesCostDAO servicesCostDao = new ENServicesCostDAO(getUserProfile(), conn);
			ServicesCalculatorLogic logic = new ServicesCalculatorLogic(conn, getUserProfile());
			
			ENServicesMaterials material = objectDAO.getObject(code);
			ENServicesCost servicesCost = servicesCostDao.getObject(material.servicesCostRef.code);
			this.checkLicensity(servicesCost);
			objectDAO.remove(code);
			
			logic.evaluateServicesCost(servicesCost);
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENServicesMaterials%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
            try {
                if (conn != null && ! conn.isClosed()) {
                	conn.close();
                	conn = null;
                }
            } catch (SQLException e) {
            }
		}
	}

   	/* ENServicesMaterials. Изменить */
	public void save(ENServicesMaterials object) {
		Connection conn = null;
		try {
			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ENServicesMaterialsDAO objectDAO = new ENServicesMaterialsDAO(getUserProfile(), conn);
		    ServicesCalculatorLogic logic = new ServicesCalculatorLogic(conn, getUserProfile());
		    ENServicesCostDAO servicesCostDao = new ENServicesCostDAO(conn, getUserProfile());
		    TKMaterialsDAO tkMaterialDao = new TKMaterialsDAO(conn, getUserProfile());
		    
		    
		    ENServicesMaterials objectOld = objectDAO.getObject(object.code);
		    
		    if(objectOld.materialRef.code != object.materialRef.code) {
			    TKMaterials tkMaterial = tkMaterialDao.getObject(object.materialRef.code);
			    
			    object.measureUnitName = tkMaterial.measurement.name;
			    object.materialName = tkMaterial.name;		    	
		    }

		    objectDAO.save(object);
		    
		    ENServicesCost servicesCost = servicesCostDao.getObject(object.servicesCostRef.code);
		    this.checkLicensity(servicesCost);
		    logic.evaluateServicesCost(servicesCost);
		    
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENServicesMaterials%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
            try {
                if (conn != null && ! conn.isClosed()) {
                	conn.close();
                	conn = null;
                }
            } catch (SQLException e) {
            }
		}
	}
	
	private void checkLicensity(ENServicesCost servicesCost) {
		Connection conn = null;
		try {
			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			TKCalcCostDAO calcCostDao = new TKCalcCostDAO(getUserProfile(), conn);
			TKClassificationTypeDAO classificationTypeDao = new TKClassificationTypeDAO(getUserProfile(), conn);
			
			TKCalcCost calcCost = calcCostDao.getObject(servicesCost.tkCalcCostRef.code);
			TKClassificationType classificationType = classificationTypeDao.getObject(calcCost.classificationTypeRef.code);
			
			if(classificationType.isnotlicensedactivity == TKConsts.ISNOTLICENSEDACTIVITY_NKRE) {
				throw new SystemException("Неможливо змінювати матеріали ліцензованих калькуляцій!");
			}
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			
		}
	}
	

} // end of EJB Controller for ENServicesMaterials