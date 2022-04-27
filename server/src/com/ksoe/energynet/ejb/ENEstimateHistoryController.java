//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
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

    /* ENEstimateHistory. �������� */
    public int add(ENEstimateHistory aENEstimateHistory)
            throws java.rmi.RemoteException;

    /* ENEstimateHistory. ������� */
    public void remove(int anObjectCode) throws java.rmi.RemoteException;

    /* ENEstimateHistory. �������� */
    public void save(ENEstimateHistory aENEstimateHistory)
            throws java.rmi.RemoteException;

    /* ENEstimateHistory. �������� ������ */
    public ENEstimateHistory getObject(int anObjectCode)
            throws java.rmi.RemoteException;

    /* ENEstimateHistory. �������� ������ ������ */
    public ENEstimateHistoryShortList getList() throws java.rmi.RemoteException;

    /* ENEstimateHistory. �������� ������ �� ������� */
    public ENEstimateHistoryShortList getFilteredList(
            ENEstimateHistoryFilter aENEstimateHistoryFilter)
            throws java.rmi.RemoteException;

    /* ENEstimateHistory. �������� ������ ��� ��������� */
    public ENEstimateHistoryShortList getScrollableList(int aFromPosition,
            int aQuantity) throws java.rmi.RemoteException;

    /* ENEstimateHistory. �������� ������ ��� ��������� �� ������� */
    public ENEstimateHistoryShortList getScrollableFilteredList(
            ENEstimateHistoryFilter aENEstimateHistoryFilter,
            int aFromPosition, int aQuantity) throws java.rmi.RemoteException;

    /* ENEstimateHistory. �������� ������ ��� ��������� �� ������� */
    public ENEstimateHistoryShortList getScrollableListByCondition(
            String aCondition, int aFromPosition, int aQuantity)
            throws java.rmi.RemoteException;

    /* ENEstimateHistory. �������� ������ ��-����� �� ������� */
    public int[] getScrollableFilteredCodeArray(
            ENEstimateHistoryFilter filterObject, int fromPosition, int quantity)
            throws java.rmi.RemoteException;

    /* ENEstimateHistory. �������� ������ �� ������ */
    public ENEstimateHistoryShort getShortObject(int code)
            throws java.rmi.RemoteException;

}