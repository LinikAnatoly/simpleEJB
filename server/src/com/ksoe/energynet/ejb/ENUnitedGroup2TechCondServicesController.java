//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENUnitedGroup2TechCondServices;
 *
 */

import com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices;
import com.ksoe.energynet.valueobject.brief.ENUnitedGroup2TechCondServicesShort;
import com.ksoe.energynet.valueobject.filter.ENUnitedGroup2TechCondServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENUnitedGroup2TechCondServicesShortList;

public interface ENUnitedGroup2TechCondServicesController extends
        javax.ejb.EJBObject {
    public static final String JNDI_NAME = "ksoe/energynet/ENUnitedGroup2TechCondServicesController";

    /* ENUnitedGroup2TechCondServices. Добавить */
    public int add(
            ENUnitedGroup2TechCondServices aENUnitedGroup2TechCondServices)
            throws java.rmi.RemoteException;

    /* ENUnitedGroup2TechCondServices. Удалить */
    public void remove(int anObjectCode) throws java.rmi.RemoteException;

    /* ENUnitedGroup2TechCondServices. Изменить */
    public void save(
            ENUnitedGroup2TechCondServices aENUnitedGroup2TechCondServices)
            throws java.rmi.RemoteException;

    /* ENUnitedGroup2TechCondServices. Получить объект */
    public ENUnitedGroup2TechCondServices getObject(int anObjectCode)
            throws java.rmi.RemoteException;

    /* ENUnitedGroup2TechCondServices. Получить полный список */
    public ENUnitedGroup2TechCondServicesShortList getList()
            throws java.rmi.RemoteException;

    /* ENUnitedGroup2TechCondServices. Получить список по фильтру */
    public ENUnitedGroup2TechCondServicesShortList getFilteredList(
            ENUnitedGroup2TechCondServicesFilter aENUnitedGroup2TechCondServicesFilter)
            throws java.rmi.RemoteException;

    /* ENUnitedGroup2TechCondServices. Получить список для просмотра */
    public ENUnitedGroup2TechCondServicesShortList getScrollableList(
            int aFromPosition, int aQuantity) throws java.rmi.RemoteException;

    /* ENUnitedGroup2TechCondServices. Получить список для просмотра по фильтру */
    public ENUnitedGroup2TechCondServicesShortList getScrollableFilteredList(
            ENUnitedGroup2TechCondServicesFilter aENUnitedGroup2TechCondServicesFilter,
            int aFromPosition, int aQuantity) throws java.rmi.RemoteException;

    /* ENUnitedGroup2TechCondServices. Получить список для просмотра по условию */
    public ENUnitedGroup2TechCondServicesShortList getScrollableListByCondition(
            String aCondition, int aFromPosition, int aQuantity)
            throws java.rmi.RemoteException;

    /* ENUnitedGroup2TechCondServices. Получить список ПК-кодов по фильтру */
    public int[] getScrollableFilteredCodeArray(
            ENUnitedGroup2TechCondServicesFilter filterObject,
            int fromPosition, int quantity) throws java.rmi.RemoteException;

    /* ENUnitedGroup2TechCondServices. Получить объект из списка */
    public ENUnitedGroup2TechCondServicesShort getShortObject(int code)
            throws java.rmi.RemoteException;

    /* ENUnitedGroup2TechCondServices. Сохранить строки договоров */
    public void saveUnitedGroup2TcsItems(
            ENUnitedGroup2TechCondServicesShort[] unitedGroup2TcsItems)
            throws java.rmi.RemoteException;

    
    public ENUnitedGroup2TechCondServicesShortList getENLine04ListByTechCondServices(int techCondServicesCode) throws java.rmi.RemoteException;
    public ENUnitedGroup2TechCondServicesShortList getENSubstation04ListByTechCondServices(int techCondServicesCode) throws java.rmi.RemoteException;
    public ENUnitedGroup2TechCondServicesShortList getENLine10ListByTechCondServices(int techCondServicesCode) throws java.rmi.RemoteException;
    public ENUnitedGroup2TechCondServicesShortList getENSubstation35ListByTechCondServices(int techCondServicesCode) throws java.rmi.RemoteException;
}
