
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENServicesDeliveryDAOGen;
import com.ksoe.energynet.valueobject.ENServicesCost;
import com.ksoe.energynet.valueobject.filter.ENServicesDeliveryFilter;

/**
 * DAO Object for ENServicesDelivery;
 *
 */

public class ENServicesDeliveryDAO extends ENServicesDeliveryDAOGen {

    public ENServicesDeliveryDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENServicesDeliveryDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    /**
     * 
     * Получить массив кодов объектов для заданного расчета договора {@link ENServicesCost}
     * 
     * @param servicesCost {@link ENServicesCost} расчет для договора
     * @throws PersistenceException
     */
    public int[] getArrayOfCodesByENServicesCost(ENServicesCost servicesCost) throws PersistenceException {
    	ENServicesCost.checkENServicesCostOnNull(servicesCost);
    	ENServicesDeliveryFilter filter = new ENServicesDeliveryFilter();
    	filter.servicesCostRef.code = servicesCost.code;
    	return this.getFilteredCodeArray(filter, 0, -1);
    }
    
    /**
     * 
     * Удалить все объекты для заданного расчета договора {@link ENServicesCost}
     * 
     * @param servicesCost {@link ENServicesCost} расчет договора
     * @throws PersistenceException
     */
    public void removeByENServicesCost(ENServicesCost servicesCost) throws PersistenceException {
    	int[] codes = this.getArrayOfCodesByENServicesCost(servicesCost);
    	for(int code : codes) {
    		this.remove(code);
    	}
    }

} // end of ENServicesDeliveryDAO
