//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENEstimateHistory;
 *
 */

import com.ksoe.energynet.valueobject.ENEstimateHistory;
import com.ksoe.energynet.valueobject.brief.ENEstimateHistoryShort;
import com.ksoe.energynet.valueobject.filter.ENEstimateHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateHistoryShortList;

public interface ENEstimateHistoryController extends javax.ejb.EJBObject {
    public static final String JNDI_NAME = "ksoe/energynet/ENEstimateHistoryController";

    /* ENEstimateHistory. Добавить */
    public int add(ENEstimateHistory aENEstimateHistory)
            throws java.rmi.RemoteException;

    /* ENEstimateHistory. Удалить */
    public void remove(int anObjectCode) throws java.rmi.RemoteException;

    /* ENEstimateHistory. Изменить */
    public void save(ENEstimateHistory aENEstimateHistory)
            throws java.rmi.RemoteException;

    /* ENEstimateHistory. Получить объект */
    public ENEstimateHistory getObject(int anObjectCode)
            throws java.rmi.RemoteException;

    /* ENEstimateHistory. Получить полный список */
    public ENEstimateHistoryShortList getList() throws java.rmi.RemoteException;

    /* ENEstimateHistory. Получить список по фильтру */
    public ENEstimateHistoryShortList getFilteredList(
            ENEstimateHistoryFilter aENEstimateHistoryFilter)
            throws java.rmi.RemoteException;

    /* ENEstimateHistory. Получить список для просмотра */
    public ENEstimateHistoryShortList getScrollableList(int aFromPosition,
            int aQuantity) throws java.rmi.RemoteException;

    /* ENEstimateHistory. Получить список для просмотра по фильтру */
    public ENEstimateHistoryShortList getScrollableFilteredList(
            ENEstimateHistoryFilter aENEstimateHistoryFilter,
            int aFromPosition, int aQuantity) throws java.rmi.RemoteException;

    /* ENEstimateHistory. Получить список для просмотра по условию */
    public ENEstimateHistoryShortList getScrollableListByCondition(
            String aCondition, int aFromPosition, int aQuantity)
            throws java.rmi.RemoteException;

    /* ENEstimateHistory. Получить список ПК-кодов по фильтру */
    public int[] getScrollableFilteredCodeArray(
            ENEstimateHistoryFilter filterObject, int fromPosition, int quantity)
            throws java.rmi.RemoteException;

    /* ENEstimateHistory. Получить объект из списка */
    public ENEstimateHistoryShort getShortObject(int code)
            throws java.rmi.RemoteException;

}