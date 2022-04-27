
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENDamageRecovery2ENAct;
 *
 */

import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENActDAO;
import com.ksoe.energynet.dataminer.ENDamageRecovery2ENActDAO;
import com.ksoe.energynet.dataminer.ENDamageRecoveryDAO;
import com.ksoe.energynet.ejb.generated.ENDamageRecovery2ENActControllerEJBGen;
import com.ksoe.energynet.logic.ActLogic;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENDamageRecovery;
import com.ksoe.energynet.valueobject.ENDamageRecovery2ENAct;
import com.ksoe.energynet.valueobject.ENDamageRecoveryStatus;
import com.ksoe.energynet.valueobject.filter.ENDamageRecovery2ENActFilter;
import com.ksoe.energynet.valueobject.lists.ENDamageRecovery2ENActShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENDamageRecovery2ENActControllerEJB extends
		ENDamageRecovery2ENActControllerEJBGen {

	public ENDamageRecovery2ENActControllerEJB() {
	}

	/* ENDamageRecovery2ENAct. Добавить */
	@Override
	public int add(ENDamageRecovery2ENAct object) {
		try {
			ENDamageRecovery2ENActDAO objectDAO = new ENDamageRecovery2ENActDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENDamageRecoveryDAO damageDAO = new ENDamageRecoveryDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENActDAO actDAO = new ENActDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ActLogic actLogic = new ActLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					                         getUserProfile());

			ENAct act = actDAO.getObject(object.actRef.code);

			if (act.statusRef.code != ENActStatus.CLOSED)
			{
				throw new SystemException("Акт повинен бути проведеним!");
			}

			ENDamageRecovery damage = damageDAO.getObject(object.damageRecoveryRef.code);

			if (damage.statusRef.code == ENDamageRecoveryStatus.CLOSED)
			{
				throw new SystemException("Для прив'язки актів акт відшкодування збитків не може бути проведеним!");
			}

		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

	        int objectCode = Integer.MIN_VALUE;

	        // проверим на всякий случай наличие этого акта в связках
	        ENDamageRecovery2ENActFilter dam2actFilter = new ENDamageRecovery2ENActFilter();
	        dam2actFilter.actRef.code = object.actRef.code;
	        ENDamageRecovery2ENActShortList dam2actList = objectDAO.getScrollableFilteredList(dam2actFilter, 0, -1);
	        if (dam2actList.totalCount > 0) {
	        	throw new SystemException("Цей акт вже включено до актів відшкодування збитків!" +
	        			"Найменування та дата :" +  dam2actList.get(0).damageRecoveryRefNumberGen + " від " + dam2actList.get(0).damageRecoveryRefDateGen);
	        }

	        objectCode = objectDAO.add(object);

	        // пересчитаем сумму согласно подвязанных актов
	        dam2actFilter = new ENDamageRecovery2ENActFilter();
	        dam2actFilter.damageRecoveryRef.code = damage.code;

	        dam2actList = objectDAO.getScrollableFilteredList(dam2actFilter, 0, -1);
        	BigDecimal damageAmmount = new BigDecimal(0);

	        for (int i=0;i<dam2actList.totalCount;i++) {
	        	damageAmmount = damageAmmount.add(actLogic.getSumByActCode(dam2actList.get(i).actRefCode));
	        }

	        damage.damageAmmount = damageAmmount;
	        damage.statusRef.code  = ENDamageRecoveryStatus.SUM_BY_ACT_CALCULATED;
	        damageDAO.save(damage);

	        return objectCode;


		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENDamageRecovery2ENAct%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENDamageRecovery2ENAct. Удалить */
	public void remove(int actCode, int damageCode) {
		try {
			ENDamageRecovery2ENActDAO objectDAO = new ENDamageRecovery2ENActDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENDamageRecoveryDAO damageDAO = new ENDamageRecoveryDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ActLogic actLogic = new ActLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),
					                         getUserProfile());

			ENDamageRecovery2ENActFilter dam2actFilter = new ENDamageRecovery2ENActFilter();
			dam2actFilter.actRef.code = actCode;
			dam2actFilter.damageRecoveryRef.code = damageCode;
			ENDamageRecovery2ENActShortList dam2actList = objectDAO.getScrollableFilteredList(dam2actFilter, 0, -1);

			if (dam2actList.totalCount != 1) {
				throw new SystemException("Ошибка при удалении связки актов!");
			}

			ENDamageRecovery2ENAct object = objectDAO.getObject(dam2actList.get(0).code);

			ENDamageRecovery damage = damageDAO.getObject(object.damageRecoveryRef.code);

			if (damage.statusRef.code == ENDamageRecoveryStatus.CLOSED)
			{
				throw new SystemException("Акт відшкодування збитків вже проведено!");
			}

			objectDAO.remove(object.code);

			 dam2actFilter = new ENDamageRecovery2ENActFilter();
	        dam2actFilter.damageRecoveryRef.code = damage.code;

	         dam2actList = objectDAO.getScrollableFilteredList(dam2actFilter, 0, -1);
        	BigDecimal damageAmmount = new BigDecimal(0);

	        for (int i=0;i<dam2actList.totalCount;i++) {
	        	damageAmmount = damageAmmount.add(actLogic.getSumByActCode(dam2actList.get(i).actRefCode));
	        }

	        damage.damageAmmount = damageAmmount;
	        if (dam2actList.totalCount==0) {
	        	damage.statusRef.code  = ENDamageRecoveryStatus.DRAFT;
	        } else
	        damage.statusRef.code  = ENDamageRecoveryStatus.SUM_BY_ACT_CALCULATED;
	        damageDAO.save(damage);


		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENDamageRecovery2ENAct%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}



} // end of EJB Controller for ENDamageRecovery2ENAct