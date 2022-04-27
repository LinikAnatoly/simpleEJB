
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENConnectionWorkType;
 *
 */

import com.ksoe.energynet.valueobject.ENConnectionWorkType;
import com.ksoe.energynet.valueobject.brief.ENConnectionWorkTypeShort;
import com.ksoe.energynet.valueobject.filter.ENConnectionWorkTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENConnectionWorkTypeShortList;


public interface ENConnectionWorkTypeController extends javax.ejb.EJBObject {
    public static final String JNDI_NAME = "ksoe/energynet/ENConnectionWorkTypeController";

    /* ENConnectionWorkType. Добавить */
    public int add(ENConnectionWorkType aENConnectionWorkType)
            throws java.rmi.RemoteException;

    /* ENConnectionWorkType. Удалить */
    public void remove(int anObjectCode) throws java.rmi.RemoteException;

    /* ENConnectionWorkType. Изменить */
    public void save(ENConnectionWorkType aENConnectionWorkType)
            throws java.rmi.RemoteException;

    /* ENConnectionWorkType. Получить объект */
    public ENConnectionWorkType getObject(int anObjectCode)
            throws java.rmi.RemoteException;

    /* ENConnectionWorkType. Получить полный список */
    public ENConnectionWorkTypeShortList getList()
            throws java.rmi.RemoteException;

    /* ENConnectionWorkType. Получить список по фильтру */
    public ENConnectionWorkTypeShortList getFilteredList(
            ENConnectionWorkTypeFilter aENConnectionWorkTypeFilter)
            throws java.rmi.RemoteException;

    /* ENConnectionWorkType. Получить список для просмотра */
    public ENConnectionWorkTypeShortList getScrollableList(int aFromPosition,
            int aQuantity) throws java.rmi.RemoteException;

    /* ENConnectionWorkType. Получить список для просмотра по фильтру */
    public ENConnectionWorkTypeShortList getScrollableFilteredList(
            ENConnectionWorkTypeFilter aENConnectionWorkTypeFilter, int aFromPosition,
            int aQuantity) throws java.rmi.RemoteException;

    /* ENConnectionWorkType. Получить список для просмотра по условию */
    public ENConnectionWorkTypeShortList getScrollableListByCondition(
            String aCondition, int aFromPosition, int aQuantity)
            throws java.rmi.RemoteException;

    /* ENConnectionWorkType. Получить список ПК-кодов по фильтру */
    public int[] getScrollableFilteredCodeArray(
            ENConnectionWorkTypeFilter filterObject, int fromPosition,
            int quantity) throws java.rmi.RemoteException;

    /* ENConnectionWorkType. Получить объект из списка */
    public ENConnectionWorkTypeShort getShortObject(int code)
            throws java.rmi.RemoteException;

}