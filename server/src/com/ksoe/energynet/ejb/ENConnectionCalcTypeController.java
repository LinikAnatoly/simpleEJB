
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
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

    /* ENConnectionCalcType. Добавить */
    public int add(ENConnectionCalcType aENConnectionCalcType)
            throws java.rmi.RemoteException;

    /* ENConnectionCalcType. Удалить */
    public void remove(int anObjectCode) throws java.rmi.RemoteException;

    /* ENConnectionCalcType. Изменить */
    public void save(ENConnectionCalcType aENConnectionCalcType)
            throws java.rmi.RemoteException;

    /* ENConnectionCalcType. Получить объект */
    public ENConnectionCalcType getObject(int anObjectCode)
            throws java.rmi.RemoteException;

    /* ENConnectionCalcType. Получить полный список */
    public ENConnectionCalcTypeShortList getList()
            throws java.rmi.RemoteException;

    /* ENConnectionCalcType. Получить список по фильтру */
    public ENConnectionCalcTypeShortList getFilteredList(
            ENConnectionCalcTypeFilter aENConnectionCalcTypeFilter)
            throws java.rmi.RemoteException;

    /* ENConnectionCalcType. Получить список для просмотра */
    public ENConnectionCalcTypeShortList getScrollableList(int aFromPosition,
            int aQuantity) throws java.rmi.RemoteException;

    /* ENConnectionCalcType. Получить список для просмотра по фильтру */
    public ENConnectionCalcTypeShortList getScrollableFilteredList(
            ENConnectionCalcTypeFilter aENConnectionCalcTypeFilter, int aFromPosition,
            int aQuantity) throws java.rmi.RemoteException;

    /* ENConnectionCalcType. Получить список для просмотра по условию */
    public ENConnectionCalcTypeShortList getScrollableListByCondition(
            String aCondition, int aFromPosition, int aQuantity)
            throws java.rmi.RemoteException;

    /* ENConnectionCalcType. Получить список ПК-кодов по фильтру */
    public int[] getScrollableFilteredCodeArray(
            ENConnectionCalcTypeFilter filterObject, int fromPosition,
            int quantity) throws java.rmi.RemoteException;

    /* ENConnectionCalcType. Получить объект из списка */
    public ENConnectionCalcTypeShort getShortObject(int code)
            throws java.rmi.RemoteException;

}