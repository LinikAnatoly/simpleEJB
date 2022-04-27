//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
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

    /* ENUnitedGroupConnections. �������� */
    public int add(ENUnitedGroupConnections aENUnitedGroupConnections)
            throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. ������� */
    public void remove(int anObjectCode) throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. �������� */
    public void save(ENUnitedGroupConnections aENUnitedGroupConnections)
            throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. �������� ������ */
    public ENUnitedGroupConnections getObject(int anObjectCode)
            throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. �������� ������ ������ */
    public ENUnitedGroupConnectionsShortList getList()
            throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. �������� ������ �� ������� */
    public ENUnitedGroupConnectionsShortList getFilteredList(
            ENUnitedGroupConnectionsFilter aENUnitedGroupConnectionsFilter)
            throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. �������� ������ ��� ��������� */
    public ENUnitedGroupConnectionsShortList getScrollableList(
            int aFromPosition, int aQuantity) throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. �������� ������ ��� ��������� �� ������� */
    public ENUnitedGroupConnectionsShortList getScrollableFilteredList(
            ENUnitedGroupConnectionsFilter aENUnitedGroupConnectionsFilter,
            int aFromPosition, int aQuantity) throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. �������� ������ ��� ��������� �� ������� */
    public ENUnitedGroupConnectionsShortList getScrollableListByCondition(
            String aCondition, int aFromPosition, int aQuantity)
            throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. �������� ������ ��-����� �� ������� */
    public int[] getScrollableFilteredCodeArray(
            ENUnitedGroupConnectionsFilter filterObject, int fromPosition,
            int quantity) throws java.rmi.RemoteException;

    /* ENUnitedGroupConnections. �������� ������ �� ������ */
    public ENUnitedGroupConnectionsShort getShortObject(int code)
            throws java.rmi.RemoteException;

}