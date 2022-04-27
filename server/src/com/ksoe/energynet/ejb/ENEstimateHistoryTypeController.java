//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENEstimateHistoryType;
 *
 */

import com.ksoe.energynet.valueobject.ENEstimateHistoryType;
import com.ksoe.energynet.valueobject.brief.ENEstimateHistoryTypeShort;
import com.ksoe.energynet.valueobject.filter.ENEstimateHistoryTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateHistoryTypeShortList;

public interface ENEstimateHistoryTypeController extends javax.ejb.EJBObject {
    public static final String JNDI_NAME = "ksoe/energynet/ENEstimateHistoryTypeController";

    /* ENEstimateHistoryType. Добавить */
    public int add(ENEstimateHistoryType aENEstimateHistoryType)
            throws java.rmi.RemoteException;

    /* ENEstimateHistoryType. Удалить */
    public void remove(int anObjectCode) throws java.rmi.RemoteException;

    /* ENEstimateHistoryType. Изменить */
    public void save(ENEstimateHistoryType aENEstimateHistoryType)
            throws java.rmi.RemoteException;

    /* ENEstimateHistoryType. Получить объект */
    public ENEstimateHistoryType getObject(int anObjectCode)
            throws java.rmi.RemoteException;

    /* ENEstimateHistoryType. Получить полный список */
    public ENEstimateHistoryTypeShortList getList()
            throws java.rmi.RemoteException;

    /* ENEstimateHistoryType. Получить список по фильтру */
    public ENEstimateHistoryTypeShortList getFilteredList(
            ENEstimateHistoryTypeFilter aENEstimateHistoryTypeFilter)
            throws java.rmi.RemoteException;

    /* ENEstimateHistoryType. Получить список для просмотра */
    public ENEstimateHistoryTypeShortList getScrollableList(int aFromPosition,
            int aQuantity) throws java.rmi.RemoteException;

    /* ENEstimateHistoryType. Получить список для просмотра по фильтру */
    public ENEstimateHistoryTypeShortList getScrollableFilteredList(
            ENEstimateHistoryTypeFilter aENEstimateHistoryTypeFilter,
            int aFromPosition, int aQuantity) throws java.rmi.RemoteException;

    /* ENEstimateHistoryType. Получить список для просмотра по условию */
    public ENEstimateHistoryTypeShortList getScrollableListByCondition(
            String aCondition, int aFromPosition, int aQuantity)
            throws java.rmi.RemoteException;

    /* ENEstimateHistoryType. Получить список ПК-кодов по фильтру */
    public int[] getScrollableFilteredCodeArray(
            ENEstimateHistoryTypeFilter filterObject, int fromPosition,
            int quantity) throws java.rmi.RemoteException;

    /* ENEstimateHistoryType. Получить объект из списка */
    public ENEstimateHistoryTypeShort getShortObject(int code)
            throws java.rmi.RemoteException;

}