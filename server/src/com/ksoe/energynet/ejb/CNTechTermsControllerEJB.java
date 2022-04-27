//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for CNTechTerms;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.CNTechTermsDAO;
import com.ksoe.energynet.ejb.generated.CNTechTermsControllerEJBGen;
import com.ksoe.energynet.valueobject.CNTechTerms;
import com.ksoe.energynet.valueobject.filter.CNTechTermsFilter;
import com.ksoe.energynet.valueobject.lists.CNTechTermsShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class CNTechTermsControllerEJB extends CNTechTermsControllerEJBGen {

    public CNTechTermsControllerEJB() {
    }

    /* CNTechTerms. Добавить */
    @Override
	public int add(CNTechTerms object) {
        try {
            CNTechTermsDAO objectDAO = new CNTechTermsDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.CN_DATASOURCE));
            return objectDAO.add(object);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("\n " +
                    "\n Нет связи с EnergyWorkflow...", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /* CNTechTerms. Удалить */
    @Override
	public void remove(int code) {
        try {
            CNTechTermsDAO objectDAO = new CNTechTermsDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.CN_DATASOURCE));
            objectDAO.remove(code);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("\n " +
                    "\n Нет связи с EnergyWorkflow...", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /* CNTechTerms. Изменить */
    @Override
	public void save(CNTechTerms object) {
        try {
            CNTechTermsDAO objectDAO = new CNTechTermsDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.CN_DATASOURCE));
            objectDAO.save(object);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("\n " +
                    "\n Нет связи с EnergyWorkflow...", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /* CNTechTerms. Получить объект */
    @Override
	public CNTechTerms getObject(int code) {
        try {
            CNTechTermsDAO objectDAO = new CNTechTermsDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.CN_DATASOURCE));
            return objectDAO.getObject(code);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("\n " +
                    "\n Нет связи с EnergyWorkflow...", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /*CNTechTerms. Получить объект по кодам пакета и подсистемы*/
    public CNTechTerms getObjectByPackAndSubsystemID(int packID, int ssID)
    {

        try
        {
            CNTechTermsDAO objectDAO = new CNTechTermsDAO(getUserProfile(), getConnection(AuthorizationJNDINames.CN_DATASOURCE));
            return objectDAO.getObjectByPackAndSubsystemID(packID, ssID);
        }
        catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с EnergyWokflow!",e);}
        catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
        finally                              {closeConnection();}
    }


    /* CNTechTerms. Получить полный список */
    @Override
	public CNTechTermsShortList getList() {
        return getScrollableFilteredList(null, 0, -1);
    }

    /* CNTechTerms. Получить список по фильтру */
    @Override
	public CNTechTermsShortList getFilteredList(CNTechTermsFilter filterObject) {
        return getScrollableFilteredList(filterObject, 0, -1);
    }

    /* CNTechTerms. Получить список для просмотра */
    @Override
	public CNTechTermsShortList getScrollableList(int fromPosition, int quantity) {
        return getScrollableFilteredList(null, fromPosition, quantity);
    }

    /* CNTechTerms. Получить список для просмотра по фильтру */
    @Override
	public CNTechTermsShortList getScrollableFilteredList(
            CNTechTermsFilter filterObject, int fromPosition, int quantity) {
        try {
            CNTechTermsDAO objectDAO = new CNTechTermsDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.CN_DATASOURCE));
            return objectDAO.getScrollableFilteredList(filterObject,
                    fromPosition, quantity, null);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("\n " +
                    "\n Нет связи с EnergyWorkflow...", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {            closeConnection();
        }
    }

    /* CNTechTerms. Получить список для просмотра по условию */
    @Override
	public CNTechTermsShortList getScrollableListByCondition(String aCondition,
            int fromPosition, int quantity) {
        CNTechTermsFilter filterObject = new CNTechTermsFilter();
        filterObject.conditionSQL = aCondition;
        return getScrollableFilteredList(filterObject, fromPosition, quantity);
    }

    /* CNTechTerms. Получить список ПК-кодов по фильтру */
    @Override
	public int[] getScrollableFilteredCodeArray(CNTechTermsFilter filterObject,
            int fromPosition, int quantity) {
        try {
            CNTechTermsDAO objectDAO = new CNTechTermsDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.CN_DATASOURCE));
            return objectDAO.getFilteredCodeArray(filterObject, fromPosition,
                    quantity);
        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException("\n " +
                    "\n Нет связи с EnergyWorkflow...", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

}