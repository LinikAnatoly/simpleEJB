
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENCheckpointPassList;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENCheckpointDAO;
import com.ksoe.energynet.dataminer.ENCheckpointPassListDAO;
import com.ksoe.energynet.ejb.generated.ENCheckpointPassListControllerEJBGen;
import com.ksoe.energynet.valueobject.ENCheckpoint;
import com.ksoe.energynet.valueobject.ENCheckpointPassList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENCheckpointPassListControllerEJB extends
		ENCheckpointPassListControllerEJBGen {

	public ENCheckpointPassListControllerEJB() {
	}
	
	public int add(ENCheckpointPassList object)
	{
		try
		{
			// Проверка, что выбран КПП для ведомости
			if(object.checkpointRef == null || 
					object.checkpointRef.code == Integer.MIN_VALUE)
			{
				throw new EnergyproSystemException("Не заданий кпп");
			}
			
			ENCheckpointDAO checkPointDao = new ENCheckpointDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENCheckpointPassListDAO checkPassDao = new ENCheckpointPassListDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			
			// Транспортное подразделения реестра берется с выбранного КПП
			ENCheckpoint checkPoint = checkPointDao.getObject(object.checkpointRef.code);
			object.transportDepartmentRef.code = checkPoint.transportDepartmentRef.code;
			
			// Пользователь и время
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();
			
			return checkPassDao.add(object);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		}
		finally
		{
			closeConnection();
		}
	}

} // end of EJB Controller for ENCheckpointPassList