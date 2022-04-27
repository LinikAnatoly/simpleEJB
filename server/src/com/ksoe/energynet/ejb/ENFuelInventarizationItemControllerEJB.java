
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENFuelInventarizationItem;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENFuelInventarizationDAO;
import com.ksoe.energynet.dataminer.ENFuelInventarizationItemDAO;
import com.ksoe.energynet.ejb.generated.ENFuelInventarizationItemControllerEJBGen;
import com.ksoe.energynet.valueobject.ENFuelInventarization;
import com.ksoe.energynet.valueobject.ENFuelInventarizationItem;
import com.ksoe.energynet.valueobject.ENFuelInventarizationStatus;
import com.ksoe.energynet.valueobject.brief.ENFuelInventarizationItemShort;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENFuelInventarizationItemControllerEJB extends
		ENFuelInventarizationItemControllerEJBGen {

	public ENFuelInventarizationItemControllerEJB() {
	}
	
	public void saveCountFact(ENFuelInventarizationItemShort[] fuelInventarizationItems) 
	{
		try 
		{
			
		ENFuelInventarizationItemDAO iiDAO = new ENFuelInventarizationItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		ENFuelInventarizationDAO iDAO = new ENFuelInventarizationDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		
		// Добавлено несколько проверок на входящие в функцию аргументы
        if(fuelInventarizationItems == null || fuelInventarizationItems.length == 0)
            throw new EnergyproSystemException("Error: aFuelInventarizationItems is null or length == 0");
        
		if(fuelInventarizationItems[0].inventarizationRefCode == Integer.MIN_VALUE)
            throw new EnergyproSystemException("Error: inventarizationRefCode is Integer.MIN_VALUE");

		ENFuelInventarization fuelInventarization = iDAO.getObject(fuelInventarizationItems[0].inventarizationRefCode);
        
        // Проверка статуса
		// будем сохранять в том случае, если строки разносяться в первый раз, или пересохраняются
        if(fuelInventarization.statusRef.code != ENFuelInventarizationStatus.ITEMS_GENERATED && 
           fuelInventarization.statusRef.code != ENFuelInventarizationStatus.FACT_QUANTITY_INSERTED	)
            throw new EnergyproSystemException("Інвентарізаційна відомість № " + fuelInventarization.numberGen + " повинна бути в статусі \"Строки сформовані\" або \"Факт рознесено\"");
        
        for (int z = 0; fuelInventarizationItems.length > z; z++)
        {
        	ENFuelInventarizationItem iitem = new ENFuelInventarizationItem();
        	iitem = iiDAO.getObject(fuelInventarizationItems[z].code);
        	iitem.countFact = fuelInventarizationItems[z].countFact;
        	iiDAO.save(iitem);
        }
        
        fuelInventarization.statusRef.code = ENFuelInventarizationStatus.FACT_QUANTITY_INSERTED;		
        iDAO.save(fuelInventarization);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't saveCountFact.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(
					"Can't saveCountFact.",
					e);
		} finally {
			closeConnection();
		}
		
	}

} // end of EJB Controller for ENFuelInventarizationItem