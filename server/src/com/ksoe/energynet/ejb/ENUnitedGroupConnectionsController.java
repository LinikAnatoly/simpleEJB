//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENUnitedGroupConnections;
 *
 */

import com.ksoe.energynet.valueobject.ENUnitedGroupConnections;
import com.ksoe.energynet.valueobject.brief.ENUnitedGroupConnectionsShort;
import com.ksoe.energynet.valueobject.filter.ENUnitedGroupConnectionsFilter;
import com.ksoe.energynet.valueobject.lists.ENUnitedGroupConnectionsShortList;

public interface ENUnitedGroupConnectionsController extends javax.ejb.EJBObject {
    public static final String JNDI_NAME = "ksoe/energynet/ENUnitedGroupConnectionsController";

    /* ENUnitedGroupConnections. Добавить */
    public int add(ENUnitedGroupConnections aENUnitedGroupConnections)
            throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. Удалить */
    public void remove(int anObjectCode) throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. Изменить */
    public void save(ENUnitedGroupConnections aENUnitedGroupConnections)
            throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. Получить объект */
    public ENUnitedGroupConnections getObject(int anObjectCode)
            throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. Получить полный список */
    public ENUnitedGroupConnectionsShortList getList()
            throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. Получить список по фильтру */
    public ENUnitedGroupConnectionsShortList getFilteredList(
            ENUnitedGroupConnectionsFilter aENUnitedGroupConnectionsFilter)
            throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. Получить список для просмотра */
    public ENUnitedGroupConnectionsShortList getScrollableList(
            int aFromPosition, int aQuantity) throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. Получить список для просмотра по фильтру */
    public ENUnitedGroupConnectionsShortList getScrollableFilteredList(
            ENUnitedGroupConnectionsFilter aENUnitedGroupConnectionsFilter,
            int aFromPosition, int aQuantity) throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. Получить список для просмотра по условию */
    public ENUnitedGroupConnectionsShortList getScrollableListByCondition(
            String aCondition, int aFromPosition, int aQuantity)
            throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. Получить список ПК-кодов по фильтру */
    public int[] getScrollableFilteredCodeArray(
            ENUnitedGroupConnectionsFilter filterObject, int fromPosition,
            int quantity) throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. Получить объект из списка */
    public ENUnitedGroupConnectionsShort getShortObject(int code)
            throws java.rmi.RemoteException;

}