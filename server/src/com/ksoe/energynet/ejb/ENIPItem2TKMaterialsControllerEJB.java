
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENIPItem2TKMaterials;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENIPItem2TKMaterialsDAO;
import com.ksoe.energynet.dataminer.ENIPItemDAO;
import com.ksoe.energynet.ejb.generated.ENIPItem2TKMaterialsControllerEJBGen;
import com.ksoe.energynet.logic.InvestProgramLogic;
import com.ksoe.energynet.valueobject.ENIPItem;
import com.ksoe.energynet.valueobject.ENIPItem2TKMaterials;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENIPItem2TKMaterialsControllerEJB extends
        ENIPItem2TKMaterialsControllerEJBGen {

    public ENIPItem2TKMaterialsControllerEJB() {
    }

    /* ENIPItem2TKMaterials. Добавить */
    public int add(ENIPItem2TKMaterials object) {
        try {
        	
			///// 16.04.14 Проверим, последнюю ли версию ИП пытаются редактировать
			if (object.ipItemRef == null)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код пункту Інвестпрограми!");
			}
			
			if (object.ipItemRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код пункту Інвестпрограми!");
			}		
			
            ENIPItemDAO ipItemDAO = new ENIPItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENIPItem ipItem = ipItemDAO.getObject(object.ipItemRef.code);
        	
        	if (ipItem == null)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код пункту Інвестпрограми!");
			}

			if (ipItem.ipRef == null)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код Інвестпрограми!");
			}
			
			if (ipItem.ipRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код Інвестпрограми!");
			}
			
			InvestProgramLogic ipLogic = new InvestProgramLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ipLogic.checkLastVersionIP(ipItem.ipRef.code, true);
			/////
			
            ENIPItem2TKMaterialsDAO objectDAO = new ENIPItem2TKMaterialsDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            object.userGen = getUserProfile().userName;
            object.dateEdit = new Date();
            object.userAdd = getUserProfile().userName;
            object.dateAdd = new Date();

            return objectDAO.add(object);

        } catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't add {%com.ksoe.energynet.valueobject.ENIPItem2TKMaterials%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }
    

    /* ENIPItem2TKMaterials. Изменить */
    public void save(ENIPItem2TKMaterials object) {
        try {
        	
			///// 16.04.14 Проверим, последнюю ли версию ИП пытаются редактировать
			if (object.ipItemRef == null)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код пункту Інвестпрограми!");
			}
			
			if (object.ipItemRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код пункту Інвестпрограми!");
			}		
			
            ENIPItemDAO ipItemDAO = new ENIPItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENIPItem ipItem = ipItemDAO.getObject(object.ipItemRef.code);
        	
        	if (ipItem == null)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код пункту Інвестпрограми!");
			}

			if (ipItem.ipRef == null)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код Інвестпрограми!");
			}
			
			if (ipItem.ipRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код Інвестпрограми!");
			}
			
			InvestProgramLogic ipLogic = new InvestProgramLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ipLogic.checkLastVersionIP(ipItem.ipRef.code, true);
			/////	

            super.save(object);

        } catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't save {%com.ksoe.energynet.valueobject.ENIPItem2TKMaterials%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }  
    

    /* ENIPItem2TKMaterials. Удалить */
    public void remove(int code) {
        try {
        	ENIPItem2TKMaterialsDAO objectDAO = new ENIPItem2TKMaterialsDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            
        	ENIPItem2TKMaterials i2m = objectDAO.getObject(code);
            
            ENIPItemDAO ipItemDAO = new ENIPItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));        	
        	
			///// 16.04.14 Проверим, последнюю ли версию ИП пытаются редактировать
			if (i2m.ipItemRef == null)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код пункту Інвестпрограми!");
			}
			
			if (i2m.ipItemRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код пункту Інвестпрограми!");
			}		
			
            ENIPItem ipItem = ipItemDAO.getObject(i2m.ipItemRef.code);
        	
        	if (ipItem == null)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код пункту Інвестпрограми!");
			}

			if (ipItem.ipRef == null)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код Інвестпрограми!");
			}
			
			if (ipItem.ipRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код Інвестпрограми!");
			}
			
			InvestProgramLogic ipLogic = new InvestProgramLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ipLogic.checkLastVersionIP(ipItem.ipRef.code, true);
			/////
            
            super.remove(code);

        } catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't remove {%com.ksoe.energynet.valueobject.ENIPItem2Plan%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }    

} // end of EJB Controller for ENIPItem2TKMaterials