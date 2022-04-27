
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENIPItem2Plan;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENIPItem2PlanDAO;
import com.ksoe.energynet.dataminer.ENIPItemDAO;
import com.ksoe.energynet.ejb.generated.ENIPItem2PlanControllerEJBGen;
import com.ksoe.energynet.logic.InvestProgramLogic;
import com.ksoe.energynet.valueobject.ENIPItem;
import com.ksoe.energynet.valueobject.ENIPItem2Plan;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENIPItem2PlanControllerEJB extends
        ENIPItem2PlanControllerEJBGen {

    public ENIPItem2PlanControllerEJB() {
    }


    /* ENIPItem2Plan. Добавить */
    public int add(ENIPItem2Plan object) {
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

            ENIPItem2PlanDAO objectDAO = new ENIPItem2PlanDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENIPItemDAO itDAO = new ENIPItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));



            int objectCode;

            object.userGen = getUserProfile().userName;
            object.dateEdit = new Date();
            object.userAdd = getUserProfile().userName;
            object.dateAdd = new Date();


           

            /** проверка уникальности пункт инвестпрограммы == план && инвестпрограмма == план */
            ipLogic.checkUniq(object.ipItemRef.code, object.planRef.code);


            objectCode = objectDAO.add(object);

            /** поищем под планы связаные с пунктом тендерные договора и вставим в связку enipitem2contract   */
            ipLogic.recalcContract(object.ipItemRef.code);

            ENIPItem itObject = itDAO.getObject(object.ipItemRef.code);
            
            /** проверка принадлежности подвида работ в плане к инвестпрограмме */
            if (itObject.invGroupRef.code != 2 ) { // для второго раздела "енергосбыт" не проверять 29.09.2021 решили новохатская немиров
            	ipLogic.checkWorksIp(object.planRef.code);
            }
            
            
            if(itObject.parentRef.code != Integer.MIN_VALUE){
            	ipLogic.recalcParentIpItemInfoTenders(itObject); // если меняем инфу на дочернем пункте ИП то обновим для парента
		    }

			ipLogic.updatePlan(object.ipItemRef.code, object.planRef.code);

            return  objectCode;

        } catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't add {%com.ksoe.energynet.valueobject.ENIPItem2Plan%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    /* ENIPItem2Plan. Изменить */
    public void save(ENIPItem2Plan object) {
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


            ENIPItem2PlanDAO objectDAO = new ENIPItem2PlanDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            object.userGen = getUserProfile().userName;
            object.dateEdit = new Date();

            objectDAO.save(object);

			ipLogic.updatePlan(object.ipItemRef.code, object.planRef.code);

        } catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't save {%com.ksoe.energynet.valueobject.ENIPItem2Plan%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    /* ENIPItem2Plan. Удалить */
    public void remove(int code) {
        try {
            ENIPItem2PlanDAO objectDAO = new ENIPItem2PlanDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENIPItem2Plan i2p = objectDAO.getObject(code);

            ENIPItemDAO ipItemDAO = new ENIPItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			///// 16.04.14 Проверим, последнюю ли версию ИП пытаются редактировать
			if (i2p.ipItemRef == null)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код пункту Інвестпрограми!");
			}

			if (i2p.ipItemRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код пункту Інвестпрограми!");
			}

            ENIPItem ipItem = ipItemDAO.getObject(i2p.ipItemRef.code);

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

            objectDAO.remove(code);

            /** поищем под планы связаные с пунктом тендерные договора и вставим в связку enipitem2contract   */
            ipLogic.recalcContract(i2p.ipItemRef.code);

            ENIPItem itObject = ipItemDAO.getObject(i2p.ipItemRef.code);
            if(itObject.parentRef.code != Integer.MIN_VALUE){
            	ipLogic.recalcParentIpItemInfoTenders(itObject); // если меняем инфу на дочернем пункте ИП то обновим для парента
		    }

			ipLogic.updatePlan(Integer.MIN_VALUE, i2p.planRef.code);

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


    /* ENIPItem2Plan. создание связки пункта ИП с планом который только что создан */
    public int addWithNewPlan(ENIPItem2Plan object) {
        try {


        	int objectCode = Integer.MIN_VALUE;

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

            ENIPItem2PlanDAO objectDAO = new ENIPItem2PlanDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENIPItemDAO itDAO = new ENIPItemDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));





            object.userGen = getUserProfile().userName;
            object.dateEdit = new Date();
            object.userAdd = getUserProfile().userName;
            object.dateAdd = new Date();


            /** проверка уникальности пункт инвестпрограммы == план && инвестпрограмма == план */
            ipLogic.checkUniq(object.ipItemRef.code, object.planRef.code);


            objectCode = objectDAO.add(object);

            /** поищем под планы связаные с пунктом тендерные договора и вставим в связку enipitem2contract   */
            ipLogic.recalcContract(object.ipItemRef.code);

            ENIPItem itObject = itDAO.getObject(object.ipItemRef.code);
            
            /** проверка принадлежности подвида работ в плане к инвестпрограмме */
            if (itObject.invGroupRef.code != 2 ) { // для второго раздела "енергосбыт" не проверять 29.09.2021 решили новохатская немиров
            	ipLogic.checkWorksIp(object.planRef.code);
            }
            if(itObject.parentRef.code != Integer.MIN_VALUE){
            	ipLogic.recalcParentIpItemInfoTenders(itObject); // если меняем инфу на дочернем пункте ИП то обновим для парента
		    }

			ipLogic.updatePlan(object.ipItemRef.code, object.planRef.code);

            return   objectCode;


        } catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't add {%com.ksoe.energynet.valueobject.ENIPItem2Plan%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

} // end of EJB Controller for ENIPItem2Plan