
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENExecutor;
 *
 */

import com.ksoe.energynet.valueobject.ENExecutor;
import com.ksoe.energynet.valueobject.lists.ENExecutorShortList;
import com.ksoe.energynet.valueobject.brief.ENExecutorShort;
import com.ksoe.energynet.valueobject.filter.ENExecutorFilter;


public interface ENExecutorController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENExecutorController";

	/* ENExecutor. Добавить */
	public int add(ENExecutor aENExecutor)
			throws java.rmi.RemoteException;

	/* ENExecutor. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENExecutor. Изменить */
	public void save(ENExecutor aENExecutor)
			throws java.rmi.RemoteException;

	/* ENExecutor. Получить объект */
	public ENExecutor getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENExecutor. Получить полный список */
	public ENExecutorShortList getList()
			throws java.rmi.RemoteException;

	/* ENExecutor. Получить список по фильтру */
	public ENExecutorShortList getFilteredList(
			ENExecutorFilter aENExecutorFilter)
			throws java.rmi.RemoteException;

	/* ENExecutor. Получить список для просмотра */
	public ENExecutorShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENExecutor. Получить список для просмотра по фильтру */
	public ENExecutorShortList getScrollableFilteredList(
			ENExecutorFilter aENExecutorFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENExecutor. Получить список для просмотра по условию */
	public ENExecutorShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENExecutor. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENExecutorFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENExecutor. Получить объект из списка */
	public ENExecutorShort getShortObject(int code)
			throws java.rmi.RemoteException;

}