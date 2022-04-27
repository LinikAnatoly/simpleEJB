
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENSheets4SOType;
 *
 */

import com.ksoe.energynet.valueobject.ENSheets4SOType;
import com.ksoe.energynet.valueobject.lists.ENSheets4SOTypeShortList;
import com.ksoe.energynet.valueobject.brief.ENSheets4SOTypeShort;
import com.ksoe.energynet.valueobject.filter.ENSheets4SOTypeFilter;


public interface ENSheets4SOTypeController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENSheets4SOTypeController";

	/* ENSheets4SOType. Добавить */
	public int add(ENSheets4SOType aENSheets4SOType)
			throws java.rmi.RemoteException;

	/* ENSheets4SOType. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENSheets4SOType. Изменить */
	public void save(ENSheets4SOType aENSheets4SOType)
			throws java.rmi.RemoteException;

	/* ENSheets4SOType. Получить объект */
	public ENSheets4SOType getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENSheets4SOType. Получить полный список */
	public ENSheets4SOTypeShortList getList()
			throws java.rmi.RemoteException;

	/* ENSheets4SOType. Получить список по фильтру */
	public ENSheets4SOTypeShortList getFilteredList(
			ENSheets4SOTypeFilter aENSheets4SOTypeFilter)
			throws java.rmi.RemoteException;

	/* ENSheets4SOType. Получить список для просмотра */
	public ENSheets4SOTypeShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSheets4SOType. Получить список для просмотра по фильтру */
	public ENSheets4SOTypeShortList getScrollableFilteredList(
			ENSheets4SOTypeFilter aENSheets4SOTypeFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENSheets4SOType. Получить список для просмотра по условию */
	public ENSheets4SOTypeShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENSheets4SOType. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENSheets4SOTypeFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENSheets4SOType. Получить объект из списка */
	public ENSheets4SOTypeShort getShortObject(int code)
			throws java.rmi.RemoteException;

}