
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for SCSealLockType;
 *
 */

import com.ksoe.energynet.valueobject.SCSealLockType;
import com.ksoe.energynet.valueobject.brief.SCSealLockTypeShort;
import com.ksoe.energynet.valueobject.filter.SCSealLockTypeFilter;
import com.ksoe.energynet.valueobject.lists.SCSealLockTypeShortList;


public interface SCSealLockTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/SCSealLockTypeController";

	/* SCSealLockType. Добавить */
	public int add(SCSealLockType aSCSealLockType)
			throws java.rmi.RemoteException;

	/* SCSealLockType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* SCSealLockType. Изменить */
	public void save(SCSealLockType aSCSealLockType)
			throws java.rmi.RemoteException;

	/* SCSealLockType. Получить объект */
	public SCSealLockType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* SCSealLockType. Получить полный список */
	public SCSealLockTypeShortList getList()
			throws java.rmi.RemoteException;

	/* SCSealLockType. Получить список по фильтру */
	public SCSealLockTypeShortList getFilteredList(
			SCSealLockTypeFilter aSCSealLockTypeFilter)
			throws java.rmi.RemoteException;

	/* SCSealLockType. Получить список для просмотра */
	public SCSealLockTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSealLockType. Получить список для просмотра по фильтру */
	public SCSealLockTypeShortList getScrollableFilteredList(
			SCSealLockTypeFilter aSCSealLockTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* SCSealLockType. Получить список для просмотра по условию */
	public SCSealLockTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* SCSealLockType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			SCSealLockTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* SCSealLockType. Получить объект из списка */
	public SCSealLockTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}