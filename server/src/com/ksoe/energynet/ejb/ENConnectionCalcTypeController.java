
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENConnectionCalcType;
 *
 */

import com.ksoe.energynet.valueobject.ENConnectionCalcType;
import com.ksoe.energynet.valueobject.brief.ENConnectionCalcTypeShort;
import com.ksoe.energynet.valueobject.filter.ENConnectionCalcTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENConnectionCalcTypeShortList;


public interface ENConnectionCalcTypeController extends javax.ejb.EJBObject {
    public static final String JNDI_NAME = "ksoe/energynet/ENConnectionCalcTypeController";

    /* ENConnectionCalcType. �������� */
    public int add(ENConnectionCalcType aENConnectionCalcType)
            throws java.rmi.RemoteException;

    /* ENConnectionCalcType. ������� */
    public void remove(int anObjectCode) throws java.rmi.RemoteException;

    /* ENConnectionCalcType. �������� */
    public void save(ENConnectionCalcType aENConnectionCalcType)
            throws java.rmi.RemoteException;

    /* ENConnectionCalcType. �������� ������ */
    public ENConnectionCalcType getObject(int anObjectCode)
            throws java.rmi.RemoteException;

    /* ENConnectionCalcType. �������� ������ ������ */
    public ENConnectionCalcTypeShortList getList()
            throws java.rmi.RemoteException;

    /* ENConnectionCalcType. �������� ������ �� ������� */
    public ENConnectionCalcTypeShortList getFilteredList(
            ENConnectionCalcTypeFilter aENConnectionCalcTypeFilter)
            throws java.rmi.RemoteException;

    /* ENConnectionCalcType. �������� ������ ��� ��������� */
    public ENConnectionCalcTypeShortList getScrollableList(int aFromPosition,
            int aQuantity) throws java.rmi.RemoteException;

    /* ENConnectionCalcType. �������� ������ ��� ��������� �� ������� */
    public ENConnectionCalcTypeShortList getScrollableFilteredList(
            ENConnectionCalcTypeFilter aENConnectionCalcTypeFilter, int aFromPosition,
            int aQuantity) throws java.rmi.RemoteException;

    /* ENConnectionCalcType. �������� ������ ��� ��������� �� ������� */
    public ENConnectionCalcTypeShortList getScrollableListByCondition(
            String aCondition, int aFromPosition, int aQuantity)
            throws java.rmi.RemoteException;

    /* ENConnectionCalcType. �������� ������ ��-����� �� ������� */
    public int[] getScrollableFilteredCodeArray(
            ENConnectionCalcTypeFilter filterObject, int fromPosition,
            int quantity) throws java.rmi.RemoteException;

    /* ENConnectionCalcType. �������� ������ �� ������ */
    public ENConnectionCalcTypeShort getShortObject(int code)
            throws java.rmi.RemoteException;

}