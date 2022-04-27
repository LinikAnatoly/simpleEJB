
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENDepartment2CCExecutor;
 *
 */

import com.ksoe.energynet.valueobject.ENDepartment2CCExecutor;
import com.ksoe.energynet.valueobject.brief.ENDepartment2CCExecutorShort;
import com.ksoe.energynet.valueobject.filter.ENDepartment2CCExecutorFilter;
import com.ksoe.energynet.valueobject.lists.ENDepartment2CCExecutorShortList;


public interface ENDepartment2CCExecutorController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENDepartment2CCExecutorController";

	/* ENDepartment2CCExecutor. Добавить */
	public int add(ENDepartment2CCExecutor aENDepartment2CCExecutor)
			throws java.rmi.RemoteException;

	/* ENDepartment2CCExecutor. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENDepartment2CCExecutor. Изменить */
	public void save(ENDepartment2CCExecutor aENDepartment2CCExecutor)
			throws java.rmi.RemoteException;

	/* ENDepartment2CCExecutor. Получить объект */
	public ENDepartment2CCExecutor getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENDepartment2CCExecutor. Получить полный список */
	public ENDepartment2CCExecutorShortList getList()
			throws java.rmi.RemoteException;

	/* ENDepartment2CCExecutor. Получить список по фильтру */
	public ENDepartment2CCExecutorShortList getFilteredList(
			ENDepartment2CCExecutorFilter aENDepartment2CCExecutorFilter)
			throws java.rmi.RemoteException;

	/* ENDepartment2CCExecutor. Получить список для просмотра */
	public ENDepartment2CCExecutorShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDepartment2CCExecutor. Получить список для просмотра по фильтру */
	public ENDepartment2CCExecutorShortList getScrollableFilteredList(
			ENDepartment2CCExecutorFilter aENDepartment2CCExecutorFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENDepartment2CCExecutor. Получить список для просмотра по условию */
	public ENDepartment2CCExecutorShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENDepartment2CCExecutor. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENDepartment2CCExecutorFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENDepartment2CCExecutor. Получить объект из списка */
	public ENDepartment2CCExecutorShort getShortObject(int code)
			throws java.rmi.RemoteException;

}