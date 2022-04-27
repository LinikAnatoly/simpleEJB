
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENCalcPowerReserveItem;
 *
 */

import java.util.Vector;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.ejb.generated.ENCalcPowerReserveItemControllerEJBGen;
import com.ksoe.energynet.valueobject.ENCalcPowerReserveItem;
import com.ksoe.energynet.valueobject.brief.ENCalcPowerReserveItemShort;
import com.ksoe.energynet.valueobject.filter.ENCalcPowerReserveItemFilter;
import com.ksoe.energynet.valueobject.lists.ENCalcPowerReserveItemShortList;
import com.ksoe.energynet.dataminer.ENCalcPowerReserveItemDAO;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENCalcPowerReserveItemControllerEJB extends
		ENCalcPowerReserveItemControllerEJBGen {

	public ENCalcPowerReserveItemControllerEJB() {
	}
	
	public int add(ENCalcPowerReserveItem anObject) {
		try {
			ENCalcPowerReserveItemDAO enCalcPowerReserveItemDAO = new ENCalcPowerReserveItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENCalcPowerReserveItemFilter priFilter = new ENCalcPowerReserveItemFilter();
			priFilter.calcPowerReserveRef.code = anObject.calcPowerReserveRef .code;
			ENCalcPowerReserveItemShortList enCalcPowerReserveItemShortList = enCalcPowerReserveItemDAO.getScrollableFilteredList(priFilter,0,-1);
			Vector<ENCalcPowerReserveItemShort> list = enCalcPowerReserveItemShortList.getList(); 
			
			for(int i=0; i<list.size(); i++){
				ENCalcPowerReserveItemShort enCalcPowerReserveItemShort = list.get(i);
				if(enCalcPowerReserveItemShort.so2nodeRefCode == anObject.getSo2nodeRef().getCode())
					throw new SystemException("Такой договор уже добавлен");
			}
			
			enCalcPowerReserveItemDAO.add(anObject);
			
			return anObject.code;
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENSO2Node%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
		
		
		
	}

} // end of EJB Controller for ENCalcPowerReserveItem