
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENElement2TKMaterials;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENElement2TKMaterialsDAO;
import com.ksoe.energynet.ejb.generated.ENElement2TKMaterialsControllerEJBGen;
import com.ksoe.energynet.valueobject.ENElement2TKMaterials;
import com.ksoe.energynet.valueobject.ENElement2TKMaterialsType;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.logic.MaterialsLogic;

public class ENElement2TKMaterialsControllerEJB extends
		ENElement2TKMaterialsControllerEJBGen {

	public ENElement2TKMaterialsControllerEJB() {
	}
	
	public int add(ENElement2TKMaterials object) 
	{
		try
		{
			///// Проверим, чтобы материал не использовался в автоматически созданных планах на изготовление
			if (object.typeRef.code == ENElement2TKMaterialsType.OWN_PRODUCTION)
			{
				MaterialsLogic materialsLogic = new MaterialsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());		
				materialsLogic.checkPlansForOwnProductionByMaterial(object.materialRef.code, true);
			}
			/////
			
			return super.add(object);
		} 
		catch (DatasourceConnectException e) 
		{
			throw new SystemException("Can't add {%com.ksoe.energynet.valueobject.ENElement2TKMaterials%} object.", e);
		} 
		catch (PersistenceException e) 
		{
			throw new SystemException(e.getMessage(), e);
		}		
	}

	public void remove(int code) 
	{
		try 
		{
			ENElement2TKMaterialsDAO objectDAO = new ENElement2TKMaterialsDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENElement2TKMaterials object = objectDAO.getObject(code);
			
			///// Проверим, чтобы материал не использовался в автоматически созданных планах на изготовление
			if (object.typeRef.code == ENElement2TKMaterialsType.OWN_PRODUCTION)
			{
				MaterialsLogic materialsLogic = new MaterialsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());		
				materialsLogic.checkPlansForOwnProductionByMaterial(object.materialRef.code, true);
			}
			/////
			
			super.remove(code);
		} 
		catch (DatasourceConnectException e) 
		{
			throw new SystemException("Can't remove {%com.ksoe.energynet.valueobject.ENElement2TKMaterials%} object.", e);
		}
		catch (PersistenceException e) 
		{
			throw new SystemException(e.getMessage(), e);
		}		
	}

	public void save(ENElement2TKMaterials object) 
	{
		try
		{
			///// Проверим, чтобы материал не использовался в автоматически созданных планах на изготовление
			if (object.typeRef.code == ENElement2TKMaterialsType.OWN_PRODUCTION)
			{
				MaterialsLogic materialsLogic = new MaterialsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());		
				materialsLogic.checkPlansForOwnProductionByMaterial(object.materialRef.code, true);
			}
			/////
			
			super.save(object);
		}
		catch (DatasourceConnectException e) 
		{
			throw new SystemException("Can't save {%com.ksoe.energynet.valueobject.ENElement2TKMaterials%} object.", e);
		}		
		catch (PersistenceException e) 
		{
			throw new SystemException(e.getMessage(), e);
		}		
	}	

} // end of EJB Controller for ENElement2TKMaterials