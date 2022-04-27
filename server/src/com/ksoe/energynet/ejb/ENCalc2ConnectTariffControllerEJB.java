//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENCalc2ConnectTariff;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENCalc2ConnectTariffDAO;
import com.ksoe.energynet.ejb.generated.ENCalc2ConnectTariffControllerEJBGen;
import com.ksoe.energynet.valueobject.ENCalc2ConnectTariff;
import com.ksoe.energynet.valueobject.filter.ENCalc2ConnectTariffFilter;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENCalc2ConnectTariffControllerEJB extends
        ENCalc2ConnectTariffControllerEJBGen {

    public ENCalc2ConnectTariffControllerEJB() {
    }

    /* ENCalc2ConnectTariff. Добавить */
    public int add(ENCalc2ConnectTariff object) {
        try {
            ENCalc2ConnectTariffDAO objectDAO = new ENCalc2ConnectTariffDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            object.userGen = getUserProfile().userName;
            object.dateEdit = new Date();

            if (object.tariff1value == null
                    || object.tariff2value == null) {
                throw new SystemException("\n\n"+
                        "Помилка при визначенні тарифів!!!");
            }

            if (object.power1Tariff == null
                    || object.power2Tariff == null) {
                throw new SystemException("\n\n"+
                        "Потужність не відповідає потужності договору!!!");
            }

            if (object.power1Tariff.doubleValue() <= 0
                    || object.power2Tariff.doubleValue() <= 0) {
                throw new SystemException("\n\n"+
                        "Потужність не відповідає потужності договору!!!");
            }

            object.summa1Tariff = object.power1Tariff.multiply(object.tariff1value).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            object.summa2Tariff = object.power2Tariff.multiply(object.tariff2value).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            object.summaTotal = object.summa1Tariff.add(object.summa2Tariff).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

            ENCalc2ConnectTariffFilter c2tFilter = new ENCalc2ConnectTariffFilter();
            c2tFilter.techCondServRef.code = object.techCondServRef.code;

            int c2tArr[] = objectDAO.getFilteredCodeArray(c2tFilter, 0, -1);
            if (c2tArr.length > 0) {
                ENCalc2ConnectTariff c2t = objectDAO.getObject(c2tArr[0]);
                object.code = c2t.code;
                object.modify_time = c2t.modify_time;

                objectDAO.save(object);
                return object.code;
            }

            return objectDAO.add(object);

        } catch (DatasourceConnectException e) {
            throw new SystemException(
                    "Can't add {%com.ksoe.energynet.valueobject.ENCalc2ConnectTariff%} object.",
                    e);
        } catch (PersistenceException e) {
            throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }
} // end of EJB Controller for ENCalc2ConnectTariff