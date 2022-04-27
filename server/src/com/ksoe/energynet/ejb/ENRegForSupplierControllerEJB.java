
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENRegForSupplier;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.ejb.generated.ENRegForSupplierControllerEJBGen;
import com.ksoe.energynet.logic.RegistryForSupplierLogic;
import com.ksoe.energynet.valueobject.ENRegForSupplier;
import com.ksoe.energynet.valueobject.ENRegForSupplierStatus;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENRegForSupplierControllerEJB extends
		ENRegForSupplierControllerEJBGen {

	public ENRegForSupplierControllerEJB() {
	}
	
	public int add(ENRegForSupplier object) {
		object.statusRef.code = ENRegForSupplierStatus.DRAFT;		
		return super.add(object);
	}

    /**
     *  Формирование строк реестра
     *
     *  @param regCode - код реестра
     *  
     */		
	public void generateRegItems(int regCode)
	{
		try 
		{
			RegistryForSupplierLogic regLogic = new RegistryForSupplierLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			regLogic.generateRegItems(regCode);
		} 
		catch (DatasourceConnectException e) 
		{
			throw new SystemException("Can't generate registry items ([generateRegItems])!", e);
		}
		catch (PersistenceException e) 
		{
			throw new SystemException("Can't generate registry items ([generateRegItems])!", e);
		}		        		
	}	
	
    /**
     *  Удаление строк реестра
     *
     *  @param regCode - код реестра
     *  
     */		
	public void removeRegItems(int regCode)
	{
		try 
		{
			RegistryForSupplierLogic regLogic = new RegistryForSupplierLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			regLogic.removeRegItems(regCode);
		} 
		catch (DatasourceConnectException e) 
		{
			throw new SystemException("Can't remove registry items ([removeRegItems])!", e);
		}
		catch (PersistenceException e) 
		{
			throw new SystemException("Can't remove registry items ([removeRegItems])!", e);
		}		
	}
	
} // end of EJB Controller for ENRegForSupplier