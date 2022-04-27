
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

/**
 * EJB Controller interface for ENRegForSupplierItem;
 *
 */

import com.ksoe.energynet.valueobject.ENRegForSupplierItem;
import com.ksoe.energynet.valueobject.lists.ENRegForSupplierItemShortList;
import com.ksoe.energynet.valueobject.brief.ENRegForSupplierItemShort;
import com.ksoe.energynet.valueobject.filter.ENRegForSupplierItemFilter;


public interface ENRegForSupplierItemController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/ENRegForSupplierItemController";

	/* ENRegForSupplierItem. Добавить */
	public int add(ENRegForSupplierItem aENRegForSupplierItem)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. Удалить */
	public void remove(int anObjectCode) throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. Изменить */
	public void save(ENRegForSupplierItem aENRegForSupplierItem)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. Получить объект */
	public ENRegForSupplierItem getObject(int anObjectCode)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. Получить полный список */
	public ENRegForSupplierItemShortList getList()
			throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. Получить список по фильтру */
	public ENRegForSupplierItemShortList getFilteredList(
			ENRegForSupplierItemFilter aENRegForSupplierItemFilter)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. Получить список для просмотра */
	public ENRegForSupplierItemShortList getScrollableList(int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. Получить список для просмотра по фильтру */
	public ENRegForSupplierItemShortList getScrollableFilteredList(
			ENRegForSupplierItemFilter aENRegForSupplierItemFilter, int aFromPosition,
			int aQuantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. Получить список для просмотра по условию */
	public ENRegForSupplierItemShortList getScrollableListByCondition(
			String aCondition, int aFromPosition, int aQuantity)
			throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. Получить список ПК-кодов по фильтру */
	public int[] getScrollableFilteredCodeArray(
			ENRegForSupplierItemFilter filterObject, int fromPosition,
			int quantity) throws java.rmi.RemoteException;

	/* ENRegForSupplierItem. Получить объект из списка */
	public ENRegForSupplierItemShort getShortObject(int code)
			throws java.rmi.RemoteException;

}