
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENConnectionTariff;
  *
  */



import java.util.Date;
import java.util.Vector;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENConnectionTariffDAO;
import com.ksoe.energynet.ejb.generated.ENConnectionTariffControllerEJBGen;
import com.ksoe.energynet.valueobject.ENConnectionTariff;
import com.ksoe.energynet.valueobject.brief.ENConnectionTariffShort;
import com.ksoe.energynet.valueobject.filter.ENConnectionTariffFilter;
import com.ksoe.energynet.valueobject.lists.ENConnectionTariffShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENConnectionTariffControllerEJB extends ENConnectionTariffControllerEJBGen
 {

  public ENConnectionTariffControllerEJB() {}


    /* ENConnectionTariff. Получить объект */
    public ENConnectionTariffShort getShortObject(int code) {
        return getShortObject(code, null);
    }

    public ENConnectionTariffShort getShortObject(int code, Date dateTY) {
        try {
            ENConnectionTariffDAO objectDAO = new ENConnectionTariffDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENConnectionTariff filterObject = new ENConnectionTariff();
            Vector list;

            filterObject.code = code;

            if (dateTY == null) {
                list = getFilteredList(filterObject).list;
            } else {
                list = getScrollableFilteredList(filterObject, null, null, 0,
                        -1, null, dateTY).list;
            }

            if (list.size() > 0)
                return (ENConnectionTariffShort) list.get(0);
            return null;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't get {%com.ksoe.energynet.valueobject.ENConnectionTariff%} ShortObject.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

    /* ENConnectionTariff. Добавить */
    public int add(ENConnectionTariff object) {
        try {
            ENConnectionTariffDAO objectDAO = new ENConnectionTariffDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            object.userGen = getUserProfile().userName;

            return objectDAO.add(object);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't add {%com.ksoe.energynet.valueobject.ENConnectionTariff%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    /* ENConnectionTariff. Изменить */
    public void save(ENConnectionTariff object) {
        try {

            ENConnectionTariffDAO objectDAO = new ENConnectionTariffDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            object.userGen = getUserProfile().userName;

            objectDAO.save(object);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't save {%com.ksoe.energynet.valueobject.ENConnectionTariff%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }


    /* ENConnectionTariff. Получить список для просмотра по фильтру */
    public ENConnectionTariffShortList getFilteredList(
            ENConnectionTariff filterObject) throws PersistenceException {

        return this.getScrollableFilteredList(filterObject, 0, -1);
    }

    public ENConnectionTariffShortList getScrollableFilteredList(
            ENConnectionTariff aFilterObject, int fromPosition, int quantity, Date dateTY) {

        return this.getScrollableFilteredList(aFilterObject, null, null,
                fromPosition, quantity, null, dateTY);
    }

    public ENConnectionTariffShortList getScrollableFilteredList(
            ENConnectionTariff aFilterObject, int fromPosition, int quantity) {

        return this.getScrollableFilteredList(aFilterObject, null, null,
                fromPosition, quantity, null, null);
    }

    public ENConnectionTariffShortList getScrollableFilteredList(
            ENConnectionTariffFilter aFilterObject, int fromPosition, int quantity) {

        return this.getScrollableFilteredList(aFilterObject, null, null,
                fromPosition, quantity, null, null);
    }

    /* ENConnectionTariff. Получить список для просмотра по фильтру */
    public ENConnectionTariffShortList getScrollableFilteredList(
            ENConnectionTariff aFilterObject, String anCondition,
            String anOrderBy, int fromPosition, int quantity,
            Vector aBindObjects) {

        return this.getScrollableFilteredList(aFilterObject, anCondition,
                anOrderBy, fromPosition, quantity, aBindObjects, null);
    }


    /* ENConnectionTariff. Получить список для просмотра по фильтру */
    public ENConnectionTariffShortList getScrollableFilteredList(
            ENConnectionTariff aFilterObject, String anCondition,
            String anOrderBy, int fromPosition, int quantity,
            Vector aBindObjects, Date dateTY) {
        try {
            ENConnectionTariffDAO objectDAO = new ENConnectionTariffDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            return objectDAO.getScrollableFilteredList(aFilterObject,
                    anCondition, anOrderBy, fromPosition, quantity,
                    aBindObjects, dateTY);

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't get list of {%com.ksoe.energynet.valueobject.ENConnectionTariff%} objects.",
                    e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

} // end of EJB Controller for ENConnectionTariff