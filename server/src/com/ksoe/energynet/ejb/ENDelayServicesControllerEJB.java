
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENDelayServices;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDelayServicesDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.ejb.generated.ENDelayServicesControllerEJBGen;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.valueobject.ENDelayServices;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENDelayServicesControllerEJB extends
		ENDelayServicesControllerEJBGen {

	public ENDelayServicesControllerEJB() {
	}

	@Override
	public int add(ENDelayServices object)
	{
		try
		{
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			return servicesLogic.addServicesDelay(object);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}

  	/* ENDelayServices. Изменить */
	@Override
	public void save(ENDelayServices object)
	{
		try
		{
			ENDelayServicesDAO objectDAO = new ENDelayServicesDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENDelayServices oldObject = objectDAO.getObject(object.code);

			///// Запретим изменять даты! Пусть удаляют старую запись и добавляют новую
			if (! object.dateStart.equals(oldObject.dateStart))
			{
				throw new SystemException("\n\nДля изменения дат удалите старую запись и добавьте новую!");
			}

			if (! object.dateFinal.equals(oldObject.dateFinal))
			{
				throw new SystemException("\n\nДля изменения дат удалите старую запись и добавьте новую!");
			}
			/////

			if (object.servicesObjectRef == null)
			{
				throw new SystemException("\n\nНет ссылки на договор по услугам на сторону!");
			}

			if (object.servicesObjectRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nНет ссылки на договор по услугам на сторону!");
			}

			ENServicesObjectDAO soDAO = new ENServicesObjectDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENServicesObject soObj = soDAO.getObjectNoSegr(object.servicesObjectRef.code);

			if (soObj.dfPackCode == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4315 Нет ссылки на пакет из DocFlow! Невозможно внести данные о задержке!");
			}

		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

		    objectDAO.save(object);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		catch (PersistenceException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
		finally
		{
			closeConnection();
		}
	}

	@Override
	public void remove(int code)
	{
		try
		{
			ServicesLogic servicesLogic = new ServicesLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			servicesLogic.removeServicesDelay(code);
		}
		catch (DatasourceConnectException e)
		{
			throw new SystemException(e.getMessage(), e);
		}
	}



} // end of EJB Controller for ENDelayServices